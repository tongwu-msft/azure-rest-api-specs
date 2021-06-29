﻿---
title: "Read a registration"
ms.custom: ""
ms.date: 04/05/2019
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---

# Read a registration
Retrieves information about a registration.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ |
| GET | `https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/<registrationId>?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Content-Type | `application/atom+xml;type=entry;charset=utf-8` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 201 | Registration retrieved successfully. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded; request rejected because registration operations rate is too high. |


For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- |
| Content-type | `application/atom+xml;type=entry;charset=utf-8` |
| ETag | {weak ETag} |


## Response body

Upon success, a validated Atom entry is returned, as in [Create a registration](create-registration.md).

