---
title: "Revoke publisher"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 90bb4dff-40c8-4f0a-acc5-967de95986b5
caps.latest.revision: 5
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Revoke publisher
Revokes a publisher. A revoked publisher will encounter errors when sending an event to the specified Event Hub. See [RevokedPublisherDescription Properties](http://msdn.microsoft.com/en-us/acbfa549-e32b-4f6b-8482-34177184f45c).  
  
 When revoking a publisher, you must specify the following properties in the [RevokedPublisherDescription](http://msdn.microsoft.com/en-us/e3cca5de-36a6-4b38-8860-7f842ad64870).  
  
|Property name|Description|  
|-------------------|-----------------|  
|Name|The name of the revoked publisher.|  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/revokedpublishers/{publisherName}`|  
  
### Request Headers  
 See [Common parameters and headers](publisher-policy-operations.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|Created.|  
|400|Bad request.|  
|401|Authorization failure.|  
|409|The specified publisher is already revoked.|  
|500|Internal error.|  
  
### Response Body  
 If the request is successful, the response body contains a description of the revoked publishers. If the request is not successful, the body contains an error code and error message.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|Name|Yes, read-only|string|2014-01|The name (ID) of the revoked publisher.|  
  
## Examples  
 **Request**  
  
```  
PUT https://your-namespace.servicebus.windows.net/your-event-hub/RevokedPublishers/your-publisher?timeout=60&api-version=2014-05 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1456362414&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
Content-Length: 338  
  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <content type="application/xml">  
      <RevokedPublisherDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
        <Name>your-publisher</Name>  
      </RevokedPublisherDescription>  
   </content>  
</entry>  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Thu, 25 Feb 2016 00:41:11 GMT  
Content-Length: 660  
  
<?xml version="1.0" encoding="UTF-8"?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <id>https://your-namespace.servicebus.windows.net/your-event-hub/RevokedPublishers/your-publisher?timeout=60&api-version=2014-05</id>  
   <title type="text">your-publisher</title>  
   <updated>2016-02-25T00:41:11Z</updated>  
   <link rel="self" href="https://your-namespace.servicebus.windows.net/your-event-hub/RevokedPublishers/your-publisher?timeout=60&api-version=2014-05" />  
   <content type="application/xml">  
      <RevokedPublisherDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
         <Name>your-publisher</Name>  
      </RevokedPublisherDescription>  
   </content>  
</entry>  
  
```