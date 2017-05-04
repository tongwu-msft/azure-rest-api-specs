---
title: "List consumer groups"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 66ae471d-ded5-4c7a-9189-f4563cda2e17
caps.latest.revision: 12
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# List consumer groups

Retrieves all consumer groups associated with the specified Event Hub. See [ConsumerGroupDescription Properties](../Topic/ConsumerGroupDescription%20Properties.md).  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/consumergroups`|  
  
### Request Headers
  
See [Common parameters and headers](../EventHub/event-hubs-management-rest-classic.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response
  
The response includes an HTTP status code, a set of response headers, and a response body.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|CreatedAt|Yes, read-only|string|2014-01|The exact time the consumer group was created.|  
|UpdatedAt|Yes, read-only|string|2014-01|The exact time the consumer group was updated.|  
  
### Response Body
  
If the request is successful, the response body contains the description of all consumer groups within the specified Event Hub. If the request is not successful, the body contains an error code and error message  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
## Examples  

**Request**  
  
```  
GET https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=https%3A%2F%2Fyour-namespace.servicebus.windows.net%2F&sig=your-sas-key&se=1455847106&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
```  
  
**Response**  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/atom+xml;type=feed;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Fri, 19 Feb 2016 01:40:40 GMT  
Content-Length: 1179  
  
<?xml version="1.0" encoding="UTF-8"?>  
<feed xmlns="http://www.w3.org/2005/Atom">  
   <title type="text">ConsumerGroups</title>  
   <id>https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups?timeout=60&api-version=2014-01</id>  
   <updated>2016-02-19T01:40:41Z</updated>  
   <link rel="self" href="https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups?timeout=60&api-version=2014-01" />  
   <entry xml:base="https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups?timeout=60&api-version=2014-01">  
      <id>https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$Default?api-version=2014-01</id>  
      <title type="text">$Default</title>  
      <published>2015-09-09T20:31:00Z</published>  
      <updated>2015-09-09T20:31:00Z</updated>  
      <link rel="self" href="consumergroups/$Default?api-version=2014-01" />  
      <content type="application/xml">  
         <ConsumerGroupDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
            <CreatedAt>2015-09-09T20:31:00.4479782</CreatedAt>  
            <UpdatedAt>2015-09-09T20:31:00.4479782</UpdatedAt>  
         </ConsumerGroupDescription>  
      </content>  
   </entry>  
</feed>  
  
```