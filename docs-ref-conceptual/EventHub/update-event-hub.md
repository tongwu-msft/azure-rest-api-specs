---
title: "Update Event Hub"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f28b03f9-db22-4643-8b58-4adea628bf21
caps.latest.revision: 14
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Update Event Hub

Updates an Event Hub. When updating an Event Hub, you can only change the properties listed here. An attempt to change any other properties results in an error. Properties that can be changed but are not specified are set to their default values.  
  
## Properties  
  
|Property Name|Available since API version|Default|Property Description|  
|-------------------|---------------------------------|-------------|--------------------------|  
|MessageRetentionInDays|2014-01|0|[MessageRetentionInDays](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.messageretentionindays#Microsoft_ServiceBus_Messaging_EventHubDescription_MessageRetentionInDays)|  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{serviceNamespace}.servicebus.windows.net/{eventHubPath}`|  
  
### Request Headers
  
See [Common parameters and headers](event-hubs-management-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
### Additional Request Headers  
  
|Request Header|Required or Optional|Description|  
|--------------------|--------------------------|-----------------|  
|If-Match|Optional|Set this header to “*” to update the Event Hub. You must provide all the desired property values on the updated Event Hub; any values not provided are set to the service default values. If this header is missing, then the update call returns an error indicating that this Event Hub already exists.|  
  
### Request Body
  
Atom entry with the description embedded in the content. For example:  
  
```xml  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <content type='application/xml'>  
    {EventHubDescription}  
  </content>  
</entry>  
```  
  
## Response
  
The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|400|Bad request.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body
  
If the request is successful, the response body contains the Event Hub description. Properties that were missing from the PUT request are returned with default values. If the request is not successful, the body contains an error code and error message.  
  
|Element Name|Description|  
|------------------|-----------------|  
|AuthorizationRules|The authorization rules.|  
|MessageRetentionInDays|The number of days to retain the events for this Event Hub.|  
|Status|The current status of the Event Hub (enabled or disabled).|  
|CreatedAt|The exact time the Event Hub was created.|  
|UpdatedAt|The exact time the Event Hub was updated.|  
|PartitionCount|The current number of partitions on the Event Hub.|  
|PartitionIds|Identifiers for partitions created for the Event Hub.|  
  
## Examples
  
**Request**  
  
```  
PUT https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
Content-Length: 264  
Expect: 100-continue  
Connection: Keep-Alive  
  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <content type='application/xml'>  
    <EventHubDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">  
      <MessageRetentionInDays>3</MessageRetentionInDays>  
    </EventHubDescription>  
  </content>  
</entry>  
```  
  
**Response**  
  
```  
HTTP/1.1 201 Created  
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
      <MessageRetentionInDays>3</MessageRetentionInDays>   
      <SizeInBytes>0</SizeInBytes>  
      <AuthorizationRules></AuthorizationRules>  
      <Status>Active</Status>  
      <PartitionCount>16</PartitionCount>  
      <EntityAvailabilityStatus>Available</EntityAvailabilityStatus>  
    </EventHubDescription>  
  </content>  
</entry>  
```