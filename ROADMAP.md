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

- [x] Fix test API mismatches in test/game/combat_attack_handler_test.dart (33 errors): complete stub method bodies in test/game/combat_attack_handler_test.dart — done when: flutter analyze reports 0 errors for test/game/combat_attack_handler_test.dart
- [ ] Fix test API mismatches in lib/components/mote_component_test.dart (23 errors): add missing param 'glowRadius'; add missing param 'neonColor'; remove illegal const; add missing param 'state'; +2 more in lib/components/mote_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/mote_component_test.dart
- [x] Fix test API mismatches in lib/components/particle_component_test.dart (20 errors): add missing param 'age'; add missing param 'isRing'; add missing param 'lifetime'; add missing param 'radius'; +4 more in lib/components/particle_component_test.dart — done when: flutter analyze reports 0 errors for lib/components/particle_component_test.dart
- [x] Fix test API mismatches in test/game/gcp_sync_handler_test.dart (19 errors): add missing param 'state'; fix miscellaneous error; resolve undefined name 'Gameconst'; fix undefined function 'State'; +5 more in test/game/gcp_sync_handler_test.dart — done when: flutter analyze reports 0 errors for test/game/gcp_sync_handler_test.dart
- [x] Fix test API mismatches in test/components/star_defense_component_test.dart (16 errors): fix miscellaneous error; fix missing member on 'GameStateNotifier'; fix type mismatch; fix undefined getter 'state'; +1 more in test/components/star_defense_component_test.dart — done when: flutter analyze reports 0 errors for test/components/star_defense_component_test.dart
- [x] Fix test API mismatches in lib/game/capture_rules_test.dart (15 errors): fix broken import 'fake_async.dart'; add missing param 'state'; fix missing member on 'CaptureRules'; fix undefined function 'fakeAsync'; +2 more in lib/game/capture_rules_test.dart — done when: flutter analyze reports 0 errors for lib/game/capture_rules_test.dart
- [x] Fix test API mismatches in test/integration/fusion_effect_service_test.dart (15 errors): fix broken import 'fusion_effect_service.dart'; fix miscellaneous error; fix undefined function 'GameStateNotifier'; fix undefined function 'FusionEffectService'; +6 more in test/integration/fusion_effect_service_test.dart — done when: flutter analyze reports 0 errors for test/integration/fusion_effect_service_test.dart
- [x] Fix test API mismatches in lib/game/fuse_motes_test.dart (14 errors): fix wrong constructor arg count; fix miscellaneous error; remove void-result usage; resolve undefined name 'moteCountProvider' in lib/game/fuse_motes_test.dart — done when: flutter analyze reports 0 errors for lib/game/fuse_motes_test.dart
- [x] Fix test API mismatches in lib/models/game_state_test.dart (14 errors): fix non-const value in const decl; remove illegal const; add missing param 'state'; fix miscellaneous error in lib/models/game_state_test.dart — done when: flutter analyze reports 0 errors for lib/models/game_state_test.dart
- [x] Fix test API mismatches in lib/game/combat_attack_handler_test.dart (13 errors): fix broken import 'local_persistence_service.dart'; fix miscellaneous error; fix undefined function 'LocalPersistenceService'; fix type mismatch; +5 more in lib/game/combat_attack_handler_test.dart — done when: flutter analyze reports 0 errors for lib/game/combat_attack_handler_test.dart
- [x] Fix test API mismatches in test/game/circuit_breaker_test.dart (13 errors): fix broken import 'circuit_breaker.dart'; fix miscellaneous error; fix undefined function 'CircuitBreaker'; resolve undefined name 'CircuitState' in test/game/circuit_breaker_test.dart — done when: flutter analyze reports 0 errors for test/game/circuit_breaker_test.dart
- [x] Fix test API mismatches in test/game/sparkle_renderer_test.dart (13 errors): fix undefined function 'when'; fix miscellaneous error; fix undefined getter 'spawnSpark'; fix undefined function 'calledOnceWith'; +3 more in test/game/sparkle_renderer_test.dart — done when: flutter analyze reports 0 errors for test/game/sparkle_renderer_test.dart
- [x] Fix test API mismatches in test/game/fusion_test.dart (12 errors): resolve undefined name 'gameServiceProvider'; resolve undefined name 'fusionReadyEventProvider'; fix miscellaneous error in test/game/fusion_test.dart — done when: flutter analyze reports 0 errors for test/game/fusion_test.dart
- [x] Fix test API mismatches in test/game/game_over_test.dart (12 errors): resolve undefined name 'gameOverProvider'; resolve undefined name 'GameOverReason'; fix wrong constructor arg count; fix undefined function 'MockGame'; +2 more in test/game/game_over_test.dart — done when: flutter analyze reports 0 errors for test/game/game_over_test.dart
- [ ] Fix test API mismatches in test/game/mote_count_provider_test.dart (11 errors): fix type mismatch; fix undefined function 'Mote'; fix undefined getter 'notifier' in test/game/mote_count_provider_test.dart — done when: flutter analyze reports 0 errors for test/game/mote_count_provider_test.dart
- [x] Fix test API mismatches in lib/components/particle_system_test.dart (10 errors): fix type mismatch; fix wrong constructor arg count; fix undefined getter 'particles'; resolve undefined name 'ParticleType' in lib/components/particle_system_test.dart — done when: flutter analyze reports 0 errors for lib/components/particle_system_test.dart
- [x] Fix test API mismatches in test/game/audio_service_test.dart (10 errors): resolve undefined name 'FlameAudio' in test/game/audio_service_test.dart — done when: flutter analyze reports 0 errors for test/game/audio_service_test.dart
- [x] Fix test API mismatches in test/game/capture_event_notifier_test.dart (10 errors): fix broken import 'capture_event_notifier.dart'; fix undefined function 'ProviderContainer'; fix undefined function 'AstroGameStateProvider'; fix undefined function 'CaptureEventNotifier'; +3 more in test/game/capture_event_notifier_test.dart — done when: flutter analyze reports 0 errors for test/game/capture_event_notifier_test.dart
- [x] Fix test API mismatches in test/game/xp_gain_level_up_boundary_test.dart (10 errors): fix undefined function 'StateNotifierProvider'; fix miscellaneous error; fix wrong constructor arg count; resolve undefined name 'ref' in test/game/xp_gain_level_up_boundary_test.dart — done when: flutter analyze reports 0 errors for test/game/xp_gain_level_up_boundary_test.dart
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
- [x] Fix test API mismatches in test/integration/game_state_provider_test.dart (7 errors): fix wrong constructor arg count; fix type mismatch; remove void-result usage; fix miscellaneous error; +3 more in test/integration/game_state_provider_test.dart — done when: flutter analyze reports 0 errors for test/integration/game_state_provider_test.dart
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
- [x] Fix test API mismatches in test/game/fuse_motes_test.dart (5 errors): fix miscellaneous error; fix wrong constructor arg count; remove void-result usage in test/game/fuse_motes_test.dart — done when: flutter analyze reports 0 errors for test/game/fuse_motes_test.dart
- [x] Fix test API mismatches in test/providers/mote_count_provider_test.dart (5 errors): resolve undefined name 'gameStateProvider'; fix miscellaneous error; add missing param 'state'; fix undefined getter 'lifecycleState' in test/providers/mote_count_provider_test.dart — done when: flutter analyze reports 0 errors for test/providers/mote_count_provider_test.dart
- [x] Fix test API mismatches in lib/game/capture_event_notifier_test.dart (4 errors): fix miscellaneous error; fix undefined function 'CaptureEventNotifier'; fix missing member on 'AudioService'; resolve undefined name 'calledOnce' in lib/game/capture_event_notifier_test.dart — done when: flutter analyze reports 0 errors for lib/game/capture_event_notifier_test.dart
- [x] Fix test API mismatches in lib/game/particle_system_api_test.dart (4 errors): fix undefined function 'ParticleSystem' in lib/game/particle_system_api_test.dart — done when: flutter analyze reports 0 errors for lib/game/particle_system_api_test.dart
- [x] Fix test API mismatches in lib/game/particle_system_test.dart (4 errors): fix undefined function 'ParticleSystem' in lib/game/particle_system_test.dart — done when: flutter analyze reports 0 errors for lib/game/particle_system_test.dart
- [x] Fix test API mismatches in test/components/capture_result_label_golden_test.dart (4 errors): fix missing member on 'NotifierProvider'; fix wrong constructor arg count; fix undefined function 'AstroGame'; fix missing member on 'GameState' in test/components/capture_result_label_golden_test.dart — done when: flutter analyze reports 0 errors for test/components/capture_result_label_golden_test.dart
- [ ] Fix test API mismatches in test/components/level_up_event_bus_test.dart (4 errors): fix miscellaneous error in test/components/level_up_event_bus_test.dart — done when: flutter analyze reports 0 errors for test/components/level_up_event_bus_test.dart
- [x] Fix test API mismatches in test/game/particle_effects_test.dart (4 errors): fix miscellaneous error in test/game/particle_effects_test.dart — done when: flutter analyze reports 0 errors for test/game/particle_effects_test.dart
- [x] Fix test API mismatches in lib/game/star_decay_test.dart (3 errors): fix undefined function 'GameStateNotifier'; fix undefined getter 'decayTimer' in lib/game/star_decay_test.dart — done when: flutter analyze reports 0 errors for lib/game/star_decay_test.dart
- [x] Fix test API mismatches in lib/game/star_production_rate_provider_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'notifier' in lib/game/star_production_rate_provider_test.dart — done when: flutter analyze reports 0 errors for lib/game/star_production_rate_provider_test.dart
- [ ] Fix test API mismatches in lib/models/star_production_rate_provider_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'notifier' in lib/models/star_production_rate_provider_test.dart — done when: flutter analyze reports 0 errors for lib/models/star_production_rate_provider_test.dart
- [x] Fix test API mismatches in test/game/cooldown_timer_test.dart (3 errors): fix miscellaneous error; fix undefined getter 'totalSeconds'; fix undefined getter 'remainingSeconds' in test/game/cooldown_timer_test.dart — done when: flutter analyze reports 0 errors for test/game/cooldown_timer_test.dart
- [x] Fix test API mismatches in test/game/perf_test.dart (3 errors): fix broken import 'flutter_driver.dart'; resolve undefined name 'FlutterDriver'; resolve undefined name 'find' in test/game/perf_test.dart — done when: flutter analyze reports 0 errors for test/game/perf_test.dart
- [x] Fix test API mismatches in test/game/victory_conditions_test.dart (3 errors): fix undefined function 'Star'; fix undefined function 'Mote' in test/game/victory_conditions_test.dart — done when: flutter analyze reports 0 errors for test/game/victory_conditions_test.dart
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
- [x] Fix test API mismatches in test/integration/fusion_provider_test.dart (1 errors): resolve undefined name 'fusionProviderProvider' in test/integration/fusion_provider_test.dart — done when: flutter analyze reports 0 errors for test/integration/fusion_provider_test.dart


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

- [x] Fix mote lifecycle — spawn motes as MoteLifecycle.active in AstroGame._tickMoteProduction() and in GameStateNotifier.addMote(); FusionRules.canFuse() checks isActive so motes stuck in 'created' can never fuse — done when: flutter analyze 0 errors and newly spawned motes have state == MoteLifecycle.active
- [ ] Add lasso selection gesture to GestureHandler — add DragCallbacks to GestureHandler; on drag start record startPos; on drag update track currentPos; on drag end compute axis-aligned bounding box from start→end and collect all MoteComponent and VectorComponent ids whose Flame world positions fall inside that box; write the selected ids into a new SelectionNotifier in lib/providers/selection_provider.dart (NotifierProvider<SelectionState>); clear selection on a plain tap that hits no star and no unit — done when: dragging across motes/vectors selects them; flutter analyze 0 errors
- [ ] Render selection highlight ring on selected Mote/Vector components — MoteComponent: in render(), if its mote.id is in selectionProvider, draw an additional outer ring using neonColor with 0.5 alpha and +4px radius; VectorComponent: same pattern with +4px radius ring; both components need a way to read selectionProvider — pass a bool isSelected via constructor or use a Flame ComponentKey lookup — done when: selected units show a visible highlight ring; flutter analyze 0 errors
- [x] Tap-to-direct selected player units — in GestureHandler.onTapDown: if selectionProvider has player unit ids, route each selected VectorComponent to the tapped world position (if tap is within _tapRadius of a star, use that star's world position); route selected MoteComponents to the tapped position at moteSpeed; clear the selection after dispatching movement orders; existing "send all vectors to tapped star" behavior only fires when selection is empty — done when: tapping a star with selected vectors sends only those vectors; flutter analyze 0 errors
- [ ] Player-initiated fusion — in GestureHandler.onTapDown: if tap hits a selected MoteComponent AND selectionProvider contains >= 5 player mote ids, fuse groups of 5; for each group of 5: compute centroid of their Flame positions, call GameStateNotifier.removeMote() × 5, call GameStateNotifier.addVector() with a new id and owner='player', spawn a VectorComponent at the centroid and add it to AstroGame, remove the 5 MoteComponents from the game tree; if selected count > 5, remainder motes stay selected — done when: lasso 5 motes, tap any selected mote → 1 vector appears at centroid; flutter analyze 0 errors
- [ ] Star capture on Vector arrival — in AstroGame.onLoad(), pass an onArrived callback to each VectorComponent; when a vector arrives, check if its position is within 48px of any star in _starPositions; if enemy or neutral star: call GameStateNotifier to reduce star's accumulatedPower by vector.currentHealth; if accumulatedPower <= 0 call captureStar(starId, vector.owner) and reset accumulatedPower to 0; if friendly star: add vector.currentHealth to star's accumulatedPower; then remove the vector from Riverpod state and from _vectorComponents — done when: sending a vector to an enemy star reduces its HP; at 0 HP the star flips ownership; flutter analyze 0 errors
- [ ] StarComponent live ownership updates — StarComponent currently captures star at construction time; it must reflect live Riverpod state instead; add a WidgetRef field and read the current Star from gameServiceProvider each render() call using the star.id; update neonColor to use the live owner; add an HP label or ring progress showing accumulatedPower / 20.0 so the player can see star investment — done when: capturing a star changes its colour on-screen without restart; flutter analyze 0 errors
- [ ] Enemy AI basic loop — add an _enemyAiTimer in AstroGame and tick it each update(dt); every 5 seconds: collect all enemy MoteComponents, route each toward the nearest neutral or player star (pick the closest by world position); if there are >= 5 enemy motes in _moteComponents for the enemy owner, fuse the oldest 5 into an enemy VectorComponent at the centroid of those motes and remove them (same fusion logic as player); route each enemy VectorComponent toward the player's home star (index 0 in _starPositions) — done when: enemy motes visibly move toward stars and occasionally fuse; enemy vectors travel toward player star; flutter analyze 0 errors
- [ ] Double-tap friendly star absorbs nearby player motes — add DoubleTapCallbacks to GestureHandler; on double-tap: find the nearest star within _tapRadius; if that star's ownerId == 'player', find all MoteComponents in _moteComponents whose owner is 'player' and whose position is within 80px of the star's world position; for each such mote: remove it from Riverpod state via removeMote(), remove its MoteComponent from the game tree, and add 1 to the star's accumulatedPower — done when: double-tapping player star pulls in nearby player motes; flutter analyze 0 errors
- [x] Win/loss detection — in AstroGame.update(dt), after UnitCombatResolver.tick(): read gameServiceProvider; win condition: player owns all 7 stars (all ownerId == 'player') AND no enemy VectorComponents or enemy MoteComponents remain; lose condition: enemy owns all 7 stars AND no player units remain; on win: call game.overlays.add('gameOver') with a result flag; on lose: same; register a 'gameOver' overlay in GameWidget that shows the result and a Restart button that calls _ref.read(gameServiceProvider.notifier).reset() then re-runs onLoad() — done when: winning the board shows a win screen; flutter analyze 0 errors

---

## BENCHMARK SPRINT — 500 Gameplay Tasks

### Block A — Core game loop wiring

- [x] In lib/game/astro_game.dart onLoad: call flutter.debugPrint to log 'AstroGame loaded' and verify no exceptions thrown — done when: flutter analyze 0 errors; log line appears on launch
- [x] In lib/game/astro_game.dart: add _elapsedSeconds double field; increment in update(double dt) with _elapsedSeconds += dt — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _playerStarCount int getter that counts stars in gameServiceProvider with ownerId == 'player' — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _enemyStarCount int getter that counts stars with ownerId == 'enemy' — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _unitCombatResolver.tick(dt) inside update(double dt) — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _productionTimer double field; in update(dt) accumulate; when >= 5.0 call _spawnMotesForOwnedStars() and reset to 0 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement _spawnMotesForOwnedStars() stub that iterates gameServiceProvider.stars where ownerId == 'player' — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _checkWinCondition() called every 2s in update; returns true when _playerStarCount == totalStars and no enemy VectorComponents exist — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _checkLossCondition() called every 2s; returns true when _playerStarCount == 0 and no player VectorComponents exist — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: when _checkWinCondition() returns true call overlays.add('gameOver') — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: when _checkLossCondition() returns true call overlays.add('gameOver') — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _routeSelectedUnitsTo(Vector2 target) that calls setTarget on all VectorComponents where isSelected == true — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in onTapDown handler call _routeSelectedUnitsTo(event.localPosition) when units are selected — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _clearSelection() that sets isSelected=false on all VectorComponents — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _clearSelection() after _routeSelectedUnitsTo() — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _selectedUnitCount int getter returning count of VectorComponents where isSelected == true — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _handleStarTap(int starId) that routes selected player units to starPositions[starId] — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: wire GestureHandler.onStarTapped callback to _handleStarTap — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _spawnPlayerUnit(Vector2 pos) that creates a VectorComponent with owner='player' and adds it to the game — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _spawnEnemyUnit(Vector2 pos) that creates a VectorComponent with owner='enemy' and adds it to the game — done when: flutter analyze 0 errors

### Block B — Star component visuals

- [x] In lib/components/star_component.dart: add Color get _ownerColor returning Color(0xFF00DDFF) for 'player', Color(0xFFFF3366) for 'enemy', Color(0xFF888888) for neutral — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: in render(Canvas canvas) draw a filled circle at (size/2) with radius 18 using _ownerColor — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add String ownerId field with default '' — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add int tier field with default 1 — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add double hp field with default 0 — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: in render draw outer glow ring at radius 22 with _ownerColor at 40% alpha using BlendMode.plus — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: draw HP arc at radius 26; sweep = (hp/20).clamp(0,1) * 2*pi; strokeWidth 3; color matches _ownerColor — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add _captureFlash double field; when ownerId changes set to 0.4; in update(dt) decrement; in render overlay white circle at alpha = _captureFlash/0.4 while > 0 — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add TextComponent child showing tier number at position offset(0, -24); update when tier changes — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add _productionRing double field 0..1; advance in update(dt) at rate 1/5 per second; in render draw thin clockwise arc at radius 30 in white 30% alpha — done when: flutter analyze 0 errors

### Block C — Mote component behavior

- [x] In lib/components/mote_component.dart: add Vector2? _target field — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: add void setTarget(Vector2 t) method that sets _target = t.clone() — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: in update(dt): if _target != null move position toward _target at 50px/s; when within 6px call onArrived?.call(this) and set _target=null — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: add void Function(MoteComponent)? onArrived callback field — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: add String owner field defaulting to 'player' — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: add int liveHp field defaulting to 1 — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: in render draw a 6px filled circle in neon cyan for 'player', neon red for 'enemy' — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: add bool isSelected field; when isSelected draw a dashed ring at radius 10 in white — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: add idle drift: when _target == null oscillate position ±3px in x using sin(elapsedTime) — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: add _elapsedTime double field incremented in update(dt) — done when: flutter analyze 0 errors

### Block D — Vector component behavior

- [x] In lib/components/vector_component.dart: verify setTarget(Vector2) method exists and moves unit at speed from _speedForTier(tier) — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add bool isSelected field; when true draw selection ring at glowRadius + 5 in cyan — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add String owner field defaulting to 'player' — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: render neon circle; color = cyan #00DDFF for player tier1, #00FFAA for tier2, #FFDD00 for tier3; red #FF3366 for enemy — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: draw HP arc at glowRadius+4; sweep = liveHp/maxHealth * 2*pi; strokeWidth 2; only visible when liveHp < maxHealth — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add _prevPosition Vector2 field updated each frame; draw a motion trail line from _prevPosition to position in owner color at 30% alpha — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: in update(dt) store _prevPosition = position.clone() before moving — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add speedMultiplier double field defaulting to 1.0; multiply speed by speedMultiplier in update — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add T3 rotating outer ring: when tier==3 draw a ring at glowRadius+8 that rotates at 90deg/s — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add _rotationAngle double incremented by pi/2 * dt when tier==3 — done when: flutter analyze 0 errors

### Block E — Gesture handler

- [x] In lib/game/gesture_handler.dart: add void Function(Rect)? onLassoSelect callback field — done when: flutter analyze 0 errors
- [x] In lib/game/gesture_handler.dart: add Vector2? _dragStart field — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: override onDragStart: set _dragStart = event.localStartPosition — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: override onDragEnd: if _dragStart != null and drag > 15px call onLassoSelect with Rect.fromPoints; clear _dragStart — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: override onLongTapDown: call onLongPress?.call() after 600ms — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: add void Function()? onLongPress callback field — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: add double _pressElapsed field; in update(dt) if pointer held increment; when >= 0.6 and not moved > 8px fire onLongPress — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: in onTapUp: if no star within 60px and no unit within 30px call onTapEmpty?.call() — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: add void Function()? onTapEmpty callback field — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: add void Function(Vector2)? onTapWorld callback for taps not near any star — done when: flutter analyze 0 errors

### Block F — Fusion mechanics

- [x] In lib/game/astro_game.dart: implement _handleLongPress(): sum tier-points of selected units (T1=1 T2=5); if sum >= 5 spawn one T2 VectorComponent at centroid of selected units; remove selected units — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in _handleLongPress compute centroid as average position of selected VectorComponents — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in _handleLongPress remove each selected unit from game world after computing centroid — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _fusionCount int field incremented on each successful fusion — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: after fusion spawn add a FusionExplosionComponent at centroid position — done when: flutter analyze 0 errors
- [ ] In lib/components/fusion_explosion_component.dart: verify component expands radius 0->30px over 0.3s then fades — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: tap-to-fuse: in onTapUp if tapped component is a selected player unit and _selectedUnitCount >= 5 call _handleLongPress() — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _isFusionReady bool getter returning _selectedUnitCount >= 5 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: when _isFusionReady is true update selection ring color to white on all selected units — done when: flutter analyze 0 errors
- [x] In lib/game/fusion_rules.dart: add static bool canFuse(List<VectorComponent> units) returning units.fold(0, (s,u) => s + u.tier) >= 5 — done when: flutter analyze 0 errors

### Block G — Capture & HP pool

- [ ] In lib/game/astro_game.dart: in _spawnMotesForOwnedStars wire MoteComponent.onArrived to _onMoteArrived — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement _onMoteArrived(MoteComponent mote): find StarComponent within 40px; if found apply mote.liveHp to star.hp; remove mote from world — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in _onMoteArrived if star is neutral (ownerId == '') and arriving mote is 'player' set star.ownerId = 'player' when hp >= 20 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in _onMoteArrived if star is enemy-owned and mote is 'player' subtract mote.liveHp from star.hp; if hp <= 0 flip ownerId to 'player' — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in _onMoteArrived after ownership flip call audioService.playCapture() — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: in _onMoteArrived after flip call screenShake(intensity: 0.4, duration: 0.3) — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement star tier upgrade: after each HP addition if star.hp >= 30 and star.tier == 1 set star.tier = 2 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: tier 3 upgrade: if star.hp >= 90 and star.tier == 2 set star.tier = 3 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement double-tap star: when double-tap detected on star call _pullNearbyUnitsToStar(starId) — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement _pullNearbyUnitsToStar(int starId): route all player VectorComponents within 200px world radius to star position — done when: flutter analyze 0 errors

### Block H — Combat system

- [x] In lib/game/unit_combat_resolver.dart: verify tick(double dt) method exists and scans player vs enemy units — done when: flutter analyze 0 errors
- [x] In lib/game/unit_combat_resolver.dart: add static double collisionRadius(int tier) returning 16 for T1, 24 for T2, 36 for T3 — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: in tick scan all player VectorComponents against all enemy VectorComponents; when distance <= collisionRadius(tier) apply mutual damage — done when: flutter analyze 0 errors
- [x] In lib/game/unit_combat_resolver.dart: mutual damage: each unit loses liveHp equal to the other's liveHp — done when: flutter analyze 0 errors
- [x] In lib/game/unit_combat_resolver.dart: when a unit's liveHp <= 0 call _destroyUnit(component) — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: in _destroyUnit remove component from Flame world and update gameServiceProvider to remove the logical unit — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: in _destroyUnit spawn 4 FluxParticleComponents at position with velocity spread 360 degrees — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: in _destroyUnit call audioService.playDeath() throttled to max 1 per 100ms — done when: flutter analyze 0 errors
- [x] In lib/game/unit_combat_resolver.dart: add _lastDeathSoundTime double; only play death sound if elapsed - _lastDeathSoundTime > 0.1 — done when: flutter analyze 0 errors
- [x] In lib/game/unit_combat_resolver.dart: add T3 AOE: when T3 unit is destroyed deal 2 damage to all enemy units within 40px — done when: flutter analyze 0 errors

### Block I — Enemy AI

- [x] In lib/game/ai/enemy_ai.dart: add void tick(double dt) method that delegates to current strategy — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add AiStrategy _strategy field assigned randomly on construction — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add _tickTimer double field; accumulate in tick(dt); trigger AI logic every 8s — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: expander strategy: every 8s find nearest neutral star and route one idle enemy unit toward it — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: aggressor strategy: every 6s route all idle enemy units toward player's highest-hp star — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: builder strategy: accumulate enemy units for 30s then route all toward nearest player star — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add _builderTimer double; reset to 0 on wave dispatch; when > 30s dispatch wave — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add home defense: if enemy home star hp < 5 recall all enemy units to home star — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add idle prevention: any enemy unit with no target for > 5s gets routed to nearest contested star — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add EnemyAI _enemyAI field; initialise in onLoad; call _enemyAI.tick(dt) in update — done when: flutter analyze 0 errors

### Block J — HUD elements

- [x] In lib/game/hud.dart: add a Text label 'Stars: X/N' in top-left using a Consumer that watches gameServiceProvider — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add 'Units: Y' text below star count — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add elapsed timer 'MM:SS' top-right; reads _elapsedSeconds from astroGame — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add pause button icon top-right; tapping calls game.pauseEngine() / resumeEngine() — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add speed toggle button '1×'/'2×'; tapping sets game.engine.timeDilation — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add minimap Container 80×80 bottom-left; draws star dots in owner colors — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: minimap star dots: cyan for player, red for enemy, grey for neutral; radius 4px — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add score Text top-center showing current score from scoreProvider — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add select-all button bottom-right '⊞'; tapping sets isSelected=true on all player VectorComponents — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add combo label that shows '×N' when comboProvider >= 2 — done when: flutter analyze 0 errors

### Block K — Audio wiring

- [x] In lib/game/audio_service.dart: add void playCapture() that calls FlameAudio.play('capture.ogg') — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add void playFuse() that calls FlameAudio.play('fuse.ogg') — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add void playDeath() that calls FlameAudio.play('pop.ogg') — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add void playWin() and playLose() calling win.ogg and lose.ogg — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add void loopBgm() that calls FlameAudio.bgm.play('ambient.ogg', volume: 0.3) — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add void stopBgm() that calls FlameAudio.bgm.stop() — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add double sfxVolume field defaulting to 1.0; multiply volume by sfxVolume on all play calls — done when: flutter analyze 0 errors
- [x] In lib/game/audio_service.dart: add bool musicEnabled field defaulting to true; skip loopBgm() when false — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _audio.loopBgm() in onLoad — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _audio.stopBgm() in game-over path — done when: flutter analyze 0 errors

### Block L — Screen shake

- [x] In lib/game/camera_shake_mixin.dart: verify shake(double intensity, double duration) method exists — done when: flutter analyze 0 errors
- [x] In lib/game/camera_shake_mixin.dart: in shake store _shakeIntensity and _shakeDuration fields — done when: flutter analyze 0 errors
- [x] In lib/game/camera_shake_mixin.dart: in update(dt) if _shakeDuration > 0 offset camera by Random(-1,1)*_shakeIntensity; decrement _shakeDuration — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _shake(double intensity, double duration) helper that calls cameraShakeMixin.shake — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _shake(0.4, 0.3) in _onMoteArrived when star ownership changes — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: call _shake(0.25, 0.2) in _destroyUnit when unit tier == 3 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add camera auto-pan on game start: in onLoad tween camera to player home star position over 1s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add camera world bounds clamp in update: clamp viewfinder.position.x to 0..worldW; .y to 0..worldH — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add pinch-zoom in onScaleUpdate: if info.pointerCount >= 2 set zoom = (zoom * info.scale.global.x).clamp(0.4, 2.0) — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add two-finger pan in onScaleUpdate: if pointerCount >= 2 subtract info.delta.global / zoom from viewfinder.position — done when: flutter analyze 0 errors

### Block M — Score system

- [x] In lib/game/score_system.dart: add int _score field and int get score — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add void addKill(int tier) method: _score += tier * 10 — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add void addCapture() method: _score += 100 — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add void addUpgrade() method: _score += 50 — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add int _combo field; void incrementCombo() that increments; void resetCombo() — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add double _comboResetTimer; in tick(dt) decrement; when <= 0 call resetCombo() — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add int get combo returning _combo — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add ScoreSystem _score field; call _score.addKill on unit death — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _score.addCapture() in _onMoteArrived when star ownership changes — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: call _score.tick(dt) in update — done when: flutter analyze 0 errors

### Block N — Visual effects

- [ ] In lib/components/score_pop_component.dart: create class extending PositionComponent; show '+N' text that floats up 30px and fades over 0.8s — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: spawn ScorePopComponent('+${unit.liveHp}') at kill position — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add pulse animation: when a mote is spawned animate radius 18->26->18 over 0.3s — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add _pulseTimer double and _pulsing bool; trigger on production cycle — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add static background star field: in onLoad add 80 PositionComponents as tiny white dots at random positions — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add damaged-unit flicker: when liveHp < maxHealth * 0.3 alternate paint.color between full and 60% alpha at 4Hz — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add _flickerTimer double incremented in update; use sin(_flickerTimer * 4 * pi) for flicker — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: add birth animation: scale from 0 to 1 over 0.15s on first frame — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: add _birthTimer double starting at 0; increment in update; scale = min(1.0, _birthTimer / 0.15) — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: contested star flicker: when 0 < hp < 20 and ownerId == '' alternate color between white and grey at 2Hz — done when: flutter analyze 0 errors

### Block O — Level system

- [ ] In lib/game/level_config.dart: verify LevelConfig has starCount, List<Vector2> starPositions, int playerHomeIndex, int enemyHomeIndex fields — done when: flutter analyze 0 errors
- [x] In lib/game/levels.dart: verify kLevels list has at least 5 LevelConfig entries — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add LevelConfig _levelConfig field; use _levelConfig.starPositions when initialising stars in onLoad — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: verify screen renders a grid of level cards using kLevels — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: tapping level card navigates to game screen with correct LevelConfig — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: add Easy/Normal/Hard difficulty row below grid; selected difficulty stored in difficultyProvider — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: Play button navigates to '/levels' route — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: read difficulty from difficultyProvider; scale enemy production interval (Easy=8s, Normal=5s, Hard=3s) — done when: flutter analyze 0 errors
- [x] In lib/game/level_config.dart: add LevelConfig.level1() factory: 7 stars, player bottom-left, enemy top-right, 5 neutrals distributed between — done when: flutter analyze 0 errors
- [x] In lib/game/level_config.dart: add LevelConfig.level2() factory: 9 stars asymmetric layout — done when: flutter analyze 0 errors

### Block P — Game over overlay

- [x] In lib/game/game_over_overlay.dart: verify overlay displays WIN or LOSE text — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: show elapsed time as 'Time: MM:SS' — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: show final score as 'Score: XXXXX' — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: show stars captured as 'Stars: X/N' — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: add Restart button that calls game.resetGame() and removes overlay — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: add Main Menu button that pops navigation back to welcome screen — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: implement resetGame(): clear all components; reset Riverpod state; re-initialise stars from _levelConfig — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: WIN overlay uses cyan neon text; LOSE uses red neon text — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: show 'New Best!' badge when score exceeds stored best for this level — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: add share row showing 'Level N | MM:SS | Score XXXXX' as selectable text — done when: flutter analyze 0 errors

### Block Q — Pause & settings

- [x] In lib/game/pause_overlay.dart: verify overlay shows 'PAUSED' with semi-transparent background — done when: flutter analyze 0 errors
- [x] In lib/game/pause_overlay.dart: add Resume button that removes overlay and calls game.resumeEngine() — done when: flutter analyze 0 errors
- [x] In lib/game/pause_overlay.dart: add Quit to Menu button — done when: flutter analyze 0 errors
- [x] In lib/screens/game_screen.dart: override didChangeAppLifecycleState: pause game when AppLifecycleState.paused; resume on resumed — done when: flutter analyze 0 errors
- [x] In lib/game/settings_screen.dart: add SFX volume Slider 0..1 that updates AudioService.sfxVolume — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: add Music toggle that sets AudioService.musicEnabled — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: add colorblind mode toggle that swaps cyan/red for blue/orange — done when: flutter analyze 0 errors
- [x] In lib/game/settings_screen.dart: add haptics toggle — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: add gear icon navigating to settings screen — done when: flutter analyze 0 errors
- [x] In lib/game/settings_screen.dart: add Reset progress button that clears all providers — done when: flutter analyze 0 errors

### Block R — Tutorial

- [x] In lib/game/tutorial_manager.dart: verify TutorialManager tracks tutorialStep int 0..5 — done when: flutter analyze 0 errors
- [x] In lib/game/tutorial_manager.dart: add void onEvent(TutorialEvent e) that advances step when correct event received — done when: flutter analyze 0 errors
- [ ] In lib/game/tutorial_overlay.dart: step 0 shows 'Drag to select your units' with dismiss on first lasso — done when: flutter analyze 0 errors
- [x] In lib/game/tutorial_overlay.dart: step 1 shows 'Tap a star to send them!' dismissed on first move order — done when: flutter analyze 0 errors
- [x] In lib/game/tutorial_overlay.dart: step 2 shows 'Hold to fuse 5 units → Vector!' dismissed on first fuse — done when: flutter analyze 0 errors
- [x] In lib/game/tutorial_overlay.dart: step 3 shows 'Capture all stars to win!' dismissed after 3s — done when: flutter analyze 0 errors
- [ ] In lib/game/tutorial_manager.dart: add bool isComplete getter returning tutorialStep >= 4 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: call tutorialManager.onEvent(TutorialEvent.lasso) after first lasso select — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: call tutorialManager.onEvent(TutorialEvent.fuse) after first fusion — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: do not show tutorial overlays when tutorialManager.isComplete is true — done when: flutter analyze 0 errors

### Block S — Performance

- [x] In lib/game/astro_game.dart: add _combatScanTimer double; only call _unitCombatResolver.tick every 3 frames (accumulate dt) to reduce O(n²) scans — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add MAX_PLAYER_UNITS = 80 const; in _spawnPlayerUnit only spawn if current player unit count < MAX_PLAYER_UNITS — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add MAX_ENEMY_UNITS = 80 const; same guard for enemy spawn — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: cap FluxParticle spawn: if total particle count >= 40 skip spawning new ones — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: skip _checkWinLoss every frame; use _winCheckTimer double and check only every 2s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _winCheckTimer double field; accumulate in update; trigger check when >= 2.0 — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: store velocity as a field rather than recomputing each frame — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: only update _prevPosition when unit actually moved (velocity > 0) — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: background star field PositionComponents use priority -1 so they render behind everything — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add dart:developer Timeline marks around _tickCombat for profiling in kDebugMode — done when: flutter analyze 0 errors

### Block T — Star defense & siege

- [ ] In lib/components/star_component.dart: add bool isUnderAttack field; when true draw a red flickering border ring — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in update set each player star's isUnderAttack = true when any enemy unit is within 80px world radius — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: auto-defend: when a player star isUnderAttack reroute idle player units within 120px to attack the nearest enemy unit — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add _siegeFlicker double; when isUnderAttack oscillate border alpha using sin(_siegeFlicker * 4) — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: increment _siegeFlicker in update(dt) — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: comeback mechanic: when player owns only 1 star and unit count <= 5 double production rate for 20s — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _comebackActive bool and _comebackTimer double fields — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: show 'SURGE!' banner text for 3s when comeback mechanic activates — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add star HP regeneration: owned stars increase hp by 0.5 per second up to tier threshold — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: add _regenTimer double; accumulate in update; add 0.5 to hp every 1s when ownerId != '' — done when: flutter analyze 0 errors

### Block U — Unit AI behavior

- [x] In lib/components/vector_component.dart: add separation steering: in update if another unit is within 20px add repulsion vector — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add _nearbyUnits List<VectorComponent> field updated each tick for separation — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add arrival deceleration: when within 60px of target reduce speed linearly to 10px/s — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add retreat behavior: when liveHp <= 1 override target to nearest friendly star — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add _retreating bool field set true when liveHp <= 1 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: formation spread: when routing N>1 units to same star offset each unit's target by position on hex grid spacing 20px — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _hexOffset(int index) helper returning Vector2 offset on a hex grid for index — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add unit stagger: when taking damage set _staggerTimer = 0.15; zero velocity while > 0 — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add _staggerTimer double decremented in update — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: add interception: if an enemy unit is within 80px and moving toward this unit switch target to intercept it — done when: flutter analyze 0 errors

### Block V — Win/loss cinematic

- [x] In lib/game/astro_game.dart: on win: tween camera zoom out to 0.5 over 1s showing all stars, then add gameOver overlay — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: on loss: pan camera to enemy home star over 0.5s then add gameOver overlay — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: slow-motion on capture: set engine.timeDilation = 0.2 for 0.4s after a star flips then restore to 1.0 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _timeDilationTimer double; in update decrease; when 0 restore timeDilation to 1.0 — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: WIN path shows 'VICTORY' in large neon cyan; animates scale 0.5->1.0 over 0.5s — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: LOSE path shows 'DEFEATED' in red neon; screen fades from red to dark over 0.3s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: impact zoom: when T3 meets T3 in combat tween camera zoom to 1.5× over 0.2s then back over 0.3s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _impactZoomActive bool to prevent multiple simultaneous impact zooms — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add win confetti: on win spawn 20 FluxParticleComponents in random colors from screen center — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _gameOverPending bool; when true skip all game logic in update — done when: flutter analyze 0 errors

### Block W — Minimap & navigation

- [x] In lib/game/hud.dart: minimap shows player unit dots as 1px cyan circles — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: minimap shows enemy unit dots as 1px red circles — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: minimap updates on a 0.25s timer not every frame — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: tapping minimap computes world position from tap offset and pans camera there — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: minimap draws a white rect showing current camera viewport bounds — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: fog of war on minimap: hide enemy unit dots when > 200px from nearest player star — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: star count HUD label pulses briefly when star count changes — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add alert icon in HUD when any player unit has been idle > 15s — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: double-tapping star count label cycles camera through each player-owned star — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add territory bar at bottom: split cyan/red showing relative star ownership percent — done when: flutter analyze 0 errors

### Block X — Environment & hazards

- [ ] In lib/game/astro_game.dart: place 2 NebulaNebula NebulaZoneComponents at fractional world positions in onLoad — done when: flutter analyze 0 errors
- [ ] In lib/components/nebula_zone_component.dart: render as radial gradient cloud with alpha 0.25-0.45 — done when: flutter analyze 0 errors
- [x] In lib/components/nebula_zone_component.dart: pulse opacity between 0.25 and 0.55 using sin(elapsed * pi / 2) period 4s — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: in update slow units inside nebula zones to 50% speed by checking containment and setting speedMultiplier=0.5 — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: restore speedMultiplier=1.0 for units that have left nebula zone — done when: flutter analyze 0 errors
- [ ] In lib/game/beacon_speed_modifier.dart: in each tick set speedMultiplier=1.3 for units within 100px of any beacon star; 1.0 outside — done when: flutter analyze 0 errors
- [ ] In lib/components/beacon_star_component.dart: draw pulsing aura ring at radius ±8px at 1Hz — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: in _tickCombat units passing through nebula zone take 0.1 damage per second — done when: flutter analyze 0 errors
- [ ] In lib/game/wind_path_deflector.dart: add wind force: in each tick add wind_direction_provider.value * 0.3 * dt to velocity of units inside nebula — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: show wind direction indicator arrow in bottom-right corner — done when: flutter analyze 0 errors

### Block Y — Accessibility & settings polish

- [ ] In lib/game/settings_screen.dart: larger tap targets toggle increases all gesture detection radii by 50% — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: reduced motion toggle disables all particle effects and pulsing animations — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: font size toggle between normal and large for all HUD TextComponents — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: auto-expand toggle: when on player motes auto-route to nearest neutral star — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: auto-defend toggle: when on newly spawned motes auto-route to most threatened star — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: if autoExpandEnabled in settingsProvider route new player motes to nearest neutral star — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: if autoDefendEnabled route new player motes to most sieged star — done when: flutter analyze 0 errors
- [ ] In lib/game/settings_screen.dart: add version number display using package_info_plus — done when: flutter analyze 0 errors
- [x] In lib/screens/welcome_screen.dart: animated title 'ASTRO FLUX' letters appear one by one over 1s on first launch — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: add 20 slowly drifting mote-sized dots in background — done when: flutter analyze 0 errors

### Block Z — Quality & tests

- [ ] Add unit test in test/game/score_system_test.dart: addKill(1) increases score by 10; addCapture increases by 100 — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/game/fusion_rules_test.dart: canFuse with 5 T1 units returns true; 4 returns false — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/game/capture_rules_test.dart: canAttack returns false for unknown IDs; true for valid pair — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/game/unit_combat_resolver_test.dart: two T1 units at distance <= 16 both reach 0 HP after tick — done when: test passes; flutter analyze 0 errors
- [x] Add unit test in test/models/star_test.dart: Star.copyWith changes only the specified field; all others unchanged — done when: test passes; flutter analyze 0 errors
- [x] Add unit test in test/models/vector_test.dart: Vector.power returns correct value for each tier — done when: test passes; flutter analyze 0 errors
- [ ] Fix all 'prefer_final_fields' warnings in lib/ — done when: flutter analyze reports 0 prefer_final_fields warnings
- [ ] Fix all 'annotate_overrides' warnings in lib/ — done when: flutter analyze reports 0 annotate_overrides warnings
- [ ] Remove all magic numbers from render() methods in lib/components/: extract to named constants — done when: flutter analyze 0 errors
- [ ] Add dartdoc /// comments to all public classes in lib/game/: one-line description per class — done when: flutter analyze 0 errors

### Block AA — More gameplay interactions

- [x] In lib/game/astro_game.dart: triple-tap on a unit selects all player units of same tier via select_all_of_tier_command.dart — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: two-finger swipe routes all selected units back to player home star — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: long-press on a star shows a small info panel (tier, HP, owner, production rate) for 2s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add rally point: triple-tap empty space sets a rally point; new motes auto-route there — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: draw rally point as a pulsing cyan crosshair PositionComponent — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: sacrifice unit: triple-tap a selected unit adds its liveHp to nearest friendly star and removes it — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add patrol order: long-press drag draws a patrol path; unit moves back and forth — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add unit lock: double-tap a selected unit to lock it in place; show padlock icon — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: locked units ignore route orders but still participate in combat — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add escort order: long-press star then drag to another star auto-routes motes from first to second — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: detect double-tap by tracking time between two onTapDown events < 300ms — done when: flutter analyze 0 errors
- [ ] In lib/game/gesture_handler.dart: add void Function(int starId)? onDoubleTapStar callback — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: wire onDoubleTapStar to _pullNearbyUnitsToStar — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: edge scroll: when drag is within 60px of screen edge pan camera 200px/s in that direction — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _edgeScrollActive bool; in update check drag position against screen edges — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add snap-to-home: double-tap star count HUD icon centers camera on player home star — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: render speed-lines: when speed > 80px/s draw 2 short white lines behind unit pointing away from velocity — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add unit number in debug mode: kDebugMode shows unit ID as tiny text above component — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add 2× speed toggle: HUD button sets engine.timeDilation 1.0/2.0 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add 4× speed option cycling 1→2→4→1× — done when: flutter analyze 0 errors

### Block AB — More star mechanics

- [ ] In lib/components/star_component.dart: draw star connection lines between adjacent player-owned stars using canvas.drawLine — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: star link bonus: add int linkBonus getter; +1 if another player-owned star within 300px — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: apply linkBonus to production: tier-based rate + linkBonus motes per cycle — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: tier 4 stars draw a rotating outer ring at radius 34 — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: tier 4 upgrade threshold: when hp >= 270 and tier == 3 set tier = 4 — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: show production rate label 'x1'/'x3'/'x9'/'x20' above owned star — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: 3s recapture window: when star flips to neutral keep a _recaptureTimer; previous owner gets 50% HP back if they reinvest within 3s — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: add star outpost state: neutral stars with hp >= 10 show yellow color and produce 0 motes — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: add star HP text tooltip: tapping star shows 'HP: X/20' label for 2s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: map-wide pip row: HUD shows 7 colored circles matching current star ownership — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: wave ripple on capture: expanding ring radius 18→60 over 0.6s in new owner color — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: add _rippleTimer double and _rippleActive bool; trigger in onOwnerChanged — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: resource scarcity event: every 90s a random star stops producing for 15s; show grey overlay — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: production spike event: every 60s a random owned star produces 2× for 10s; show green flash — done when: flutter analyze 0 errors
- [x] In lib/components/star_component.dart: contested star flicker rate doubles when hp > 15 (close to capture) — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: draw opponent capture arc in red when enemy is adding HP to a player star — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: star production burst: when a star is first captured spawn 3 bonus motes immediately — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: tier upgrade flash: golden bloom ring expands r=22→40 over 0.5s on upgrade — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add _starProductionBurst(int starId) called on first capture — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: fortification bonus: tier 3+ stars have effective capture threshold 40 not 20 — done when: flutter analyze 0 errors

### Block AC — More AI behavior

- [ ] In lib/game/ai/enemy_ai.dart: Sniper strategy: route all units at player's lowest-HP star — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add AiStrategy.sniper to enum — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI response to player moves: if player sends >3 units toward enemy star reroute half idle units to intercept — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add _playerMoveCount int field; increment when player move detected; reset every 5s — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI feint: Aggressor sends small decoy group at one star then main force at another 1 in 4 waves — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI adaptivity: if enemy loses 3 stars in a row switch to Aggressor regardless of initial strategy — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add _lostStarStreak int counter; increment on each star loss; trigger strategy switch at 3 — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI economy: always maintain 2 units at home star; only dispatch surplus — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI star investment: after capturing neutral star immediately route 3 units to it — done when: flutter analyze 0 errors
- [x] In lib/game/ai/enemy_ai.dart: AI recovery: if enemy owns only home star switch to Turtle (defend-only) for 30s — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add AiStrategy.turtle to enum; implement as defend-only — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI tier-up: when 5 idle T1 units near home star fuse them into T2 — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI concede: if AI has 0 units and 0 stars for >10s call game.triggerAiConcede() — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI multi-front: Aggressor with >= 15 units splits force to attack two player stars simultaneously — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add void triggerAiConcede() that sets all enemy stars to player ownership — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add response latency jitter: AI decisions delayed 0.2-0.8s randomly to feel natural — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: add _responseJitter double set randomly on each decision; subtract from tick timer — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: AI difficulty scaling: Easy = 0.6× tick frequency; Hard = 1.5× — done when: flutter analyze 0 errors
- [ ] In lib/game/ai/enemy_ai.dart: in constructor read difficultyProvider and set _tickMultiplier accordingly — done when: flutter analyze 0 errors
- [x] In lib/game/game_over_overlay.dart: show AI strategy used: 'You faced: Aggressor' — done when: flutter analyze 0 errors

### Block AD — More HUD & UI

- [ ] In lib/game/hud.dart: add threat meter 0-100 based on enemy units × proximity to player stars — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: threat meter shows as a thin red bar at bottom of screen — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: screen edge warning: when enemy unit within 80px of player home star flash red border on HUD — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: show 'Fuse ready ⚡' indicator below unit count when >= 5 T1 selected — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: add unit balance indicator: icon showing player vs enemy unit count ratio — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add kill feed: show last 3 kill events as fading text on right side for 2s each — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: low-unit warning: when player unit count <= 5 HUD unit label turns red and pulses — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add level name banner 'Level 1: First Contact' that fades after 2s on game start — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add objectives reminder 'Capture all 7 stars' that fades after 8s — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: add best time per level 'Best: MM:SS' below each completed card — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: add difficulty rating 1-5 stars shown on each level card — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: locked levels shown as dimmed with a lock icon — done when: flutter analyze 0 errors
- [ ] In lib/screens/level_select_screen.dart: level unlock gating: level N+1 unlocks after winning level N — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: style title 'ASTRO FLUX' in neon cyan font — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: add Continue button visible when a game is in progress — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: HUD opacity setting: all HUD elements use opacity from settingsProvider.hudOpacity — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add difficulty badge 'EASY'/'HARD' tag in corner — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: add score breakdown rows: Kills, Captures, Upgrades, Time bonus — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: show win streak counter 'Win streak: N' below play button — done when: flutter analyze 0 errors
- [x] In lib/game/hud.dart: production rate HUD: on tap show 'Next mote: Xs' for each owned star — done when: flutter analyze 0 errors

### Block AE — More visual polish

- [ ] In lib/components/mote_component.dart: glow radius varies by owner: player 8px cyan, enemy 7px red — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: idle motes pulse glow radius ±2px at 1Hz using sin — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: T2 units render as a diamond (rotated square) using Path — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: T3 units render as a hexagon using Path with 6 vertices — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add unit facing: rotate to face movement direction using atan2(velocity.y, velocity.x) — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: enemy units use color #FF3366 T1, #FF6644 T2, #FF9900 T3 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: background color shifts from #050510 toward #100505 as enemy captures more stars — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _bgColorTimer double; lerp background color based on enemyStarCount / totalStars — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: star glow radius varies by tier: T1=22 T2=26 T3=32 T4=40 — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: player home star has brighter glow (+4px) to distinguish from captured stars — done when: flutter analyze 0 errors
- [ ] In lib/components/fusion_explosion_component.dart: T3 fusion shows larger bloom than T2: radius 0->50 instead of 0->30 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: unit merging animation: the 5 T1 units slide toward centroid over 0.2s before disappearing — done when: flutter analyze 0 errors
- [x] In lib/components/vector_component.dart: T2 spawn flash: new T2 shows 0.3s gold bloom at spawn position — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add _spawnFlashTimer double; show gold circle that fades — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: T3 spawn: screen shake intensity 0.3 + large gold bloom — done when: flutter analyze 0 errors
- [ ] In lib/components/nebula_zone_component.dart: draw as radial gradient Paint object with center color transparent and edge color purple 30% alpha — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add screen edge vignette: dark radial gradient overlay on HUD layer — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: add pulsing aura: outer ring radius oscillates ±4px at 0.8Hz for owned stars — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: combat spark shower: each combat hit spawns 2 FluxParticleComponents at impact point — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: enemy stars pulse at 1.2Hz in red while player stars pulse at 0.8Hz in cyan — done when: flutter analyze 0 errors

### Block AF — Achievements & progression

- [ ] In lib/game/astro_game.dart: add achievement 'First Capture': fire on player's first star capture; show toast — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: add achievement 'Fusion Master': fire after 10 fusions in one session — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add achievement 'Dominator': fire when player owns all stars simultaneously — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add achievement 'Survivor': fire on win when player owned only 1 star at some point — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _lowestStarCount int tracking minimum player star count; used for Survivor check — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add achievement 'Speed Run': fire on winning level 1 in under 3 minutes — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add AchievementToast component: slides in from top for 2.5s showing achievement name — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _achievementsUnlocked Set<String> field; check before firing to prevent duplicates — done when: flutter analyze 0 errors
- [ ] In lib/game/score_system.dart: add time bonus: 1000 points for wins under 3min; 500 for under 5min — done when: flutter analyze 0 errors
- [ ] In lib/game/score_system.dart: add efficiency multiplier: kills/unitsLost ratio applied to final score — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: show achievements unlocked this run as a row of icons — done when: flutter analyze 0 errors
- [ ] In lib/screens/welcome_screen.dart: show 'X/10 badges earned' count below player name — done when: flutter analyze 0 errors
- [x] In lib/game/astro_game.dart: hat-trick achievement: capturing 3 stars in < 30s shows 'HAT TRICK!' banner and plays special sound — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _captureTimestamps List<double> field; check last 3 for hat-trick — done when: flutter analyze 0 errors
- [x] In lib/game/score_system.dart: add session stats: totalGamesPlayed, totalWins, longestWinStreak — done when: flutter analyze 0 errors

### Block AG — Final 79 tasks

- [ ] In lib/game/astro_game.dart: add random map seed: LevelConfig.randomSeed generates star positions deterministically — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: show seed number in HUD corner when random mode active — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: blitz mode: production rate 4×; combat damage 2×; toggled from settings — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _blitzMode bool field read from settingsProvider — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: in _spawnMotesForOwnedStars multiply spawn count by 4 when _blitzMode — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add slow-motion replay: game over stores last 10s of unit positions; plays back at 0.25× speed — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _replayBuffer List<Map<int,Vector2>> storing unit positions each frame — done when: flutter analyze 0 errors
- [ ] In lib/game/game_over_overlay.dart: add Replay button that triggers slow-motion replay — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: kill combo: 5 kills within 10s grants 15s window where player motes move 20% faster — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _killStreakCount int and _killStreakTimer double; reset after 10s with no kill — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: show 'KILL STREAK!' banner for 3s when streak bonus activates — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add critical hit: 10% chance combat deals 2× damage; show larger spark — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _isCritHit() bool returning Random().nextDouble() < 0.1 — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: apply crit multiplier: if _isCritHit() multiply damage by 2 — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add daily bonus: first game of the day doubles production rate for first 60s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _dailyBonusActive bool and _dailyBonusTimer double — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: show 'DAILY BONUS' banner while daily bonus active — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add morale break: 3 ally deaths within 5s reduces nearby player unit speed by 10% for 5s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _moraleBreakTimer double; when active multiply player unit speeds by 0.9 — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: show morale-break visual: unit briefly dims to 60% opacity — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add T2 unit shield: first 2 damage absorbed; shield shown as outer ring that breaks — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add int shieldHp field defaulting to 2 for tier==2 — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: render shield ring at glowRadius+9 that disappears when shieldHp <= 0 — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: apply damage to shieldHp first; only damage liveHp after shield depleted — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: reinforcement rush: units arriving to an active combat get +20% speed bonus for 5s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _isCombatActive(Vector2 pos) bool that checks for combat within 80px — done when: flutter analyze 0 errors
- [x] In lib/components/mote_component.dart: reinforcement rush: set speedMultiplier=1.2 when spawned near active combat — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: stalemate detection: two units fighting for >8s with neither dying both get destroyed — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: add _combatDuration Map<String,double> tracking how long each pair has fought — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: chain explosion: T3 death deals 1 damage to all other T3 units within 60px — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: knockback: T3 unit hitting T1 pushes T1 back 30px — done when: flutter analyze 0 errors
- [ ] In lib/components/vector_component.dart: add _knockback(Vector2 direction, double distance) method — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add 2-player local mode: split bottom-half / top-half touch zones — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: player 2 uses magenta #FF00FF units — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _player2Units list and _player2StarCount getter — done when: flutter analyze 0 errors
- [ ] In lib/game/hud.dart: add second HUD in opposite corner for P2 showing star and unit counts — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add FPS counter in bottom-right in kDebugMode — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _frameCount int and _fpsTimer double; compute FPS every 0.5s — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add spatial hash for combat: divide world into 100px cells; only check units in same/adjacent cells — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _spatialHash Map<String,List<VectorComponent>> rebuilt in update — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _cellKey(Vector2 pos) helper returning '${(pos.x/100).floor()},${(pos.y/100).floor()}' — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add _neighborCells(String key) returning 9 adjacent cell keys — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add app lifecycle pause: listen to WidgetsBindingObserver; pauseEngine on inactive — done when: flutter analyze 0 errors
- [ ] In lib/screens/game_screen.dart: add WidgetsBindingObserver mixin and didChangeAppLifecycleState override — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: keep screen awake: call WakelockPlus.enable() in onLoad; disable in game over — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: handle screen rotation: on resize recalculate star world positions as fractions of new world size — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: handle very small screens: if canvasSize.y < 700 scale world to fit all stars without scrolling — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add loading screen: show CircularProgressIndicator while onLoad completes; replace with game widget after — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: memory pressure: add onLowMemory that clears particle pool and reduces background star count — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: dispose audio on game over: call _audio.stopBgm() in onDetach — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add error guard in _onMoteArrived: wrap in try/catch; on error log and skip without crashing — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add null-safety guard in gesture callbacks: check isMounted before calling game methods — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: wrap game-over state with _gameOverPending guard to prevent re-triggering — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add crash reporting stub: wrap update() in try/catch; log uncaught errors to console — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add analytics stub: log 'game_start', 'game_win', 'game_lose' events to console — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add share score: game over calls Share.share('I scored X on Astro Flux Level N!') — done when: flutter analyze 0 errors
- [ ] In lib/game/astro_game.dart: add version display: settings screen shows app version from package_info_plus — done when: flutter analyze 0 errors
- [x] In lib/game/balance.dart: create file with all numeric balance constants: moteSpeed, captureThreshold, combatRadius etc — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kMoteSpeed = 50.0 — done when: flutter analyze 0 errors
- [x] In lib/game/balance.dart: add const double kCaptureThreshold = 20.0 — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kProductionInterval = 5.0 — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kT1CombatRadius = 16.0 — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kT2CombatRadius = 24.0 — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kT3CombatRadius = 36.0 — done when: flutter analyze 0 errors
- [x] In lib/game/balance.dart: add const int kMaxPlayerUnits = 80 — done when: flutter analyze 0 errors
- [ ] In lib/game/balance.dart: add const double kFusionThreshold = 5.0 — done when: flutter analyze 0 errors
- [ ] In lib/components/mote_component.dart: replace magic number 50 with kMoteSpeed from balance.dart — done when: flutter analyze 0 errors
- [ ] In lib/components/star_component.dart: replace magic number 20 with kCaptureThreshold from balance.dart — done when: flutter analyze 0 errors
- [ ] In lib/game/unit_combat_resolver.dart: replace hardcoded 16/24/36 with kT1/T2/T3CombatRadius — done when: flutter analyze 0 errors
- [ ] Add unit test in test/game/balance_test.dart: verify kT1CombatRadius < kT2CombatRadius < kT3CombatRadius — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/game/astro_game_test.dart: _hexOffset(0) returns Vector2.zero(); _hexOffset(1) returns non-zero — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/game/score_system_test.dart: combo increments on kill; resets after 2s gap — done when: test passes; flutter analyze 0 errors
- [ ] Add unit test in test/models/level_config_test.dart: LevelConfig.level1() has starCount == 7 — done when: test passes; flutter analyze 0 errors
- [ ] Fix all remaining merge conflicts in lib/: remove all <<<<<<< ======= >>>>>>> markers — done when: flutter analyze 0 errors
- [ ] Run flutter pub get and verify pubspec.lock is up to date — done when: flutter analyze 0 errors
- [ ] Add barrel export file lib/components/components.dart exporting all component classes — done when: flutter analyze 0 errors
- [ ] Add barrel export file lib/game/game.dart exporting all game classes — done when: flutter analyze 0 errors
- [ ] Final flutter analyze clean pass: resolve all remaining warnings in lib/ — done when: flutter analyze lib/ returns 0 issues
- [ ] Add dart:developer log calls in key game events (star capture, fusion, game over) for performance tracing in kDebugMode — done when: flutter analyze 0 errors
