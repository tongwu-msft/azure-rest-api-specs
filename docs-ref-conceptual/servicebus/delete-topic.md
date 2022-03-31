---
title: "Delete Topic"
description: API reference documentation for the operations available in the Delete Topic REST API, a RESTful web service for managing Delete Topic resources in Azure.
ms.custom: ""
ms.date: "05/14/2015"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9996fa3a-2db1-484f-bb91-1bda2dfe2449
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
# Delete Topic

> [!IMPORTANT]
> This API is [**obsolete and retired**](https://docs.microsoft.com/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Delete an existing topic. This operation also removes all associated state, including messages in the topic.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|DELETE|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Topics/{Topic Path}|HTTP/1.1|  
  
### Request Headers  
  
|Request Header|Description|  
|--------------------|-----------------|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Topic deleted successfully. This does not mean that the topic is completely deleted upon the return of the API call. It means that it is marked for deletion.|  
|401|Authorization failure.|  
|404|The specified topic does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 None.
