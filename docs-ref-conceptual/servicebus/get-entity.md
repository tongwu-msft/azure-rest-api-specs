---
title: "Get Entity"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 38bc8c9c-ee25-4212-90bc-4b619a769a6d
caps.latest.revision: 8
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
# Get Entity
Retrieves a messaging entity.  
  
## Request  
 You can construct the **Get Entity** request as follows.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://{serviceNamespace}.servicebus.windows.net[:{port}]/{path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies a Shared Access Signature (SAS) token with "Manage" rights. See [Service Bus authentication with Shared Access Signatures](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas) for details.|  
  
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
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|**Content-type**|Content-Type: application/atom+xml; type=entry|  
  
### Response Body  
 Upon success, a valid Atom entry is returned. For example:  
  
```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <id>https://{serviceNamespace}.servicebus.Windows.net/{path}</id>  
  <published>{createdTime}</published>  
  <updated>{lastUpdatedTime}</updated>  
  <link rel='self'>https://{serviceNamespace}.servicebus.Windows.net/{path} </link>  
  <content type='application/xml'>  
    {description}  
  </content>  
</entry>  
```

For the content of the {description} element, see [Overview](overview.md).