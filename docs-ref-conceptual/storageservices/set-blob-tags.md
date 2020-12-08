---
title: Set Blob Tags (REST API) - Azure Storage
description: The Set Blob Tags operation sets user-defined tags for the specified blob as one or more key-value pairs.  
author: rerdmann

ms.date: 07/06/2020
ms.service: storage
ms.topic: reference
ms.author: rerdmann
---

# Set Blob Tags
The `Set Blob Tags` operation sets user-defined tags for the specified blob as one or more key-value pairs.  
  
## Request  
 The `Set Blob Tags` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tags`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tags&versionid=<DateTime>`|HTTP/1.1|  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`versionid`|Optional for versions 2019-12-12 and newer. The versionid parameter is an opaque `DateTime` value that, when present, specifies the version of the blob to retrieve.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the request content in bytes. Note that this header refers to the content length of the tags document, not of the blob itself.|  
|`Content-Type`|Required. The value of this header should be application/xml; charset=UTF-8.|
|`Content-MD5`|Optional. An MD5 hash of the request content. This hash is used to verify the integrity of the request content during transport. If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> Note that this header is associated with the request content, and not with the content of the blob itself.|  
|`x-ms-content-crc64`|Optional. A CRC64 hash of the request content. This hash is used to verify the integrity of the request content during transport. If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> Note that this header is associated with the request content, and not with the content of the blob itself.<br /><br /> If both `Content-MD5` and `x-ms-content-crc64` headers are present, the request will fail with error code 400 (Bad Request).|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease.<br /><br /> To perform this operation on a blob with an active lease, specify the valid lease ID for this header. If a valid lease ID is not specified on the request, the operation will fail with status code 403 (Forbidden).| 
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
 This operation supports the `x-ms-if-tags` conditional header to set blob tags only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Body  
  
 The format of the request body is as follows:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<Tags>  
    <TagSet>  
        <Tag>  
            <Key>tag-name-1</Key>  
            <Value>tag-value-1</Value>  
        </Tag>  
        <Tag>  
            <Key>tag-name-2</Key>  
            <Value>tag-value-2</Value>  
        </Tag>  
    </TagSet>  
</Tags>  
```
  
 The request body must be a well-formed UTF-8 XML document, containing a tag set representing the tags for the blob.
  
 The tag set may contain at most 10 tags. Tag keys and values are case sensitive. Tag keys must be between 1 and 128 characters, and tag values must be between 0 and 256 characters. Valid tag key and value characters include:
  
- Lowercase and uppercase letters (a-z, A-Z)  
- Digits (0-9)  
- A space ( )  
- Plus (+), minus (-), period (.), solidus (/), colon (:), equals (=), and underscore (_)  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 204 (No Content).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Response Body  
 None.  
  
## Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to the blob's tags (the `t` SAS permission).  
  
 In addition, RBAC users with the `Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/write` permission can perform this operation.  
  
## Remarks  
 The `Set Blob Tags` operation is supported in REST API version 2019-12-12 and later.  
  
 The `Set Blob Tags` operation overwrites all existing tags on the blob.  To remove all tags from a blob, send a `Set Blob Tags` request with an empty `<TagSet>`.  
  
 This operation does not update the ETag or Last Modified Time of the blob. It is possible to set tags on an archived blob.  
  
 The storage service maintains strong consistency between a blob and its tags.  Changes to blob tags are immediately visible to subsequent `Get Blob Tags` operations on the blob.  The secondary index, however, is eventually consistent; changes to a blob's tags may not be immediately visible to `Find Blobs by Tags` operations.  
  
 If a request provides invalid tags, the Blob service returns status code 400 (Bad Request).  
  
## See Also  
 [Manage and find data on Azure Blob Storage with Blob Index](https://docs.microsoft.com/azure/storage/blobs/storage-manage-find-blobs)  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)  
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)  
