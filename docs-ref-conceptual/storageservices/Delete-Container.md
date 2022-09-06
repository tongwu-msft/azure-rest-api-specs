---
title: Delete Container (REST API) - Azure Storage
description: The Delete Container operation marks the specified container for deletion. The container and any blobs contained within it are later deleted during garbage collection. 
author: pemari-msft
ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Container

The `Delete Container` operation marks the specified container for deletion. The container and any blobs contained within it are later deleted during garbage collection.  
  
## Request  

You can construct the `Delete Container` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account. 
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.blob.core.windows.net/mycontainer?restype=container`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10000/devstoreaccount1/mycontainer?restype=container`|HTTP/1.1|  
  
For more information, see [Use Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters  

You can specify the following additional parameter on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-lease-id: <ID>`|Required for version 2012-02-12 and later if the container has an active lease. To call `Delete Container` on a container that has an active lease, specify the lease ID in this header. If this header isn't specified when there is an active lease, `Delete Container` returns a 409 (Conflict) error. If you specify the wrong lease ID, or a lease ID on a container that doesn't have an active lease, `Delete Container` returns a 412 (Precondition failed) error.|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  
  
This operation also supports the use of conditional headers to delete the container only if a specified condition is met. For more information, see [Specifying conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request body  

None.  
  
### Sample request  
  
```  
Request Syntax:  
DELETE https://myaccount.blob.core.windows.net/mycontainer?restype=container HTTP/1.1  
  
Request Headers:  
x-ms-version: 2011-08-18  
x-ms-date: Sun, 25 Sep 2011 21:44:34 GMT  
Authorization: SharedKey devstoreaccount1:t7mf5htNuwLFX9g0S2LDdRtRn1FQzMAluBvHy1QPpnM=  
```  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 202 (Accepted). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?LinkId=73147).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
### Sample response  
  
```  
Response Status:  
HTTP/1.1 202 Accepted  
  
Response Headers:  
Transfer-Encoding: chunked  
Content-Type: application/xml  
Date: Sun, 25 Sep 2011 21:45:00 GMT  
x-ms-version: 2011-08-18  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  

Only the account owner can call this operation.  
  
## Remarks  

When a container is deleted, a container with the same name can't be created for at least 30 seconds. The container might not be available for more than 30 seconds if the service is still processing the request. While the container is being deleted, attempts to create a container of the same name fail with status code 409 (Conflict). The service indicates that the container is being deleted. All other operations, including operations on any blobs under the container, fail with status code 404 (Not Found) while the container is being deleted.  
  
## See also  

[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Specifying conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md)
