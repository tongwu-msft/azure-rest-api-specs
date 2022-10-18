---
title: Merge Entity (REST API) - Azure Storage
description: The Merge Entity operation updates an existing entity by updating the entity's properties. This operation does not replace the existing entity.
author: pemari-msft
ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Merge Entity

The `Merge Entity` operation updates an existing entity by updating the entity's properties. This operation does not replace the existing entity, as the [Update Entity](Update-Entity2.md) operation does.  
  
## Request  

You can construct the `Merge Entity` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, and *mytable* with the name of your table. Replace *myPartitionKey* and *myRowKey* with the name of the partition key and row key identifying the entity to be updated.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`MERGE`|`https://myaccount.table.core.windows.net/mytable(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
The address of the entity to be updated can take a number of forms on the request URI. See the [OData Protocol](https://www.odata.org/) for additional details.  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Table Storage port as `127.0.0.1:10002`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`MERGE`|`http://127.0.0.1:10002/devstoreaccount1/mytable(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
Table Storage in the storage emulator differs from the Azure Table Storage in several ways. For more information, see [Differences between the storage emulator and Azure Storage services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI parameters  

You can specify the following additional parameters on the request URI.  

|Parameter|Description|
|---------|-----------|
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Table Storage operations](Setting-Timeouts-for-Table-Service-Operations.md).|

### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Type`|Required. Specifies the content type of the payload. Possible values are `application/atom+xml` and `application/json`.<br /><br /> For more information about valid content types, see [Payload format for Table Storage operations](Payload-Format-for-Table-Service-Operations.md).|  
|`Content-Length`|Required. The length of the request body.|  
|`If-Match`|Required. The client can specify the `ETag` for the entity on the request, in order to compare to the `ETag` maintained by the service for the purpose of optimistic concurrency. The update operation will be performed only if the `ETag` sent by the client matches the value maintained by the server. This match indicates that the entity hasn't been modified since it was retrieved by the client.<br /><br /> To force an unconditional update, set `If-Match` to the wildcard character (*).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Table Storage](/azure/storage/tables/monitor-table-storage).|  
  
### Request body  

The `Merge Entity` operation sends the entity to be updated as an `OData` entity, which can be either a JSON or an Atom feed. For more information, see [Inserting and updating entities](Inserting-and-Updating-Entities.md).  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (No Content). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md) and [Table Storage error codes](Table-Service-Error-Codes.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The `ETag` for the entity.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Table Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
### Sample response  
  
```  
Response Status:  
HTTP/1.1 204 No Content  
  
Response Headers:  
Connection: Keep-Alive  
Content-Length: 0  
Cache-Control: no-cache  
Date: Mon, 25 Nov 2013 19:06:47 GMT  
ETag: W/"0x5B168C7B6E589D2"  
x-ms-version: 2013-08-15  
DataServiceVersion: 1.0;NetFx  
MaxDataServiceVersion: 2.0;NetFx  
Server: Windows-Azure-Table/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  

The account owner can perform this operation. Additionally, anyone with a shared access signature that has permission to perform this operation can do so.  
  
## Remarks  

Table Storage doesn't make `null` values for properties persistent. Specifying a property with a `null` value is equivalent to omitting that property in the request. Only properties with non-`null` values are updated by the `Merge Entity` operation.  
  
You can't remove a property with a `Merge Entity` operation. If you need to do this, replace the entity by calling the [Update Entity](Update-Entity2.md) operation.  
  
When you merge an entity, you must specify the `PartitionKey` and `RowKey` system properties as part of the merge operation.  
  
An entity's `ETag` provides default, optimistic concurrency for merge operations. The `ETag` value is opaque, and shouldn't be read or relied upon. Before a merge operation occurs, Table Storage verifies that the entity's current `ETag` value is identical to the `ETag` value included with the request in the `If-Match` header. If the values are identical, Table Storage determines that the entity hasn't been modified since it was retrieved, and the merge operation proceeds.  
  
If the entity's `ETag` differs from that specified with the merge request, the merge operation fails with status code 412 (Precondition Failed). This error indicates that the entity has been changed on the server since it was retrieved. To resolve this error, retrieve the entity and reissue the request.  
  
To force an unconditional merge operation, set the value of the `If-Match` header to the wildcard character (*) on the request. Passing this value to the operation will override the default, optimistic concurrency, and ignore any mismatch in `ETag` values.  
  
If the `If-Match` header is missing from the request in version 2011-08-18 and later, then the service performs an [Insert Or Merge Entity](Insert-Or-Merge-Entity.md) (upsert) operation. In versions prior to 2011-08-18, the service returns status code 400 (Bad Request).  
  
Any application that can authorize and send an `HTTP MERGE` request can merge an entity. For more information about constructing a query by using `HTTP MERGE`, see [Add, modify, and delete entities](/dotnet/framework/data/wcf/how-to-add-modify-and-delete-entities-wcf-data-services).  
  
For information about performing batch merge operations, see [Performing entity group transactions](Performing-Entity-Group-Transactions.md).  
  
## See also  

[Update Entity](Update-Entity2.md)   
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Setting the OData data service version headers](Setting-the-OData-Data-Service-Version-Headers.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Table Storage error codes](Table-Service-Error-Codes.md)