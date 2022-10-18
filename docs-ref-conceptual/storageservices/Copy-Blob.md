---
title: Copy Blob (REST API) - Azure Storage
description: The Copy Blob operation copies a blob to a destination within the storage account.
author: pemari-msft

ms.date: 04/15/2022
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Copy Blob

The `Copy Blob` operation copies a blob to a destination within the storage account.

In version 2012-02-12 and later, the source for a `Copy Blob` operation can be a committed blob in any Azure storage account.

Beginning with version 2015-02-21, the source for a `Copy Blob` operation can be an Azure file in any Azure storage account.
  
> [!NOTE]
>  Only storage accounts created on or after June 7, 2012, allow the `Copy Blob` operation to copy from another storage account.  
  
## Request  
You can construct the `Copy Blob` request as follows. We recommend HTTPS. Replace *myaccount* with the name of your storage account, *mycontainer* with the name of your container, and *myblob* with the name of your destination blob.  
  
Beginning with version 2013-08-15, you can specify a shared access signature (SAS) for the destination blob if it's in the same account as the source blob. Beginning with version 2015-04-05, you can also specify a shared access signature for the destination blob if it's in a different storage account.  
  
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
|`x-ms-meta-name:value`|Optional. Specifies a user-defined name/value pair associated with the blob. If no name/value pairs are specified, the operation copies the metadata from the source blob or file to the destination blob. If one or more name/value pairs are specified, the destination blob is created with the specified metadata, and metadata is not copied from the source blob or file.<br /><br /> Beginning with version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference). For more information, see [Naming and referencing containers, blobs, and metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md).|  
|`x-ms-tags`|Optional. Sets the given query-string-encoded tags on the blob. Tags are not copied from the copy source. For more information, see [Remarks](#remarks). Supported in version 2019-12-12 and later.|  
|`x-ms-source-if-modified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has been modified since the specified date/time. If the source blob has not been modified, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-unmodified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has not been modified since the specified date/time. If the source blob has been modified, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-match`|Optional. An `ETag` value. Specify this conditional header to copy the source blob only if its `ETag` value matches the specified value. If the values don't match, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`x-ms-source-if-none-match`|Optional. An `ETag` value. Specify this conditional header to copy the blob only if its `ETag` value doesn't match the specified value. If the values are identical, Blob Storage returns status code 412 (Precondition Failed). You can't specify this header if the source is an Azure file.|  
|`If-Modified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has been modified since the specified date/time. If the destination blob has not been modified, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-Unmodified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has not been modified since the specified date/time. If the destination blob has been modified, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-Match`|Optional. An `ETag` value. Specify an `ETag` value for this conditional header to copy the blob only if the specified `ETag` value matches the `ETag` value for an existing destination blob. If the values don't match, Blob Storage returns status code 412 (Precondition Failed).|  
|`If-None-Match`|Optional. An `ETag` value, or the wildcard character (*).<br /><br /> Specify an `ETag` value for this conditional header to copy the blob only if the specified `ETag` value doesn't match the `ETag` value for the destination blob.<br /><br /> Specify the wildcard character (\*) to perform the operation only if the destination blob doesn't exist.<br /><br /> If the specified condition isn't met, Blob Storage returns status code 412 (Precondition Failed).|  
|`x-ms-copy-source:name`|Required. Specifies the name of the source blob or file.<br /><br /> Beginning with version 2012-02-12, this value can be a URL of up to 2 kibibytes (KiB) in length that specifies a blob. The value should be URL encoded as it would appear in a request URI. <br /><br /> The read operation on a source blob in the same storage account can be authorized via shared key. Beginning with version 2017-11-09, you can also use Azure Active Directory (Azure AD) to authorize the read operation on the source blob. However, if the source is a blob in another storage account, the source blob must be public, or access to it must be authorized via a shared access signature. If the source blob is public, no authorization is required to perform the copy operation.<br /><br /> Beginning with version 2015-02-21, the source object can be a file in Azure Files. If the source object is a file that will be copied to a blob, then the source file must be authorized through a shared access signature, whether it resides in the same account or in a different account.<br /><br /> Only storage accounts created on or after June 7, 2012, allow the `Copy Blob` operation to copy from another storage account.<br /><br /> Here are some examples of source object URLs:<br /><br /> -   `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`<br /><br /> When the source object is a file in Azure Files, the source URL uses the following format. Note that the URL must include a valid SAS token for the file.<br /><br /> -   `https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?sastoken`<br /><br /> In versions before 2012-02-12, blobs can be copied only within the same account, and a source name can use these formats:<br /><br /> -   Blob in named container: `/accountName/containerName/blobName`<br />-   Snapshot in named container: `/accountName/containerName/blobName?snapshot=<DateTime>`<br />-   Blob in root container: `/accountName/blobName`<br />-   Snapshot in root container: `/accountName/blobName?snapshot=<DateTime>`|
|`x-ms-lease-id:<ID>`|Required if the destination blob has an active lease. The lease ID specified for this header must match the lease ID of the destination blob. If the request doesn't include the lease ID or the ID isn't valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination blob doesn't currently have an active lease, the operation fails with status code 412 (Precondition Failed).<br /><br /> In version 2012-02-12 and later, this value must specify an active infinite lease for a leased blob. A finite-duration lease ID fails with status code 412 (Precondition Failed).|  
|`x-ms-source-lease-id: <ID>`|Optional for versions before 2012-02-12 (unsupported in 2012-02-12 and later). Specify this header to perform the `Copy Blob` operation only if the provided lease ID matches the active lease ID of the source blob.<br /><br /> If this header is specified and the source blob doesn't currently have an active lease, the operation fails with status code 412 (Precondition Failed).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-KiB character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Using logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-access-tier`|Optional. Specifies the tier to be set on the target blob. This header is for page blobs on a premium account only with version 2017-04-17 and later. For a full list of supported tiers, see [High-performance premium storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). This header is supported on version 2018-11-09 and later for block blobs. Block blob tiering is supported on Blob Storage or General Purpose v2 accounts. Valid values are `Hot`, `Cool`,  and `Archive`. For detailed information about block blob tiering, see [Hot, cool, and archive storage tiers](/azure/storage/storage-blob-storage-tiers).|
|`x-ms-rehydrate-priority`|Optional. Indicates the priority with which to rehydrate an archived blob. This header is supported on version 2019-02-02 and later for block blobs. Valid values are `High` and `Standard`. You can set the priority on a blob only once. This header will be ignored on subsequent requests to the same blob. Default priority without this header is `Standard`.|  
|`x-ms-seal-blob`|Optional. Supported on version 2019-12-12 or later. This header is valid for append blobs only. It seals the destination blob after the copy operation is finished.|
|`x-ms-immutability-policy-until-date`|Version 2020-06-12 and later. Specifies the retention-until date to be set on the blob. This is the date until which the blob can be protected from modification or deletion. It follows RFC1123 format.|  
|`x-ms-immutability-policy-mode`|Version 2020-06-12 and later. Specifies the immutability policy mode to be set on the blob. Valid values are `unlocked` and `locked`. An `unlocked` value indicates that the user can change the policy by increasing or decreasing the retention-until date. A `locked` value indicates that these actions are prohibited.|  
|`x-ms-legal-hold`|Version 2020-06-12 and later. Specifies the legal hold to be set on the blob. Valid values are `true` and `false`.|  

This operation supports the `x-ms-if-tags` and `x-ms-source-if-tags` conditional headers to succeed only if the specified condition is met. For more information, see [Specify conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md). 

### Request body  
None.  
  
## Response  
The response includes an HTTP status code and a set of response headers.  
  
### Status code  
In version 2012-02-12 and later, a successful operation returns status code 202 (Accepted).  
  
In versions before 2012-02-12, a successful operation returns status code 201 (Created).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  
The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|In version 2012-02-12 and later, if the copy is complete, this header contains the `ETag` value of the destination blob. If the copy isn't complete, the header contains the `ETag` value of the empty blob created at the start of the copy operation.<br /><br /> In versions before 2012-02-12, this header returns the `ETag` value for the destination blob.<br /><br /> In version 2011-08-18 and later, the `ETag` value is in quotation marks.|  
|`Last-Modified`|Returns the date/time that the copy operation to the destination blob finished.|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use this header to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage that's used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`x-ms-copy-id: <id>`|Version 2012-02-12 and later. Provides a string identifier for this copy operation. Use with `Get Blob` or `Get Blob Properties` to check the status of this copy operation, or pass to `Abort Copy Blob` to cancel a pending copy operation.|  
|`x-ms-copy-status: <success &#124; pending>`|Version 2012-02-12 and later. Indicates the state of the copy operation, with these values:<br /><br /> -   `success`: The operation finished successfully.<br />-   `pending`: The operation is in progress.|  
|`x-ms-version-id: <DateTime>`|Version 2019-12-12 and later. Uniquely identifies the blob by its version. You can use this opaque value in subsequent requests to access this version of the blob.|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|  
  
## Response body  
None.  
  
## Sample response  
The following code is a sample response for a request to copy a blob:  
  
```  
Response Status:  
HTTP/1.1 202 Accepted  
  
Response Headers:   
Last-Modified: <date>   
ETag: "0x8CEB669D794AFE2"  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402  
x-ms-version: 2015-02-21  
x-ms-copy-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
x-ms-copy-status: pending
x-ms-version-id: <DateTime>  
Date: <date>  
  
```  
  
## Authorization  
The account owner can call this operation. For requests made against version 2013-08-15 and later, a shared access signature that has permission to write to the destination blob or its container is supported for copy operations within the same account. Note that the shared access signature specified on the request applies only to the destination blob.  
  
Access to the source blob or file is authorized separately, as described in the details for the request header `x-ms-copy-source`.  
  
The following table describes how the destination and source objects for a `Copy Blob` operation can be authorized:  
  
|Blob|Authorization with Shared Key or Shared Key Lite|Authorization with shared access signature|Public object not requiring authorization|  
|-|-----------------------------------------------------|-------------------------------------------------|------------------------------------------------|  
|Destination blob|Yes|Yes|No|  
|Source blob in same account|Yes|Yes|Yes|  
|Source blob in another account|No|Yes|Yes|  
|Source file in the same account or another account|No|Yes|Not applicable|  
  
If a request specifies tags in the `x-ms-tags` request header, the caller must meet the authorization requirements of the [Set Blob Tags](Set-Blob-Tags.md) operation.  
  
## Remarks  
In version 2012-02-12 and later, the `Copy Blob` operation can finish asynchronously. This operation returns a copy ID that you can use to check or cancel the copy operation. Blob Storage copies blobs on a best-effort basis.  
  
The source blob for a copy operation can be a block blob, an append blob, a page blob, or a snapshot. If the destination blob already exists, it must be of the same blob type as the source blob. Any existing destination blob will be overwritten. You can't modify the destination blob while a copy operation is in progress.  
  
In version 2015-02-21 and later, the source for the copy operation can also be a file in Azure Files. If the source is a file, the destination must be a block blob.  
  
Multiple pending `Copy Blob` operations within an account might be processed sequentially. A destination blob can have only one outstanding `Copy Blob` operation. In other words, a blob can't be the destination for multiple pending `Copy Blob` operations. An attempt to copy a blob to a destination blob that already has a copy operation pending fails with status code 409 (Conflict).  
  
Only storage accounts created on or after June 7, 2012, allow the `Copy Blob` operation to copy from another storage account. An attempt to copy from another storage account to an account created before June 7, 2012, fails with status code 400 (Bad Request).  
  
The `Copy Blob` operation always copies the entire source blob or file. Copying a range of bytes or set of blocks is not supported.  
  
A `Copy Blob` operation can take any of the following forms:  
  
- You can copy a source blob to a destination blob that has a different name. The destination blob can be an existing blob of the same blob type (block, append, or page), or it can be a new blob that the copy operation creates.  
  
- You can copy a source blob to a destination blob that has the same name, effectively replacing the destination blob. Such a copy operation removes any uncommitted blocks and overwrites the blob's metadata.  
  
- You can copy a source file in Azure Files to a destination blob. The destination blob can be an existing block blob, or it can be a new block blob that the copy operation creates. Copying from files to page blobs or append blobs is not supported.  
  
- You can copy a snapshot over its base blob. By promoting a snapshot to the position of the base blob, you can restore an earlier version of a blob.  
  
- You can copy a snapshot to a destination blob that has a different name. The resulting destination blob is a writeable blob and not a snapshot.  
  
When you're copying from a page blob, Blob Storage creates a destination page blob of the source blob's length. Initially, the page blob contains all zeroes. Then the source page ranges are enumerated, and non-empty ranges are copied.  
  
For a block blob or an append blob, Blob Storage creates a committed blob of zero length before returning from this operation.  
  
When you're copying from a block blob, all committed blocks and their block IDs are copied. Uncommitted blocks are not copied. At the end of the copy operation, the destination blob has the same committed block count as the source.  
  
When you're copying from an append blob, all committed blocks are copied. At the end of the copy operation, the destination blob will have fewer than or the same number of committed blocks as the source blob.  
  
For all blob types, you can call `Get Blob` or `Get Blob Properties` on the destination blob to check the status of the copy operation. The final blob will be committed when the copy operation finishes.  
  
When the source of a copy operation provides `ETag` values, any changes to the source while the copy operation is in progress will cause that operation to fail. An attempt to change the destination blob while a copy is in progress will fail with status code 409 (Conflict). If the destination blob has an infinite lease, the lease ID must be passed to `Copy Blob`. Finite-duration leases are not allowed.  
  
The `ETag` value for a block blob changes when the `Copy Blob` operation starts and when the operation finishes. The `ETag` value for a page blob changes when the `Copy Blob` operation starts, and it continues to change frequently during the copy operation. The contents of a block blob are visible through a `Get` command only after the full copy operation finishes.  
  
### Copying blob properties, tags, and metadata  
  
When a blob is copied, the following system properties are copied to the destination blob that has the same values:  
  
- `Content-Type`  
 
- `Content-Encoding`  
  
- `Content-Language`  
  
- `Content-Length`  
  
- `Cache-Control`  
  
- `Content-MD5`  
  
- `Content-Disposition`  
  
- `x-ms-blob-sequence-number` (for page blobs only)  
  
- `x-ms-committed-block-count` (for append blobs only, and for version 2015-02-21 only)  
  
The source blob's committed blocklist is also copied to the destination blob, if the blob is a block blob. Any uncommitted blocks are not copied.  
  
The destination blob is always the same size as the source blob. The value of the `Content-Length` header for the destination blob matches the value of that header for the source blob.  
  
When the source blob and destination blob are the same, `Copy Blob` removes any uncommitted blocks. If metadata is specified in this case, the existing metadata is overwritten with the new metadata.  
  
If the `x-ms-tags` header provides tags for the destination blob, they must be query-string encoded. Tag keys and values must conform to the naming and length requirements, as specified in [Set Blob Tags](Set-Blob-Tags.md). 

The `x-ms-tags` header can contain up to 2 kilobits of tags. If you need more tags, use the `Set Blob Tags` operation.  
  
If the `x-ms-tags` header doesn't provide tags, then tags aren't copied from the source blob.

### Copying a leased blob  
  
The `Copy Blob` operation only reads from the source blob, so the lease state of the source blob doesn't matter. However, the `Copy Blob` operation saves the `ETag` value of the source blob when the copy operation starts. If the `ETag` value changes before the copy operation finishes, the operation fails. You can prevent changes to the source blob by leasing it during the copy operation.  
  
If the destination blob has an active infinite lease, you must specify its lease ID in the call to the `Copy Blob` operation. If the lease that you specify is an active finite-duration lease, this call fails with a status code 412 (Precondition Failed). While the copy operation is pending, any lease operation on the destination blob fails with status code 409 (Conflict). An infinite lease on the destination blob is locked in this way during the copy operation whether you're copying to a destination blob that has a different name from the source, copying to a destination blob that has the same name as the source, or promoting a snapshot over its base blob. 

If the client specifies a lease ID on a blob that doesn't yet exist, Blob Storage returns status code 412 (Precondition Failed) for requests made against version 2013-08-15 and later. For earlier versions, Blob Storage returns status code 201 (Created).  
  
### Copying blob snapshots  
  
When a source blob is copied, any snapshots or versions of the source blob are not copied to the destination. When a destination blob is overwritten with a copy, any snapshots or versions associated with the destination blob stay intact under its name.  
  
You can perform a copy operation to promote a snapshot over its base blob, as long as it's in an online tier (hot or cool). In this way, you can restore an earlier version of a blob. The snapshot remains, but its destination is overwritten with a copy that can be both read and written.  
  
### Copying blob versions    
  
You can perform a copy operation to promote a version over its base blob, as long as it's in an online tier (hot or cool). In this way, you can restore an earlier version of a blob. The version remains, but its destination is overwritten with a copy that can be both read and written.  

### Copying an archived blob

Beginning with version 2018-11-09, you can copy an archived blob to a new blob within the same storage account. The source blob remains in the archive tier. When the source blob is an archived blob, the request must contain the `x-ms-access-tier` header, which indicates the tier of the destination blob. The destination blob must be in an online tier. You can't copy to a blob in the archive tier.

Beginning with version 2021-02-12, you can copy an archived blob to an online tier in a different storage account, as long as the destination account is in the same region as the source account.

The request might fail if the source blob is being rehydrated.

For detailed information about tiering at the block blob level, see [Hot, cool, and archive storage tiers](/azure/storage/storage-blob-storage-tiers).

### Working with a pending copy operation (version 2012-02-12 and later)  
  
If the `Copy Blob` operation finishes asynchronously, use the following table to determine the next step based on the returned status code:  
  
|Status code|Meaning|  
|-----------------|-------------|  
|202 (Accepted), x-ms-copy-status: success|Copy operation finished successfully.|  
|202 (Accepted), x-ms-copy-status: pending|Copy operation has not finished. Poll the destination blob by using `Get Blob Properties` to examine the `x-ms-copy-status` header until the operation finishes or fails.|  
|4xx, 500, or 503|Copy operation failed.|  
  
During and after a `Copy Blob` operation, the properties of the destination blob contain the copy ID of the `Copy Blob` operation and URL of the source blob. When the operation finishes, Blob Storage writes the time and outcome value (`success`, `failed`, or `aborted`) to the destination blob's properties. If the operation has a `failed` outcome, the `x-ms-copy-status-description` header contains an error detail string.  
  
A pending `Copy Blob` operation has a two-week timeout. A copy attempt that hasn't finished after two weeks times out and leaves an empty blob with the `x-ms-copy-status` field set to `failed` and the `x-ms-copy-status-description` set to 500 (OperationCancelled). Intermittent, non-fatal errors that can occur during a copy operation might impede progress of the operation but not cause it to fail. In these cases, `x-ms-copy-status-description` describes the intermittent errors.
  
Any attempt to modify or snapshot the destination blob during the copy operation will fail with status code 409 (Conflict), "Copy Blob in Progress."  
  
If you call the `Abort Copy Blob` operation, you'll see an `x-ms-copy-status:aborted` header. The destination blob will have intact metadata and a blob length of 0 bytes. You can repeat the original call to `Copy Blob` to try the copy operation again.  

If the `Copy Blob` operation finishes synchronously, use the following table to determine the status of the copy operation:

|Status code|Meaning|  
|-----------------|-------------|  
|202 (Accepted), x-ms-copy-status: success|Copy operation finished successfully.|  
|4xx, 500, or 503|Copy operation failed.| 

The tier is inherited for premium storage tiers. For block blobs, overwriting the destination blob will inherit the hot or cool tier from the destination if `x-ms-access-tier` is not provided. Overwriting an archived blob will fail. For detailed information about tiering at the block blob level, see [Hot, cool, and archive storage tiers](/azure/storage/storage-blob-storage-tiers).
  
### Billing  
  
The destination account of a `Copy Blob` operation is charged for one transaction to start the copy. The destination account also incurs one transaction for each request to cancel or request the status of the copy operation.  
  
When the source blob is in another account, the source account incurs transaction costs. In addition, if the source and destination accounts reside in different regions (for example, US North and US South), bandwidth that you use to transfer the request is charged to the source storage account as egress. Egress between accounts within the same region is free.  
  
When you copy a source blob to a destination blob that has a different name within the same account, you use additional storage resources for the new blob. The copy operation then results in a charge against the storage account's capacity usage for those additional resources. However, if the names of the source and destination blobs are the same within the same account (for example, when you promote a snapshot to its base blob), no additional charge is incurred, other than the extra copy metadata stored in version 2012-02-12 and later.  
  
When you promote a snapshot to replace its base blob, the snapshot and base blob become identical. They share blocks or pages, so the copy operation does not result in an additional charge against the storage account's capacity usage. However, if you copy a snapshot to a destination blob that has a different name, that operation incurs an additional charge for the storage resources that the resulting new blob uses. Two blobs that have different names can't share blocks or pages, even if they're identical. For more information about snapshot cost scenarios, see [Understanding how snapshots accrue charges](Understanding-How-Snapshots-Accrue-Charges.md).  
  
## See also  
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Understanding how snapshots accrue charges](Understanding-How-Snapshots-Accrue-Charges.md)   
[Abort Copy Blob](Abort-Copy-Blob.md)
