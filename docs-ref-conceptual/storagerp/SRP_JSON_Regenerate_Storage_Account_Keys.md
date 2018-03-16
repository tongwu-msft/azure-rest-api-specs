# JSON payloads for Regenerate Storage Account Keys

## Request Body (version 2016-01-01 and later)

```json
{
    "keyName": "name"
}
```

## Request Body (version 2015-06-15 and earlier)

```json
{
    "keyName": "key1|key2"
}
```

## Response Body (version 2016-01-01 and later)

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
    }
 ]
}
```

## Response Body (version 2015-06-15 and earlier)

```json
{
    "key1": "key1 value",
    "key2": "key2 value"
}
```
