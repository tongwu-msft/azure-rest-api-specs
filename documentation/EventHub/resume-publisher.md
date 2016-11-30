---
title: "Resume publisher"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a9330dcc-27ee-4b3d-a3dc-c335b2ecac88
caps.latest.revision: 4
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Resume publisher
Restores a revoked publisher. This operation enables the publisher to resume sending events to the specified Event Hub.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/revokedpublishers/{publisherName}`|  
  
### Request Headers  
 See [Common parameters and headers](publisher-policy-operations.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  
 If the request is successful, the response body is empty. If the request is not successful, the body contains an error code and error message.  
  
## Examples  
 **Request**  
  
```  
DELETE https://your-namespace.servicebus.windows.net/your-event-hub/revokedpublishers/your-publisher?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=https%3A%2F%2Fyour-namespace.servicebus.windows.net%2F&sig=your-sas-key&se=1455858326&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 200 OK  
Content-Length: 0  
Server: Microsoft-HTTPAPI/2.0  
Date: Wed, 25 Jun 2014 22:43:27 GMT  
  
```