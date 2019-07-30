---
title: "Enumeration"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ebafd37b-1c80-467b-91fc-2c4c36362aa6
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
# Enumeration
The **Discovery** operation navigates hierarchical namespaces, while **Enumeration** enables you to list all entities of certain kind, in a flat view. Enumeration is performed against the special reserved resource collection ($Resources) that resides at the root of the service namespace. For features, enumeration occurs with respect to the collection address; for example, “/subscriptions” or “/rules” for subscriptions and rules on a topic.  
  
## Request  
 You can construct the **Enumeration** request as follows.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://{serviceNamespace}.servicebus.windows.net/$Resources/{resourceCollection}<br /><br /> or<br /><br /> https://{serviceNamespace}.servicebus.windows.net/{path}/Subscriptions<br /><br /> or<br /><br /> https://{serviceNamespace}.servicebus.windows.net/{path}/Subscriptions/{subscription-name}/rules|HTTP/1.1|  

### Query parameters $skip and $top  
Enumeration supports paging. You can retrieve a range of entities under your service namespace. The query parameter $skip indicates how many entries the request shall skip
when returning an enumeration and $top how many entries shall be returned.
  
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
  
> [!NOTE]
>  An empty feed is returned if no entities exist.  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|**Content-type**|Content-Type: application/atom+xml; type=entry|  
  
### Response Body  
 Upon success, an Atom feed containing multiple Atom entries listing all available resource of given type in the given namespace is returned. For example:  
  
```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<feed xmlns='http://www.w3.org/2005/Atom'>  
  <entry>  
    <id>https://{serviceNamespace}.Windows.net/{path}</id>  
    <published>{createdTime}</published>  
    <updated>{lastUpdatedTime}</updated>  
    <link rel='self'>https://{serviceNamespace}.servicebus.Windows.net/{path}</link>  
    <content type='application/xml'>  
      {description}
    </content>  
  </entry>  
</feed>  
```

For the possible content of the {description} element, see [Overview](overview.md).