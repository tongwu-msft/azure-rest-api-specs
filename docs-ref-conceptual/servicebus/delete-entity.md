---
title: "Delete Entity"
description: API reference documentation for the operations available in the Delete Entity REST API, a RESTful web service for managing Delete Entity resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d94063c2-c751-4a5d-a00c-169810ee6ccb
caps.latest.revision: 8
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Delete Entity
Deletes a messaging entity.  
  
## Request  
 You can construct the **Delete Entity** request as follows.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|DELETE|https://{serviceNamespace}.servicebus.windows.net/{path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies a Shared Access Signature (SAS) token with "Manage" rights. See [Service Bus authentication with Shared Access Signatures](/azure/service-bus-messaging/service-bus-sas) for details.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|OK.|  
|401|Unauthorized. The request is not authorized.|  
|404|Not found.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the headers shown below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|**Content-type**|Content-Type: application/atom+xml; type=entry|  
  
### Response Body  
 None.