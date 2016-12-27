# Common Error Codes for Storage Resource Provider

The following are the list of HTTP Status code and ErrorCode messages that are common for all Storage Resource Provider operations.

| Error Code                             | HTTP status code              | User messageverb specified was not recognized by the server or isn’t valid for this resource.|
|----------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| InvalidHttpVerb                        | Bad Request (400)           | The HTTP verb specified was not recognized by the server or isn’t valid for this resource.|
| MissingOrIncorrectVersionHeader        | Bad Request (400)           | The versioning header is not specified or was specified incorrectly.|
| MissingOrInvalidRequiredQueryParameter | Bad Request (400)           | A required query parameter was not specified for this request or was specified incorrectly. |
| StorageAccountNameNotValid             | Bad Request (400)           | The specified account name is not valid. |
| AuthenticationFailed                   | Forbidden (403)             | The server failed to authenticate the request. Verify that the certificate is valid and is associated with this subscription. |
| SubscriptionDisabled                   | Forbidden (403)             | The subscription is in a disabled state. |
| ResourceNotFound                       | Not Found (404)             | The specified resource does not exist. |
| SubscriptionNotFound                   | Not Found (404)             | The subscription specified is not found. |
| SubscriptionStateForbidden             | Not Found (404)             | The subscription is not ready for storage account operations. |
| StorageAccountBeingCreated             | Conflict (409)              | This specified storage account is being created. |
| StorageAccountIsNotProvisioned         | Conflict (409)              | The storage account provisioning state must be 'Succeeded' before executing the operation. |
| StorageAccountOperationInProgress      | Conflict (409)              | A write operation for the storage account is in progress. |
| TooManyRequests                        | TooManyRequest (429)        | The request is being throttled. |
| InternalError                          | Internal Server Error (500) | The server encountered an internal error. Please retry the request. |
| OperationTimedOut                      | Internal Server Error (500) | The operation could not be completed within the permitted time. |
| ServerBusy                             | Service Unavailable (503)   | The server (or an internal component) is currently unavailable to receive requests. Please retry your request. |
