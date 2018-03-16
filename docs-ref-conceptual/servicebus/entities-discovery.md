---
title: "Entities Discovery"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a484d1f4-f35b-44ea-9039-e219b75d1559
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
# Entities Discovery
Discovers messaging entities.  
  
## Request  
 You can construct the **Entities Discovery** request as follows.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://{serviceNamespace}.servicebus.Windows.net[:{port}]/{path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|OK.|  
|401|Unauthorized. The request is not authorized.|  
  
> [!NOTE]
>  In order for the HTTP GET request be interpreted as a “Discovery” operation, the name addressed by the URL must not be occupied. If the name is taken, the HTTP GET request is interpreted as a “Get” operation.  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|**Content-type**|Content-Type: application/atom+xml; type=entry|  
  
### Response Body  
 Upon success, an Atom feed listing immediate children of current node is returned. For example:  
  
```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<feed xmlns='http://www.w3.org/2005/Atom'>  
  <entry>  
    <id>https://{serviceNamespace}.servicebus.Windows.net/{path}</id>  
    <published>{createdTime}</published>  
    <updated>{lastUpdatedTime}</updated>  
    <link rel='self'>https://{serviceNamespace}.servicebus.Windows.net/{path}</link>  
    <content type='application/xml'>  
      ...  
    </content>  
  </entry>  
</feed>  
```