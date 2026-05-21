// Cloud Functions for Astro Flux
// Node 18 runtime — deployed via `firebase deploy --only functions`
//
// Three callable functions (called from GcpSyncHandler via cloud_functions SDK):
//   validateFusion       — checks whether a fusion attempt is allowed
//   validateVectorCount  — checks whether the current vector count is within limits
//   validateStarCapture  — checks whether a star can be captured
//
// API request/response schemas live in docs/cloud_functions_api.md.

const { onCall, HttpsError } = require('firebase-functions/v2/https');
const { initializeApp }      = require('firebase-admin/app');
const { getFirestore }       = require('firebase-admin/firestore');

initializeApp();

// ── Business-rule constants (mirror dart-side values in game_rules_engine.dart) ──
const MAX_FUSED_MOTES        = 2;    // max motes in a single fusion event
const LIFECYCLE_ACTIVE       = 'active';
const MAX_VECTOR_COUNT       = 100;  // global cap to prevent runaway scaling
const VALID_OWNER_ID_PATTERN = /^[a-zA-Z0-9_-]{1,64}$/;

// ─── validateFusion ────────────────────────────────────────────────────────────
// Request:  { motes: [{ id: int, lifecycleState: string }, ...] }
// Response: { isFusionAllowed: boolean }
exports.validateFusion = onCall({ region: 'us-central1' }, async (request) => {
  const { motes } = request.data;

  if (!Array.isArray(motes)) {
    throw new HttpsError('invalid-argument', '"motes" must be an array.');
  }
  if (motes.length === 0) {
    throw new HttpsError('invalid-argument', '"motes" must not be empty.');
  }
  if (motes.length > MAX_FUSED_MOTES) {
    return { isFusionAllowed: false };
  }

  // All motes must be active — fused or created motes cannot participate.
  const allActive = motes.every(
    (m) => m && typeof m.id === 'number' && m.lifecycleState === LIFECYCLE_ACTIVE
  );

  return { isFusionAllowed: allActive };
});

// ─── validateVectorCount ───────────────────────────────────────────────────────
// Request:  { vectorCount: int }
// Response: { isVectorCountValid: boolean }
exports.validateVectorCount = onCall({ region: 'us-central1' }, async (request) => {
  const { vectorCount } = request.data;

  if (typeof vectorCount !== 'number' || !Number.isInteger(vectorCount)) {
    throw new HttpsError('invalid-argument', '"vectorCount" must be an integer.');
  }
  if (vectorCount < 0) {
    throw new HttpsError('invalid-argument', '"vectorCount" must be non-negative.');
  }

  return { isVectorCountValid: vectorCount <= MAX_VECTOR_COUNT };
});

// ─── validateStarCapture ───────────────────────────────────────────────────────
// Request:  { starId: int, ownerId: string }
// Response: { isCaptureAllowed: boolean }
//
// A capture is allowed when:
//   1. starId is a positive integer.
//   2. ownerId matches the safe identifier pattern.
//   3. The star document in Firestore (collection "stars") either does not exist
//      yet (new game), or is not already owned by the same ownerId (prevents
//      redundant re-captures).
exports.validateStarCapture = onCall({ region: 'us-central1' }, async (request) => {
  const { starId, ownerId } = request.data;

  if (typeof starId !== 'number' || !Number.isInteger(starId) || starId <= 0) {
    throw new HttpsError('invalid-argument', '"starId" must be a positive integer.');
  }
  if (typeof ownerId !== 'string' || !VALID_OWNER_ID_PATTERN.test(ownerId)) {
    throw new HttpsError('invalid-argument',
      '"ownerId" must be a non-empty alphanumeric string (max 64 chars).');
  }

  const db  = getFirestore();
  const ref = db.collection('stars').doc(String(starId));
  const snap = await ref.get();

  if (!snap.exists) {
    // Star not yet tracked in Firestore — capture is allowed.
    return { isCaptureAllowed: true };
  }

  const data = snap.data();
  // Disallow re-capture by the current owner; all other states are capturable.
  const alreadyOwned = data.ownerId === ownerId;
  return { isCaptureAllowed: !alreadyOwned };
});
