---
title: "Get partition runtime metadata"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 56eef728-2f8c-4023-a25d-f893a56ed080
caps.latest.revision: 9
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Get partition runtime metadata

Returns the metadata for a specified partition on an Event Hub. See [PartitionDescription Properties](https://msdn.microsoft.com/library/azure/microsoft.servicebus.messaging.partitiondescription_properties.aspx).  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/consumergroups/{consumergroupName}/partitions/{partitionId}`|  
  
### Request Headers  

See [Common parameters and headers](../EventHub/event-hubs-management-rest-classic.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  

The response includes an HTTP status code, a set of response headers, and a response body.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|SizeInBytes|Yes, read-only|int|2014-01|The approximate size, in bytes, of the Event Hubs partition.|  
|BeginSequenceNumber|Yes, read-only|string|2014-01|The beginning sequence number.|  
|EndSequenceNumber|Yes, read-only|string|2014-01|The end sequence number.|  
|IncomingBytesPerSecond|Yes, read-only|string|2014-01|The approximate incoming rate of events (in bytes per second) for the partition in this consumer group.|  
|OutgoingBytesPerSecond|Yes, read-only|string|2014-01|The approximate outgoing rate (in bytes per second) for the partition in this consumer group.|  
|LastEnqueuedOffset|Yes, read-only|string|2015-01|The offset of the last enqueued event.|  
|LastEnqueuedTimeUtc|Yes, read-only|string|2015-01|The time in UTC at which  the last event was enqueued.|  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  

If the request is successful, the response body contains the description of the specified partition. If the request is not successful, the body contains an error code and error message.  
  
## Examples  

**Request**  
  
```  
GET https://your-namespace.servicebus.windows.net/your-event-hub//consumergroups/$Default/partitions/0?timeout=60&api-version=2015-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1456273000&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
```  
  
**Response**  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 23 Feb 2016 23:34:13 GMT  
Content-Length: 910  
  
<?xml version="1.0" encoding="UTF-8"?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <id>sb://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$Default/partitions/0?timeout=60&api-version=2014-01</id>  
   <title type="text">0</title>  
   <published>2015-09-09T20:31:00Z</published>  
   <updated>2015-09-09T20:31:00Z</updated>  
   <link rel="self" href="sb://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/$Default/partitions/0?timeout=60&api-version=2014-01" />  
   <content type="application/xml">  
      <PartitionDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
         <SizeInBytes>33554432</SizeInBytes>  
         <BeginSequenceNumber>0</BeginSequenceNumber>  
         <EndSequenceNumber>20044</EndSequenceNumber>  
         <IncomingBytesPerSecond>0</IncomingBytesPerSecond>  
         <OutgoingBytesPerSecond>0</OutgoingBytesPerSecond>  
         <LastEnqueuedOffset>2062040</LastEnqueuedOffset>  
         <LastEnqueuedTimeUtc>2016-02-23T03:22:27.024Z</LastEnqueuedTimeUtc>  
      </PartitionDescription>  
   </content>  
</entry>  
  
```