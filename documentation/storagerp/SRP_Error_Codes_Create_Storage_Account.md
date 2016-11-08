# Error Codes for Create Storage Account 

These are the error codes for the Create Storage Account API.

|          Code                                     | HTTP Status        | Description                                                                           |
|---------------------------------------------------|--------------------|---------------------------------------------------------------------------------------|
| AccountPropertyCannotBeSet                        | BadRequest (400) | A property that cannot be set for the storage account was specified in the PUT request. |
| AccountPropertyCannotBeUpdated                    | BadRequest (400) | A property that cannot be updated for the storage account was specified in the request. |
| AccountTypeNotSupportedInLocation                 | BadRequest (400) | The SKU is not supported in the specified location.                                     |
| InvalidAccessTier                                 | BadRequest (400) | The access tier is not allowed for this account kind.                                   |
| InvalidAccountType                                | BadRequest (400) | The SKU specified is not valid.                                                         |
| LocationNotValid                                  | BadRequest (400) | The specified location is not valid.                                                    |
| MaxTagKeyLengthExceeded                           | BadRequest (400) | A key given in the tags is too long.                                                    |
| MaxTagValueLengthExceeded                         | BadRequest (400) | A value given in the tags is too long.                                                  |
| MissingEncryptionKeySource                        | BadRequest (400) | The Encryption KeySource is missing from the request.                                   |
| MissingEncryptionService                          | BadRequest (400) | Encryption Service is missing from the request.                                         |
| StorageAccountNameNotValid                        | BadRequest (400) | The specified account name is not valid.                                                |
| StorageAccountPropertiesNotValid                  | BadRequest (400) | The properties field in the request is invalid.                                         |
| StorageAccountTypeConversionNotAllowed            | BadRequest (400) | The storage account does not support SKU conversion.                                    |
| StorageCustomDomainNameNotSupportedForAccountType | BadRequest (400) | Custom domain name not supported for SKU.                                               |
| StorageCustomDomainNameNotValid                   | BadRequest (400) | The domain name specified is not valid.                                                 |
| TooManyTags                                       | BadRequest (400) | Too many tags are specified for the storage account.                                    |
| UnknownEncryptionKeySource                        | BadRequest (400) | Encryption KeySource given is unknown.                                                  |
| DataEncryptionNotSupportedInLocation              | Conflict (409)   | Data Encryption is not supported in the location.                                       |
| MaxStorageAccountsCountPerSubscriptionExceeded    | Conflict (409)   | The subscription has exceeded its storage account count quota.                          |
| StorageAccountAlreadyExists                       | Conflict (409)   | This specified storage account already exists under the subscription.                   |
| StorageAccountAlreadyTaken                        | Conflict (409)   | This specified storage account is already taken by a different subscription.            |
| StorageAccountOperationInProgress                 | Conflict (409)   | An operation for the storage account is in progress.                                    |
| StorageDomainNameAlreadyActivated                 | Conflict (409)   | The custom domain name has already been activated for another storage account.          |
| StorageDomainNameCouldNotVerify                   | Conflict (409)   | The custom domain name could not be verified.                                           |
| StorageDomainNameNotValid                         | Conflict (409)   | The domain name specified is not valid.                                                 |
| SubscriptionNotRegisteredForFeature               | Conflict (409)   | The subscription is not registered for a required feature.                              |
| SubscriptionOperationInProgress                   | Conflict (409)   | An operation for the subscription account is in progress.                               |