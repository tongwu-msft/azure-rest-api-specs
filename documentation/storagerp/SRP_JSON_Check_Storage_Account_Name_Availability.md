# JSON payloads for Check Storage Account Name Availability

## Request Body (HTTP 200)

```
{ 
   "name": "foo", 
    "type": "Microsoft.Storage/storageAccounts" 
} 
```

## Response Body (HTTP 200)

```
{
    "nameAvailable": true|false,
    "reason": "AccountNameInvalid|AlreadyExists",
    "message": "error message"
}
```
