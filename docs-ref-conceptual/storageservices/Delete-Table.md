---
title: Delete Table (REST API) - Azure Storage
description: The Delete Table operation deletes the specified table and any data it contains. 
author: pemari-msft
ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Table

The `Delete Table` operation deletes the specified table and any data it contains.  
  
## Request  

You can construct the `Delete Table` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, and *mytable* with the name of the table to be deleted.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.table.core.windows.net/Tables('mytable')`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Table Storage port as `127.0.0.1:10002`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10002/devstoreaccount1/Tables('mytable')`|HTTP/1.1|  
  
Table Storage in the emulated storage service differs from the Azure Table Storage in several ways. For more information, see [Differences between the storage emulator and Azure Storage services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI parameters  

None.  
  
### Request headers  

The request must include the `Authorization` header, and either the `Date` or `x-ms-date` header, as specified in [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md). Additional headers are described in the following table.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Type`|Required. Specifies the content type of the payload. Possible values are:<br /><br /> -   `application/atom+xml` (versions prior to 2015-12-11 only)<br />-   `application/json`<br /><br /> For more information, see [Payload format for Table Storage operations](Payload-Format-for-Table-Service-Operations.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Table Storage](/azure/storage/tables/monitor-table-storage).|  
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (No Content). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md) and [Table Storage error codes](Table-Service-Error-Codes.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Table Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. This service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

Only the account owner can call this operation.  
  
## Remarks  

When you successfully delete a table, it's immediately marked for deletion and is no longer accessible to clients. The table is later removed from Table Storage during garbage collection.  
  
Note that deleting a table is likely to take at least 40 seconds to complete. If you attempt an operation against the table while it's being deleted, the service returns status code 409 (Conflict). The service returns additional error information indicating that the table is being deleted.  
  
## See also  

[Table Storage error codes](Table-Service-Error-Codes.md)   
[Setting the OData data service version headers](Setting-the-OData-Data-Service-Version-Headers.md)   
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)
