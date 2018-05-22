# Error Codes for Regenerate Storage Account Keys

These are the error codes for the Regenerate Storage Account Keys API.

| Error Code                        | HTTP Status      | Description                                                                                   |
|-----------------------------------|------------------|------------------------------------------------------|
| StorageAccountKeyNameNotValid     | BadRequest (400) | The specified key name is invalid.                   |
| StorageAccountNotFound            | Not Found (404)  | The specified storage account does not exist.        |
| StorageAccountOperationInProgress | Conflict (409)   | An operation for the storage account is in progress. |
