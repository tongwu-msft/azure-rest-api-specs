# Error Codes for Delete Storage Account

These are the error codes for the Delete Storage Account API.

| Error Code                        | HTTP Status    | Description                                                                                   |
|-----------------------------------|----------------|-----------------------------------------------------------------------------------------------------------------------|
| AccountCannotBeDeleted            | Conflict (409) | The storage account cannot be deleted due to its artifacts being in use.                                              |
| StorageAccountInCreating          | Conflict (409) | Cannot delete the storage account while it is being created. Please retry after the storage account is fully created. |
| StorageAccountOperationInProgress | Conflict (409) | An operation for the storage account is in progress.                                                                  |