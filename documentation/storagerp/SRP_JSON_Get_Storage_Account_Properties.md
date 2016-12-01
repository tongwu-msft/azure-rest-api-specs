# JSON payloads for Get Storage Account Properties

## Request Body

The Request Body is empty.

## Response Body (version 2016-01-01 and later)

```
{
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
    "name": "accountName",
    "location": "account geo region",
    "tags": {
        "key1": "value1", 
        "key2": "value2"
    },
    "type": "Microsoft.Storage/StorageAccount",
    "properties": {
        "provisioningState": "status",
        "encryption": {
                "services": {
                        "blob": {
                                "enabled": true,
                                "lastEnabledTime": dateTime}
                }
                "keySource": "Microsoft.Storage"
        }
        "primaryEndpoints": {
            "blob": "blob endpoint",
            "queue": "queue endpoint",
            "table": "table endpoint",
             "file": "file endpoint"
        },
        "primaryLocation": "primary geo region",
        "statusOfPrimary": "available|unavailable",
        "lastGeoFailoverTime": "dateTime",
        "secondaryLocation": "secondary geo region",
        "statusOfSecondary": "available|unavailable",
        "secondaryEndpoints": {
            "blob": "secondary blob endpoint",
            "queue": "secondary queue endpoint",
            "table": "secondary table endpoint",
        },
        "creationTime": "dateTime",
        "customDomain": {
                "name": "user domain”
         },
        "accessTier": "Cool|Hot"
    },
    "sku": {
            "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
            "tier": "Standard|Premium"
    }
    "kind": "Storage|BlobStorage"
}

```

## Response Body (version 2015-06-15 and later)

```
{
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
    "name": "accountName",
    "location": "account geo region",
    "tags": {
        "key1": "value1", 
        "key2": "value2"
    },
    "type": "Microsoft.Storage/StorageAccount",
    "properties": {
        "provisioningState": "status"
        "accountType": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS“,
        "primaryEndpoints": {
            "blob": "blob endpoint",
            "queue": "queue endpoint",
            "table": "table endpoint",
             "file": "file endpoint"
        },
        "primaryLocation": "primary geo region",
        "statusOfPrimary": "available|unavailable",
        "lastGeoFailoverTime": "dateTime",
        "secondaryLocation": "secondary geo region",
        "statusOfSecondary": "available|unavailable",
        "secondaryEndpoints": {
            "blob": "secondary blob endpoint",
            "queue": "secondary queue endpoint",
            "table": "secondary table endpoint",
        },
        "creationTime": "dateTime",
        "customDomain": {
                "name": "user domain”
         }
    }
}
```