# JSON payloads for List Storage Accounts for Resource Group Operation

## Request Body 

The Request Body is empty.

## Response Body (2016-01-01 and later)

For HTTP 200, if using API version 2016-01-01 or later, the response body will contain the full account properties. See the Response section of the [Get Storage Account Properties](../../api-ref/storagerp/storageaccounts.json#StorageAccounts_GetProperties) operation for the full set of properties and descriptions.

```
 {
    "value": [
    {
        "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
        "name": "accountName1",
        "location": "account geo region",
        "tags": {
            "key1": "value1", 
            "key2": "value2"
         },
        "type": "Microsoft.Storage/StorageAccount",
        "properties": {},
        "sku": {
            "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
            "tier": "Standard|Premium"
        },
        "kind": "Storage|BlobStorage"
    },
    {
       "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
        "name": "accountName2",
        "location": "account geo region",
        "tags": {
            "key1": "value1",  
            "key2": "value2"
        },
        "type": "Microsoft.Storage/StorageAccount",
        "properties": {},
        "sku": {
            "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
            "tier": "Standard|Premium"
        },
        "kind": "Storage|BlobStorage"
    }
    ]
}
```

##Response Body (2015-06-15 and earlier)

Formatted list of storage accounts and their properties. See the Response section of the [Get Storage Account Properties2](PUTLINKHERE) operation for the full set of properties and descriptions.

```
{
    "value": [
    {
        "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
        "name": "accountName1",
        "location": "account geo region",
        "tags": {
            "key1": "value1", 
            "key2": "value2"
     },
        "type": "Microsoft.Storage/StorageAccount",
        "properties": {}
    },
    {
       "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}",
        "name": "accountName2",
        "location": "account geo region",
        "tags": {
            "key1": "value1",  
            "key2": "value2"
        },
        "type": "Microsoft.Storage/StorageAccount",
        "properties": {}
    }
    ]
}
```