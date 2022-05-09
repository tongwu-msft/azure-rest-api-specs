---
title: "JSON payloads for Check Storage Account Name Availability (Azure Storage)"
description: JSON request and response payloads for the Check Storage Account Name Availability API.
---
# JSON payloads for Check Storage Account Name Availability

## Request Body (HTTP 200)

```json
{ 
   "name": "name-to-check", 
    "type": "Microsoft.Storage/storageAccounts" 
} 
```

## Response Body (HTTP 200)

```json
{
    "nameAvailable": true|false,
    "reason": "AccountNameInvalid|AlreadyExists",
    "message": "error message"
}
```
