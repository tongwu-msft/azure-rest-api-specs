---
title: Create Table (REST API) - Azure Storage
description: The Create Table operation creates a new table in a storage account. 
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Create Table

The `Create Table` operation creates a new table in a storage account.  
  
## Request  

 You can construct the `Create Table` request as shown here. We recommend that you use HTTPS. Replace *myaccount* with the name of your storage account:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`POST`|`https://myaccount.table.core.windows.net/Tables`|HTTP/1.1|  
  
### Emulated storage service request  

When you're making a request against the emulated storage service, specify the emulator hostname and Azure Table Storage port as `127.0.0.1:10002`, followed by the emulated storage account name:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`POST`|`http://127.0.0.1:10002/devstoreaccount1/Tables`|HTTP/1.1|  
  
The Table service in the storage emulator differs from the Table Storage service in several ways. For more information, see [Differences between the storage emulator and Azure Storage services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI parameters  

 None.  
  
### Request headers  

The required and optional request headers are described in the following table:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Type`|Required. Specifies the content type of the payload. Possible values are:<br /><br /> - `application/atom+xml` (versions earlier than 2015-12-11 only)<br />- `application/json`<br /><br /> For more information, see [Payload format for Table Storage operations](Payload-Format-for-Table-Service-Operations.md).|  
|`Accept`|Optional. Specifies the accepted content type of the response payload. Possible values are:<br /><br />- `application/atom+xml` (versions earlier than 2015-12-11 only)<br />- `application/json;odata=nometadata`<br />- `application/json;odata=minimalmetadata`<br />- `application/json;odata=fullmetadata`<br /><br /> For more information, see [Payload Format for Table Service Operations](Payload-Format-for-Table-Service-Operations.md).|  
|`Prefer`|Optional. Specifies whether the response should include the inserted entity in the payload. Possible values are `return-no-content` and `return-content`.<br /><br /> For more information about this header, see [Set the `Prefer` header to manage response echo on insert operations](Setting-the-Prefer-Header-to-Manage-Response-Echo-on-Insert-Operations.md).|  
|`Content-Length`|Required. The length of the request body.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Table Storage](/azure/storage/tables/monitor-table-storage).|  
  
### Request body  

The request body specifies the name of the table to be created. Table names must conform to the naming restrictions that are described in [Understand the Table Storage data model](Understanding-the-Table-Service-Data-Model.md).  
  
 The request body is an OData entity set, which can be expressed as JSON or as an Atom feed.  
  
> [!NOTE]
>  JSON is the recommended payload format, and it's the only format that's supported for version 2015-12-11 and later.  
  
 For guidance on valid table names, see the "Table Names" section in [Understand the Table Storage data model](Understanding-the-Table-Service-Data-Model.md#table-names).  
  
#### JSON (version 2013-08-15 and later)  

The request body as a JSON feed is in the following general format:  
  
```  
{   
    "TableName":"mytable"  
}  
```  
  
#### Atom feed (versions earlier than 2015-12-11)  

The request body as an Atom feed is in the following general format:  
  
```  
<?xml version="1.0" encoding="utf-8" standalone="yes"?>     
  <entry xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices"   
    xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata"  
    xmlns="https://www.w3.org/2005/Atom">   
    <title />   
    <updated>2009-03-18T11:48:34.9840639-07:00</updated>   
    <author>  
      <name/>   
    </author>   
      <id/>   
      <content type="application/xml">  
        <m:properties>  
          <d:TableName>mytable</d:TableName>  
        </m:properties>  
      </content>   
    </entry>  
```  
  
## Response  

The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status code  

The status code depends on the value of the `Prefer` header. If the `Prefer` header is set to `return-no-content`, a successful operation returns status code 204 (`No Content`). If the `Prefer` header isn't specified or if it's set to `return-content`, a successful operation returns status code 201 (`Created`). For more information, see [Set the `Prefer` header to manage response echo on insert operations](Setting-the-Prefer-Header-to-Manage-Response-Echo-on-Insert-Operations.md).  
  
 For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md) and [Table Storage error codes](Table-Service-Error-Codes.md).  
  
### Response headers  

The response for this operation includes the headers that are described in the following table. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|Uniquely identifies the request that was made, and you can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the Table Storage version that was used to execute the request. This header is returned for requests that are made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that's generated by the service, which indicates the time when the response was initiated.|  
|`Preference-Applied`|Indicates whether the `Prefer` request header was honored. If the response doesn't include this header, the `Prefer` header wasn't honored. If the header is returned, its value will be either `return-content` or `return-no-content`.<br /><br /> For more information, see [Set the `Prefer` header to manage response echo on insert operations](Setting-the-Prefer-Header-to-Manage-Response-Echo-on-Insert-Operations.md).|  
|`Content-Type`|Indicates the content type of the payload. The value depends on the value that's specified for the `Accept` request header. Possible values are:<br /><br /> - `application/atom+xml`<br />- `application/json;odata=nometadata`<br />- `application/json;odata=minimalmetadata`<br />- `application/json;odata=fullmetadata`<br /><br /> For more information about content types, see [Payload format for Table Storage operations](Payload-Format-for-Table-Service-Operations.md).|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value contains no more than 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present, it isn't present in the response.|  
  
### Response body  

If the request includes the `Prefer` header with the value `return-no-content`, no response body is returned. Otherwise, the response body is an OData entity set.  
  
> [!NOTE]
> We recommend JSON as the payload format. It's the only format that's supported for version 2015-12-11 and later.  
  
#### JSON (version 2013-08-15 and later)  

Here are the response payloads in JSON for various control levels.  
  
 **Full metadata**  
  
```  
{  
  
    "odata.metadata":"https://myaccount.table.core.windows.net/$metadata#Tables/@Element",  
  
    "odata.type":" myaccount.Tables",  
  
    "odata.id":"https://myaccount.table.core.windows.net/Tables('mytable')",  
  
    "odata.editLink":"Tables('mytable')",  
  
    "TableName":"mytable"  
  
}  
```  
  
 **Minimal metadata**  
  
```  
{  
  
    "odata.metadata":"https://myaccount.table.core.windows.net/$metadata#Tables/@Element",  
  
    "TableName":"mytable"  
  
}  
  
```  
  
 **No metadata**  
  
```  
{  
  
    "TableName":"mytable"  
  
}  
  
```  
  
#### Atom feed (versions earlier than 2015-12-11)  

Here's a sample Atom response for the `Create Table` operation.  
  
```  
<?xml version="1.0" encoding="utf-8" standalone="yes"?>  
<entry xml:base="https://myaccount.table.core.windows.net/" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns="https://www.w3.org/2005/Atom"> <id>https://myaccount.table.core.windows.net/Tables('mytable')</id>  
  <title type="text"></title>  
  <updated>2013-10-24T17:18:54.7062347Z</updated>  
  <author>  
    <name />  
  </author>  
  <link rel="edit" title="Tables" href="Tables('mytable')" />  
  <category term="myaccount.Tables" scheme="http://schemas.microsoft.com/ado/2007/08/dataservices/scheme" />  
  <content type="application/xml">  
    <m:properties>  
      <d:TableName>mytable</d:TableName>  
    </m:properties>  
  </content>  
</entry>  
```  
  
## Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
 None.  
  
## See also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Set the OData data service version headers](Setting-the-OData-Data-Service-Version-Headers.md)   
 [Status and error codes](Status-and-Error-Codes2.md)   
 [Table Storage error codes](Table-Service-Error-Codes.md)
