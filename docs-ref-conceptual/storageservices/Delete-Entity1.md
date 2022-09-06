---
title: Delete Entity (REST API) - Azure Storage
description: The Delete Entity operation deletes an existing entity in a table.
author: pemari-msft
ms.date: 07/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Entity (Azure Storage)

The `Delete Entity` operation deletes an existing entity in a table.  
  
## Request  

You can construct the `Delete Entity` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, *mytable* with the name of your table, and *myPartitionKey* and *myRowKey* with the name of the partition key and row key identifying the entity to be deleted.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.table.core.windows.net/mytable(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
The address of the entity to be updated might take a number of forms on the request URI. For additional details, see the [OData Protocol](https://www.odata.org/).  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Table Storage port as `127.0.0.1:10002`, followed by the emulated storage account name. 
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`http://127.0.0.1:10002/devstoreaccount1/myentity(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
Table Storage in the storage emulator differs from the Azure service in several ways. For more information, see [Differences between the storage emulator and Azure Storage services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI parameters
  
You can specify the following additional parameter on the request URI.  

|Parameter|Description|
|---------|-----------|
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting timeouts for Table Storage operations](Setting-Timeouts-for-Table-Service-Operations.md).| 
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`If-Match`|Required. The client can specify the `ETag` for the entity on the request, in order to compare to the `ETag` maintained by the service for the purpose of optimistic concurrency. The delete operation proceeds only if the `ETag` sent by the client matches the value maintained by the server. This match indicates that the entity hasn't been modified since it was retrieved by the client.<br /><br /> To force an unconditional delete, set `If-Match` to the wildcard character (*).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Table Storage](/azure/storage/tables/monitor-table-storage).|  
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (No Content). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md) and [Table Storage error codes](Table-Service-Error-Codes.md).  
  
### Response headers  

The response includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Table Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

The account owner can perform this operation. Additionally, anyone with a shared access signature who has permission to perform this operation can perform it.  
  
## Remarks  

When you successfully delete an entity, the entity is immediately marked for deletion and is no longer accessible to clients. The entity is later removed from Table Storage during garbage collection.  
  
An entity's `ETag` provides default optimistic concurrency for delete operations. The `ETag` value is opaque, and should not be read or relied upon. Before a delete operation occurs, Table Storage verifies that the entity's current `ETag` value is identical to the `ETag` value included with the delete request in the `If-Match` header. If the values are identical, Table Storage determines that the entity hasn't been modified since it was retrieved, and the delete operation proceeds.  
  
If the entity's `ETag` differs from that specified with the delete request, the delete operation fails with status code 412 (Precondition Failed). This error indicates that the entity has been changed on the server since it was retrieved. To resolve this error, retrieve the entity again and reissue the request.  
  
To force an unconditional delete operation, set the value of the `If-Match` header to the wildcard character (*) on the request. Passing this value to the operation overrides the default optimistic concurrency, and ignores any mismatch in `ETag` values.  
  
If the `If-Match` header is missing from the request, the service returns status code 400 (Bad Request). A request malformed in other ways can also return code 400. For more information, see [Table Storage error codes](Table-Service-Error-Codes.md).  
  
Any application that can authorize and send an `HTTP DELETE` request can delete an entity. For more information about constructing a query by using `HTTP DELETE`, see [Add, modify, and delete entities](/dotnet/framework/data/wcf/how-to-add-modify-and-delete-entities-wcf-data-services).  
  
For information about performing batch delete operations, see [Performing entity group transactions](Performing-Entity-Group-Transactions.md).  
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Setting the OData data service version headers](Setting-the-OData-Data-Service-Version-Headers.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Table Storage error codes](Table-Service-Error-Codes.md)
