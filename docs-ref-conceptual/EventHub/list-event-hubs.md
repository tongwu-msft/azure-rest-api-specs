---
title: "List Event Hubs"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a1df22da-00cf-4dba-adc0-4097455999d5
caps.latest.revision: 6
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"

---

# List Event Hubs

Retrieves all metadata associated with all Event Hubs within a specified Service Bus namespace. See [EventHubDescription Properties](/dotnet/api/microsoft.servicebus.messaging.eventhubdescription#properties_).  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{servicebusNamespace}.servicebus.windows.net/$Resources/Eventhubs`|  
  
### Request Headers
  
See [Common parameters and headers](event-hubs-management-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
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
  
If the request is successful, the response body contains the description of all the Event Hubs under the queried Service Bus namespace. If the request is not successful, the body contains an error code and error message.  
  
## Examples
  
**Request**  
  
```  
GET https://your-namespace.servicebus.windows.net/ $Resources/Eventhubs?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
```  
  
**Response**  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Wed, 25 Jun 2014 22:43:27 GMT  
  
<?xml version="1.0" encoding="UTF-8"?>  
<feed xmlns="http://www.w3.org/2005/Atom">  
   <title type="text">EventHubs</title>  
   <id>https://your-namespace.servicebus.windows.net/$Resources/Eventhubs?timeout=60&api-version=2014-01</id>  
   <updated>2016-02-19T22:56:38Z</updated>  
   <link rel="self" href="https://your-namespace.servicebus.windows.net/$Resources/Eventhubs?timeout=60&api-version=2014-01" />  
   <entry xml:base="https://your-namespace.servicebus.windows.net/$Resources/Eventhubs?timeout=60&api-version=2014-01">  
      <id>https://your-namespace.servicebus.windows.net/your-event-hub?api-version=2014-01</id>  
      <title type="text">your-event-hub</title>  
      <published>2015-09-09T20:30:51Z</published>  
      <updated>2015-09-09T21:16:12Z</updated>  
      <author>  
         <name>your-namespace</name>  
      </author>  
      <link rel="self" href="../your-event-hub?api-version=2014-01" />  
      <content type="application/xml">  
         <EventHubDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
            <MessageRetentionInDays>1</MessageRetentionInDays>  
            <AuthorizationRules>  
               <AuthorizationRule i:type="SharedAccessAuthorizationRule">  
                  <ClaimType>SharedAccessKey</ClaimType>  
                  <ClaimValue>None</ClaimValue>  
                  <Rights>  
                     <AccessRights>Send</AccessRights>  
                  </Rights>  
                  <CreatedTime>2015-09-09T21:16:11.7216934Z</CreatedTime>  
                  <ModifiedTime>2015-09-09T21:16:11.7216934Z</ModifiedTime>  
                  <KeyName>send</KeyName>  
                  <PrimaryKey>your-primary-key</PrimaryKey>  
                  <SecondaryKey>your-secondary-key</SecondaryKey>  
               </AuthorizationRule>  
               <AuthorizationRule i:type="SharedAccessAuthorizationRule">  
                  <ClaimType>SharedAccessKey</ClaimType>  
                  <ClaimValue>None</ClaimValue>  
                  <Rights>  
                     <AccessRights>Listen</AccessRights>  
                  </Rights>  
                  <CreatedTime>2015-09-09T21:16:11.7216934Z</CreatedTime>  
                  <ModifiedTime>2015-09-09T21:16:11.7216934Z</ModifiedTime>  
                  <KeyName>listen</KeyName>  
                  <PrimaryKey>your-primary-key</PrimaryKey>  
                  <SecondaryKey>your-secondary-key</SecondaryKey>  
               </AuthorizationRule>  
               <AuthorizationRule i:type="SharedAccessAuthorizationRule">  
                  <ClaimType>SharedAccessKey</ClaimType>  
                  <ClaimValue>None</ClaimValue>  
                  <Rights>  
                     <AccessRights>Manage</AccessRights>  
                     <AccessRights>Send</AccessRights>  
                     <AccessRights>Listen</AccessRights>  
                  </Rights>  
                  <CreatedTime>2015-09-09T21:16:11.7216934Z</CreatedTime>  
                  <ModifiedTime>2015-09-09T21:16:11.7216934Z</ModifiedTime>  
                  <KeyName>manage</KeyName>  
                  <PrimaryKey>your-primary-key</PrimaryKey>  
                  <SecondaryKey>your-secondary-key</SecondaryKey>  
               </AuthorizationRule>  
            </AuthorizationRules>  
            <Status>Active</Status>  
            <CreatedAt>2015-09-09T20:30:51.083</CreatedAt>  
            <UpdatedAt>2015-09-09T21:16:12.057</UpdatedAt>  
            <PartitionCount>2</PartitionCount>  
            <PartitionIds xmlns:d2p1="http://schemas.microsoft.com/2003/10/Serialization/Arrays">  
               <d2p1:string>0</d2p1:string>  
               <d2p1:string>1</d2p1:string>  
            </PartitionIds>  
         </EventHubDescription>  
      </content>  
   </entry>  
</feed>  
  
```