---
title: Copy Blob From URL (REST API) - Azure Storage
description: The Copy Blob From URL operation copies a blob to a destination within the storage account synchronously for source blob sizes up to 256 MiB. This API is available starting in version 2018-03-28. 
author: pemari-msft

ms.date: 03/21/2022
ms.author: pemari
ms.service: storage
ms.topic: reference
---

# Copy Blob From URL

The `Copy Blob From URL` operation copies a blob to a destination within the storage account synchronously for source blob sizes up to 256 mebibytes (MiB). This API is available starting in version 2018-03-28.  

The source for a `Copy Blob From URL` operation can be any committed block blob in any Azure storage account that's either public or authorized with a shared access signature.

## Request  
You can construct the `Copy Blob From URL` request as follows. We recommend HTTPS. Replace *myaccount* with the name of your storage account, *mycontainer* with the name of your container, and *myblob* with the name of your destination blob.  
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob`|HTTP/1.1|  
  
### URI for the emulated storage service  
When you're making a request against the emulated storage service, specify the emulator host name and Azure Blob Storage port as `127.0.0.1:10000`, followed by the name of the emulated storage account:  
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob`|HTTP/1.1|  
  
For more information, see [Use the Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters

You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  
The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. Specifies a user-defined name/value pair associated with the blob. If no name/value pairs are specified, the operation will copy the metadata from the source blob or file to the destination blob. If one or more name/value pairs are specified, the destination blob is created with the specified metadata, and metadata is not copied from the source blob or file.<br /><br /> Beginning with version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference). For more information, see [Naming and referencing containers, blobs, and metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md).|
|`x-ms-encryption-scope`|Optional. Indicates the encryption scope for encrypting the request contents. This header is supported in version 2020-12-06 and later.|
|`x-ms-tags`|Optional. Sets query-string-encoded tags on the blob. Tags are not copied from the copy source. For more information, see [Remarks](#remarks). Supported in version 2019-12-12 and later.|  
|`x-ms-copy-source-tag-option`|Optional. Possible values are `REPLACE` and `COPY` (case-sensitive). The default value is `REPLACE`.<br/><br/>If `COPY` is specified, the tags from the source blob will be copied to the destination blob. The source blob must be private, and the request must have permission to the [Get Blob Tags](get-blob-tags.md) operation on the source blob and the [Set Blob Tags](set-blob-tags.md) operation on the destination blob. This incurs an extra call to the `Get Blob Tags` operation on the source account.<br/><br/>`REPLACE` will set tags that the `x-ms-tags` header specifies on the destination blob. If `x-ms-tags` specifies `REPLACE` and no tags, then no tags will be set on the destination blob. Specifying `COPY` and `x-ms-tags` will result in a 409 (Conflict) error.<br/><br/>Supported in version 2021-04-10 and later. |
|`x-ms-source-if-modified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has been modified since the specified date/time. If the source blob has not been modified, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-unmodified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has not been modified since the specified date/time. If the source blob has been modified, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-match`|Optional. An `ETag` value. Specify this conditional header to copy the source blob only if its `ETag` value matches the specified value. If the values don't match, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-none-match`|Optional. An `ETag` value. Specify this conditional header to copy the blob only if its `ETag` value doesn't match the specified value. If the values are identical, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`If-Modified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has been modified since the specified date/time. If the destination blob has not been modified, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-Unmodified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has not been modified since the specified date/time. If the destination blob has been modified, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-Match`|Optional. An `ETag` value. Specify an `ETag` value for this conditional header to copy the blob only if the specified `ETag` value matches the `ETag` value for an existing destination blob. If the values don't match, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-None-Match`|Optional. An `ETag` value, or the wildcard character (*).<br /><br /> Specify an `ETag` value for this conditional header to copy the blob only if the specified `ETag` value doesn't match the `ETag` value for the destination blob.<br /><br /> Specify the wildcard character (\*) to perform the operation only if the destination blob doesn't exist.<br /><br /> If the specified condition isn't met, Blob Storage returns status code 412 (Precondition Failed).|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source blob. The value can be a URL of up to 2 kibibytes (KiB) in length that specifies a blob. The value should be URL-encoded as it would appear in a request URI. The source blob must either be public or be authorized via a shared access signature. If the source blob is public, no authorization is required to perform the operation. If the size of the source blob is greater than 256 MiB, the request fails with a 409 (Conflict) error. The blob type of the source blob has to be block blob. Here are some examples of source object URLs:<br /><br /> -   `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`|  
|`x-ms-copy-source-authorization: <scheme> <signature>`|Optional. Specifies the authorization scheme and signature for the copy source. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).<br /> Only the scheme bearer is supported for Azure Active Directory.<br />This header is supported in version 2020-10-02 and later.|
|`x-ms-requires-sync:true`|Required. Indicates that this is a synchronous `Copy Blob From URL` operation instead of an asynchronous `Copy Blob` operation.|
|`x-ms-source-content-md5`|Optional. Specifies an MD5 hash of the blob content from the URI. This hash is used to verify the integrity of the blob during transport of the data from the URI. When this header is specified, the storage service compares the hash of the content that has arrived from the copy source with this header value.<br /><br /> The MD5 hash is not stored with the blob.<br /><br /> If the two hashes don't match, the operation fails with error code 400 (Bad Request).|  
|`x-ms-lease-id:<ID>`|Required if the destination blob has an active lease. The lease ID specified for this header must match the lease ID of the destination blob. If the request doesn't include the lease ID or it isn't valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination blob doesn't currently have an active lease, the operation fails with status code 412 (Precondition Failed).<br /><br /> In version 2012-02-12 and later, this value must specify an active, infinite lease for a leased blob. A finite-duration lease ID fails with status code 412 (Precondition Failed).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-KiB character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Using logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).
  
### Request body  
None.  
  
## Response  
The response includes an HTTP status code and a set of response headers.  
  
### Status code  
A successful operation returns status code 202 (Accepted).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  
The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|If the copy is complete, contains the `ETag` value of the destination blob. If the copy isn't complete, contains the `ETag` value of the empty blob created at the start of the copy.<br /><br /> The `ETag` value is in quotation marks.|  
|`Last-Modified`|Returns the date/time that the copy operation to the destination blob finished.|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage that's used to execute the request.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`x-ms-copy-id: <id>`|String identifier for this copy operation.|  
|`x-ms-copy-status: <success>`| Indicates the state of the copy operation. A value of `success`  means that the operation finished successfully.
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|
|`x-ms-request-server-encrypted: true/false`|Set to `true` if the contents of the request are successfully encrypted through the specified algorithm. Otherwise, the value is `false`.|
|`x-ms-encryption-scope`|Returned if the request used an encryption scope, so the client can ensure that the contents of the request are successfully encrypted through the encryption scope.|
  
## Response body  
 None.  
  
## Sample response  
The following is a sample response for a request to copy a blob:  
  
```  
Response Status:  
HTTP/1.1 202 Accepted  
  
Response Headers:   
Last-Modified: <date>   
ETag: "0x8CEB669D794AFE2"  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402  
x-ms-version: 2018-03-28  
x-ms-copy-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
x-ms-copy-status: success  
Date: <date>  
  
``` 
  
## Authorization  
This operation can be called by the account owner and by anyone with a shared access signature who has permission to write to this blob or its container.  

Access to the source blob or file is authorized separately, as described in the details for the request header `x-ms-copy-source`. 
  
If a request specifies tags with the `x-ms-tags` request header, the caller must meet the authorization requirements of the [Set Blob Tags](Set-Blob-Tags.md) operation.  
  
## Remarks
The source and destination blob for a `Copy Blob From URL` operation must be a block blob.  

In version 2020-10-02 and later, Azure Active Directory authorization is supported for the source of the copy operation.
  
The `Copy Blob From URL` operation always copies the entire source blob. Copying a range of bytes or set of blocks is not supported.  
  
You can copy a source blob to a destination blob that has a different name. The destination blob can be an existing block blob, or it can be a new blob that the copy operation creates.     
  
When you're copying from a block blob, all committed blocks and their block IDs are copied. Uncommitted blocks are not copied. At the end of the copy operation, the destination blob will have the same committed block count as the source.   
  
The `ETag` value for a block blob changes when the `Copy Blob From URL` operation starts and when the operation finishes.
  
### Copying blob properties and metadata  
  
When a block blob is copied, the following system properties are copied to the destination blob with the same values:  
  
- `Content-Type`  
  
- `Content-Encoding`  
  
- `Content-Language`  
  
- `Content-Length`  
  
- `Cache-Control`  
  
- `Content-MD5`  
  
- `Content-Disposition`  
  
The source blob's committed block list is also copied to the destination blob. Any uncommitted blocks are not copied.  
  
The destination blob is always the same size as the source blob, so the value of the `Content-Length` header for the destination blob matches the value of that header for the source blob.  
  
If the `x-ms-tags` header provides tags for the destination blob, they must be query-string encoded. Tag keys and values must conform to the naming and length requirements specified in the [Set Blob Tags](Set-Blob-Tags.md) operation. 

The `x-ms-tags` header can contain up to 2 kilobits of tags. If you need more tags, use the `Set Blob Tags` operation.  
  
If the `x-ms-tags` header doesn't provide tags, then tags aren't copied from the source blob.  
  
### Copying a leased blob  
  
The `Copy Blob From URL` operation only reads from the source blob, so the lease state of the source blob doesn't matter.
  
### Billing  
  
The destination account of a `Copy Blob From URL` operation is charged for one transaction to start the operation. The destination account also incurs one transaction for each request to the source of the copy operation.  
  
The source account also incurs transaction costs. In addition, if the source and destination accounts reside in different regions (for example, US North and US South), bandwidth that you use to transfer the request is charged to the source storage account as egress. Egress between accounts within the same region is free.  
  
When you copy a source blob to a destination blob that has a different name within the same account, you use additional storage resources for the new blob. The copy operation then results in a charge against the storage account's capacity usage for those additional resources.  
  
## See also  
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Understanding how snapshots accrue charges](Understanding-How-Snapshots-Accrue-Charges.md)   
