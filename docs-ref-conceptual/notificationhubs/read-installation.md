---
title: "Read an installation"
description: Use this API reference documentation to retrieve installations based on Installation ID.
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

# Read an installation
Retrieves installations based on Installation ID.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
|  GET | `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/{id}?api-version=2015-01` | HTTP/1.1 |


## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Content-Type | application/json |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |



## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 200 | The installation was retrieved successfully. |
| 400 | The installation could not be retrieved because the request was malformed. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 |  Quota exceeded; request rejected because registration operations rate is too high. |
| 404 | Installation Not Found. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- | 
| Content-type | application/json |
| Content-Location | The location of the installation in the format: `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/<installationId>` |

## Response body

Upon success, a JSON document for the installation is returned. The format of the JSON follows the format shown in [Create or overwrite an installation](create-overwrite-installation.md).

## See Also

[Create or overwrite installation](create-overwrite-installation.md)  
[Update installation](update-installation.md)  
[Delete installation](delete-installation.md)

