# Error Codes for Update Storage Account

These are the error codes for the Update Storage Account API.

| Error Code                                  | HTTP Status      | Description                                                                                   |
|---------------------------------------------|------------------|-----------------------------------------------------------------------------------------------|
| AccountPropertyCannotBeUpdated              | BadRequest (400) | A property that cannot be updated for the storage account was specified in the PATCH request. |
| InvalidAccessTier                           | BadRequest (400) | The access tier is not allowed for this account kind.                                         |
| InvalidAccountType                          | BadRequest (400) | The specified Account type is invalid.                                                        |
| MaxTagKeyLengthExceeded                     | BadRequest (400) | A key given in the tags is too long.                                                          |
| MaxTagValueLengthExceeded                   | BadRequest (400) | A value given in the tags is too long.                                                        |
| MissingEncryptionKeySource                  | BadRequest (400) | Encryption KeySource is missing from the request.                                             |
| MissingEncryptionService                    | BadRequest (400) | Encryption Service is missing from the request.                                               |
| StorageAccountNameNotValid                  | BadRequest (400) | The specified account name is not valid.                                                      |
| StorageAccountTypeConversionNotAllowed      | BadRequest (400) | The storage account does not support account type conversion                                  |
| StorageAccountTypeConversionCannotBeChanged | BadRequest (400) | The storage account does not support SKU conversion.                                          |
| StorageCustomDomainNameNotValid             | BadRequest (400) | The domain name specified is not valid.                                                       |
| TooManyTags                                 | BadRequest (400) | Too many tags are specified for the storage account.                                          |
| TooManyUpdateParametersSpecified            | BadRequest (400) | Attempting to update multiple account properties                                              |
| UnknownEncryptionKeySource                  | BadRequest (400) | Encryption KeySource given is unknown.                                                        |
| StorageAccountNotFound                      | Not Found (404)  | The specified storage account does not exist.                                                 |
| CustomDomainNameAlreadySet                  | Conflict (409)   | Custom domain is already set. Current value must be unregistered before setting a new value.  |
| DataEncryptionNotSupportedInLocation        | Conflict (409)   | Data Encryption is not supported in the Location.                                             |
| FeatureNotSupportForAccount                 | Conflict (409)   | A Feature is not supported for the account because its creation time is too old.              |
| StorageAccountOperationInProgress           | Conflict (409)   | An operation for the storage account is in progress.                                          |
| StorageDomainNameCouldNotVerify             | Conflict (409)   | The custom domain name could not be verified.                                                 |
| SubscriptionNotRegisteredForFeature         | Conflict (409)   | The subscription is not registered for the required feature.                                  |