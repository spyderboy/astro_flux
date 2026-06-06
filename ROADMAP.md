# Backlog — generated 2026-05-06

## Wednesday 2026-05-06
- [x] Define NeonRenderer mixin for Sprite/Canvas drawing that applies high-saturation background colors and glow shaders.
- [x] Implement Flame Widget components for Mote, Vector, and Star with dark backgrounds and neon stroke rendering.
- [x] Connect Riverpod state to the Fusion Logic: convert 10 Motes into a Vector automatically when threshold met.
- [x] Implement Touch/Click handlers for Star Capture that deduct Vectors and update provider state.
- [x] Integrate Flame's BlendMode.plus to render combat particle effects for Vector attacks.
- [x] Wire Stub GCP Cloud Function handler into the game loop for syncing player progress vectors.
- [x] Run Play on Android Emulator to ensure Riverpod state survives warm restarts and hot reload.
- [x] Finalize v1.0 build configuration targeting iOS/Android (GCP persistence stubs included) for release.

# Backlog — generated 2026-05-07

## Thursday 2026-05-07
- [x] Install FlutterFire and configure GCP Cloud Functions v2 triggers in pubspec.yaml
- [x] Create Star model class with production_rate properties
- [x] Implement Vector model with id generation and capacity tracking
- [x] Complete Mote model with exact_fuseWith() method implementation
- [x] Add Riverpod change_stream listener to game loop provider
- [x] Build core AstroGame state management architecture in lib/game/astro_game.dart
- [x] Define game constants file (FUSION_THRESHOLD = 10, STAR_TIER_MAX = 3)
- [x] Configure Flame renderer with BlendMode.plus for combat particles
- [x] Create project-wide NeonRenderer mixin implementation base class
- [x] Add high-saturation color palette configuration with hex codes
- [x] Implement initial update loop in astro_game.dart with timer
- [x] Set up FlutterFire persistence configuration for state saving
- [x] Document V1.0 release checklist requirements
- [x] Create basic README.md with build commands and architecture overview
- [x] Configure Android keystore properties in android/app/build.gradle
- [x] Configure iOS signing certificates in ios/SigningIdentity.podspec
- [x] Implement initial Mote count state observer provider
- [x] Add error handling for failed fusion attempts
- [x] Create Star tier progression data table configuration file
- [x] Set up flame_sound_player instance with basic idle engine noise
- [x] Configure Android manifest activity launcher settings
- [x] Document API endpoints for vector sync to Cloud Functions
- [x] Add project-wide logging setup using flutter_riverpod logger
- [x] Complete Star model with spawn_interval property configuration
- [x] Implement Star production logic loop calculating motes over time
- [x] Add Mote lifecycle state machine (created, active, fused)
- [x] Create flame components file structure for game objects
- [x] Implement NeonRenderer mixin methods for drawing strokes
- [x] Build basic Mote particle rendering in Flame canvas drawComponent
- [x] Add color picker logic for motes to use neon cyan/blue spectrum
- [x] Implement Vector visual component with glow radius property
- [x] Create Star component class with tier selection and capture indicator
- [x] Add combat attack vector direction calculation helper method
- [x] Implement basic particle generation system for combat effects
- [x] Set up Riverpod state bridge between game and UI layers
- [x] Document fusion threshold calculation in GameProvider service
- [x] Configure cloud function trigger handler for player sync
- [x] Build async fetch wrapper for leaderboards from Cloud API
- [x] Add basic touch input listener for mobile device interaction
- [x] Create Star production rate curve table implementation
- [x] Implement Vector capture mechanics with cooldown timer
- [x] Add GCP error fallback mechanism for offline state handling
- [x] Configure neon glow shader parameters in renderer config
- [x] Complete FlameWidget component for Mote with rotation animation
- [x] Add Vector rendering component with pulse glow effect
- [x] Implement Star render component with progression visual feedback
- [x] Configure add blend mode for combat particle overlays
- [x] Build neon stroke renderer using Path class in Dart
- [x] Create high-saturation color lookup table for game palette
- [x] Document rendering pipeline steps for game loop
- [x] Add additive blending configuration to Flame's render engine
- [x] Implement glow shader effect with custom blend mode
- [x] Create particle system manager for combat effects
- [x] Add star capture hit indicator with neon stroke rendering
- [x] Build touch gesture handler mapping to coordinate space
- [x] Implement basic game over state management in AstroGame
- [x] Configure vector_math import dependencies in lib/game/
- [x] Set up flame_audio player instance with preset engine sound
- [x] Add combat score display component with high-saturation text
- [x] Create star tier visualization rendering for production rate display
- [x] Build fusion event particle explosion effect system
- [x] Document Mote to Vector conversion animation requirements
- [x] Implement Star decay timer if not captured by player
- [x] Set up GCP backend sync status indicator in game state
- [x] Complete Riverpod provider for Mote fusion threshold detection
- [x] Implement auto-fusion trigger when 10 motes reach Vector limit
- [x] Build fusion UI indicator component showing pending motes count
- [x] Create FusionProvider service with async fuse request handler
- [x] Document Riverpod state management architecture in lib/models/
- [x] Add combat state observer with provider binding to current player vectors
- [x] Set up provider cache mechanism for star production rates
- [x] Build capture event provider for star capture confirmation
- [x] Create async sync function wrapper for GCP leaderboards
- [x] Implement server state reconciliation on last synced vector count
- [x] Document Riverpod change notification patterns for UI updates
- [x] Add battle state management with Riverpod providers
- [x] Configure provider error handling strategy in game loop
- [x] Build star capture animation state with flame animation manager
- [x] Set up auto-fusion cooldown timer mechanism for combat actions
- [x] Create GCP sync status listener provider to track offline sync
- [x] Add fallback local storage implementation when cloud sync fails
- [x] Implement basic victory condition check in state management
- [x] Configure Riverpod async stream for star production updates
- [x] Document API response handling patterns for Cloud Functions
- [x] Complete core capture mechanics for Star interaction
- [x] Build touch handler for capturing lower-tier stars by player vector
- [x] Implement deduct Vectors from game state on successful capture
- [x] Add star ownership visualization component with neon border
- [x] Create capture target animation with particle effects
- [x] Document capture score calculation logic in Riverpod service
- [x] Build Vector-to-Star attack line rendering with neon glow
- [x] Implement basic star defense mechanism against player attacks
- [x] Add defensive cooldown timer for captured stars
- [x] Configure capture state provider to sync with game loop
- [x] Document combat rules: which vector types can attack which targets
- [x] Create particle effect manager with Flame's blend mode config
- [x] Set up GCP leaderboard fetch function for player rankings
- [x] Implement basic star level progression system in Riverpod state
- [x] Configure error fallback when server unavailable for capture
- [x] Build combat result visual feedback with high-saturation text
- [x] Complete GCP Cloud Functions integration for progress sync
- [x] Build async handler wrapper for player vector state updates
- [x] Add optimistic UI update with rollback on server error
- [x] Set up leaderboard ranking algorithm for server-side calculation
- [x] Document API response schema from GCP Cloud Functions endpoints
- [x] Create sync retry mechanism with exponential backoff strategy
- [x] Add player vector count validation before submission to server
- [x] Set up notification service for GCP leaderboards refresh on reconnect
- [x] Configure Cloud Function auth middleware for user identity check
- [x] Implement basic star level fetch from server endpoint
- [x] Document error boundary implementation in Riverpod providers
- [x] Configure GCP Cloud Function timeout settings for sync operations
- [x] Add player progress reset on server authentication failure
- [x] Complete build configuration targeting iOS and Android platforms
- [x] Configure Firebase App SDK for Cloud Functions in pubspec.yaml
- [x] Build release build script using flutter build appbundle
- [x] Document GCP Cloud Function deployment checklist for production
- [x] Set up automated testing framework with flutter_test runner
- [x] Add integration tests for Riverpod state management changes
- [x] Build device compatibility matrix documentation for release targets
- [x] Configure Firebase App SDK triggers for player vector sync
- [x] Implement comprehensive end-to-end game loop integration test
- [x] Document release certification requirements for Apple Store
- [x] Set up beta deployment configuration with Firebase Preview API
- [x] Configure GCP Cloud Function logging to stdout for debugging
- [x] Document memory usage guidelines for Flame game engine
- [x] Set up release build pipeline automation with GitHub Actions workflow
- [x] Create lib/models/star.dart file and define base interface class structure.
- [x] Implement Star class with tier property and production rate calculations logic.
- [x] Define Mote model data structure for state management in Riverpod service.
- [x] Create Vector model with auto-incrementing ID generation implementation.
- [x] Initialize lib/game/astro_game.dart main entry point file structure.
- [x] Implement init lifecycle method inside FlameGame base class wrapper code.
- [x] Set up Riverpod Provider for global game state management provider root.
- [x] Define Vector model properties including visual size and level data fields.
- [x] Configure GCP Cloud Function project structure within functions codebase directory.
- [x] Wire Riverpod async stream to handle star production updates data flow.
- [x] Implement local storage provider service for offline progress saving mechanism.
- [x] Create Star decay timer logic implementation within Riverpod state management.
- [x] Add error fallback handling strategy for sync failures in backend system.
- [x] Set up build script using flutter build appbundle command for release package.
- [x] Create configuration file for Android and iOS SDK dependencies list.
- [x] Verify project dependencies resolve correctly in pubspec.yaml file contents.
- [x] Initialize git repository with commit message template for development team.
- [x] Document data model relationships diagram in doc folder readme documentation.
- [x] Set up Firebase Auth middleware configuration for user identity check security.
- [x] Implement basic victory condition check logic in state manager code flow.
- [x] Configure additive blending mode settings in Flame config object definition.
- [x] Write render loop code to process update and paint stages efficiently.
- [x] Implement pulse animation logic specifically for Vector objects display mode.
- [x] Create touch hit detection logic using vector_math library methods available.
- [x] Integrate vector_math imports into AstroGame class implementation file code.
- [x] Configure high-saturation glow shader parameters using Dart float type values.
- [x] Implement rotation animation controller for motes using Tween class logic.
- [x] Create canvas texture loader function for star particle backgrounds assets.
- [x] Add combat score display component layout into UI layer structure definition.
- [x] Set up default game over state management logic within Riverpod provider.
- [x] Implement Star capture hit indicator rendering path drawing code execution.
- [x] Define additive blend mode configuration parameters for Flame engine settings.
- [x] Create particle effect manager initialization handler function logic implementation.
- [x] Document rendering pipeline steps in assets folder readme documentation file.
- [x] Finalize v1.0 build configuration targeting iOS and Android platforms list.
- [x] Implement Mote production schedule loop from Star objects array iteration.
- [x] Write auto-fusion trigger logic when threshold is reached in game state.
- [x] Create Riverpod Provider for pending motes count display in UI component.
- [x] Wire Flame event to Riverpod state change listener interface implementation.
- [x] Implement deduce Vectors from game state on fusion success action code.
- [x] Add star ownership visualization component in Canvas layer structure definition.
- [x] Build async handler wrapper for GCP sync provider instance logic flow.
- [x] Configure Cloud Function trigger code for auto-fusion notifications codebase.
- [x] Create Star decay timer mechanism within Riverpod state management context.
- [x] Write unit test for server validation logic on vectors submission code.
- [x] Build star level fetch function from API endpoint implementation script.
- [x] Set up GCP leaderboard ranking algorithm in server script code base.
- [x] Implement offline-first local storage saving mechanism for player data storage.
- [x] Add player progress reset logic on authentication failure case handling.
- [x] Document API response schema from Cloud Function endpoints code documentation.
- [x] Set up notification service for GCP leaderboards refresh action listener.
- [x] Document fusion logic mathematical formulas in technical doc folder contents.
- [x] Create touch input handler interface to capture Star nodes on canvas.
- [x] Implement Vectors deducted on successful star capture event logic.
- [x] Build ownership visualization component with neon border stroke rendering path.
- [x] Define capture target animation state using flame animation manager code.
- [x] Configure provider error handling strategy in game loop structure implementation.
- [x] Build async handler wrapper for player vector sync updates to server
- [x] Set up Firebase Auth configuration for secure capture actions security check.
- [x] Implement fallback local storage when network is disconnected scenario handling.
- [x] Set up notification service for reconnect event listener logic configuration.
- [x] Create configuration file for offline-first sync mechanism code definition.
- [x] Document error boundary implementation in Riverpod providers code structure
- [x] Configure Cloud Function triggers for progress sync events logic flow


# Backlog — refined 2026-05-10

## Integration — Wire Game Together

- [x] In AstroGame.onLoad(): add StarComponent for each star in gameServiceProvider state, add VectorComponent for each vector, add MoteComponent for each mote
- [x] In AstroGame.onLoad(): add CombatAttackHandler, StarDefenseComponent, and StarCaptureFeedbackManager with a real Riverpod Ref
- [x] In AstroGame.onLoad(): add CombatScoreComponent and FusionIndicatorComponent to HUD layer
- [x] Wire AstroGame touch input: on tap, check hit against StarComponent positions and emit CombatAttackEvent
- [x] In AstroGame.update(): sync Flame component list with gameServiceProvider state — add/remove StarComponent and VectorComponent when state changes

## Combat System

- [x] Define CombatAttackEvent data class with source vector ID and target star ID fields
- [x] Register Flame event bus listener for CombatAttackEvent in AstroGame.onLoad()
- [x] Implement attack eligibility check using capture_rules.dart before processing event
- [x] Wire touch gesture handler to emit CombatAttackEvent on valid star tap
- [x] Write unit test for CombatAttackEvent handler dispatch and eligibility validation

- [x] Define AttackLineComponent with start/end Vector2 fields and animated progress float (convert to Offset only for canvas.drawLine calls)
- [x] Animate AttackLineComponent progress 0→1 over 0.3s using Flame EffectController
- [x] Render attack line with canvas.drawLine using neon paint and BlendMode.plus
- [x] Fade out AttackLineComponent when progress > 0.8 and remove on completion
- [x] Write golden test for attack line neon glow rendering appearance

- [x] Define AttackParticle model with velocity, neon color, and lifetime fields
- [x] Spawn 8 particles at collision point when AttackLineComponent animation completes
- [x] Apply BlendMode.plus to AttackParticle paint for additive neon glow effect
- [x] Add maxParticles = 200 cap field with enforcement to ParticleManager — reject spawn when pool is full
- [x] Route AttackParticle spawns through ParticleManager.spawn() instead of adding directly to game tree
- [x] Write unit test: ParticleManager.spawn() respects 200-particle cap and returns false when full
- [x] Write unit test: AttackParticle initial velocity points outward from collision point
- [x] Write unit test: AttackParticle removes itself from parent after its lifetime expires

- [x] Create CombatResultLabel TextComponent positioned at target star world coordinates
- [x] Apply neon cyan color from game palette with drop shadow to CombatResultLabel
- [x] Animate CombatResultLabel upward 40px over 0.8s using MoveEffect
- [x] Fade out CombatResultLabel opacity 1→0 over final 0.3s using OpacityEffect
- [x] Write golden test for CombatResultLabel styling and animation keyframes

- [x] Create CombatScoreWidget TextComponent wired to CombatStateProvider.score stream
- [x] Apply neon cyan (#00FFFF) with glow from NeonRenderer palette to score widget
- [x] Add +N score pop animation on each successful attack hit event
- [x] Write golden test for score text render and pop animation frame

- [x] Create StarCaptureIndicator PositionComponent with neon checkmark shape in lib/components/
- [x] Position StarCaptureIndicator above captured star using Flame coordinate space
- [x] Wire StarCaptureIndicator to capture event provider stream show/hide state
- [x] Add 1.2s fade-out animation to StarCaptureIndicator after capture confirmation
- [x] Write widget test for StarCaptureIndicator lifecycle and fade timing

- [x] Add defense_cooldown_ms property to Star model in lib/models/star.dart
- [x] Implement isDefending() check in capture_rules.dart using cooldown timestamp
- [x] Block CombatAttackEvent processing when target star isDefending() returns true
- [x] Activate star defense with 5s cooldown on each successful capture event
- [x] Write unit test for defense cooldown activation, blocking, and expiry logic

- [x] Add lastCapturedAt timestamp field to Star model for cooldown tracking
- [x] Implement CooldownTimer class with start(), isActive(), and reset() methods
- [x] Wire CooldownTimer to star capture event in GameStateNotifier on success
- [x] Show cooldown progress ring on StarComponent canvas during active cooldown
- [x] Write unit test for CooldownTimer accuracy using FakeAsync mock clock

## Offline & Sync

- [x] Add connectivity_plus listener to detect network state changes in main.dart
- [x] Define LocalStateQueue class in lib/services/ with enqueue(SyncAction), flush(), and queueLength — no GCP dependency
- [x] Serialize LocalStateQueue entries to SharedPreferences as JSON on each write
- [x] Add flush() method to LocalStateQueue that drains queue by calling each SyncAction in order
- [x] Call localStateQueue.flush() from GcpSyncHandler connectivity listener when network reconnects
- [x] Write integration test for offline queue persistence and flush round-trip

- [x] Add offlineVectors list field to GameState model with JSON serialization support
- [x] Implement readOfflineVectors() and writeOfflineVectors() in PersistenceService
- [x] Show offline badge on vector count display when writing to local storage only
- [x] Reconcile local offline vectors against server state on reconnect merge
- [x] Write unit test for offline vector read/write cycle and reconciliation logic

- [x] Create SyncStatusWidget with synced/syncing/offline display state enum
- [x] Wire SyncStatusWidget to GcpSyncStatusProvider stream for rebuild trigger
- [x] Style SyncStatusWidget: green (synced), amber (syncing), red (offline) neon dots
- [x] Animate syncing state with pulsing glow effect using RepaintBoundary wrapper
- [x] Position SyncStatusWidget in HUD top-right corner without overlapping canvas

- [x] Define CircuitBreaker class with closed/open/half-open states in lib/utils/
- [x] Implement CircuitBreaker failure threshold: 5 failures opens circuit for 30s
- [x] Wrap GcpSyncHandler.sync() with CircuitBreaker check before each network call
- [x] Log CircuitBreaker state transitions to GcpSyncStatusProvider stream
- [x] Write unit test for CircuitBreaker state transitions at threshold and reset timeout

- [x] Implement RetryScheduler with attempt counter and 2s base delay configuration
- [x] Calculate retry backoff as min(2s * 2^attempt, 60s) with 20% random jitter
- [x] Wrap all GcpSyncHandler network calls with RetryScheduler.run() wrapper
- [x] Cancel pending retry timer on successful sync or app lifecycle pause event
- [x] Write unit test for RetryScheduler backoff delay values at attempts 1 through 5

- [x] Define FusionLogEntry model with timestamp, mote IDs, and result vector ID
- [x] Add logFusionEvent(FusionLogEntry) method to GcpSyncHandler class
- [x] Write FusionLogEntry to Firestore subcollection on each successful fusion
- [x] Create FusionHistoryProvider reading last 20 entries via StreamProvider
- [x] Write integration test for fusion log Firestore persistence and retrieval

- [x] Add onDocumentUpdate Firestore trigger watching mote count field in index.js
- [x] Build FCM notification payload in Cloud Function when mote count hits FUSION_THRESHOLD
- [x] Send FCM push notification to player device token from Cloud Function trigger
- [x] Add client-side FCM message listener to update Riverpod fusion pending state
- [x] Test FCM trigger locally using firebase emulators:start and manual Firestore write

- [x] Set timeoutSeconds: 60 on all sync-related Cloud Function definitions in index.js
- [x] Add retry: true flag on idempotent Cloud Functions for automatic failure retry
- [x] Set memory: '256MB' on leaderboard and progress sync Cloud Functions
- [x] Add maxInstances: 10 limit on sync functions to prevent runaway auto-scaling
- [x] Document timeout and scaling rationale in functions/README.md

- [x] Add onDocumentWrite Firestore trigger for player vector count field changes
- [x] Build FCM notification payload with vector delta (added/removed count)
- [x] Send FCM notification to affected player device tokens from trigger handler
- [x] Add 5s deduplication window to avoid duplicate vector sync notifications
- [x] Write emulator integration test for trigger firing on vector document write

- [x] Add validateFusionRequest(playerId, moteIds) endpoint to Cloud Functions
- [x] Check mote ownership and exact count (must be 10) server-side in endpoint
- [x] Return HTTP 400 with structured error when server-side validation fails
- [x] Capture pre-fusion GameState snapshot in FusionProvider before sending fusion request
- [x] Restore pre-fusion snapshot in FusionProvider.requestFusion() on HTTP 400 response
- [x] Write integration test for valid and invalid fusion request handling paths

## Riverpod State

- [x] Create StarProductionStreamProvider using StreamProvider.autoDispose in providers/
- [x] Emit StarProductionTick event every Star.production_interval seconds from provider
- [x] Wire StarProductionStreamProvider into GameStateNotifier to update mote counts
- [x] Verify stream disposes cleanly on widget unmount to prevent memory leaks
- [x] Write unit test for stream emission timing and cancellation on dispose

- [x] Create FusionThresholdProvider watching MoteProvider count as derived stream
- [x] Emit FusionReadyEvent when mote count crosses FUSION_THRESHOLD (10) boundary
- [x] Add distinct() operator to stream to suppress duplicate events at same count
- [x] Wire FusionThresholdProvider to auto-trigger FusionProvider.fuse() on event
- [x] Write unit test for threshold detection at mote counts 9, 10, and 11

- [x] Define FusionIndicatorState model with pendingCount, isAnimating, progress fields
- [x] Create FusionIndicatorNotifier extending StateNotifier<FusionIndicatorState>
- [x] Wire FusionIndicatorNotifier to MoteProvider count stream for live updates
- [x] Build FusionIndicatorWidget consuming fusionIndicatorProvider for UI rebuild
- [x] Write widget test for FusionIndicatorWidget at 0, 5, and 10 pending mote counts

- [x] Define StarLevel model with level (1–5), xp, and xpToNextLevel fields
- [x] Add gainXp(int amount) method to StarLevelNotifier state management class
- [x] Wire capture events to grant +10 XP in GameStateNotifier on successful capture
- [x] Dispatch LevelUpEvent and trigger visual feedback when XP threshold is crossed
- [x] Write unit test for XP gain, level-up boundary, and max level 5 cap behavior

- [x] Define VictoryCondition enum: capturedAllStars, fusionCountReached, timeExpired
- [x] Add checkVictoryConditions() method to GameStateNotifier class
- [x] Call checkVictoryConditions() after each star capture and fusion event fires
- [x] Dispatch VictoryEvent to Riverpod stream when any victory condition is met
- [x] Write unit test for each of the three VictoryCondition trigger scenarios

- [x] Define BattleState model with phase (idle/active/victory/defeat) and score fields
- [x] Create BattleStateNotifier with startBattle() and endBattle(result) methods
- [x] Wire BattleStateNotifier to CombatStateProvider for real-time score updates
- [x] Expose battleStateProvider for UI widgets to consume phase transition events
- [x] Write unit test for battle phase transitions and cumulative score accumulation

- [x] Add cache TTL of 5 minutes to StarProductionRateProvider configuration
- [x] Implement manual cache invalidation in GameStateNotifier.onStarTierUpgrade()
- [x] Add ref.keepAlive() to prevent autoDispose during active game sessions
- [x] Write unit test for cache hit, miss, and manual invalidation behavior

- [x] Define getStarLevel(starId) function in GcpSyncService calling Cloud Function
- [x] Parse StarLevel JSON response into StarLevel model with level and xp fields
- [x] Cache StarLevel result in StarLevelProvider with 60s TTL to reduce API calls
- [x] Handle 404 response by returning default StarLevel(level: 1, xp: 0)
- [x] Write integration test for getStarLevel() against Cloud Functions emulator

- [x] Define GameOverReason enum: outOfVectors, timerExpired, serverDisconnect
- [x] Add triggerGameOver(GameOverReason reason) method to GameStateNotifier
- [x] Pause game loop and show GameOverOverlay widget on triggerGameOver() call
- [x] Wire GameOverOverlay restart button to GameStateNotifier.resetGame() method
- [x] Write unit test for game over trigger, overlay display, and state reset sequence

## Rendering

- [x] Define SparkleRenderer mixin class in lib/components/sparkle_renderer.dart
- [x] Add sparkleRadius and sparkleColor properties with neon palette defaults
- [x] Implement renderSparkle(Canvas, Offset) drawing a 6-point star polygon shape
- [x] Wire SparkleRenderer.renderSparkle() to star capture success animation trigger
- [x] Write golden test comparing SparkleRenderer output against approved baseline PNG

- [x] Define drawNeonMoteOutline(Canvas canvas, Offset center, double radius) function
- [x] Draw circular path with 3px neon cyan stroke using Paint from game palette
- [x] Add outer glow layer with sigma=4 MaskFilter on secondary Paint object
- [x] Add inner highlight arc at 30% opacity for depth and volume visual effect
- [x] Write golden test comparing drawNeonMoteOutline output against baseline PNG

- [x] Create tools/generate_glow_texture.dart as a standalone Dart script
- [x] Generate 64×64 radial gradient PNG with configurable neon color and sigma
- [x] Save generated PNG to assets/textures/glow_base.png automatically on run
- [x] Register assets/textures/glow_base.png in pubspec.yaml assets list
- [x] Document generation parameters (color, sigma, scale) in script header comment

- [x] Audit all combat particle Paint objects to confirm BlendMode.plus is set
- [x] Add BlendMode.plus to AttackLineComponent paint configuration explicitly
- [x] Write golden test capturing blended particle overlay with correct additive result

- [x] Update NeonRendererConfig primary neon cyan to #00FFFF, magenta to #FF00FF
- [x] Verify contrast ratios of updated colors meet 4.5:1 legibility on dark backgrounds
- [x] Write golden test for updated color values rendered on dark game background

## Audio

- [x] Verify flame_audio dependency version and add to pubspec.yaml if missing
- [x] Load engine_idle.mp3 via FlameAudio.audioCache.loadAll() in AstroGame.onLoad()
- [x] Play engine_idle.mp3 as looping background audio on game start
- [x] Pause audio in lifecycleStateChange callback when app is backgrounded
- [x] Write smoke test verifying audio loads and plays without error on startup

- [x] Add capture_success.mp3 and capture_fail.mp3 to assets/audio/ directory
- [x] Register both audio files in pubspec.yaml assets list
- [x] Play capture_success.mp3 in CaptureEventNotifier on successful star capture
- [x] Play capture_fail.mp3 when capture attempt fails due to active cooldown
- [x] Write test verifying correct audio cue fires for each capture outcome path

- [x] Implement FusionExplosionComponent spawning 16 radial particles on fusion event
- [x] Apply neon palette color with BlendMode.plus to FusionExplosionComponent particles
- [x] Animate explosion particles outward over 0.5s then fade opacity to zero
- [x] Remove FusionExplosionComponent from Flame tree after animation completes
- [x] Write golden test for explosion particle render at t=0.25s keyframe

## Testing

- [x] Write fuseMotes() unit test: exactly 10 motes input produces 1 vector output
- [x] Write fuseMotes() unit test: 9 motes input produces no fusion and no vector
- [x] Write fuseMotes() unit test: server rejection triggers full state rollback
- [x] Write fuseMotes() unit test: concurrent calls are guarded against race condition
- [x] Add flutter test --coverage step to CI and assert >70% line coverage target

- [x] Write Star tier 1 production rate unit test against base formula output value
- [x] Write Star tier 2 production rate unit test verifying multiplier applies correctly
- [x] Write Star tier 3 production rate unit test verifying cap enforced at max value
- [x] Write tier boundary unit test for tier 1→2 transition at capture threshold
- [x] Write edge case unit test for production rate with zero elapsed decay time

- [x] Write integration test: fusion triggers at exactly 10 motes in Riverpod state
- [x] Write integration test: no fusion fires at 9 motes in Riverpod state
- [x] Write integration test: active cooldown timer blocks fusion trigger correctly
- [x] Write integration test: server rejection after trigger is handled with rollback
- [x] Write integration test: state is consistent after partial fusion failure scenario

- [x] Write collision unit test: mote-star hit within radius correctly detected
- [x] Write collision unit test: near-miss tap just outside star radius not detected
- [x] Write collision unit test: vector-star threshold at exact boundary value
- [x] Write collision unit test: multi-object simultaneous collision resolution priority
- [x] Write collision performance test: 100 simultaneous checks complete under 16ms

- [x] Write Star decay unit test: timer starts after spawn + decay_interval elapses
- [x] Write Star decay unit test: timer cancels on successful star capture event
- [x] Write Star decay unit test: timer resets on star tier upgrade event
- [x] Write Star decay unit test: state consistent when decay fires mid-capture
- [x] Use FakeAsync in all decay timer tests for deterministic clock behavior

- [x] Write capture animation unit test: animation triggers on capture success event
- [x] Write capture animation unit test: completion callback resets indicator state
- [x] Write capture animation unit test: animation cancels on rapid second capture
- [x] Write capture animation golden test: render matches baseline at 50% keyframe

- [x] Add golden_toolkit to dev_dependencies in pubspec.yaml for screenshot tests
- [x] Create GoldenTestWrapper widget with fixed 375×667 viewport for consistency
- [x] Write golden test for NeonRenderer mote glow at full opacity on dark background
- [x] Write golden test for combat particle overlay with BlendMode.plus applied
- [x] Add flutter test --update-goldens step to CI workflow configuration

- [x] Add flutter_driver and benchmark_harness to dev_dependencies in pubspec.yaml
- [x] Create test_driver/perf_test.dart running the game loop for 60 seconds
- [x] Measure frame build times and report p50, p90, and p99 values in milliseconds
- [x] Assert p99 frame time < 16.7ms to verify sustained 60fps rendering capability
- [x] Write benchmark results to benchmark_results.json for CI regression tracking

- [x] Define FusionUIVariant enum with compactBar and expandedPanel case values
- [x] Create FusionUIVariantProvider reading active variant from Firebase Remote Config
- [x] Implement variant A: compact horizontal progress bar fusion layout component
- [x] Implement variant B: expanded panel showing individual mote count as grid icons
- [x] Log analytics event per variant on each fusion interaction for comparison

- [x] Add firebase_crashlytics to pubspec.yaml dependencies and run flutter pub get
- [x] Configure FlutterError.onError to forward all Flutter errors to Crashlytics
- [x] Wrap main() body in runZonedGuarded to capture uncaught Dart exceptions
- [x] Tag crash reports with current player ID and game state context fields
- [x] Write test verifying crash handler is invoked on simulated FlutterError

- [x] Run flutter test --coverage to verify all new unit tests pass cleanly
- [x] Run flutter drive integration tests on iOS simulator configuration
- [x] Review coverage report and fix any tests below 70% line coverage target
- [x] Confirm no test regressions before proceeding to release build preparation

## Documentation

- [x] Create docs/cloud_functions_api.md with request/response JSON schemas
- [x] Document error response format: code, message, and retryable flag fields
- [x] Add example request/response JSON for each Cloud Function endpoint
- [x] Document retry behavior and idempotency guarantees per endpoint in doc

- [x] Create docs/animations.md with fusion transition animation specification
- [x] Define animation duration (0.4s), easing curve (easeOutCubic), and keyframes
- [x] Include before/after state diagrams for mote-to-vector conversion sequence
- [x] Document required asset files and canvas draw sequence order

- [x] Document required provisioning profile and certificate types for App Store
- [x] List required Info.plist keys and privacy usage description strings
- [x] Document App Store Connect metadata requirements: screenshots and description
- [x] Add export compliance declaration for any encryption usage in the app

- [x] Create docs/gcp_deployment.md with step-by-step Cloud Function deploy commands
- [x] Document required IAM roles for Cloud Functions service account permissions
- [x] List all environment variables required in Cloud Function runtime configuration
- [x] Add rollback procedure for failed Cloud Function deployments to the doc

- [x] Add console.log at entry and exit of each Cloud Function with structured format
- [x] Use structured log format: {severity, message, requestId, context} fields
- [x] Configure Cloud Logging filter to capture ERROR and above in production env
- [x] Document logging conventions in functions/README.md for team reference

- [x] Document memory usage guidelines for Flame game engine in docs/performance.md
- [x] Set up device compatibility matrix documentation for supported release targets

## Playability Sprint — 2026-05-15
## PRIORITY: wire the game loop end-to-end before any visual polish.
## All rendering, shading, and animation tasks must be deferred until this block is complete.

### 1 — Riverpod bridge (foundation for everything below)
- [x] Pass WidgetRef into AstroGame via constructor and store as game.ref so Flame components can read and write gameServiceProvider
- [x] Replace AstroGame private mote/vector/star lists with reads from gameServiceProvider state so render components reflect Riverpod state

### 2 — Mote production
- [x] Instantiate MoteProductionSystem in AstroGame.onLoad() and add() it to the game tree so stars automatically produce motes each tick

### 3 — Touch input
- [x] Instantiate GestureHandler in AstroGame.onLoad() and add() it to the game tree so star taps are intercepted
- [x] Rename CaptureRules.canAttack to canCapture everywhere it is called, or add a canAttack alias, to fix the compile error in GestureHandler
- [x] Implement CaptureRules.canCapture to check that the player has at least one Vector before allowing a capture attempt

### 4 — Capture event pipeline
- [x] Wire CombatAttackHandler as a listener for CombatAttackEvent so that a successful tap calls gameServiceProvider.notifier.captureStar()
- [x] Deduct one Vector from the player's state in GameStateNotifier.captureStar() and verify star ownership flips to the player's ID

### 5 — Auto-fusion
- [x] Instantiate FusionAutomationComponent in AstroGame.onLoad() and add() it to the game tree so 10 motes auto-fuse into a vector
- [x] Fix fusionProvider: replace reference to private notifier._moteCount with a public motes.length read from gameServiceProvider state

### 6 — Win / lose
- [x] Add a Riverpod listener or Flame update() watcher that calls VictoryRules.checkVictoryConditions() each tick and triggers triggerGameOver() on win or loss
- [x] Register GameOverOverlay in GameWidget overlayBuilderMap under the key 'gameOver' and call game.overlays.add('gameOver') when gameOverProvider fires

### 7 — Welcome screen
- [x] Create a WelcomeScreen StatefulWidget with game title, a START button, and a brief one-line rule summary; navigate to GameWidget on tap
- [x] Wire WelcomeScreen as the initial route in main.dart so cold start lands on it instead of directly in the game

### 8 — Enemy starter state
- [x] On game init, assign half the stars a random enemy owner ID so the player has stars to fight for from the first second
- [x] Add a passive enemy AI that captures one random unowned star every 30 seconds to create ongoing pressure

### 9 — Player feedback
- [x] Show a HUD overlay with current mote count, vector count, and stars captured vs total so the player can track progress
- [x] Display a brief toast or label when a capture succeeds or fails so the player understands tap outcomes

## RTS Gesture Sprint — 2026-05-15
## PRIORITY: large navigable map and unit command gestures before any visual polish.
## Complete Playability Sprint first. Do not start this block until all Playability Sprint tasks are done.

### 1 — Large map and camera
- [x] Define a world canvas 4x the screen size (3000x3000 logical pixels) and distribute stars randomly across it at startup
- [x] Add Flame CameraComponent to AstroGame and configure it with defined world bounds so the player cannot scroll outside the map
- [x] Implement two-finger pan: translate camera by drag delta via ScaleGestureDetector, clamped to world bounds
- [x] Implement pinch-to-zoom: scale camera zoom between 0.4x and 2.0x via ScaleGestureDetector pinch delta, clamped so the view never exceeds world bounds
- [x] Add a minimap HUD widget in the corner showing all star positions colored by owner at a glance

### 2 — Unit positioning (required before selection can work)
- [x] Add a Vector2 world position field to the Mote model; spawn each mote near its producing star with a small random offset so motes appear on the map
- [x] Add a Vector2 world position field to the Vector model; place newly fused vectors at the centroid of their contributing motes
- [x] Render MoteComponent and VectorComponent at their world positions as Flame PositionComponents so they appear as discrete selectable objects on the map

### 3 — Swipe to select
- [x] Implement a single-finger drag gesture that draws a selection rectangle overlay on the canvas while the player swipes
- [x] On drag end, detect all MoteComponent and VectorComponent instances whose world positions fall inside the rectangle and mark them selected
- [x] Add a SelectionProvider in Riverpod that holds the current selected unit IDs; clear selection on a tap that hits no units
- [x] Render a bright neon highlight ring around each selected unit so the player sees what is selected

### 4 — Tap to move selected units
- [x] When units are selected and the player taps anywhere on the map, dispatch a MoveOrderEvent with the selected unit IDs and the tapped world position
- [x] Implement MoveOrderHandler: each selected unit moves toward the target position at its tier speed; on arrival at empty space units idle at that position
- [x] If the tapped position is within 48px of any star (enemy, neutral, or friendly), redirect movement to that star and set unit destination to that star
- [x] Clear the active selection after a move order is dispatched

### 5 — Unit tiers and stats (see docs/unit_spec.md)
- [x] Add tier (1/2/3), power (1/3/9), speed (300/150/60 px/s), maxHealth (1/5/25), and currentHealth fields to the unit model; Tier-1 units are the existing Mote/Vector, Tier-3 is a new Surge type
- [x] Implement a pointValue helper: Tier-1=1pt, Tier-2=5pt, Tier-3=25pt; used by combine logic to determine output tier
- [x] Move units toward their target position each game tick using their tier speed value in world-space pixels per second

### 6 — Long press to combine and reinforce
- [x] Detect a long press (600ms) on a selected group and trigger a CombineOrderEvent; sum the point values of all selected units
- [x] Add a `spawnSurge(Vector2 centroid)` method to GameStateNotifier that creates a new Tier-3 unit (power=9, hp=25) and adds it to the game world at the given position
- [x] In CombineOrderHandler: if total combine points >= 25, call spawnSurge() at the group centroid then remove all selected units from state
- [x] If total points >= 5 and < 25: produce one Tier-2 Vector at the group centroid and consume all selected units
- [x] In CombineOrderHandler: before applying upgrade thresholds, scan selected units for any damaged higher-tier unit (currentHealth < maxHealth); if found, apply incoming points as healing (1pt = 1hp) until that unit is full before counting remaining points toward a tier-up
- [x] If total points < 5: ignore the gesture and show a brief shake feedback so the player knows the combine failed
- [x] Show a burst animation at the centroid sized to the output tier when combine succeeds

### 7 — Unit vs unit combat
- [x] Each unit model gets a currentHealth field initialised to its tier maxHealth (Tier-1=1, Tier-2=5, Tier-3=25); see docs/unit_spec.md
- [x] Each game tick, detect all pairs of player and enemy units whose world positions are within collision radius of each other (Tier-1=16px, Tier-2=24px, Tier-3=36px)
- [x] In UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart: for each colliding (player, enemy) unit pair within collision radius (tier1=16px, tier2=24px, tier3=36px), subtract the other unit's power from each unit's currentHealth simultaneously — compute both new health values BEFORE writing either back to state
- [x] In UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart: after damage is applied, filter out any unit whose currentHealth <= 0, remove it via ref.read(gameServiceProvider.notifier), and spawn a CombatParticleComponent demolish effect at its world position
- [x] In MoveOrderHandler.update() in lib/game/move_order_handler.dart: confirm units advance toward their target position each tick regardless of combat state — MoveOrderHandler must never check or wait on UnitCombatResolver; the two run independently in the same AstroGame.update(dt) call

### 8 — Star model: tiers, power pools, and production
- [x] Add maxTier (1–4, set at generation), currentTier (starts 0), accumulatedPower (starts 0), and owner fields to the Star model; see docs/unit_spec.md
- [x] At map generation assign each star a random maxTier weighted toward lower values (50% tier-1, 25% tier-2, 15% tier-3, 10% tier-4) so large stars are rare and contested
- [x] Owned stars (currentTier >= 1) produce motes each cycle (every 5 seconds) at rate: tier-1=1, tier-2=3, tier-3=9, tier-4=27 motes per cycle

### 9 — Populating stars (siege and reinforce)
- [x] When a unit arrives within 48px of any star: consume the unit immediately and add its power value to the star's accumulatedPower pool
- [x] When accumulatedPower reaches the threshold for the next tier (0→1=10, 1→2=30, 2→3=90, 3→4=270): advance currentTier by 1, reset accumulatedPower to 0
- [x] When a neutral or enemy star advances from tier 0 to tier 1: flip ownership to the arriving unit's owner
- [x] If the star is already at maxTier: discard any arriving power silently so stars cannot exceed their natural growth cap
- [x] Show a visual pulse on the star each time a unit arrives and contributes power so the player sees progress accumulating

# Backlog — generated 2026-05-19

## Tuesday 2026-05-19
- [x] Add method _updateGameState to AstroGame in lib/game/astro_game.dart
- [x] Update Mote model with lifecycle state machine in lib/models/mote.dart
- [x] Implement capture logic in CombatAttackHandler in lib/game/combat_attack_handler.dart
- [x] Create and add CombatScoreWidget TextComponent in GameWidget in lib/game/game_widget.dart
- [x] Add method _updateFusionIndicator to AstroGame in lib/game/astro_game.dart
- [x] Define StarLevelUpEvent class in lib/models/star_level_up_event.dart
- [x] Implement VictoryRules.checkVictoryConditions() in GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Create WelcomeScreen StatefulWidget in lib/screens/welcome_screen.dart
- [x] Add method _handleCaptureSuccess to CombatAttackHandler in lib/game/combat_attack_handler.dart
- [x] Update MoteComponent rendering with neon glow in lib/components/mote_component.dart
- [x] Implement move logic in MoveOrderHandler in lib/game/move_order_handler.dart
- [x] Create HUD overlay for mote and vector counts in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleMoveComplete to MoveOrderHandler in lib/game/move_order_handler.dart
- [x] Define CombineOrderEvent class in lib/models/combine_order_event.dart
- [x] Implement long press gesture detection in GestureHandler in lib/game/gesture_handler.dart
- [x] Create burst animation at centroid when combine succeeds in lib/components/burst_animation_component.dart
- [x] Add method _handleCombineSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Update Star model with tiers and power pools in lib/models/star.dart
- [x] Implement siege logic in UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Create visual pulse on star each time a unit arrives in lib/components/pulse_effect_component.dart
- [x] Add method _handleUnitArrival to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Define UnitAttackEvent class in lib/models/unit_attack_event.dart
- [x] Implement combat logic in UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart
- [x] Create CombatParticleComponent demolish effect at unit world position in lib/components/combat_particle_component.dart
- [x] Add method _handleUnitCombat to UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Update MoteComponent rendering with world position in lib/components/mote_component.dart
- [x] Implement reinforce logic in CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Create HUD overlay showing captured stars vs total in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleReinforceSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Define UnitHealEvent class in lib/models/unit_heal_event.dart
- [x] Implement healing logic in GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Create burst animation at centroid when heal succeeds in lib/components/heal_animation_component.dart
- [x] Add method _handleUnitHeal to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Update Star model with maxTier and accumulatedPower in lib/models/star.dart
- [x] Implement power pooling logic in UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Create HUD overlay showing current health and maxHealth of selected units in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleStarCapture to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Define StarSiegeEvent class in lib/models/star_siege_event.dart
- [x] Implement siege logic in UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart
- [x] Create SiegeEffectComponent visual effect at star world position in lib/components/siege_effect_component.dart
- [x] Add _updateGameState method to AstroGame in lib/game/astro_game.dart
- [x] Update Mote model with lifecycle state machine in lib/models/mote.dart
- [x] Implement capture logic in CombatAttackHandler in lib/game/combat_attack_handler.dart
- [x] Create and add CombatScoreWidget TextComponent in GameWidget in lib/game/game_widget.dart
- [x] Add method _updateFusionIndicator to AstroGame in lib/game/astro_game.dart
- [x] Define StarLevelUpEvent class in lib/models/star_level_up_event.dart
- [x] Implement VictoryRules.checkVictoryConditions() in GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Create WelcomeScreen StatefulWidget in lib/screens/welcome_screen.dart
- [x] Add method _handleCaptureSuccess to CombatAttackHandler in lib/game/combat_attack_handler.dart
- [x] Update MoteComponent rendering with neon glow in lib/components/mote_component.dart
- [x] Implement move logic in MoveOrderHandler in lib/game/move_order_handler.dart
- [x] Create HUD overlay for mote and vector counts in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleMoveComplete to MoveOrderHandler in lib/game/move_order_handler.dart
- [x] Define CombineOrderEvent class in lib/models/combine_order_event.dart
- [x] Implement long press gesture detection in GestureHandler in lib/game/gesture_handler.dart
- [x] Create burst animation at centroid when combine succeeds in lib/components/burst_animation_component.dart
- [x] Add method _handleCombineSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Update Star model with tiers and power pools in lib/models/star.dart
- [x] Implement siege logic in UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Create visual pulse on star each time a unit arrives in lib/components/pulse_effect_component.dart
- [x] Add method _handleUnitArrival to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Define UnitAttackEvent class in lib/models/unit_attack_event.dart
- [x] Implement combat logic in UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart
- [x] Create CombatParticleComponent demolish effect at unit world position in lib/components/combat_particle_component.dart
- [x] Add method _handleUnitCombat to UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Update MoteComponent rendering with world position in lib/components/mote_component.dart
- [x] Implement reinforce logic in CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Create HUD overlay showing captured stars vs total in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleReinforceSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart
- [x] Define UnitHealEvent class in lib/models/unit_heal_event.dart
- [x] Implement healing logic in GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Create burst animation at centroid when heal succeeds in lib/components/heal_animation_component.dart
- [x] Add method _handleUnitHeal to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Update Star model with maxTier and accumulatedPower in lib/models/star.dart
- [x] Implement power pooling logic in UnitCombatResolver in lib/game/unit_combat_resolver.dart
- [x] Create HUD overlay showing current health and maxHealth of selected units in GameWidget in lib/game/game_widget.dart
- [x] Add method _handleStarCapture to GameStateNotifier in lib/game/game_state_notifier.dart
- [x] Define StarSiegeEvent class in lib/models/star_siege_event.dart
- [x] Implement siege logic in UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart
- [x] Create SiegeEffectComponent visual effect at star world position in lib/components/siege_effect_component.dart

# Backlog — generated 2026-05-19

## Tuesday 2026-05-19
- [x] Add _updateGameState method to AstroGame in lib/game/astro_game.dart — done when: game state is updated on each tick.
- [x] Update Mote model with lifecycle state machine in lib/models/mote.dart — done when: motes have states (created, active, fused).
- [x] Implement capture logic in CombatAttackHandler in lib/game/combat_attack_handler.dart — done when: successful captures update player's stars and vectors.
- [x] Create and add CombatScoreWidget TextComponent in GameWidget in lib/game/game_widget.dart — done when: score is displayed on the HUD.
- [x] Add method _updateFusionIndicator to AstroGame in lib/game/astro_game.dart — done when: fusion indicator updates based on pending motes.
- [x] Define StarLevelUpEvent class in lib/models/star_level_up_event.dart — done when: event exists for capturing stars and leveling up.
- [x] Implement VictoryRules.checkVictoryConditions() in GameStateNotifier in lib/game/game_state_notifier.dart — done when: game checks for victory conditions and triggers game over or win state.
- [x] Create WelcomeScreen StatefulWidget in lib/screens/welcome_screen.dart — done when: welcome screen with START button is shown.
- [x] Add method _handleCaptureSuccess to CombatAttackHandler in lib/game/combat_attack_handler.dart — done when: capture success triggers UI feedback.
- [x] Update MoteComponent rendering with neon glow in lib/components/mote_component.dart — done when: motes are rendered with a neon glow effect.
- [x] Implement move logic in MoveOrderHandler in lib/game/move_order_handler.dart — done when: units move toward tapped positions on the map.
- [x] Create HUD overlay for mote and vector counts in GameWidget in lib/game/game_widget.dart — done when: mote and vector counts are displayed on the HUD.
- [x] Add method _handleMoveComplete to MoveOrderHandler in lib/game/move_order_handler.dart — done when: move completion triggers any necessary UI updates.
- [x] Define CombineOrderEvent class in lib/models/combine_order_event.dart — done when: event exists for combining units.
- [x] Implement long press gesture detection in GestureHandler in lib/game/gesture_handler.dart — done when: long press triggers a combine or siege event.
- [x] Create burst animation at centroid when combine succeeds in lib/components/burst_animation_component.dart — done when: successful combines trigger an animated effect.
- [x] Add method _handleCombineSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart — done when: combine success updates game state and triggers UI effects.
- [x] Update Star model with tiers and power pools in lib/models/star.dart — done when: stars have properties for current tier, accumulated power, and max tier.
- [x] Implement siege logic in UnitCombatResolver tick() in lib/game/unit_combat_resolver.dart — done when: enemy units cause damage to player units during combat.
- [x] Create visual pulse on star each time a unit arrives in lib/components/pulse_effect_component.dart — done when: units arriving at stars trigger visual feedback.
- [x] Add method _handleUnitArrival to GameStateNotifier in lib/game/game_state_notifier.dart — done when: units arriving at stars update game state and trigger visual effects.
- [x] Define UnitAttackEvent class in lib/models/unit_attack_event.dart — done when: event exists for unit combat events.
- [x] Implement combat logic in UnitCombatResolver.tick() in lib/game/unit_combat_resolver.dart — done when: player units cause damage to enemy units during combat.
- [x] Create CombatParticleComponent demolish effect at unit world position in lib/components/combat_particle_component.dart — done when: destroyed units trigger particle effects.
- [x] Add method _handleUnitCombat to UnitCombatResolver in lib/game/unit_combat_resolver.dart — done when: unit combat updates game state and triggers visual and audio effects.
- [x] Update MoteComponent rendering with world position in lib/components/mote_component.dart — done when: motes are rendered at their correct positions on the map.
- [x] Implement reinforce logic in CombineOrderHandler in lib/game/combine_order_handler.dart — done when: successful reinforcements update game state and trigger UI effects.
- [x] Create HUD overlay showing captured stars vs total in GameWidget in lib/game/game_widget.dart — done when: captured star count is displayed on the HUD.
- [x] Add method _handleReinforceSuccess to CombineOrderHandler in lib/game/combine_order_handler.dart — done when: reinforce success triggers UI feedback.
- [x] Define UnitHealEvent class in lib/models/unit_heal_event.dart — done when: event exists for unit healing events.
- [x] Implement healing logic in GameStateNotifier in lib/game/game_state_notifier.dart — done when: units are healed and UI is updated accordingly.
- [x] Create burst animation at centroid when heal succeeds in lib/components/heal_animation_component.dart — done when: successful heals trigger animated effects.
- [x] Add update(dt) to VectorComponent that moves position toward _target at speed px/s — done when: units visibly travel across the screen toward a tapped star.
- [x] Implement move logic in MoveOrderHandler to handle unit movement based on target positions — done when: selected units move to tap coordinates.
- [x] Create and add CombatScoreWidget TextComponent to display current player score — done when: score is visible on the HUD.
- [x] Define StarLevelUpEvent class with parameters for star ID and new level — done when: event class exists with proper attributes.
- [x] Implement VictoryRules.checkVictoryConditions() in GameStateNotifier to check for win/lose conditions — done when: victory rules are checked each tick.
- [x] Create WelcomeScreen StatefulWidget with START button and game title — done when: welcome screen is shown on cold start.
- [x] Add method _handleCaptureSuccess in CombatAttackHandler to handle successful star captures — done when: player's captured stars update on capture.
- [x] Update MoteComponent rendering with neon glow effect using NeonRenderer — done when: motes are rendered with a neon glow.
- [x] Define StarSiegeEvent class to handle enemy star siege events — done when: siege event class exists with proper attributes.
- [x] Implement siege logic in UnitCombatResolver.tick() for player and enemy unit interactions — done when: enemy units damage player units during combat.
- [x] Create CombatParticleComponent to display demolish effects on destroyed units — done when: particle effects are visible when units are destroyed.
- [x] Add method _handleUnitCombat in UnitCombatResolver to handle combat between player and enemy units — done when: combat events trigger proper visual and audio effects.
- [x] Update Mote model with lifecycle states (created, active, fused) — done when: motes have these states.
- [x] Implement capture logic in CombatAttackHandler to update player's stars on successful captures — done when: player's star count updates on capture.
- [x] Create HUD overlay for mote and vector counts using TextComponent — done when: mote and vector counts are displayed on the HUD.
- [x] Add method _handleMoveComplete in MoveOrderHandler to handle completion of unit movement orders — done when: move completion triggers any necessary UI updates.
- [x] Define CombineOrderEvent class for combining units — done when: combine event class exists with proper attributes.
- [x] Implement reinforce logic in CombineOrderHandler to handle unit reinforcements based on power pools — done when: successful reinforcements update game state.
- [x] Create burst animation at centroid when combine succeeds using AnimationController and Flame SpriteSheet — done when: successful combines trigger an animated effect.
- [x] Add method _handleCombineSuccess in CombineOrderHandler to handle successful combine events — done when: combine success updates game state and triggers UI effects.
- [x] Update Star model with properties for current tier, accumulated power, and max tier — done when: stars have these new properties.
- [x] Implement siege logic in UnitCombatResolver.tick() for enemy units capturing player stars — done when: enemy units can capture player stars during combat.
- [x] Create SiegeEffectComponent to display visual effects at captured star positions — done when: visual effects are visible when stars are captured.
- [x] Add method _handleUnitArrival in GameStateNotifier to handle units arriving at stars — done when: units arriving at stars update game state and trigger visual effects.
- [x] Define UnitHealEvent class for unit healing events — done when: heal event class exists with proper attributes.
- [x] Implement healing logic in GameStateNotifier to handle unit healing based on available resources — done when: units are healed and UI is updated accordingly.
- [x] Create burst animation at centroid when heal succeeds using AnimationController and Flame SpriteSheet — done when: successful heals trigger an animated effect.
- [x] Add method _handleUnitHeal in GameStateNotifier to handle successful heal events — done when: heal success updates game state and triggers UI effects.
- [x] Update MoteComponent rendering with world position for accurate visual representation on the map — done when: motes are rendered at their correct positions.
- [x] Implement reinforce logic in CombineOrderHandler to handle combining of damaged units based on incoming power — done when: successful reinforcements update game state and trigger UI effects.
- [x] Create HUD overlay showing captured stars vs total using TextComponent — done when: captured star count is displayed on the HUD.
- [x] Add method _handleReinforceSuccess in CombineOrderHandler to handle successful reinforce events — done when: reinforce success triggers UI feedback.
- [x] Define VictoryCondition enum for different game end conditions — done when: victory condition enum exists with proper values.
- [x] Implement VictoryRules.checkVictoryConditions() in GameStateNotifier to check for win/lose based on VictoryCondition — done when: game checks for victory conditions and triggers game over or win state.
- [x] Create GameOverOverlay widget to display game over screen — done when: game over screen is shown upon losing the game.
- [x] Add method triggerGameOver(GameOverReason reason) in GameStateNotifier to handle game end scenarios — done when: game over triggers with correct reason and UI updates.
- [x] Update WelcomeScreen to include brief one-line rule summary — done when: welcome screen displays a concise game rule on cold start.
- [x] Add method _updateFusionIndicator in AstroGame to update fusion indicator based on pending motes — done when: fusion indicator updates based on pending mote count.
- [x] Create HUD overlay showing current health and maxHealth of selected units using TextComponent — done when: health details are displayed on the HUD.
- [x] Add method _handleStarCapture in GameStateNotifier to handle successful star captures and update game state accordingly — done when: star capture updates player's captured stars.


# Test-File Fix Sprint — generated 2026-05-23

## Sprint goal
Fix all *_test.dart API mismatches so `flutter analyze` reports 0 errors
in test files. Each task fixes one test file. Workers should:
1. Read the test file in full.
2. Read the production source file(s) it imports.
3. Update the test to match the current API — correct constructor args,
   updated provider names, proper imports, no stubs.
4. Never delete tests; always adapt them.

## Key API facts (as of 2026-05-23)
- Mote(id: n, state: MoteLifecycle.active) — state field required, named only
- Star(id: n) — all named, const OK now
- Particle fields: age, lifetime, radius, position, velocity, color, isRing
- gameServiceProvider lives in lib/models/game_state_provider.dart
- StateProvider REMOVED in Riverpod 3.x — use NotifierProvider
- StateNotifierProvider REMOVED — use NotifierProvider
- Notifier from Riverpod 3.x — external code cannot set .state; use methods
- FlameAudio — import package:flame_audio/flame_audio.dart
- Vector2 — import package:flame/components.dart
- CircuitBreaker is in lib/utils/circuit_breaker.dart; no CircuitState enum
- GameStateNotifier is a Notifier<GameState> with no constructor args
- CombatAttackHandler is in lib/game/combat_attack_handler.dart (class is empty — tests should reflect minimal implementation)

## Tasks

- [ ] Fix test API mismatches in test/game/combat_attack_handler_test.dart (33 errors): complete stub method bodies in test/game/combat_attack_handler_test.dart — done when: flutter analyze reports 0 errors for test/game/combat_attack_handler_test.dart
- [ ] Fix test API mismatches in lib/components/mote_component_test.dart (23 errors): add missing param 'glowRadius'; add missing param 'neonColor'; remove illegal const; add missing param 'state'; +2 more in lib/components/mote_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/mote_component_test.dart
- [x] Fix test API mismatches in lib/components/particle_component_test.dart (20 errors): add missing param 'age'; add missing param 'isRing'; add missing param 'lifetime'; add missing param 'radius'; +4 more in lib/components/particle_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/particle_component_test.dart
- [x] Fix test API mismatches in test/game/gcp_sync_handler_test.dart (19 errors): add missing param 'state'; fix miscellaneous error; resolve undefined name 'Gameconst'; fix undefined function 'State'; +5 more in test/game/gcp_sync_handler_test.dart — done when: flutter analyze reports 0 errors for test/game/gcp_sync_handler_test.dart
- [ ] Fix test API mismatches in test/components/star_defense_component_test.dart (16 errors): fix miscellaneous error; fix missing member on 'GameStateNotifier'; fix type mismatch; fix undefined getter 'state'; +1 more in test/components/star_defense_component_test.dart — done when: flutter analyze reports 0 errors for test/components/star_defense_component_test.dart
- [ ] Fix test API mismatches in lib/game/capture_rules_test.dart (15 errors): fix broken import 'fake_async.dart'; add missing param 'state'; fix missing member on 'CaptureRules'; fix undefined function 'fakeAsync'; +2 more in lib/game/capture_rules_test.dart — done when: flutter analyze reports 0 errors for lib/game/capture_rules_test.dart
- [x] Fix test API mismatches in test/integration/fusion_effect_service_test.dart (15 errors): fix broken import 'fusion_effect_service.dart'; fix miscellaneous error; fix undefined function 'GameStateNotifier'; fix undefined function 'FusionEffectService'; +6 more in test/integration/fusion_effect_service_test.dart — done when: flutter analyze reports 0 errors for test/integration/fusion_effect_service_test.dart
- [x] Fix test API mismatches in lib/game/fuse_motes_test.dart (14 errors): fix wrong constructor arg count; fix miscellaneous error; remove void-result usage; resolve undefined name 'moteCountProvider' in lib/game/fuse_motes_test.dart — done when: flutter analyze reports 0 errors for lib/game/fuse_motes_test.dart
- [x] Fix test API mismatches in lib/models/game_state_test.dart (14 errors): fix non-const value in const decl; remove illegal const; add missing param 'state'; fix miscellaneous error in lib/models/game_state_test.dart — done when: flutter analyze reports 0 errors for lib/models/game_state_test.dart
- [ ] Fix test API mismatches in lib/game/combat_attack_handler_test.dart (13 errors): fix broken import 'local_persistence_service.dart'; fix miscellaneous error; fix undefined function 'LocalPersistenceService'; fix type mismatch; +5 more in lib/game/combat_attack_handler_test.dart — done when: flutter analyze reports 0 errors for lib/game/combat_attack_handler_test.dart
- [x] Fix test API mismatches in test/game/circuit_breaker_test.dart (13 errors): fix broken import 'circuit_breaker.dart'; fix miscellaneous error; fix undefined function 'CircuitBreaker'; resolve undefined name 'CircuitState' in test/game/circuit_breaker_test.dart — done when: flutter analyze reports 0 errors for test/game/circuit_breaker_test.dart
- [x] Fix test API mismatches in test/game/sparkle_renderer_test.dart (13 errors): fix undefined function 'when'; fix miscellaneous error; fix undefined getter 'spawnSpark'; fix undefined function 'calledOnceWith'; +3 more in test/game/sparkle_renderer_test.dart — done when: flutter analyze reports 0 errors for test/game/sparkle_renderer_test.dart
- [x] Fix test API mismatches in test/game/fusion_test.dart (12 errors): resolve undefined name 'gameServiceProvider'; resolve undefined name 'fusionReadyEventProvider'; fix miscellaneous error in test/game/fusion_test.dart — done when: flutter analyze reports 0 errors for test/game/fusion_test.dart
- [ ] Fix test API mismatches in test/game/game_over_test.dart (12 errors): resolve undefined name 'gameOverProvider'; resolve undefined name 'GameOverReason'; fix wrong constructor arg count; fix undefined function 'MockGame'; +2 more in test/game/game_over_test.dart — done when: flutter analyze reports 0 errors for test/game/game_over_test.dart
- [ ] Fix test API mismatches in test/game/mote_count_provider_test.dart (11 errors): fix type mismatch; fix undefined function 'Mote'; fix undefined getter 'notifier' in test/game/mote_count_provider_test.dart — done when: flutter analyze reports 0 errors for test/game/mote_count_provider_test.dart
- [ ] Fix test API mismatches in lib/components/particle_system_test.dart (10 errors): fix type mismatch; fix wrong constructor arg count; fix undefined getter 'particles'; resolve undefined name 'ParticleType' in lib/components/particle_system_test.dart — done when: flutter analyze reports 0 errors for lib/components/particle_system_test.dart
- [x] Fix test API mismatches in test/game/audio_service_test.dart (10 errors): resolve undefined name 'FlameAudio' in test/game/audio_service_test.dart — done when: flutter analyze reports 0 errors for test/game/audio_service_test.dart
- [ ] Fix test API mismatches in test/game/capture_event_notifier_test.dart (10 errors): fix broken import 'capture_event_notifier.dart'; fix undefined function 'ProviderContainer'; fix undefined function 'AstroGameStateProvider'; fix undefined function 'CaptureEventNotifier'; +3 more in test/game/capture_event_notifier_test.dart — done when: flutter analyze reports 0 errors for test/game/capture_event_notifier_test.dart
- [ ] Fix test API mismatches in test/game/xp_gain_level_up_boundary_test.dart (10 errors): fix undefined function 'StateNotifierProvider'; fix miscellaneous error; fix wrong constructor arg count; resolve undefined name 'ref' in test/game/xp_gain_level_up_boundary_test.dart — done when: flutter analyze reports 0 errors for test/game/xp_gain_level_up_boundary_test.dart
- [ ] Fix test API mismatches in test/components/attack_line_component_test.dart (9 errors): fix missing member on 'AttackLineComponentTest'; resolve undefined name 'testRenderer'; fix type mismatch; fix wrong constructor arg count; +4 more in test/components/attack_line_component_test.dart — done when: flutter analyze reports 0 errors for test/components/attack_line_component_test.dart
- [ ] Fix test API mismatches in test/game/combat_attack_event_handler_test.dart (9 errors): fix broken import 'combat_attack_event.dart'; fix broken import 'flutter_vector_math.dart'; fix miscellaneous error; fix undefined function 'CombatAttackHandler'; +4 more in test/game/combat_attack_event_handler_test.dart — done when: flutter analyze reports 0 errors for test/game/combat_attack_event_handler_test.dart
- [ ] Fix test API mismatches in lib/game/capture_target_animation_test.dart (8 errors): fix undefined function 'Vector2'; resolve undefined name 'Colors'; resolve undefined name 'FlameTester'; fix undefined function 'GameWidget'; +3 more in lib/game/capture_target_animation_test.dart — done when: flutter analyze reports 0 errors for lib/game/capture_target_animation_test.dart
- [x] Fix test API mismatches in lib/game/collision_performance_test.dart (8 errors): fix miscellaneous error; fix missing member on 'Game'; resolve ambiguous import; fix undefined function 'Star'; +1 more in lib/game/collision_performance_test.dart — done when: flutter analyze reports 0 errors for lib/game/collision_performance_test.dart
- [x] Fix test API mismatches in lib/systems/persistence_service_test.dart (8 errors): fix non-const value in const decl; remove illegal const; add missing param 'state' in lib/systems/persistence_service_test.dart — done when: flutter analyze reports 0 errors for lib/systems/persistence_service_test.dart
- [ ] Fix test API mismatches in test/components/neon_glow_test.dart (8 errors): resolve undefined name 'testRenderer'; fix type mismatch; fix wrong constructor arg count; fix miscellaneous error; +3 more in test/components/neon_glow_test.dart — done when: flutter analyze reports 0 errors for test/components/neon_glow_test.dart
- [x] Fix test API mismatches in test/game/game_loop_integration_test.dart (8 errors): add missing param 'state'; fix wrong constructor arg count; fix type mismatch; resolve undefined name 'notifier'; +2 more in test/game/game_loop_integration_test.dart — done when: flutter analyze reports 0 errors for test/game/game_loop_integration_test.dart
- [x] Fix test API mismatches in test/game/server_validation_service_test.dart (8 errors): fix miscellaneous error; add missing param 'state'; rename lifecycleState → state in test/game/server_validation_service_test.dart — done when: flutter analyze reports 0 errors for test/game/server_validation_service_test.dart
- [ ] Fix test API mismatches in lib/components/combat_attack_handler_test.dart (7 errors): fix broken import 'local_persistence_service.dart'; fix miscellaneous error; fix undefined function 'StateNotifierProvider'; fix undefined function 'LocalPersistenceService'; +2 more in lib/components/combat_attack_handler_test.dart — done when: flutter analyze reports 0 errors for lib/components/combat_attack_handler_test.dart
- [ ] Fix test API mismatches in test/game/fusion_effect_service_test.dart (7 errors): fix broken import 'flutter_primepod.dart'; fix broken import 'game_events.dart'; fix undefined function 'AstroGame'; fix undefined function 'Vector2'; +3 more in test/game/fusion_effect_service_test.dart — done when: flutter analyze reports 0 errors for test/game/fusion_effect_service_test.dart
- [ ] Fix test API mismatches in test/integration/game_state_provider_test.dart (7 errors): fix wrong constructor arg count; fix type mismatch; remove void-result usage; fix miscellaneous error; +3 more in test/integration/game_state_provider_test.dart — done when: flutter analyze reports 0 errors for test/integration/game_state_provider_test.dart
- [x] Fix test API mismatches in lib/game/fusion_effect_service_test.dart (6 errors): fix broken import 'flutter_primepod.dart'; fix undefined function 'AstroGame'; fix undefined function 'Vector2'; resolve undefined name 'find'; +2 more in lib/game/fusion_effect_service_test.dart — done when: flutter analyze reports 0 errors for lib/game/fusion_effect_service_test.dart
- [x] Fix test API mismatches in test/components/combat_result_label_golden_test.dart (6 errors): fix miscellaneous error; fix broken import 'combat_result_label_component.dart' in test/components/combat_result_label_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/combat_result_label_golden_test.dart
- [x] Fix test API mismatches in test/game/capture_rules_test.dart (6 errors): fix broken import 'fake_async.dart'; fix missing member on 'CaptureRules'; fix undefined function 'fakeAsync'; resolve undefined name 'ref'; +1 more in test/game/capture_rules_test.dart — done when: flutter analyze reports 0 errors for test/game/capture_rules_test.dart
- [x] Fix test API mismatches in test/game/fusion_rules_test.dart (6 errors): fix broken import 'fusion_rules.dart'; fix undefined function 'group'; fix undefined function 'test'; fix undefined function 'expect'; +2 more in test/game/fusion_rules_test.dart — done when: flutter analyze reports 0 errors for test/game/fusion_rules_test.dart
- [ ] Fix test API mismatches in test/integration/fusion_request_validation_test.dart (6 errors): resolve undefined name 'gameServiceProvider'; fix miscellaneous error; resolve undefined name 'fusionProviderProvider'; add missing param 'state' in test/integration/fusion_request_validation_test.dart — done when: flutter analyze reports 0 errors for test/integration/fusion_request_validation_test.dart
- [x] Fix test API mismatches in test/services/server_validation_service_test.dart (6 errors): add missing param 'state'; fix missing member on 'Mote' in test/services/server_validation_service_test.dart — done when: flutter analyze reports 0 errors for test/services/server_validation_service_test.dart
- [x] Fix test API mismatches in lib/components/capture_target_animation_test.dart (5 errors): fix broken import 'fusion_indicator_state.dart'; fix broken import 'capture_target_animation.dart'; fix undefined function 'CaptureTargetAnimation'; resolve undefined name 'Vector2'; +1 more in lib/components/capture_target_animation_test.dart — done when: flutter analyze reports 0 errors for lib/components/capture_target_animation_test.dart
- [x] Fix test API mismatches in lib/components/vector_component_test.dart (5 errors): remove illegal const in lib/components/vector_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/vector_component_test.dart
- [x] Fix test API mismatches in lib/game/particle_effects_test.dart (5 errors): fix undefined function 'ParticleSystem'; fix missing member on 'ParticleEffects' in lib/game/particle_effects_test.dart — done when: flutter analyze reports 0 errors for lib/game/particle_effects_test.dart
- [x] Fix test API mismatches in lib/game/perf_test.dart (5 errors): fix broken import 'flutter_driver.dart'; fix miscellaneous error; resolve undefined name 'FlutterDriver'; resolve undefined name 'find'; +1 more in lib/game/perf_test.dart — done when: flutter analyze reports 0 errors for lib/game/perf_test.dart
- [x] Fix test API mismatches in test/components/combat_particle_overlay_golden_test.dart (5 errors): fix broken import 'combat_particle_overlay.dart'; fix miscellaneous error; fix missing member on 'CombatParticleOverlayGoldenTestGame'; resolve undefined name 'AttackParticle' in test/components/combat_particle_overlay_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/combat_particle_overlay_golden_test.dart
- [ ] Fix test API mismatches in test/game/fuse_motes_test.dart (5 errors): fix miscellaneous error; fix wrong constructor arg count; remove void-result usage in test/game/fuse_motes_test.dart — done when: flutter analyze reports 0 errors for test/game/fuse_motes_test.dart
- [ ] Fix test API mismatches in test/providers/mote_count_provider_test.dart (5 errors): resolve undefined name 'gameStateProvider'; fix miscellaneous error; add missing param 'state'; fix undefined getter 'lifecycleState' in test/providers/mote_count_provider_test.dart — done when: flutter analyze reports 0 errors for test/providers/mote_count_provider_test.dart
- [x] Fix test API mismatches in lib/game/capture_event_notifier_test.dart (4 errors): fix miscellaneous error; fix undefined function 'CaptureEventNotifier'; fix missing member on 'AudioService'; resolve undefined name 'calledOnce' in lib/game/capture_event_notifier_test.dart — done when: flutter analyze reports 0 errors for lib/game/capture_event_notifier_test.dart
- [ ] Fix test API mismatches in lib/game/particle_system_api_test.dart (4 errors): fix undefined function 'ParticleSystem' in lib/game/particle_system_api_test.dart — done when: flutter analyze reports 0 errors for lib/game/particle_system_api_test.dart
- [x] Fix test API mismatches in lib/game/particle_system_test.dart (4 errors): fix undefined function 'ParticleSystem' in lib/game/particle_system_test.dart — done when: flutter analyze reports 0 errors for lib/game/particle_system_test.dart
- [x] Fix test API mismatches in test/components/capture_result_label_golden_test.dart (4 errors): fix missing member on 'NotifierProvider'; fix wrong constructor arg count; fix undefined function 'AstroGame'; fix missing member on 'GameState' in test/components/capture_result_label_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/capture_result_label_golden_test.dart
- [ ] Fix test API mismatches in test/components/level_up_event_bus_test.dart (4 errors): fix miscellaneous error in test/components/level_up_event_bus_test.dart — done when: flutter analyze reports 0 errors for test/components/level_up_event_bus_test.dart
- [x] Fix test API mismatches in test/game/particle_effects_test.dart (4 errors): fix miscellaneous error in test/game/particle_effects_test.dart — done when: flutter analyze reports 0 errors for test/game/particle_effects_test.dart
- [ ] Fix test API mismatches in lib/game/star_decay_test.dart (3 errors): fix undefined function 'GameStateNotifier'; fix undefined getter 'decayTimer' in lib/game/star_decay_test.dart — done when: flutter analyze reports 0 errors for lib/game/star_decay_test.dart
- [x] Fix test API mismatches in lib/game/star_production_rate_provider_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'notifier' in lib/game/star_production_rate_provider_test.dart — done when: flutter analyze reports 0 errors for lib/game/star_production_rate_provider_test.dart
- [ ] Fix test API mismatches in lib/models/star_production_rate_provider_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'notifier' in lib/models/star_production_rate_provider_test.dart — done when: flutter analyze reports 0 errors for lib/models/star_production_rate_provider_test.dart
- [x] Fix test API mismatches in test/game/cooldown_timer_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'totalSeconds'; fix undefined getter 'remainingSeconds' in test/game/cooldown_timer_test.dart — done when: flutter analyze reports 0 errors for test/game/cooldown_timer_test.dart
- [ ] Fix test API mismatches in test/game/perf_test.dart (3 errors): fix broken import 'flutter_driver.dart'; resolve undefined name 'FlutterDriver'; resolve undefined name 'find' in test/game/perf_test.dart — done when: flutter analyze reports 0 errors for test/game/perf_test.dart
- [ ] Fix test API mismatches in test/game/victory_conditions_test.dart (3 errors): fix undefined function 'Star'; fix undefined function 'Mote' in test/game/victory_conditions_test.dart — done when: flutter analyze reports 0 errors for test/game/victory_conditions_test.dart
- [x] Fix test API mismatches in lib/components/combat_particle_component_test.dart (2 errors): remove illegal const in lib/components/combat_particle_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/combat_particle_component_test.dart
- [x] Fix test API mismatches in lib/components/particle_effects_test.dart (2 errors): fix undefined function 'ParticleSystem' in lib/components/particle_effects_test.dart — done when: flutter analyze reports 0 errors for lib/components/particle_effects_test.dart
- [x] Fix test API mismatches in lib/game/audio_service_test.dart (2 errors): fix missing member on 'AudioService'; fix undefined getter 'played' in lib/game/audio_service_test.dart — done when: flutter analyze reports 0 errors for lib/game/audio_service_test.dart
- [x] Fix test API mismatches in lib/game/star_decay_manager_test.dart (2 errors): fix miscellaneous error in lib/game/star_decay_manager_test.dart — done when: flutter analyze reports 0 errors for lib/game/star_decay_manager_test.dart
- [x] Fix test API mismatches in test/components/neon_renderer_config_test.dart (2 errors): fix miscellaneous error; fix undefined getter 'glowColor' in test/components/neon_renderer_config_test.dart — done when: flutter analyze reports 0 errors for test/components/neon_renderer_config_test.dart
- [x] Fix test API mismatches in test/components/star_capture_indicator_test.dart (2 errors): fix broken import 'star_capture_indicator.dart'; fix undefined function 'StarCaptureIndicator' in test/components/star_capture_indicator_test.dart — done when: flutter analyze reports 0 errors for test/components/star_capture_indicator_test.dart
- [x] Fix test API mismatches in test/game/star_production_rate_provider_test.dart (2 errors): fix broken import 'star_production_rate_provider.dart'; resolve undefined name 'starProductionRatesProvider' in test/game/star_production_rate_provider_test.dart — done when: flutter analyze reports 0 errors for test/game/star_production_rate_provider_test.dart
- [x] Fix test API mismatches in test/components/combat_text_score_golden_test.dart (1 errors): fix miscellaneous error in test/components/combat_text_score_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/combat_text_score_golden_test.dart
- [x] Fix test API mismatches in test/components/neon_glow_golden_test.dart (1 errors): fix undefined getter 'moteGlowColor' in test/components/neon_glow_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/neon_glow_golden_test.dart
- [x] Fix test API mismatches in test/components/particle_system_test.dart (1 errors): fix undefined function 'ParticleManager' in test/components/particle_system_test.dart — done when: flutter analyze reports 0 errors for test/components/particle_system_test.dart
- [ ] Fix test API mismatches in test/integration/fusion_provider_test.dart (1 errors): resolve undefined name 'fusionProviderProvider' in test/integration/fusion_provider_test.dart — done when: flutter analyze reports 0 errors for test/integration/fusion_provider_test.dart


# Layer 2 — Core Gameplay Loop — generated 2026-05-24

## Sprint goal
Wire the full player gameplay loop so the game is actually playable end-to-end:
lasso motes, tap to direct, fuse into vectors, capture stars, auto-combat, and
win/lose. Each task below is self-contained and maps to one or two source files.

## Key invariants (read before touching any file)
- Positions live in Flame (VectorComponent/MoteComponent) — NEVER in Riverpod models
- Riverpod holds logical state only (ownership, HP, lifecycle) — never Vector2
- ScaleDetector stays on AstroGame (FlameGame) — never on a PositionComponent
- TapCallbacks / DragCallbacks go on GestureHandler (PositionComponent), not FlameGame
- FusionRules.fusionThreshold = 5 — always 5 motes per vector, no auto-fusion
- Motes are cyan (player) / red (enemy); Vectors are same + tier glow
- Star neutrals start at 0 HP; ownership flips when HP first crosses 20

## Tasks

- [ ] Fix mote lifecycle — spawn motes as MoteLifecycle.active in AstroGame._tickMoteProduction() and in GameStateNotifier.addMote(); FusionRules.canFuse() checks isActive so motes stuck in 'created' can never fuse — done when: flutter analyze 0 errors and newly spawned motes have state == MoteLifecycle.active
- [ ] Add lasso selection gesture to GestureHandler — add DragCallbacks to GestureHandler; on drag start record startPos; on drag update track currentPos; on drag end compute axis-aligned bounding box from start→end and collect all MoteComponent and VectorComponent ids whose Flame world positions fall inside that box; write the selected ids into a new SelectionNotifier in lib/providers/selection_provider.dart (NotifierProvider<SelectionState>); clear selection on a plain tap that hits no star and no unit — done when: dragging across motes/vectors selects them; flutter analyze 0 errors
- [ ] Render selection highlight ring on selected Mote/Vector components — MoteComponent: in render(), if its mote.id is in selectionProvider, draw an additional outer ring using neonColor with 0.5 alpha and +4px radius; VectorComponent: same pattern with +4px radius ring; both components need a way to read selectionProvider — pass a bool isSelected via constructor or use a Flame ComponentKey lookup — done when: selected units show a visible highlight ring; flutter analyze 0 errors
- [ ] Tap-to-direct selected player units — in GestureHandler.onTapDown: if selectionProvider has player unit ids, route each selected VectorComponent to the tapped world position (if tap is within _tapRadius of a star, use that star's world position); route selected MoteComponents to the tapped position at moteSpeed; clear the selection after dispatching movement orders; existing "send all vectors to tapped star" behavior only fires when selection is empty — done when: tapping a star with selected vectors sends only those vectors; flutter analyze 0 errors
- [ ] Player-initiated fusion — in GestureHandler.onTapDown: if tap hits a selected MoteComponent AND selectionProvider contains >= 5 player mote ids, fuse groups of 5; for each group of 5: compute centroid of their Flame positions, call GameStateNotifier.removeMote() × 5, call GameStateNotifier.addVector() with a new id and owner='player', spawn a VectorComponent at the centroid and add it to AstroGame, remove the 5 MoteComponents from the game tree; if selected count > 5, remainder motes stay selected — done when: lasso 5 motes, tap any selected mote → 1 vector appears at centroid; flutter analyze 0 errors
- [ ] Star capture on Vector arrival — in AstroGame.onLoad(), pass an onArrived callback to each VectorComponent; when a vector arrives, check if its position is within 48px of any star in _starPositions; if enemy or neutral star: call GameStateNotifier to reduce star's accumulatedPower by vector.currentHealth; if accumulatedPower <= 0 call captureStar(starId, vector.owner) and reset accumulatedPower to 0; if friendly star: add vector.currentHealth to star's accumulatedPower; then remove the vector from Riverpod state and from _vectorComponents — done when: sending a vector to an enemy star reduces its HP; at 0 HP the star flips ownership; flutter analyze 0 errors
- [ ] StarComponent live ownership updates — StarComponent currently captures star at construction time; it must reflect live Riverpod state instead; add a WidgetRef field and read the current Star from gameServiceProvider each render() call using the star.id; update neonColor to use the live owner; add an HP label or ring progress showing accumulatedPower / 20.0 so the player can see star investment — done when: capturing a star changes its colour on-screen without restart; flutter analyze 0 errors
- [ ] Enemy AI basic loop — add an _enemyAiTimer in AstroGame and tick it each update(dt); every 5 seconds: collect all enemy MoteComponents, route each toward the nearest neutral or player star (pick the closest by world position); if there are >= 5 enemy motes in _moteComponents for the enemy owner, fuse the oldest 5 into an enemy VectorComponent at the centroid of those motes and remove them (same fusion logic as player); route each enemy VectorComponent toward the player's home star (index 0 in _starPositions) — done when: enemy motes visibly move toward stars and occasionally fuse; enemy vectors travel toward player star; flutter analyze 0 errors
- [ ] Double-tap friendly star absorbs nearby player motes — add DoubleTapCallbacks to GestureHandler; on double-tap: find the nearest star within _tapRadius; if that star's ownerId == 'player', find all MoteComponents in _moteComponents whose owner is 'player' and whose position is within 80px of the star's world position; for each such mote: remove it from Riverpod state via removeMote(), remove its MoteComponent from the game tree, and add 1 to the star's accumulatedPower — done when: double-tapping player star pulls in nearby player motes; flutter analyze 0 errors
- [x] Win/loss detection — in AstroGame.update(dt), after UnitCombatResolver.tick(): read gameServiceProvider; win condition: player owns all 7 stars (all ownerId == 'player') AND no enemy VectorComponents or enemy MoteComponents remain; lose condition: enemy owns all 7 stars AND no player units remain; on win: call game.overlays.add('gameOver') with a result flag; on lose: same; register a 'gameOver' overlay in GameWidget that shows the result and a Restart button that calls _ref.read(gameServiceProvider.notifier).reset() then re-runs onLoad() — done when: winning the board shows a win screen; flutter analyze 0 errors
