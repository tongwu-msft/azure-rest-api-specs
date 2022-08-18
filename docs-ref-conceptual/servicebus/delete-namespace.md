---
title: "Delete Namespace"
description: API reference documentation for the operations available in the Delete Namespace REST API, a RESTful web service for managing Delete Namespace resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0eb4fdab-809a-45fd-b908-11ed8c175e67
caps.latest.revision: 9
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
# Delete Namespace

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Deletes an existing namespace. This operation also removes all associated entities including queues, topics, relay points, and messages stored under the namespace.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|DELETE|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{namespace name}|HTTP/1.1|  
  
### Request Headers  
 The name of the namespace to delete.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|Set to **application/xml;type=entry;charset=utf-8**.|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Namespace deleted successfully. This does not mean that the namespace is completely deleted at the return of the API call. It means that it is marked for deletion.|  
|401|Authorization failure. Returned when user does not have credentials to delete that namespace. This could be due to suspended subscription.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 None
