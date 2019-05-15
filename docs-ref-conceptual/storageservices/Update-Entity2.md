---
title: "Update Entity"
ms.custom: na
ms.date: 2016-12-13
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
H1: Update Entity
ms.assetid: 96a833e2-388c-460c-bfad-11e723c67d3f
caps.latest.revision: 56
author: tamram
manager: carolz
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Update Entity
The `Update Entity` operation updates an existing entity in a table. The `Update Entity` operation replaces the entire entity and can be used to remove properties.  
  
## Request  
 The `Update Entity` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, `mytable` with the name of your table, and *myPartitionKey* and *myRowKey* with the name of the partition key and row key identifying the entity to be updated:  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.table.core.windows.net/mytable(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
 The address of the entity to be updated may take a number of forms on the request URI. See the [OData Protocol](http://www.odata.org/) for additional details.  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Table service port as `127.0.0.1:10002`, followed by the emulated storage account name:  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`http://127.0.0.1:10002/devstoreaccount1/mytable(PartitionKey='myPartitionKey', RowKey='myRowKey')`|HTTP/1.1|  
  
 The Table service in the storage emulator differs from the Windows® Azure™ Table service in several ways. For more information, see [Differences Between the Storage Emulator and Azure Storage Services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  

|Parameter|Description|
|---------|-----------|
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Table Service Operations](Setting-Timeouts-for-Table-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Type`|Required. Specifies the content type of the payload. Possible values are `application/atom+xml` and `application/json`.<br /><br /> For more information about valid content types, see [Payload Format for Table Service Operations](Payload-Format-for-Table-Service-Operations.md).|  
|`Content-Length`|Required. The length of the request body.|  
|`If-Match`|Required. The client may specify the ETag for the entity on the request in order to compare to the ETag maintained by the service for the purpose of optimistic concurrency. The update operation will be performed only if the ETag sent by the client matches the value maintained by the server, indicating that the entity has not been modified since it was retrieved by the client.<br /><br /> To force an unconditional update, set `If-Match` to the wildcard character (*).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request Body  
 The `Update Entity` operation sends the entity to be updated as an OData entity set, which may be either a JSON or an Atom feed. For more information, see [Inserting and Updating Entities](Inserting-and-Updating-Entities.md).  
  
> [!NOTE]
>  JSON is the recommended payload format, and is the only format supported for versions 2015-12-11 and later.  
  
### Sample Request  
  
#### JSON (versions 2013-08-15 and later)  
 This example shows a sample request URI, the associated request headers, and the request body for a JSON feed.  
  
```  
Request Headers:  
x-ms-version: 2015-12-11  
Accept-Charset: UTF-8  
Content-Type: application/json  
If-Match: *  
x-ms-date: Mon, 27 Jun 2016 18:10:24 GMT  
Authorization: SharedKeyLite myaccount:u0sWZKmjBD1B7LY/CwXWCnHdqK4B1P4z8hKy9SVW49o=  
Content-Length: ###  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
  
{  
   "Address":"Santa Clara",  
   "Age":23,  
   "AmountDue":200.23,  
   "CustomerCode@odata.type":"Edm.Guid",  
   "CustomerCode":"c9da6455-213d-42c9-9a79-3e9149a57833",  
   "CustomerSince@odata.type":"Edm.DateTime",  
   "CustomerSince":"2008-07-10T00:00:00",  
   "IsActive":false,  
   "NumberOfOrders@odata.type":"Edm.Int64",  
   "NumberOfOrders":"255",  
   "PartitionKey":"mypartitionkey",  
   "RowKey":"myrowkey"  
}  
```  
  
#### Atom Feed (versions prior to 2015-12-11)  
 This example shows a sample request URI, the associated request headers, and the request body for an Atom feed.  
  
```  
Request URI:  
https://myaccount.table.core.windows.net/mytable(PartitionKey='myPartitionKey',RowKey='myRowKey')  
  
Request Headers:  
x-ms-version: 2013-08-15  
Accept: application/atom+xml,application/xml  
Accept-Charset: UTF-8  
Content-Type: application/atom+xml  
If-Match: *  
x-ms-date: Wed, 20 Nov 2013 18:10:24 GMT  
Authorization: SharedKeyLite myaccount:u0sWZKmjBD1B7LY/CwXWCnHdqK4B1P4z8hKy9SVW49o=  
Content-Length: ###  
DataServiceVersion: 1.0;NetFx  
MaxDataServiceVersion: 2.0;NetFx  
  
Request Body:  
<?xml version="1.0" encoding="utf-8"?>  
<entry xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns="http://www.w3.org/2005/Atom">  
  <title />  
  <updated>2008-09-18T23:46:37.168836Z</updated>  
  <author>  
    <name />  
  </author>  
<id>https://myaccount.table.core.windows.net/mytable(PartitionKey='mypartitionkey',RowKey='myrowkey')</id>  
  <content type="application/xml">  
    <m:properties>  
      <d:Address>Santa Clara</d:Address>  
      <d:Age m:type="Edm.Int32">23</d:Age>  
      <d:AmountDue m:type="Edm.Double">200.23</d:AmountDue>  
      <d:CustomerCode m:type="Edm.Guid">c9da6455-213d-42c9-9a79-3e9149a57833</d:CustomerCode>  
      <d:CustomerSince m:type="Edm.DateTime">2008-07-10T00:00:00Z</d:CustomerSince>  
      <d:IsActive m:type="Edm.Boolean">false</d:IsActive>  
      <d:NumOfOrders m:type="Edm.Int64">255</d:NumOfOrders>  
      <d:PartitionKey>mypartitionkey</d:PartitionKey>  
      <d:RowKey>myrowkey</d:RowKey>  
    </m:properties>  
  </content>  
</entry>  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 204 (No Content).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md) and [Table Service Error Codes](Table-Service-Error-Codes.md).  
  
### Response Headers  
 The response includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag for the entity.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Table service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 204 No Content  
  
Response Headers:  
Connection: Keep-Alive  
x-ms-request-id: 2c085f8f-11a4-4e1d-bd49-82c6bd87649d  
Content-Length: 0  
Cache-Control: no-cache  
Date: Mon, 27 Jun 2016 18:12:54 GMT  
ETag: W/"0x5B168C7B6E589D2"  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Server: Windows-Azure-Table/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  
 This operation can be performed by the account owner and by anyone with a shared access signature that has permission to perform this operation.  
  
## Remarks  
 When updating an entity, you must specify the `PartitionKey` and `RowKey` system properties as part of the update operation.  
  
 An entity's ETag provides default optimistic concurrency for update operations. The ETag value is opaque and should not be read or relied upon. Before an update operation occurs, the Table service verifies that the entity's current ETag value is identical to the ETag value included with the update request in the `If-Match` header. If the values are identical, the Table service determines that the entity has not been modified since it was retrieved, and the update operation proceeds.  
  
 If the entity's ETag differs from that specified with the update request, the update operation fails with status code 412 (Precondition Failed). This error indicates that the entity has been changed on the server since it was retrieved. To resolve this error, retrieve the entity again and reissue the request.  
  
 To force an unconditional update operation, set the value of the `If-Match` header to the wildcard character (*) on the request. Passing this value to the operation will override the default optimistic concurrency and ignore any mismatch in ETag values.  
  
 If the `If-Match` header is missing from the request in versions 2011-08-18 and later, then the service performs an [Insert Or Replace Entity](Insert-Or-Replace-Entity.md) (upsert) operation. In versions prior to 2011-08-18, the service returns status code 400 (Bad Request).  
  
 The Table service does not persist `null` values for properties. Specifying a property with a `null` value is equivalent to omitting that property in the request.  
  
> [!NOTE]
>  You can take advantage of either behavior to remove a property from an entity.  
  
 To explicitly type a property, specify the appropriate OData data type by setting the `m:type` attribute within the property definition in the Atom feed. For more information about typing properties, see [Inserting and Updating Entities](Inserting-and-Updating-Entities.md).  
  
 Any application that can authenticate and send an HTTP PUT request can update an entity.  
  
 For information about performing batch update operations, see [Performing Entity Group Transactions](Performing-Entity-Group-Transactions.md).  
  
## See Also  
 [Merge Entity](Merge-Entity.md)   
 [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md)   
 [Setting the OData Data Service Version Headers](Setting-the-OData-Data-Service-Version-Headers.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Table Service Error Codes](Table-Service-Error-Codes.md)
