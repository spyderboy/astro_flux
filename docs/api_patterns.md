# API Response Handling Patterns (Cloud Functions)

This document describes the two primary patterns used in Astro Flux for interacting with GCP Cloud Functions (v2) via `HttpClient`.

## 1. The Result Wrapper Pattern
**Used in:** `LeaderboardService`

This pattern is used for **Read Operations** where the UI needs to react to loading, success, and error states simultaneously.

### Implementation Details
- **Status Enum:** A `LeaderboardResultStatus` enum defines the lifecycle: `loading`, `success`, and `error`.
- **Result Class:** A `LeaderboardResult` class encapsulates the state, the returned data (e.g., `List<LeaderboardEntry>`), and an optional `errorMessage`.
- **Factory Constructors:** Use static factories like `LeaderboardResult.loading()`, `LeaderboardResult.success(data)`, and `LeaderboardResult.error(msg)` to create immutable states.

### Advantages
- **UI Binding:** Extremely easy to use with Riverpod providers to drive the game UI.
- **Error Encapsulation:** Error messages are bundled with the state, preventing "orphan" error states in the UI.

---

## 2. The Callback/Notifier Pattern
**Used in:** `GcpSyncHandler`

This pattern is used for **Write Operations (Side Effects)** where the handler manages the network request and notifies an external state manager of progress.

### Implementation Details
- **Status Callbacks:** An `onStatusChanged` callback updates a global `StateProvider` (e.g., `gcpSyncStatusProvider`) with a `GcpSyncStatus` enum.
- **Failure Callbacks:** An `onSyncFailure` callback allows the caller to define recovery logic (e.g., reverting to local `PersistenceService`).
- **Fallback Mechanism:** An `onLoadFallback` callback allows the handler to trigger a local load if the network request fails.

### Advantages
- **Decoupling:** The `GcpSyncHandler` does not need to know about the `GameStateNotifier`; it simply executes the provided function.
- **Separation of Concerns:** The logic for *how* to recover from a failure lives in the Service/Provider layer, while the *execution* of the sync lives in the Handler.

---

## General Networking Rules

### Error Handling & Timeouts
- **Timeouts:** All `HttpClient` requests **MUST** use `.timeout(Duration)` to prevent blocking the game loop or hanging the application.
- **Try-Catch:** All network operations must be wrapped in `try-catch` blocks to handle `SocketException`, `HttpException`, or `TimeoutException`.
- **Status Validation:** Always check `response.statusCode == 200`. Any other code should be treated as an error.

### Data Serialization
- **Payloads:** Use `jsonEncode` for POST bodies.
- **Response Parsing:** Use `utf8.decoder` to read the response body and `jsonDecode` to parse the payload.
- **Model Mapping:** All models must implement `toMap()` and `fromMap()` to facilitate seamless JSON translation between the client and Cloud Functions.