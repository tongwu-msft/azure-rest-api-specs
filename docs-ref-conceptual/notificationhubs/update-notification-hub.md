---
title: "Update a notification hub"
description: Use this API reference documentation to update notification hubs.
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


# Update a notification hub
Updates notification hubs.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| PUT | `https://{namespace}.servicebus.windows.net/{Notification Hub}?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- |
| Content-Type | `application/xml;type=entry;charset=utf-8` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |
| If-Match | Set this header to “*” to update the notification hub. You must provide all the property values that are desired on the updated notification hub. Any values not provided will be set to the service default values. If this header is missing, then the update call returns an error indicating that this notification hub already exists. |


## Request body
A NotificationHubDescription element. For an example, see the request body for [Create a notification hub](create-notification-hub.md).

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 200 | Notifications hub updated successfully. |
| 400 | Invalid request body. The notification topic could not be updated because the request was malformed (or the validation failed). |
| 401 | Authorization failure. The access key was incorrect. |
| 404 | Not found. The node does not contain a notification hub. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

A NotificationHubDescription element with all policies defined in the current node. For an example, see [Create Notification Hub](create-notification-hub.md).

