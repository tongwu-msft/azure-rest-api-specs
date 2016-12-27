---
title: "Delete Queue"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: da017387-6fed-41ad-a662-262051e28f10
caps.latest.revision: 9
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
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
# Delete Queue
Deletes an existing queue. This operation removes all associated state, including messages in the queue.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|DELETE|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Queues/{Queue Path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Namespace|Management Endpoint url|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a queue with a name that contains special or encoded characters (for example, `test?Name=value&`, which gets encoded to `test%3FName%3Dvalue%26`), a (401) Unauthorized exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|200|Queue deleted successfully. This does not mean that the queue is completely deleted upon the return of the API call. It means that it is marked for deletion.|  
|401|Authorization failure.|  
|404|The specified queue does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 None.