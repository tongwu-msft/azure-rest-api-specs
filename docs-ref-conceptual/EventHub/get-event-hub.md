---
title: "Get Event Hub"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2b3a0d8b-a06e-4d2b-84fb-6c2f62d40080
caps.latest.revision: 14
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Get Event Hub

Retrieves all metadata associated with the specified Event Hub. See [EventHubDescription Properties](../Topic/EventHubDescription%20Properties.md).  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{serviceNamespace}.servicebus.windows.net/{eventHubPath}`|  
  
### Request Headers  
See [Common parameters and headers](../EventHub/event-hubs-management-rest-classic.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  
The response includes an HTTP status code, a set of response headers, and a response body.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|AuthorizationRules|Yes, read-only|string|2014-01|The authorization rules.|  
|MessageRetentionInDays|Yes, read-only|string|2014-01|The number of days to retain the events for this Event Hub.|  
|Status|Yes, read-only|string|2014-01|The current status of the Event Hub (enabled or disabled).|  
|CreatedAt|Yes, read-only|string|2014-01|The exact time the Event Hub was created.|  
|UpdatedAt|Yes, read-only|string|2014-01|The exact time the Event Hub was updated.|  
|PartitionCount|Yes, read-only|string|2014-01|The current number of partitions on the Event Hub.|  
|PartitionIds|Yes, read-only|string|2014-01|Identifiers for partitions created for the Event Hub.|  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  
If the request is successful, the response body contains the description of the queried Event Hub. If the request is not successful, the body contains an error code and error message.  
  
## Examples  
**Request**  
  
```  
GET https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
ContentType: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
```  
  
**Response**  
  
```  
HTTP/1.1 200 Created  
Transfer-Encoding: chunked  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Wed, 25 Jun 2014 22:43:27 GMT  
  
<entry xmlns="http://www.w3.org/2005/Atom">  
  <id>https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01</id>  
  <title type="text">your-event-hub</title>  
  <published>2014-06-25T22:43:16Z</published>  
  <updated>2014-06-25T22:43:27Z</updated>  
  <author>  
    <name>your-namespace</name>  
  </author>  
  <link rel="self" href="https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01"/>  
  <content type="application/xml">  
    <EventHubDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
      <SizeInBytes>0</SizeInBytes>  
      <MessageRetentionInDays>2</MessageRetentionInDays>  
      <AuthorizationRules></AuthorizationRules>  
      <Status>Active</Status>  
      <CreatedAt>2014-06-25T22:51:47.8656642</CreatedAt>  
      <UpdatedAt>2014-06-25T22:51:50.623Z</UpdatedAt>  
      <AccessedAt>0001-01-01T00:00:00Z</AccessedAt>  
      <PartitionCount>4</PartitionCount>  
      <EntityAvailabilityStatus>Available</EntityAvailabilityStatus>  
    </EventHubDescription>  
  </content>  
</entry>  
```