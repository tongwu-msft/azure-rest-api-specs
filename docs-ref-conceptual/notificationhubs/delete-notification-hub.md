---
title: "Delete a notification hub"
description: Use this API reference documentation to delete a notification hub.
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

# Delete a notification hub
Deletes a notification hub.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| DELETE | `https://{namespace}.servicebus.windows.net/{Notification Hub}?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |  
| -------------- | ----------- | 
| Content-Type | application/xml;type=entry;charset=utf-8 | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 | 

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes


| Code | Description |
| ---- | ----------- | 
| 200 | The hub deleted successfully. | 
| 400 | Invalid request body. The notification hub could not be deleted because the request was malformed (or the validation failed). |
| 401 | Authorization failure. The access key was incorrect. | 
| 404 | Not found. The node does not contain a notification hub. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

None.

