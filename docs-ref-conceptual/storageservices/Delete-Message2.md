---
title: Delete Message (REST API) - Azure Storage
description: The Delete Message operation deletes the specified message from the queue. 
author: pemari-msft
ms.date: 07/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Message (Azure Storage)

The `Delete Message` operation deletes the specified message from the queue.  
  
## Request  

You can construct the `Delete Message` request as follows. HTTPS is recommended.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.queue.core.windows.net/myqueue/messages/messageid?popreceipt=string-value`|HTTP/1.1|  

Replace `myaccount` with the name of your storage account, `myqueue` with the name of your queue, and `string-value` with the value of the pop receipt that has been obtained for the message to be deleted.
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator host name and Azure Queue Storage port as `127.0.0.1:10001`, followed by the emulated storage account name.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10001/devstoreaccount1/myqueue/messages/messageid?popreceipt=string-value`|HTTP/1.1|  
  
### URI parameters  

The request URI supports the following parameters.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`popreceipt`|Required. A valid pop receipt value returned from an earlier call to the [Get Messages](Get-Messages.md) or [Update Message](Update-Message.md) operation.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Queue Storage operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Queue Storage](/azure/storage/queues/monitor-queue-storage).|  
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (No Content). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response also includes additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Queue Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

The account owner can perform this operation. Additionally, anyone with a shared access signature that has permission to perform this operation can perform it.  
  
## Remarks  

When you successfully delete a message, it's immediately marked for deletion, and is no longer accessible to clients. The message is later removed from the queue during garbage collection.  
  
After a client retrieves a message with the [Get Messages](Get-Messages.md) operation, the client is expected to process and delete the message. To delete the message, you must have two items of data returned in the response body of the `Get Messages` operation:  
  
- The message ID, an opaque GUID value that identifies the message in the queue.  
  
- A valid pop receipt, an opaque value that indicates that the message has been retrieved.  
  
The message ID is returned from the previous `Get Messages` operation. The pop receipt is returned from the most recent `Get Messages` or `Update Message` operation. For the `Delete Message` operation to succeed, the pop receipt specified on the request must match the pop receipt returned from the `Get Messages` or `Update Message` operation.  
  
Pop receipts remain valid until one of the following events occurs:  
  
- The message expires.  
  
- The message is deleted by using the last pop receipt received, either from `Get Messages` or `Update Message`.  
  
- The invisibility timeout expires, and the message is dequeued by a `Get Messages` request. When the invisibility timeout expires, the message becomes visible again. If it's retrieved by another `Get Messages` request, the returned pop receipt can be used to delete or update the message.  
  
- The message is updated with a new visibility timeout. When the message is updated, a new pop receipt is returned.  
  
If a message with a matching pop receipt isn't found, the service returns error code 404 (Not Found). This error occurs in the previously listed cases in which the pop receipt is no longer valid.  
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Queue Storage error codes](Queue-Service-Error-Codes.md)