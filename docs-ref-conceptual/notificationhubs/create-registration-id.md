---
title: "Create a registration ID"
description: Use this API reference documentation to return a registration ID (without creating a registration) and how you can use the generated registration ID to create a registration.
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

# Create a registration ID
Returns a registration ID (without creating a registration). You can use the generated registration ID to create a registration using the [Create or Update Registration](create-update-registration.md) method.

## Request

| Method | Request URI | HTTP version | 
| ------ | ----------- | ------------ | 
| POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/registrationIDs/?api-version=2015-01` | HTTP/1.1 |


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
| 201 | Registration created successfully. | 
| 400 | Invalid request body. The registration could not be created because the request was malformed. | 
| 401 | Authorization failure. The access key was incorrect. | 
| 403 | Quota exceeded; too many registrations in this namespace. Registration not created. | 
| 403 | Request rejected because registration operations rate is too high | 


For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description | 
| --------------- | ----------- | 
| Content-type | `application/atom+xml;type=entry;charset=utf-8` | 
|  Content-Location | The location of the registration in the format: `https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/<registrationId>` |
| ETag | {weak ETag} |

## Response body

None.

