---
title: Azure Communication Services Common Error Codes
description: Learn about the common codes you might find when using Communication Services REST APIs
author: ProbablePrime
ms.author: rifox
ms.manager: sstacey
ms.date: 03/12/2020
ms.topic: reference
ms.service: azure-communication-services
ms.devlang: rest-api
---
# Common Error Codes

When making requests against Azure Communication Services' REST API, you may come across error codes which signal that an error has occurred. To help you with troubleshooting a list of common error codes is provided below for various scenarios. For additional information on troubleshooting these, please see our [TroubleShooting Guide](https://docs.microsoft.com/azure/communication-services/concepts/troubleshooting-info).

## HTTP Status Codes

When making HTTP Requests, you will sometimes receive standard [HTTP Status Codes](https://www.w3.org/Protocols/HTTP/HTRESP.html) which signify an error. To aid you in troubleshooting a description of common HTTP Status codes and what they mean within the context of Azure Communication Services is provided below:

| HTTP status code          | Description                                                                                                                                                                                                                |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 400 Bad Request           | The request received could not be understood by the service. Double check the documentation and ensure you're sending everything required and in the correct format.                                                       |
| 401 Unauthorized          | The request could not be authenticated. This could mean that the authentication being used is invalid, expired or not suitable for this request. Check our [Authentication Guide](authentication.md) for more information. |
| 403 Forbidden             | The request was authorized, but has insufficient permissions to carry out this operation. Double check our [Authentication Guide](authentication.md) for more information.                                                 |
| 404 Not Found             | The resource or endpoint you're trying to access does not exist. Double check our documentation to ensure the resource/address you're trying to reach is correct.                                                          |
| 422 Un-processable Entity | The body of the request could not be validated. Is it valid JSON?                                                                                                                                                          |
| 429 Too Many Requests     | The number of requests exceeded some limits places on this operation. Please try again later.                                                                                                                              |
| 500 Internal Server Error | An internal error occurred.                                                                                                                                                                                                |

## Service Specific Errors

Depending on the area of Azure Communication Services that you are using, you'll be interacting with different services. These services sometimes have added error codes, or context that can be added to standard HTTP Status Codes. To provide this context for you, a list of error codes and their descriptions for each service within Azure Communication Services can be found below.

### SMS Service

For the SMS Service, it responds with standard HTTP Status Codes. Based on these codes and the context of SMS more context can be provided.
| Error Code | Description           | Action to take/suggestions                                                                                                                                                                                                                   |
| ---------- | --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 200        | Success               | OK                                                                                                                                                                                                                                           |
| 201        | Created               | Request has been accepted                                                                                                                                                                                                                    |
| 400        | Bad request           | Invalid request data                                                                                                                                                                                                                         |
| 401        | Unauthorized          | The authentication used(if any) doesn't have the permission to send a SMS or the number used in the SMS Request does not belong to the resource being used. Double check our [Authentication Guide](authentication.md) for more information. |
| 404        | Resource not found    | Request format is ok but the service could not find data associated with the input request                                                                                                                                                   |
| 500        | Internal server error | No authentication was found or unknown error occurred Double check our [Authentication Guide](authentication.md) for more information.                                                                                                       |
