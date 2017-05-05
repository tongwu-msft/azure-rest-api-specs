---
title: "Create consumer group2"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 612fac84-4c6f-4e39-80e8-50c8ef43f73c
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# Create consumer group

Creates a new consumer group. When creating a consumer group, you can specify the following properties in **ConsumerGroupDescription**. If a property is not specified, Service Bus uses the default value for that property.  See [ConsumerGroupDescription Properties](/dotnet/api/microsoft.servicebus.messaging.consumergroupdescription#properties_).  
  
 Default value of [ConsumerGroupDescription Properties](/dotnet/api/microsoft.servicebus.messaging.consumergroupdescription#properties_):  
  
|Property Name|Default|  
|-------------------|-------------|  
|UserMetadata|(empty)|  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/consumergroups/{consumergroupName}`|  
  
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
|201|Created.|  
|400|Bad request.|  
|401|Authorization failure.|  
|403|Quota exceeded; consumer group not created.|  
|409|The specified consumer group already exists (or the specified path is already occupied).|  
|500|Internal error.|  
  
### Response Body  

If the request is successful, the response body contains the description of the specified consumer group. If the request is not successful, the body contains an error code and error message.  
  
## Examples  

**Request**  
  
```  
PUT https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/testCG?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=https%3A%2F%2Fyour-namespace.servicebus.windows.net%2F&sig=your-sas-key&se=1455847106&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <content type="application/xml">  
      <ConsumerGroupDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
      </ConsumerGroupDescription>  
   </content>  
</entry>  
  
```  
  
**Response**  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Fri, 19 Feb 2016 01:52:50 GMT  
Content-Length: 776  
  
<?xml version="1.0" encoding="UTF-8"?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
   <id>https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/testCG?timeout=60&api-version=2014-01</id>  
   <title type="text">testCG</title>  
   <published>2016-02-19T01:52:50Z</published>  
   <updated>2016-02-19T01:52:50Z</updated>  
   <link rel="self" href="https://your-namespace.servicebus.windows.net/your-event-hub/consumergroups/testCG?timeout=60&api-version=2014-01" />  
   <content type="application/xml">  
      <ConsumerGroupDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
         <CreatedAt>2016-02-19T01:52:50.570652Z</CreatedAt>  
         <UpdatedAt>2016-02-19T01:52:50.570652Z</UpdatedAt>  
      </ConsumerGroupDescription>  
   </content>  
</entry>  
```