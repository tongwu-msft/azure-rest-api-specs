# JSON payloads for Create Storage Account

## Request Body (HTTP 200) (version 2016-01-01 and later)

```json
{
    "location": "account geo region",
    "tags": {
        "key1": "value1", 
        "key2": "value2"
    },
    "properties": {
        "customDomain": {
                "name": "user domain",
                "useSubDomainName": "true"
        },
        "encryption": {
                "services": {
                         "blob": {
                                 "enabled": true
                         }
                },
                "keySource": "Microsoft.Storage"    
        },
        "accessTier": "Cool|Hot"
    }
    "sku": {
        "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
    },   
    "kind": "Storage|BlobStorage"
}
```

## Request Body (HTTP 200) (version 2015-06-15 and earlier)

```json
{
    "location": "account geo region",
    "tags": {
        "key1": "value1", 
        "key2": "value2"
    },
    "properties": {
        "accountType": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
    }
}
```

## Response Body (HTTP 200) (version 2016-01-01 and later)

For HTTP 200, if using API version 2016-01-01 or later, the response body will contain the full account properties. See the Response section of the [Get Storage Account Properties](../../docs-ref-autogen/storagerp/storageaccounts.json#StorageAccounts_GetProperties) operation for the full set of properties and descriptions.

```json
{
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
    "name": "accountName",
    "location": "account geo region",
    "tags": {
        "key1": "value1", 
        "key2": "value2"
    },
    "type": "Microsoft.Storage/storageAccounts",
    "properties": {
        "provisioningState": "status",
        "encryption": {
	           "services": {
                "blob": {
                    "enabled": true,
                    "lastEnabledTime": dateTime
                }
            },
	           "keySource": "Microsoft.Storage"
        },
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
    }
    "sku": {
        "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
        "tier": "Standard|Premium" 
    }, 
    "kind": "Storage|BlobStorage"
}
```

For HTTP 202, the response body will be empty.

## Response Body (HTTP 200) (version 2015-06-15 and earlier)

For HTTP 200, if using API version 2015-06-15 or earlier, the response body will only contain the original request that was PUT per the Azure REST guidelines.

```json
{
    "location": "account geo region",
    "tags": {
      "key1": "value1", 
      "key2": "value2"
    },
    "properties": {
      "accountType": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
    }
}
```

For HTTP 202, the response body will be empty.