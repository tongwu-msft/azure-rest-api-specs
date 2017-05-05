---
title: "Get consumer group"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b742bccf-b585-43e8-8fb2-a0648db7f482
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Get consumer group

Retrieves all metadata associated with the specified consumer group. See [ConsumerGroupDescription Properties](/dotnet/api/microsoft.servicebus.messaging.consumergroupdescription#properties_).  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/consumergroups/{consumergroupName}`|  
  
### Request Headers  

See [Common parameters and headers](event-hubs-management-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  

The response includes an HTTP status code, a set of response headers, and a response body.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|CreatedAt|Yes, read-only|string|2014-01|The exact time the consumer group was created.|  
|UpdatedAt|Yes, read-only|string|2014-01|The exact time the consumer group was updated.|  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  

If the request is successful, the response body contains the description of the specified consumer group. If the request is not successful, the body contains an error code and error message.  
  
## Examples  

**Request**  
  
```  
GET https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$default?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=https%3A%2F%2Fyour-namespace.servicebus.windows.net%2F&sig=your-sas-key&se=1455847106&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
```  
  
**Response**  
  
```  
HTTP/1.1 200 Created  
Transfer-Encoding: chunked  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Wed, 25 Jun 2014 22:43:27 GMT  
  
HTTP/1.1 200 OK  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Fri, 19 Feb 2016 01:40:20 GMT  
Content-Length: 776  
  
<?xml version="1.0" encoding="UTF-8"?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <id>sb://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$default?timeout=60&api-version=2014-01</id>  
   <title type="text">$Default</title>  
   <published>2015-09-09T20:31:00Z</published>  
   <updated>2015-09-09T21:16:12Z</updated>  
   <link rel="self" href="sb://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$default?timeout=60&api-version=2014-01" />  
   <content type="application/xml">  
      <ConsumerGroupDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
         <CreatedAt>2015-09-09T20:31:00.4479782</CreatedAt>  
         <UpdatedAt>2015-09-09T21:16:12.0432889</UpdatedAt>  
      </ConsumerGroupDescription>  
   </content>  
</entry>  
  
```