# JSON payloads for List Operations

## Request Body

The Request Body is empty.

## Response Body

Formatted list of operations and their description.

```json
{
  "value": [
    {
      "name": "Microsoft.Storage/storageAccounts/write",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Accounts",
        "operation": "Create/Update Storage Account",
        "description": "Creates a storage account with the specified parameters or update the properties or tags or adds custom domain for the specified storage account."
      }
    },
    {
      "name": "Microsoft.Storage/storageAccounts/delete",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Accounts",
        "operation": "Delete Storage Account",
        "description": "Deletes an existing storage account."
      }
    },
    {
      "name": "Microsoft.Storage/storageAccounts/listkeys/action",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Accounts",
        "operation": "List Storage Account Keys",
        "description": "Returns the access keys for the specified storage account."
      }
    },
    {
      "name": "Microsoft.Storage/storageAccounts/regeneratekey/action",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Accounts",
        "operation": "Regenerate Storage Account Keys",
        "description": "Regenerates the access keys for the specified storage account."
      }
    },
    {
      "name": "Microsoft.Storage/checknameavailability/read",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Name Availability",
        "operation": "Check Name Availability",
        "description": "Checks that account name is valid and is not in use."
      }
    },
    {
      "name": "Microsoft.Storage/storageAccounts/read",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Accounts",
        "operation": "List/Get Storage Account(s)",
        "description": "Returns the list of storage accounts or gets the properties for the specified storage account."
      }
    },
    {
      "name": "Microsoft.Storage/usages/read",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Usage Metrics",
        "operation": "Get Subscription Usages",
        "description": "Returns the limit and the current usage count for resources in the specified subscription"
      }
    },
   {
      "name": "Microsoft.Storage/operations/read",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Operations",
        "operation": "Poll Asynchronous Operation",
        "description": "Polls the status of an asynchronous operation."
      }
    },
    {
      "name": "Microsoft.Storage/register/action",
      "display": {
        "provider": "Microsoft Storage",
        "resource": "Storage Resource Provider",
        "operation": "Registers the Storage Resource Provider",
        "description": "Registers the subscription for the storage resource provider and enables the creation of storage accounts."
      }
    }	
  ]
}
```
