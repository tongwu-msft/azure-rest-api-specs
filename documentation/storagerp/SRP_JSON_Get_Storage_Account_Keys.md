# JSON payloads for Get Storage Account Keys

## Request Body 

The Request Body is empty.

## Response Body (2016-01-01 and later)

For HTTP 200, if using API version 2016-01-01 or later, the response body will contain the full account properties. See the Response section of the [Get Storage Account Properties](../../api-ref/storagerp/storageaccounts.json#StorageAccounts_GetProperties) operation for the full set of properties and descriptions.

```json
{
  “keys”: [
    {
      “keyName”: “key1”,
      “value”: "key1Value”,
      “permissions”: “FULL”
    },
    {
      “keyName”: “key2”,
      “value”: "key2Value”,
      “permissions”: “FULL”
    },
  ]
}
```

##Response Body (2015-06-15 and earlier)

```json
Response Body (version 2015-06-15 and earlier)
{
    "key1": "key1 value",
    "key2": "key2 value"
}
```

