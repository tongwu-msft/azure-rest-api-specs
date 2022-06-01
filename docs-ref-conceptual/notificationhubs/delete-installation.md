---
title: "Delete an installation"
description: Use this API reference documentation to delete an installation.
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

# Delete an installation
Deletes an installation.

## Request

| Method | Request URI | HTTP version | 
| ------ | ----------- | ------------ | 
| DELETE | `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/installationId?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.
| Request header | Description | 
| -------------- | ----------- | ------------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 | 

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description | 
| ---- | ----------- | 
| 204 | The installation was deleted successfully. Even if the installation did not exist, and therefore was not found, the service will return 204. |
| 400 | The installation could not be created/overwritten because the request was malformed. |
| 401 | Authorization failure. The access key was incorrect. | 
| 403 | Quota exceeded. Request rejected because registration operations rate is too high. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

None.

## See Also

[Create or overwrite an installation](create-overwrite-installation.md)  
[Read an installation](read-installation.md)  
[Update an installation](update-installation.md)

