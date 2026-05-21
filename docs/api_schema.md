# API Response Schema

This document outlines the response structures for the Firebase Cloud Functions used in Astro Flux.

## Cloud Functions

All functions are HTTPS Callable functions (`onCall`).

### `syncGameState`

Synchronizes the local client game state with the Firestore backend.

**Request Body**
- `data`: The `GameState` object containing `motes`, `vectors`, and `stars`.

**Success Response**
```json
{
  "success": true,
  "timestamp": "2023-10-27T10:00:00.000Z"
}
```

**Error Responses**
- `unauthenticated`: User must be authenticated to sync game state.
- `internal`: Failed to sync game state.

---

### `refreshLeaderboard`

Triggers a recalculation of player rankings based on the current game states.

**Request Body**
- `data`: (None required)

**Success Response**
```json
{
  "success": true,
  "updatedUsers": 42
}
```

**Error Responses**
- `unauthenticated`: Auth required.
- `internal`: Failed to refresh leaderboard.

---

## Firestore Triggers (Background)

### `onFusionComplete`

Triggered automatically when a user's `vectors` count increases in the `gameStates` collection. This function triggers a push notification to the user.