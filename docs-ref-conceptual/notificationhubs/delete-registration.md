---
title: "Delete a registration"
description: Use this API reference documentation to delete a registration.
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

# Delete a registration
Deletes a registration.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| DELETE | `https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/<registrationId>?api-version=2015-01` | HTTP/1.1 | 


## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Content-Type | `application/atom+xml;type=entry;charset=utf-8` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| If-Match | ETag as returned by creation, update, and retrieval, or ‘*’ (overwrite). |
| x-ms-version | 2015-01 |

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description | 
| ---- | ----------- | 
| 200 | Registration deleted successfully. |
| 400 | Invalid request body. The registration could not be deleted because the request was malformed (or the validation failed). |
| 401 | Authorization failure. The access key was incorrect. |
| 404 | Not found. The registration does not exist. | 
| 412 | Precondition failed. The current version of the registration does not have specified ETag. |
| 403 | Quota exceeded. Request rejected because registration operations rate is too high. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

None.

