# Astro Flux - Cloud Functions API Endpoints

## Overview
This document describes the API endpoints used by the GCP Sync Handler for synchronizing game state with Cloud Functions.

## Vector Sync Endpoint

**Endpoint:** `POST https://your-cloud-function-url.appspot.com/api/sync`

**Purpose:** Upload vector data from the client to the server.

**Request Body:**
```json
{
  "vectors": [
    {
      "id": 1
    },
    {
      "id": 2
    }
  ]
}
```

**Response:**
```json
{
  "status": "success"
}
```

**HTTP Status Codes:**
- `200 OK` - Success
- `400 Bad Request` - Invalid payload format
- `500 Internal Server Error` - Server-side error

## Vector Load Endpoint

**Endpoint:** `GET https://your-cloud-function-url.appspot.com/api/load`

**Purpose:** Retrieve vector data from the server for client synchronization.

**Response Body:**
```json
{
  "vectors": [
    {
      "id": 1
    }
  ]
}
```

**HTTP Status Codes:**
- `200 OK` - Success, returns vector list
- `500 Internal Server Error` - Server-side error

## Authentication

Authentication headers will be added once the Cloud Function is deployed:
- `Authorization: Bearer <token>`
- `X-Client-Version: <version>`

## Implementation Notes

- All endpoints expect JSON payloads
- Vector model uses `toMap()` / `fromMap()` for serialization
- Client uses `HttpClient` for HTTP requests
- Error handling throws exceptions on non-200 responses

## Future Enhancements

- Add authentication middleware
- Implement rate limiting
- Add endpoint for star sync
- Add endpoint for mote sync
- Implement WebSocket for real-time updates