---
title: Azure Communication Services Common Headers
description: Learn about the common headers you might find when using Communication Services REST APIs
author: ProbablePrime
ms.author: rifox
ms.manager: sstacey
ms.date: 03/12/2020
ms.topic: reference
ms.service: azure-communication-services
ms.devlang: rest-api
---
# Common Headers

The following headers are commonly seen when making requests against Azure Communication Services:

## Request Headers

These headers can be used when making a request, some headers are required:

| Header                  | Required                        | Type   | Description                                                                                                                                                                            |
| ----------------------- | ------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Authorization**       | Required                        | String | The authorization for the request. The contents of this header varies depending on the type of authentication, For more information, see [authentication](authentication.md)           |
| **Content-Type**        | Required (on PUT and POST)      | String | For POST and PUT Operations, set this header to application/json.                                                                                                                      |
| **User-Agent**          | Optional                        | String | A string that specifies the client user agent doing the request. The recommended format is {user agent name}/{version}. For example, ContosoApp/1.0.0.                                 |
| **Host**                | Required                        | String | The host name and optional port from which, the request will originate. For example, `contoso.com:80`. This header, will usually be set automatically by many applications.            |
| **Date**                | Required when using Access Keys | Date   | The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT. Can also be included in an **x-ms-date** header. |
| **x-ms-date**           | Required when using Access Keys | Date   | The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT. Can also be included in a **Date** header.       |
| **x-ms-content-sha256** | Required when using Access Keys | String | Must be an SHA256 hash of the request Body                                                                                                                                             |

## Response Headers

These headers will commonly be included in a response from Azure Communication Services:

| Header                | Type             | Description                                                                                                                                                                                                                                                                        |
| --------------------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **content-type**      | String/MIME Type | The Content type of the response, usually **application/json**, which indicates the response is formatted as JSON                                                                                                                                                                   |
| **Date**              | Date             | The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT. Can also be included in an **x-ms-date** header.                                                                                             |
| **ms-csv**            | String           | A standard Microsoft Correlation Vector. Correlation vectors can be used when making a support/bug request to our team. For more information on them, see our [TroubleShooting Guide](https://docs.microsoft.com/azure/communication-services/concepts/troubleshooting-info) |
| **x-processing-time** | String           | The time it took your request to be processed by Azure Communication Services. For example: "5ms"                                                                                                                                                                                  |
