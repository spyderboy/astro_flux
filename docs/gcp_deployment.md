# GCP Deployment Guide

## Prerequisites
1. **Google Cloud Account**: Ensure you have a Google Cloud account with the necessary permissions.
2. **Installed Tools**:
   - `gcloud` command-line tool
   - `dart` SDK
3. **Setup Project**:
   - Create a new GCP project or use an existing one.
   - Enable the Cloud Functions API in your Google Cloud Console.

## Deployment Steps
1. **Initialize gcloud**
   ```bash
   gcloud init
   ```
2. **Set Project**
   ```bash
   gcloud config set project <your-project-id>
   ```
3. **Login to GCP**
   ```bash
   gcloud auth login
   ```
4. **Deploy Function**
   Navigate to the directory containing your Cloud Function code and run:
   ```bash
   cd lib/game/gcp_sync_handler.dart
   gcloud functions deploy gcpSyncHandler --runtime nodejs16 --trigger-http --allow-unauthenticated
   ```
5. **Verify Deployment**
   Open the GCP Console, navigate to Cloud Functions, and verify that your function is deployed successfully.

## Testing Locally
For local testing of the Cloud Function, you can use the `firebase functions` CLI or a similar tool if available. Otherwise, deploy locally using a Compute Engine instance or another server setup.

## Error Handling
- **Circuit Breaker**: The `GcpSyncHandler` includes a circuit breaker to handle errors gracefully. It retries operations up to a maximum number of attempts and opens the circuit breaker if too many failures occur.
- **Logging**: Ensure that all critical steps are logged for monitoring and debugging purposes.
