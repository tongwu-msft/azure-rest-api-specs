# JSON payloads for Check Storage Account Name Availability

## Request Body (HTTP 200)

```json
{ 
   "name": "foo", 
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
