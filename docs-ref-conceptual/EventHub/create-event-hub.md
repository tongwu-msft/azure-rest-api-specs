---
title: "Create Event Hub"
ms.custom: ""
ms.date: "2017-05-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fb28477c-a9e5-49fb-8f04-d894d9d7d1d9
caps.latest.revision: 10
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Create Event Hub

Creates a new Event Hub. When creating an Event Hub, you can specify the following properties. If a property is not specified, Event Hubs uses the default value for this property. See [EventHubDescription Properties](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription#properties_).  
  
## Properties  

In addition to the properties listed as follows, you can specify additional properties that appear in the Event Hub description, but are ignored by the service.  
  
You must specify the properties in the order given below. Any property that is specified out of order is interpreted as a user property. This property will appear twice in the Event Hub description: once with the value that is set by the user, and once with the default value that is used by Event Hubs.  
  
|Property Name|Available since API version|Default|Property Description|  
|-------------------|---------------------------------|-------------|--------------------------|  
|MessageRetentionInDays|2014-01|0|[MessageRetentionInDays](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.messageretentionindays#Microsoft_ServiceBus_Messaging_EventHubDescription_MessageRetentionInDays)|  
|Authorization|2014-01|(empty)|[Authorization](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.authorization#Microsoft_ServiceBus_Messaging_EventHubDescription_Authorization)|  
|Status|2014-01|Active|[Status](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.status#Microsoft_ServiceBus_Messaging_EventHubDescription_Status)|  
|UserMetadata|2014-01|(empty)|[UserMetadata](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.usermetadata#Microsoft_ServiceBus_Messaging_EventHubDescription_UserMetadata)|  
|PartitionCount|2014-01|16|[PartitionCount](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription.partitioncount#Microsoft_ServiceBus_Messaging_EventHubDescription_PartitionCount)|  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`https://{serviceNamespace}.servicebus.windows.net/{eventHubPath}`|HTTP/1.1|  
  
### Request Headers  

See [Common parameters and headers](event-hubs-management-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
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
|201|Event Hub created.|  
|400|Bad request.|  
|401|Authorization failure.|  
|403|Quota exceeded; Event Hub not created.|  
|409|The specified Event Hub already exists (or the specified path is already occupied).|  
|500|Internal error.|  
  
### Response Body
  
If the request is successful, the response body contains the description of the created Event Hub. If the request is not successful, the body contains an error code and error message.  
  
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
  
The following HTTP request creates an Event Hub with custom settings:  
  
```  
PUT https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <content type='application/xml'>  
    <EventHubDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">  
      <MessageRetentionInDays>3</MessageRetentionInDays>  
      <PartitionCount>8</PartitionCount>  
    </EventHubDescription>  
  </content>  
</entry>  
  
```  
  
Event Hubs returns the following response:  
  
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