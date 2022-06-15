---
title: Clear Messages (REST API) - Azure Storage
description: The Clear Messages operation deletes all messages from the specified queue.
author: pemari-msft

ms.date: 09/09/2019
ms.author: pemari
ms.service: storage
ms.topic: reference
---

# Clear Messages
The `Clear Messages` operation deletes all messages from the specified queue.  
  
## Request  
You can construct the `Clear Messages` request as follows. We recommend HTTPS. Replace *myaccount* with the name of your storage account, and replace *myqueue* with the name of your queue.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.queue.core.windows.net/myqueue/messages`|HTTP/1.1|  
  
### URI for the emulated storage service  
When you're making a request against the emulated storage service, specify the emulator host name and Azure Queue Storage port as `127.0.0.1:10001`, followed by the name of the emulated storage account:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10001/devstoreaccount1/myqueue/messages`|HTTP/1.1|  
  
### URI parameters  
You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set timeouts for Queue Storage operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  
  
### Request headers  
The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Using logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request body  
None.  
  
## Response  
The response includes an HTTP status code and a set of response headers.  
  
### Status code  
A successful operation returns status code 204 (No Content).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  
The response for this operation includes the following headers. The response also includes additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use this header to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Queue Storage that's used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|  
  
### Response body  
None.  
  
## Authorization  
Only the account owner can call this operation.  
  
## Remarks  
If a queue contains a large number of messages, `Clear Messages` might time out before all messages have been deleted. In this case, Queue Storage returns status code 500 (Internal Server Error), with the additional error code OperationTimedOut. If the operation times out, the client should continue to retry `Clear Messages` until it succeeds, to ensure that all messages have been deleted.  
  
## See also  
[Queue Storage error codes](Queue-Service-Error-Codes.md)   
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)
