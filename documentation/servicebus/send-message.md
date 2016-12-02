---
title: "Send Message"
ms.custom: ""
ms.date: "2016-09-06"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 27515a20-6fa4-4594-abd6-dc539a5d14e8
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
# Send Message
The **Send Message** operation sends a new message.  
  
## Request  
 You can construct the **Send Message** request as follows.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|http{s}://{serviceNamespace}.servicebus.Windows.net/{topic path}/messages|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
|x-ms-retrypolicy|(Optional) Set to `NoRetry` to disable automatic retry on send operations in the case of transient errors.|  
  
### Request Body  
 Atom entry with the description embedded in the content. For example:  
  
```xml  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <content type='application/xml'>  
    {description}  
  </content>  
</entry>  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|OK. The resource has been successfully created or updated.|  
|400|Bad Request. The request is invalid.|  
|401|Unauthorized. The request is not authorized.|  
|409|Conflict. The resource could not be updated due to a conflict|  
  
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