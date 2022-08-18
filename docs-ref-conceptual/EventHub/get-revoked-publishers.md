---
title: "Get revoked publishers"
description: Learn how the Get Revoked Publishers operation retrieves all revoked publishers within the specified Event Hub.
ms.custom: ""
ms.date: 07/14/2020
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a05221c5-5854-4904-aa8c-450536b4c71b
caps.latest.revision: 4
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
---
# Get revoked publishers
Retrieves all revoked publishers within the specified Event Hub. See [RevokedPublisherDescription Properties](/dotnet/api/microsoft.servicebus.messaging.revokedpublisherdescription.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/revokedpublishers`|  
  
### Request Headers  
 See [Common parameters and headers](publisher-policy-operations.md) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|Name|Yes, read-only|string|2014-01|The name (ID) of the revoked publisher.|  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  
 If the request is successful, the response body contains a description of the revoked publishers of the queried Event Hub. If the request is not successful, the body contains an error code and error message.  
  
## Examples  
 **Request**  

> [!NOTE]
> You can also use an **Azure Active Directory** token for the **Authorization** header as noted in the [Common parameters and headers](event-hubs-management-rest.md). For example: `Authorization: Bearer <Azure AD token>`.

  
```  
GET https://your-namespace.servicebus.windows.net/your-event-hub/RevokedPublishers?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=https%3A%2F%2Fyour-namespace.servicebus.windows.net%2F&sig=your-sas-key&se=1455847106&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/atom+xml;type=feed;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Fri, 19 Feb 2016 03:36:27 GMT  
Content-Length: 1059  
  
<?xml version="1.0" encoding="UTF-8"?>  
<feed xmlns="http://www.w3.org/2005/Atom">  
   <title type="text">RevokedPublishers</title>  
   <id>https://your-namespace.servicebus.windows.net/your-event-hub/revokedpublishers?timeout=60&api-version=2014-01</id>  
   <updated>2016-02-19T03:36:28Z</updated>  
   <link rel="self" href="https://your-namespace.servicebus.windows.net/your-event-hub/revokedpublishers?timeout=60&api-version=2014-01" />  
   <entry xml:base="https://your-namespace.servicebus.windows.net/your-event-hub/revokedpublishers?timeout=60&api-version=2014-01">  
      <id>https://your-namespace.servicebus.windows.net/your-event-hub/revokedpublishers/?api-version=2014-01</id>  
      <title type="text">your-publisher</title>  
      <updated>2016-02-19T03:36:28Z</updated>  
      <link rel="self" href="revokedpublishers/?api-version=2014-01" />  
      <content type="application/xml">  
         <RevokedPublisherDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
            <Name>your-publisher</Name>  
         </RevokedPublisherDescription>  
      </content>  
   </entry>  
</feed>  
  
```