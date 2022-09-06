---
title: Delete Queue (REST API) - Azure Storage
description: The Delete Queue operation permanently deletes the specified queue. 
author: pemari-msft
ms.date: 08/10/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Queue (Azure Storage)

The `Delete Queue` operation permanently deletes the specified queue.  
  
## Request  

You can construct the `Delete Queue` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.queue.core.windows.net/myqueue`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Queue Storage port as `127.0.0.1:10001`, followed by the emulated storage account name.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10001/devstoreaccount1/myqueue`|HTTP/1.1|  
  
### URI parameters  

You can specify the following additional parameter on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Queue Storage operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request Header|Description|  
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

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Queue Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

Only the account owner can call this operation.  
  
## Remarks  

When you delete a queue, you can't create a queue with the same name for at least 30 seconds. The queue might not be available for more than 30 seconds if the service is still processing the request.

While the queue is being deleted, attempts to create a queue of the same name fail with status code 409 (Conflict). The service returns additional error information, indicating that the queue is being deleted. All other operations, including operations on any messages in the queue, fail with status code 404 (Not Found) while the queue is being deleted.  
  
## See also  

[Queue Storage error codes](Queue-Service-Error-Codes.md)   
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)
