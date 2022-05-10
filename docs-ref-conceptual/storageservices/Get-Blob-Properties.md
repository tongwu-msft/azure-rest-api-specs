---
title: Get Blob Properties (REST API) - Azure Storage
description: The Get Blob Properties operation returns all user-defined metadata, standard HTTP properties, and system properties for the blob. It does not return the content of the blob.
author: pemari-msft

ms.date: 10/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Get Blob Properties

The `Get Blob Properties` operation returns all user-defined metadata, standard HTTP properties, and system properties for the blob. It does not return the content of the blob.  
  
## Request  
 The `Get Blob Properties` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|HEAD Method Request URI|HTTP Version|  
|-----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`|HTTP/1.1|  
  
### Emulated storage service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
|HEAD Method Request URI|HTTP Version|  
|-----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob`|HTTP/1.1|  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI parameters
  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to retrieve. For more information on working with blob snapshots, see [Creating a Snapshot of a Blob](Creating-a-Snapshot-of-a-Blob.md)|  
|`versionid`|Optional, version 2019-12-12 and newer. The versionid parameter is an opaque `DateTime` value that, when present, specifies the Version of the blob to retrieve.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id: <ID>`|Optional. If this header is specified, the `Get Blob Properties` operation will be performed only if both of the following conditions are met:<br /><br /> - The blob's lease is currently active.<br />- The lease ID specified in the request matches that of the blob.<br /><br /> If both of these conditions are not met, the request will fail and the `Get Blob Properties` operation will fail with status code 412 (Precondition Failed).|
|`x-ms-upn`|Optional, Version 2020-06-12 or newer. Valid for accounts with hierarchical namespace enabled. If **true**, the user identity values returned in the `x-ms-owner` will be transformed from Azure Active Directory object IDs to user principal names. If **false**, the values will be returned as Azure Active Directory object IDs. The default value is **false**. Note that group and application object IDs are not translated because they do not have unique friendly names.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
 This operation also supports the use of conditional headers to return blob properties and metadata only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Headers (Customer-provided encryption keys)
  
Beginning with version 2019-02-02, the following headers may be specified on the request to read a blob encrypted with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional. If a blob has previously been encrypted with a customer-provided key, then these headers must be included on the request to complete the read operation successfully.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Optional. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the blob, including an update of the blob's metadata or properties, changes the last modified time of the blob.|  
|`x-ms-creation-time`|Version 2017-11-09 and newer. The date/time at which the blob was created. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).|  
|`x-ms-meta-name:value`|A set of name-value pairs that correspond to the user-defined metadata associated with this blob.|  
|`x-ms-tag-count`|Version 2019-12-12 or newer. If the blob has any tags, returns the number of tags stored on the blob. This header is not returned if there are no tags on the blob.|  
|`x-ms-blob-type:<BlockBlob&#124;PageBlob&#124;AppendBlob>`|The blob type.|  
|`x-ms-copy-completion-time:<datetime>`|Version 2012-02-12 and newer. Conclusion time of the last attempted `Copy Blob` operation where this blob was the destination blob. This value can specify the time of a completed, aborted, or failed copy attempt. This header does not appear if a copy is pending, if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a concluded `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-copy-status-description: <error string>`|Version 2012-02-12 and newer, only appears when `x-ms-copy-status` is `failed` or `pending`. Describes cause of fatal or non-fatal copy operation failure. This header does not appear if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a concluded `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-copy-id: <id>`|Version 2012-02-12 and newer. String identifier for the last attempted `Copy Blob` operation where this blob was the destination blob. This header does not appear if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a concluded `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-copy-progress: <bytes copied/bytes total>`|Version 2012-02-12 and newer. Contains the number of bytes copied and the total bytes in the source in the last attempted `Copy Blob` operation where this blob was the destination blob. Can show between 0 and `Content-Length` bytes copied. This header does not appear if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a concluded `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-copy-source: url`|Version 2012-02-12 and newer. URL up to 2 KiB in length that specifies the source blob used in the last attempted `Copy Blob` operation where this blob was the destination blob. This header does not appear if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a concluded `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-copy-status: <pending &#124; success &#124; aborted &#124; failed>`|Version 2012-02-12 and newer. State of the copy operation identified by x-ms-copy-id, with these values:<br /><br /> - `success`: Copy completed successfully.<br />- `pending`: Copy is in progress. Check `x-ms-copy-status-description` if intermittent, non-fatal errors impede copy progress but don’t cause failure.<br />- `aborted`: Copy was ended by `Abort Copy Blob`.<br />- `failed`: Copy failed. See `x-ms-copy-status-description` for failure details.<br /><br /> This header does not appear if this blob has never been the destination in a `Copy Blob` operation, or if this blob has been modified after a completed `Copy Blob` operation using `Set Blob Properties`, `Put Blob`, or `Put Block List`.|  
|`x-ms-incremental-copy: true`|Version 2016-05-31 and newer. Included if the blob is incremental copy blob.|
|`x-ms-copy-destination-snapshot:<datetime>`|Version 2016-05-31 and newer. Included if the blob is incremental copy blob or incremental copy snapshot, if `x-ms-copy-status` is success. Snapshot time of the last successful incremental copy snapshot for this blob. |
|`x-ms-lease-duration: <infinite &#124; fixed>`|When a blob is leased, specifies whether the lease is of infinite or fixed duration. Included for requests using version 2012-02-12 and newer.|  
|`x-ms-lease-state: <available &#124; leased &#124; expired &#124; breaking &#124; broken>`|Lease state of the blob. Included for requests made using version 2012-02-12 and newer.|  
|`x-ms-lease-status:<locked&#124; unlocked>`|The lease status of the blob.|  
|`Content-Length`|The size of the blob in bytes. For a page blob, this header returns the value of the `x-ms-blob-content-length` header that is stored with the blob.|  
|`Content-Type`|The content type specified for the blob. If no content type was specified, the default content type is `application/octet-stream`.|  
|`Etag`|The ETag contains a value that you can use to perform operations conditionally. See [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md) for more information. If the request version is 2011-08-18 or newer, the ETag value will be in quotes.|  
|`Content-MD5`|If the `Content-MD5` header has been set for the blob, this response header is returned so that the client can check for message content integrity.<br /><br /> In version 2012-02-12 and newer, `Put Blob` sets a block blob’s MD5 value even when the `Put Blob` request doesn’t include an MD5 header.|  
|`Content-Encoding`|If the `Content-Encoding` request header has previously been set for the blob, that value is returned in this header.|  
|`Content-Language`|If the `Content-Language` request header has previously been set for the blob, that value is returned in this header.|  
|`Content-Disposition`|If the `Content-Disposition` request header has previously been set for the blob, that value is returned in this header, for requests against version 2013-08-15 and later.<br /><br /> The `Content-Disposition` response header field conveys additional information about how to process the response payload, and also can be used to attach additional metadata. For example, if set to `attachment`, it indicates that the user-agent should not display the response, but instead show a Save As dialog.|  
|`Cache-Control`|If the `Cache-Control` request header has previously been set for the blob, that value is returned in this header.|  
|`x-ms-blob-sequence-number`|The current sequence number for a page blob.<br /><br /> This header is not returned for block blobs or append blobs.<br /><br /> This header is not returned for block blobs.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.<br /><br /> This header is also returned for anonymous requests without a version specified if the container was marked for public access using the 2009-09-19 version of the Blob service.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`Accept-Ranges: bytes`|Indicates that the service supports requests for partial blob content. Included for requests made using version 2013-08-15 and newer.|  
|`x-ms-blob-committed-block-count`|The number of committed blocks present in the blob. This header is returned only for append blobs.|  
|`x-ms-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the blob data and application metadata are completely encrypted using the specified algorithm. Otherwise, the value is set to `false` (when the blob is unencrypted, or if only parts of the blob/application metadata are encrypted).|  
|`x-ms-encryption-key-sha256`|Version 2019-02-02 or newer. This header is returned if the blob is encrypted with a customer-provided key.|  
|`x-ms-encryption-scope`|Version 2019-02-02 or newer. This header is returned if the blob is encrypted with an encryption scope.|  
|`x-ms-access-tier`|Version 2017-04-17 or newer. The tier of page blob on a premium storage account or tier of block blob on blob storage or general purpose v2 account. For a list of allowed premium page blob tiers, see [High-performance Premium Storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). For blob storage or general purpose v2 account, valid values are `Hot`/`Cool`/`Archive`. For detailed information about standard blob account block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).
|`x-ms-access-tier-inferred: true`|Version 2017-04-17 and newer. For page blobs on a premium storage account only. If the access tier is not explicitly set on the blob, the tier is inferred based on its content length and this header will be returned with `true` value. For block blobs on Blob Storage or general purpose v2 account, if the blob does not have the access tier set then we infer the tier from the storage account properties. This header is set only if the block blob tier is inferred|  
|`x-ms-archive-status`|Version 2017-04-17 or newer. For blob storage or general purpose v2 account, valid values are `rehydrate-pending-to-hot`/`rehydrate-pending-to-cool`. If the blob is being rehydrated and is not complete then this header is returned indicating that rehydrate is pending and also tells the destination tier. For detailed information about standard blob account block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).|  
|`x-ms-access-tier-change-time`|Version 2017-04-17 or newer. This gives the last time tier was changed on the object. This header is returned only if tier on block blob was ever set. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). For detailed information about standard blob account block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
|`x-ms-rehydrate-priority`|Version 2019-12-12 or newer. If an object is in rehydrate pending state then this header is returned with priority of rehydrate. Valid values are `High`/`Standard`. For detailed information about standard blob account block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).|  
|`x-ms-or-{policy-id}_{rule-id}`|Version 2019-12-12 or newer, returned only for block blobs. `policy-id` is a guid value representing the identifier of an object replication policy on the storage account. `rule-id` is a guid value which represents the identifier of a policy rule on the blob container. If the account is  `ObjectReplication` enabled, the value of this header represents the replication status of blob with the given policy and rule identifiers, either `complete` or `failed`. |  
|`x-ms-or-policy-id`|Version 2019-12-12 or newer, returned only for block blobs. If the account is `ObjectReplication` enabled, the value of this header represents the policy that governs the replication. |  
|`x-ms-last-access-time`|Version 2020-02-10 or newer. Indicates the last time when the blob's data was accessed based on the storage account's last access time tracking policy. The header will not be returned if the storage account does not have a last access time tracking policy, or the policy is disabled. For information about setting the storage account's last access time tracking policy, see [Blob Service API](/rest/api/storagerp/blobservices/setserviceproperties).|  
|`x-ms-blob-sealed`|Version 2019-12-12 or newer, returned only for append blobs. If the append blob has been sealed the value would be true, see [Seal Append Blobs](append-blob-seal.md)|
|`x-ms-immutability-policy-until-date`|Version 2020-06-12 or newer. Specifies the 'retention until' date set on the blob. This is the date until which the blob can be protected from being modified or deleted. Returned only if an immutability policy is set on the blob. The value of this header is RFC1123 format.| 
|`x-ms-immutability-policy-mode: unlocked/locked`|Version 2020-06-12 or newer. The immutability policy mode, returned if an immutability policy is set on the blob. Values are `unlocked`/`locked`. `unlocked` indicates the user may change the policy by increasing or decreasing the retention-until date. `locked` indicates that these actions are prohibited.| 
|`x-ms-legal-hold: true/false`|Version 2020-06-12 or newer. This header is not returned if there is no legal hold on the blob. The value of this header is set to true if the blob contains a legal hold and its value is true. Otherwise, the value is set to false if the blob contains a legal hold and its value false.| 
|`x-ms-owner`|Version 2020-06-12 or newer only for accounts with hierarchical namespace enabled. Returns the owner user of the file or directory.| 
|`x-ms-group`|Version 2020-06-12 or newer only for accounts with hierarchical namespace enabled. Returns the owning group of the file or directory.| 
|`x-ms-permissions`|Version 2020-06-12 or newer only for accounts with hierarchical namespace enabled. Returns the permissions set for 'user', 'group' and 'other' on the file or directory. Each individual permission is in [r,w,x,-]{3} format.| 
|`x-ms-resource-type`|Version 2020-10-02 or newer only for accounts with hierarchical namespace enabled. Returns the resource type for the path, which can be either `file`/`directory`.| 
|`x-ms-expiry-time`|Version  2020-02-10 or newer only for accounts with hierarchical namespace enabled. Returns the expiry time set on the blob. Will only be returned for files which have expiry set.| 

### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
x-ms-meta-Name: myblob.txt  
x-ms-meta-DateUploaded: <date>  
x-ms-blob-type: AppendBlob  
x-ms-lease-status: unlocked  
x-ms-lease-state: available  
Content-Length: 11  
Content-Type: text/plain; charset=UTF-8  
Date: <date>  
ETag: "0x8CAE97120C1FF22"  
Accept-Ranges: bytes  
x-ms-blob-committed–block-count: 1  
x-ms-version: 2015-02-21  
Last-Modified: <date>  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-copy-id: 36650d67-05c9-4a24-9a7d-a2213e53caf6  
x-ms-copy-source: <url>  
x-ms-copy-status: success  
x-ms-copy-progress: 11/11  
x-ms-copy-completion-time: <date>  
  
```  
  
## Authorization  
 If the container's access control list (ACL) is set to allow anonymous access to the blob, any client may call this operation. If the container is private, this operation can be performed by the account owner and by anyone with a Shared Access Signature that has permission to read the blob.  
  
## Remarks  
 To determine if a `Copy Blob` operation has completed, first check that the `x-ms-copy-id` header value matches the copy ID provided by the original call to `Copy Blob`. A match assures that another application did not abort the copy and start a new `Copy Blob` operation. Then check for the `x-ms-copy-status: success` header. However, be aware that all write operations on a blob except `Lease`, `Put Page` and `Put Block` operations remove all `x-ms-copy-*` properties from the blob. These properties are also not copied by `Copy Blob` operations that use versions before 2012-02-12.  
  
 `x-ms-copy-status-description` contains more information about the `Copy Blob` failure. The following table shows `x-ms-copy-status-description` values and their meaning.  
  
 The following table describes the three fields of every `x-ms-copy-status-description` value.  
  
|Component|Description|  
|---------------|-----------------|  
|HTTP status code|Standard 3-digit integer specifying the failure.|  
|Error code|Keyword describing error that is provided by Azure in the <ErrorCode\> element. If no <ErrorCode\> element appears, a keyword containing standard error text associated with the 3-digit HTTP status code in the HTTP specification is used. See [Common REST API Error Codes](Common-REST-API-Error-Codes.md).|  
|Information|Detailed description of failure, in quotes.|  
  
 The following table describes the `x-ms-copy-status` and `x-ms-copy-status-description` values of common failure scenarios.  
  
> [!IMPORTANT]
>  Description text shown here can change without warning, even without a version change, so do not rely on matching this exact text.  
  
|Scenario|x-ms-copy-status value|x-ms-copy-status-description value|  
|--------------|-------------------------------|--------------------------------------------|  
|Copy operation completed successfully.|success|empty|  
|User aborted copy operation before it completed.|aborted|empty|  
|A failure occurred when reading from the source blob during a copy operation, but the operation will be retried.|pending|502 BadGateway "Encountered a retryable error when reading the source. Will retry. Time of failure: <time\>"|  
|A failure occurred when writing to the destination blob of a copy operation, but the operation will be retried.|pending|500 InternalServerError "Encountered a retryable error. Will retry. Time of failure: <time\>"|  
|An unrecoverable failure occurred when reading from the source blob of a copy operation.|failed|404 ResourceNotFound "Copy failed when reading the source." **Note:**  When reporting this underlying error, Azure returns `ResourceNotFound` in the <ErrorCode\> element. If no <ErrorCode\> element appeared in the response, a standard string representation of the HTTP status such as `NotFound` would appear.|  
|The timeout period limiting all copy operations elapsed. (Currently the timeout period is 2 weeks.)|failed|500 OperationCancelled "The copy exceeded the maximum allowed time."|  
|The copy operation failed too often when reading from the source, and didn’t meet a minimum ratio of attempts to successes. (This timeout prevents retrying a very poor source over 2 weeks before failing).|failed|500 OperationCancelled "The copy failed when reading the source."|  
  
 `x-ms-last-access-time` tracks the time when the blob's data was accessed based on the storage account's last access time tracking policy. Accessing a blob's metadata does not change its last access time.
  
## See also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)
