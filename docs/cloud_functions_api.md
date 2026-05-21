# Cloud Functions API

## Request/Response Schemas

### Validate Fusion

**Request Body:**
```json
{
  "motes": [
    {
      "id": 1,
      "lifecycleState": "active"
    },
    {
      "id": 2,
      "lifecycleState": "active"
    }
  ]
}
```

**Response Body:**
```json
{
  "isFusionAllowed": true
}
```

### Validate Vector Count

**Request Body:**
```json
{
  "vectorCount": 45
}
```

**Response Body:**
```json
{
  "isVectorCountValid": true
}
```

### Validate Star Capture

**Request Body:**
```json
{
  "starId": 1,
  "ownerId": "player123"
}
```

**Response Body:**
```json
{
  "isCaptureAllowed": true
}
```
