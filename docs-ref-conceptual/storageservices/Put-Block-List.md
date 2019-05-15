---
title: "Put Block List"
ms.custom: na
ms.date: 2016-12-13
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: c864893e-d758-475a-b419-af0c60dd2569
caps.latest.revision: 75
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
# Put Block List
The `Put Block List` operation writes a blob by specifying the list of block IDs that make up the blob. In order to be written as part of a blob, a block must have been successfully written to the server in a prior [Put Block](Put-Block.md) operation.  
  
 You can call `Put Block List` to update a blob by uploading only those blocks that have changed, then committing the new and existing blocks together. You can do this by specifying whether to commit a block from the committed block list or from the uncommitted block list, or to commit the most recently uploaded version of the block, whichever list it may belong to.  
  
## Request  
 The `Put Block List` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=blocklist`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=blocklist`|HTTP/1.1|  
  
 Note that the storage emulator only supports blob sizes up to 2 GB.  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the request content in bytes. Note that this header refers to the content length of the list of blocks, not of the blob itself.|  
|`Content-MD5`|Optional. An MD5 hash of the request content. This hash is used to verify the integrity of the request content during transport. If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> Note that this header is associated with the request content, and not with the content of the blob itself.|  
|`x-ms-blob-cache-control`|Optional. Sets the blob’s cache control. If specified, this property is stored with the blob and returned with a read request.<br /><br /> If this property is not specified with the request, then it is cleared for the blob if the request is successful.|  
|`x-ms-blob-content-type`|Optional. Sets the blob’s content type. If specified, this property is stored with the blob and returned with a read request.<br /><br /> If the content type is not specified, then it is set to the default type, which is `application/octet-stream`.|  
|`x-ms-blob-content-encoding`|Optional.  Sets the blob’s content encoding. If specified, this property is stored with the blob and returned with a read request.<br /><br /> If this property is not specified with the request, then it is cleared for the blob if the request is successful.|  
|`x-ms-blob-content-language`|Optional.  Set the blob’s content language. If specified, this property is stored with the blob and returned with a read request.<br /><br /> this property is not specified with the request, then it is cleared for the blob if the request is successful.|  
|`x-ms-blob-content-md5`|Optional. An MD5 hash of the blob content. Note that this hash is not validated, as the hashes for the individual blocks were validated when each was uploaded.<br /><br /> The [Get Blob](Get-Blob.md) operation returns the value of this header in the Content-MD5 response header.<br /><br /> If this property is not specified with the request, then it is cleared for the blob if the request is successful.|  
|`x-ms-meta-name:value`|Optional. User-defined name-value pairs associated with the blob.<br /><br /> Note that beginning with version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference).|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-blob-content-disposition`|Optional. Sets the blob’s `Content-Disposition` header. Available for versions 2013-08-15 and later.<br /><br /> The `Content-Disposition` header field conveys additional information about how to process the response payload, and also can be used to attach additional metadata. For example, if set to `attachment`, it indicates that the user-agent should not display the response, but instead show a Save As dialog.<br /><br /> The response from the [Get Blob](Get-Blob.md) and [Get Blob Properties](Get-Blob-Properties.md) operations includes the content-disposition header.|  
  
 This operation also supports the use of conditional headers to commit the block list only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Body  
 In the request body, you can specify which block list the Blob service should check for the requested block. In this way you can update an existing blob by inserting, replacing, or deleting individual blocks, rather than re-uploading the entire blob. Once you've uploaded the block or blocks that have changed, you can commit a new version of the blob by committing the new blocks together with the existing blocks that you wish to keep.  
  
 To update a blob, you can specify that the service should look for a block ID in the committed block list, in the uncommitted block list, or in the uncommitted block list first and then in the committed block list. To indicate which approach to use, specify the block ID within the appropriate XML element within the request body, as follows:  
  
-   Specify the block ID within the `Committed` element to indicate that the Blob service should search only the committed block list for the named block. If the block is not found in the committed block list, it will not be written as part of the blob, and the Blob service will return status code 400 (Bad Request).  
  
-   Specify the block ID within the `Uncommitted` element to indicate that the Blob service should search only the uncommitted block list for the named block. If the block is not found in the uncommitted block list, it will not be written as part of the blob, and the Blob service will return status code 400 (Bad Request).  
  
-   Specify the block ID within the `Latest` element to indicate that the Blob service should first search the uncommitted block list. If the block is found in the uncommitted list, that version of the block is the latest and should be written to the blob. If the block is not found in the uncommitted list, then the service should search the committed block list for the named block and write that block to the blob if it is found.  
  
 The request body for this version of `Put Block List` uses following XML format:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<BlockList>  
  <Committed>first-base64-encoded-block-id</Committed>  
  <Uncommitted>second-base64-encoded-block-id</Uncommitted>  
  <Latest>third-base64-encoded-block-id</Latest>  
  ...  
</BlockList>  
  
```  
  
### Sample Request  
 To demonstrate `Put Block List`, assume you have uploaded three blocks that you now wish to commit. The following example commits a new blob by indicating that the latest version of each block listed should be used. It's not necessary to know whether these blocks have already been committed.  
  
```  
  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=blocklist HTTP/1.1  
  
Request Headers:  
x-ms-date: Wed, 31 Aug 2011 00:17:43 GMT  
x-ms-version: 2011-08-18  
Content-Type: text/plain; charset=UTF-8  
Authorization: SharedKey myaccount:DJ5QZSVONZ64vAhnN/wxcU+Pt5HQSLAiLITlAU76Lx8=  
Content-Length: 133  
  
Request Body:  
<?xml version="1.0" encoding="utf-8"?>  
<BlockList>  
  <Latest>AAAAAA==</Latest>  
  <Latest>AQAAAA==</Latest>  
  <Latest>AZAAAA==</Latest>  
</BlockList>  
  
```  
  
 Next, assume that you wish to update the blob. The new blob will have the following changes:  
  
-   A new block with ID `ANAAAA==`. This block must first be uploaded with a call to [Put Block](Put-Block.md) and will appear in the uncommitted block list until the call to `Put Block List`.  
  
-   An updated version of the block with ID `AZAAAA==`. This block must first be uploaded with a call to [Put Block](Put-Block.md) and will appear in the uncommitted block list until the call to `Put Block List`.  
  
-   Removal of the block with the ID `AAAAAA==`. Given that this block is not included in the next call to `Put Block List`, the block will effectively be removed from the blob.  
  
 The following example shows the call to `Put Block List` that updates the blob:  
  
```  
  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=blocklist HTTP/1.1  
  
Request Headers:  
x-ms-date: Wed, 31 Aug 2009 00:17:43 GMT  
x-ms-version: 2011-08-18  
Content-Type: text/plain; charset=UTF-8  
Authorization: SharedKey myaccount:DJ5QZSVONZ64vAhnN/wxcU+Pt5HQSLAiLITlAU76Lx8=  
Content-Length: 133  
  
Request Body:  
<?xml version="1.0" encoding="utf-8"?>  
<BlockList>  
  <Uncommitted>ANAAAA==</Uncommitted>  
  <Committed>AQAAAA==</Committed>  
  <Uncommitted>AZAAAA==</Uncommitted>  
</BlockList>  
  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response|Descriptions|  
|--------------|------------------|  
|`ETag`|The entity tag contains a value that the client can use to perform conditional `GET/PUT` operations by using the `If-Match` request header. If the request version is 2011-08-18 or newer, the ETag value will be in quotes.|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the blob, including an update of the blob's metadata or properties, changes the last modified time of the blob.|  
|`Content-MD5`|This header is returned so that the client can check for message content integrity. This header refers to the content of the request, meaning, in this case, the list of blocks, and not the content of the blob itself.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
Content-MD5: oafL1+HS78x65+e39PGIIg==  
Date: Sun, 25 Sep 2011 00:17:44 GMT  
ETag: “0x8CB172A360EC34B”  
Last-Modified: Sun, 25 Sep 2011 00:17:43 GMT  
x-ms-version: 2011-08-18  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  
  
## Remarks  
 The `Put Block List` operation enforces the order in which blocks are to be combined to create a blob.  
  
 The same block ID can be specified more than one time in the list of blocks. If a block ID is specified more than one time, it will represent the range of bytes in each of those locations in the block list for the final committed blob. If a block ID appears more than once in the list, both instances of the block ID must be specified within the same block list. In other words, both instances must be specified within the `Committed` element, the `Uncommitted` element, or the `Latest` element.  
  
 With `Put Block List`, you can modify an existing blob by inserting, updating, or deleting individual blocks, without uploading the whole blob again. You can specify block IDs from both the current committed block list and the uncommitted block list to create a new blob or update the content of an existing blob. In this way you can update a blob by specifying a few new blocks from the uncommitted block list, and the rest from the committed block list, which are already part of the existing blob.  
  
 If a block ID is specified in the `Latest` element, and the same block ID exists in both the committed and uncommitted block lists, `Put Block List` commits the block from the uncommitted block list. If the block ID exists in the committed block list but not in the uncommitted block list, then `Put Block List` commits the block from the committed block list.  
  
 Each block can be a different size, up to a maximum of 100 MB for version 2016-05-31 and later, and 4 MB for older versions. The maximum size of a block blob is therefore slightly more than 4.75 TB (100 MB X 50,000 blocks) for version 2016-05-31 and later, and 195 GB (4 MB X 50,000 blocks) for all older versions. If you attempt to commit more than 50,000 blocks, the service returns status code 409 (Block List Too Long). The service also returns additional information about the error in the response, including the maximum number of blocks permitted.  
  
 The maximum number of uncommitted blocks that may be associated with a blob is 100,000, and the maximum size of the uncommitted block list is about 9.5 TB for version 2016-05-31 and later, and 400 GB for older versions.  
  
 When you call `Put Block List` to update an existing blob, the blob's existing properties and metadata are overwritten. However, any existing snapshots are retained with the blob. You can use the conditional request headers to perform the operation only if a specified condition is met.  
  
 If the `Put Block List` operation fails due to a missing block, you will need to upload the missing block.  
  
 Any uncommitted blocks will be garbage collected if there are no successful calls to `Put Block` or `Put Block List` on the blob within a week following the last successful `Put Block` operation. If [Put Blob](Put-Blob.md) is called on the blob, any uncommitted blocks will be garbage collected.  
  
 If the blob has an active lease, the client must specify a valid lease ID on the request in order to commit the block list. If the client does not specify a lease ID, or specifies an invalid lease ID, the Blob service returns status code 412 (Precondition Failed). If the client specifies a lease ID but the blob does not have an active lease, the Blob service also returns status code 412 (Precondition Failed). If the client specifies a lease ID on a blob that does not yet exist, the Blob service will return status code 412 (Precondition Failed) for requests made against version 2013-08-15 and later; for prior versions the Blob service will return status code 201 (Created).  
  
 If the blob has an active lease and you call `Put Block List` to update the blob, the lease is maintained on the updated blob.  
  
 `Put Block List` applies only to block blobs. Calling `Put Block List` on a page blob results in status code 400 (Bad Request).  
  
 Calling `Put Block List` on an archived blob will return an error and on `Hot`/`Cool` blob does not change the blob tier.
## See Also  
 [Understanding Block Blobs, Append Blobs, and Page Blobs](Understanding-Block-Blobs--Append-Blobs--and-Page-Blobs.md)   
 [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
