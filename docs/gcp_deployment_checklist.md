# GCP Cloud Functions v2 Deployment Checklist

Use this checklist to ensure a secure, scalable, and performant deployment of Cloud Functions for the Astro Flux backend (persistence and leaderboards).

## 1. Security & Identity
- [ ] **Least Privilege IAM**: Ensure the service account running the function has only the minimum required permissions (e.g., `roles/datastore.user`, `roles/pubsub.publisher`).
- [ ] **Secret Management**: Do NOT hardcode API keys or service credentials. Use **GCP Cloud Secret Manager** and mount secrets as environment variables or volumes.
- [ **Authentication/Authorization**: Validate that all incoming requests are authenticated via Firebase Auth or Google Identity Platform tokens.
- [ ] **CORS Configuration**: If the function is called from a web client, strictly define allowed origins in the function's CORS policy.

## 2. Configuration & Resource Management
- [ ] **Resource Allocation**: Set appropriate memory and CPU limits based on load testing. Avoid over-provisioning to save costs.
- [ ] **Timeout Settings**: Ensure the function timeout is higher than the maximum expected execution time, but low enough to prevent runaway costs.
- [ ] **Environment Variables**: Verify all necessary runtime configuration (e.g., database names, tier constants) are set in the deployment environment.
- [ ] **Concurrency**: For Cloud Functions v2, tune the concurrency setting to balance throughput and memory usage.

## 3. Reliability & Networking
- [ ] **VPC Connector**: If the function needs to access private resources (e.g., a Cloud SQL instance), ensure a **Serverless VPC Access connector** is configured.
- [ ] **Retry Logic**: Implement exponential backoff in the client-side `GcpSyncHandler` and ensure functions are idempotent to handle retries safely.
- [ ] **Error Handling**: Ensure standard error responses (400, 401, 403, 500) are returned to the client to allow proper error state handling in the game.

## 4. Monitoring & Observability
- [ ] **Cloud Logging**: Ensure structured logging (JSON) is used to allow for efficient querying and alerting in **Cloud Logging**.
- [ ] **Cloud Monitoring**: Set up alerts for high error rates, latency spikes, and function execution failures.
- [ ] **Tracing**: Enable **Cloud Trace** to identify bottlenecks in complex function execution paths.

## 5. Deployment Pipeline (CI/CD)
- [ ] **Cloud Build**: Use Cloud Build or GitHub Actions to automate deployment from the main branch.
- [ ] **Automated Testing**: Ensure unit tests and integration tests pass before the deployment trigger is activated.
- [ ] **Infrastructure as Code (IaC)**: Use Terraform or Pulumi to manage function deployment, permissions, and infrastructure to ensure environment parity.

## 6. Optimization
- [ ] **Cold Start Mitigation**: Use minimum instances if latency is critical for user experience during gameplay.
- [ ] **Dependency Minimization**: Keep the deployment package small to reduce initialization time.