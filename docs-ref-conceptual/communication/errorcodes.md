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

When making requests against Azure Communication Services' REST API, you may come across error codes, which signal that an error has occurred. To help you with troubleshooting, a list of common error codes is provided below for various scenarios. For more information on troubleshooting these error codes, see our [TroubleShooting Guide](/azure/communication-services/concepts/troubleshooting-info).

## HTTP Status Codes

You'll receive standard [HTTP Status Codes](https://www.w3.org/Protocols/HTTP/HTRESP.html) in the service responses from Azure Communication Services. Some of these codes, may signify an error. To aid you in troubleshooting a description of common HTTP Status codes and what they mean within the context of Azure Communication Services is provided below:

| HTTP status code          | Description                                                                                                                                                                                                                      |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 400 Bad Request           | The request received couldn't be understood by the service. Double check the documentation and ensure you're sending everything required and in the correct format.                                                              |
| 401 Unauthorized          | The request couldn't be authenticated. This error could mean that the authentication being used is invalid, expired, or not suitable for this request. Check our [Authentication Guide](authentication.md) for more information. |
| 403 Forbidden             | The request was authorized, but has insufficient permissions to carry out this operation. Double check our [Authentication Guide](authentication.md) for more information.                                                       |
| 404 Not Found             | The resource or endpoint you're trying to access doesn't exist. Double check our documentation to ensure the resource/address you're trying to reach is correct.                                                                 |
| 422 Unprocessable Entity  | The body of the request couldn't be validated. Is it valid JSON?                                                                                                                                                                 |
| 429 Too Many Requests     | The number of requests exceeded some limits places on this operation. Try again later.                                                                                                                                           |
| 500 Internal Server Error | An internal error occurred.                                                                                                                                                                                                      |

## Service-Specific Errors

Depending on the area of Azure Communication Services that you're using, you'll be interacting with different services. These services, may provide additional context within their error codes.

### SMS Service

For the SMS Service, it responds with standard HTTP Status Codes. Based on these codes and the context of SMS more context can be provided.

| Error Code | Response | Description|
| ---------- | ----------|----------- |
| 200 OK     | Success   |
| 201        | Created| Request has been accepted.|
| 400        | Bad request           | Invalid request data. |
| 401        | Unauthorized          | Your request was either missing authentication, or the authentication provided doesn't allow for sending an SMS. Double check our [Authentication Guide](authentication.md) for more information. |
| 404        | Resource not found    | The resource or endpoint you're trying to access doesn't exist. Double check our documentation to ensure the resource/address you're trying to reach is correct.                                  |
| 500        | Internal server error | No authentication was found or unknown error occurred Double check our [Authentication Guide](authentication.md) for more information.                                                            |
