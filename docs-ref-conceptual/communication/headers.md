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

These headers can be used when making a request, some of these are required

| Header                  | Required                        | Type   | Description                                                                                                                                                                           |
| ----------------------- | ------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Authorization**       | Required                        | String | The authorization for the request. This varies depending on the type of request, For more information, see [authentication](authentication.md)                                        |
| **Content-Type**        | Required (on PUT and POST)      | String | For POST and PUT Operations, set this to application/json.                                                                                                                            |
| **User-Agent**          | Optional                        | String | A string that specifies the client user agent performing the request. The recommended format is {user agent name}/{version}. For example, ContosoApp/1.0.0.                           |
| **Host**                | Required                        | String | The host name and optional port from which, the request will originate. For example `contoso.com:80`. This will usually be set automatically by many applications.                    |
| **Date**                | Required when using Access Keys | Date   | The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT. Can also be included in a **x-ms-date** header. |
| **x-ms-date**           | Required when using Access Keys | Date   | The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT. Can also be included in a **Date** header.      |
| **x-ms-content-sha256** | Required when using Access Keys | String | Must be a SHA256 hash of the request Body                                                                                                                                             |
