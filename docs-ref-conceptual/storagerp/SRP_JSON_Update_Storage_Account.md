# JSON payloads for Update Storage Account

## Request Body (version 2016-01-01 and later)

```json
{
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
                                "enabled": true}
            	   },
	              "keySource": "Microsoft.Storage"
	       },
        "accessTier": "Cool|Hot"
    },
    "sku": {
            "name": "Standard_LRS|Standard_ZRS|Standard_GRS|Standard_RAGRS|Premium_LRS"
    },
}
```

## Request Body1 (for updating Tags) (version 2015-06-15 and earlier)

```json
{
    "tags": {
      "key1": "value1", 
      "key2": "value2"
    }
}
```

## Request Body2 (for updating accountType) (version 2015-06-15 and earlier)

```json
{    
    "properties": {
        "accountType": "Standard_LRS|Standard_GRS|Standard_RAGRS" 
   }
}
```

## Request Body3 (for updating customDomain) (version 2015-06-15 and earlier)

```json
{    
    "properties": { 
         "customDomain": {
                "name": "user domain",
                "useSubDomainName": true
         }
    }
}
```

## Response Body

For HTTP 200, if using API version 2016-01-01 or later, the response body will contain the full account properties. See the Response section of the [Get Storage Account Properties](../../docs-ref-autogen/storagerp/storageaccounts.json#StorageAccounts_GetProperties) operation for the full set of properties and descriptions. 

For versions 2015-06-15 and earlier, the response body will contain the original request body that was sent with the PATCH request.

