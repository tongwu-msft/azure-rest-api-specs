---
title: Update Message (REST API) - Azure Storage
description: The Update Message operation updates the visibility timeout of a message.
author: pemari-msft
ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Update Message

The `Update Message` operation updates the visibility timeout of a message. You can also use this operation to update the contents of a message. A message must be in a format that can be included in an XML request with UTF-8 encoding, and the encoded message can be up to 64 KB in size. This operation was introduced with version 2011-08-18 of the Azure Queue Storage API. 
  
## Request  

You can construct the `Update Message` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, and *myqueue* with the name of your queue.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.queue.core.windows.net/myqueue/messages/messageid?popreceipt=<string-value>&visibilitytimeout=<int-seconds>`|HTTP/1.1|  
  
### Emulated storage service  

This operation is supported for SDK 1.6 and later versions.  
  
When you make a request against the emulated storage service, specify the emulator hostname and Queue Storage port as `127.0.0.1:10001`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`http://127.0.0.1:10001/devstoreaccount1/myqueue/messages/messageid?popreceipt=<string-value>&visibilitytimeout=<int-seconds>`|HTTP/1.1|  
  
### URI parameters  

You can specify the following parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`popreceipt`|Required. Specifies the valid pop receipt value returned from an earlier call to the [Get Messages](Get-Messages.md) or [Update Message](Update-Message.md) operations.|  
|`visibilitytimeout`|Required. Specifies the new visibility timeout value, in seconds, relative to server time. The new value must be larger than or equal to 0, and can't be larger than 7 days. The visibility timeout of a message can't be set to a value later than the expiry time. You can update a message until it has been deleted or has expired.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Queue Storage operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` `or x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Requires 2011-08-18 or later. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Queue Storage](/azure/storage/queues/monitor-queue-storage).|  
  
### Request body  

The body of the request contains the message data in the following XML format. Note that the message content must be in a format that can be encoded with UTF-8.  
  
```  
<QueueMessage>  
    <MessageText>message-content</MessageText>  
</QueueMessage>  
```  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (No Content). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Queue Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-popreceipt`|The pop receipt of the queue message.|  
|`x-ms-time-next-visible`|A UTC date/time value that represents when the message will be visible on the queue.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

The account owner can perform this operation. Additionally, anyone with a shared access signature who has permission to perform this operation can do so.  
  
## Sample request and response  

The following request extends the visibility of a queue message by 30 seconds and updates its content.  
  
```  
PUT https://myaccount.queue.core.windows.net/myqueue/messages/663d89aa-d1d9-42a2-9a6a-fcf822a97d2c?popreceipt=AgAAAAEAAAApAAAAGIw6Q29bzAE%3d&visibilitytimeout=30&timeout=30 HTTP/1.1  
  
```  
  
The request is sent with the following headers:  
  
```  
x-ms-version: 2011-08-18  
x-ms-date: Mon, 29 Aug 2011 17:17:21 GMT  
Authorization: SharedKey myaccount:batcrWZ35InGCZeTUFWMdIQiOZPCW7UEyeGdDOg7WW4=  
Content-Length: 75  
```  
  
The request is sent with the following XML body:  
  
```  
<QueueMessage>  
    <MessageText>new-message-content</MessageText>  
</QueueMessage>  
```  
  
After the request has been sent, the following response is returned:  
  
```  
HTTP/1.1 204 No Content  
Content-Length: 0  
Server: Windows-Azure-Queue/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: df34a7dd-3cbe-4206-a586-d6de3cf225a7  
x-ms-version: 2011-08-18  
x-ms-popreceipt: AwAAAAIAAAApAAAAINtMQ29bzAEBAAAA  
x-ms-time-next-visible: Mon, 29 Aug 2011 17:17:51 GMT  
Date: Mon, 29 Aug 2011 17:17:21 GMT  
```  
  
## Remarks  

An `Update Message` operation fails if the specified message doesn't exist in the queue, or if the specified pop receipt doesn't match the message.  
  
A pop receipt is returned by the `Get Messages` operation or the `Update Message` operation. Pop receipts remain valid until one of the following events occurs:  
  
- The message has expired.  
  
- The message has been deleted by using the last pop receipt received, either from `Get Messages` or `Update Message`.  
  
- The invisibility time has elapsed and the message has been dequeued by a `Get Messages` request. When the invisibility time elapses, the message becomes visible again. If it's retrieved by another `Get Messages` request, the returned pop receipt can be used to delete or update the message.  
  
- The message has been updated with a new visibility timeout. When the message is updated, a new pop receipt will be returned.  
  
You can use the `Update Message` operation to continually extend the invisibility of a queue message. This functionality can be useful if you want a worker role to lease a queue message. For example, if a worker role calls [Get Messages](Get-Messages.md) and recognizes that it needs more time to process a message, it can continually extend the message’s invisibility until it is processed. If the worker role were to fail during processing, eventually the message would become visible again, and another worker role could process it.  
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Queue Storage error codes](Queue-Service-Error-Codes.md)
