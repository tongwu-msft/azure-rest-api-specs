# Error Codes for Poll Async Storage Operation

These are the error codes for the Poll Async Storage Operation API.

| Code                                           | HTTP Status     | Description                                                                  |
|------------------------------------------------|-----------------|------------------------------------------------------------------------------|
| OperationIdNotFound                            | Not Found (404) | The specified operation Id is not found.                                     |
| MaxStorageAccountsCountPerSubscriptionExceeded | Conflict (409)  | The subscription has exceeded its storage account count quota.               |
| StorageAccountAlreadyTaken                     | Conflict (409)  | This specified storage account is already taken by a different subscription. |
| StorageAccountAlreadyExists                    | Conflict (409)  | This specified storage account already exists under the subscription.        |