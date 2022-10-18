---
title: List Blobs (REST API) - Azure Storage
description: The List Blobs operation returns a list of the blobs under the specified container.
author: pemari-msft
ms.date: 12/09/2021
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# List Blobs

The `List Blobs` operation returns a list of the blobs under the specified container.  
  
## Request  

You can construct the `List Blobs` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.blob.core.windows.net/mycontainer?restype=container&comp=list`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`http://127.0.0.1:10000/devstoreaccount1/mycontainer?restype=container&comp=list`|HTTP/1.1|  
  
For more information, see [Use Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters  

You can specify the following additional parameters on the URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Optional. Filters the results to return only blobs with names that begin with the specified prefix.|  
|`delimiter`|Optional. When the request includes this parameter, the operation returns a `BlobPrefix` element in the response body. This element acts as a placeholder for all blobs with names that begin with the same substring, up to the appearance of the delimiter character. The delimiter can be a single character or a string.|  
|`marker`|Optional. A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a marker value within the response body if the list returned was not complete. You can then use the marker value in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of blobs to return, including all `BlobPrefix` elements. If the request doesn't specify `maxresults`, or specifies a value greater than 5,000, the server will return up to 5,000 items. If there are additional results to return, the service returns a continuation token in the `NextMarker` response element. In certain cases, the service might return fewer results than specified by `maxresults`, and also return a continuation token.<br /><br /> Setting `maxresults` to a value less than or equal to zero results in error response code 400 (Bad Request).|  
|`include={snapshots,metadata,uncommittedblobs,copy,deleted,tags,versions,`<br/>`deletedwithversions,immutabilitypolicy,legalhold,permissions}`|Optional. Specifies one or more datasets to include in the response:<br /><br /> -   `snapshots`: Specifies that snapshots should be included in the enumeration. Snapshots are listed from oldest to newest in the response.<br />-   `metadata`: Specifies that blob metadata be returned in the response.<br />-   `uncommittedblobs`: Specifies that blobs for which blocks have been uploaded, but which haven't been committed by using [Put Block List](Put-Block-List.md), be included in the response.<br />-   `copy`: Version 2012-02-12 and later. Specifies that metadata related to any current or previous `Copy Blob` operation should be included in the response.<br />-`deleted`: Version 2017-07-29 and later. Specifies that soft-deleted blobs should be included in the response. <br />-`tags`: Version 2019-12-12 and later. Specifies that user-defined, blob index tags should be included in the response. <br />-`versions`: Version 2019-12-12 and later. Specifies that versions of blobs should be included in the enumeration.<br />-`deletedwithversions`: Version 2020-10-02 and later. Specifies that deleted blobs with any versions (active or deleted) should be included in the response. Use the tag `\<HasVersionsOnly\>`, and the value `true`.<br />-`immutabilitypolicy`: Version 2020-06-12 and later. Specifies that the enumeration should include the immutability policy until date, and the immutability policy mode of the blobs.<br />-`legalhold`: Version 2020-06-12 and later. Specifies that the enumeration should include the legal hold of blobs.<br />-`permissions`: Version 2020-06-12 and later. Supported only for accounts with a hierarchical namespace enabled. If a request includes this parameter, then the owner, group, permissions, and access control list for the listed blobs or directories will be included in the enumeration. <br /><br /> To specify more than one of these options on the URI, you must separate each option with a URL-encoded comma ("%82").|
|`showonly={deleted,files,directories}`|Optional. Specifies one of these datasets to be returned in the response:<br /><br />-`deleted`: Optional. Version 2020-08-04 and later. Only for accounts enabled with hierarchical namespace. When a request includes this parameter, the list only contains soft-deleted blobs. If `include=deleted` is also specified, the request fails with Bad Request (400).<br />-`files`: Optional. Version 2020-12-06 and later. Only for accounts enabled with hierarchical namespace. When a request includes this parameter, the list only contains files. <br />-`directories`: Optional. Version 2020-12-06 and later. Only for accounts enabled with hierarchical namespace. When a request includes this parameter, the list only contains directories.|
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, and optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-upn`|Optional. Valid only when a hierarchical namespace is enabled for the account, and `include=permissions` is provided in the request. If `true`, the user identity values returned in the \<Owner\>, \<Group\>, and \<Acl\> fields are transformed from Azure Active Directory (Azure AD) object IDs to user principal names. If `false`, the values are returned as Azure AD object IDs. The default value is `false`. Note that group and application object IDs aren't translated because they don't have unique friendly names.| 
  
### Request body  

None.  
  
### Sample request  

See [Enumerating blob resources](Enumerating-Blob-Resources.md) for a sample request.  
  
##  <a name="response"></a> Response  

The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code  

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Specifies the format in which the results are returned. Currently this value is `application/xml`.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made by using version 2009-09-19 and later.<br /><br /> This header is also returned for anonymous requests, without a version specified, if the container was marked for public access by using the 2009-09-19 version of Blob Storage.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

The format of the XML response is as follows.  
  
Note that the `Prefix`, `Marker`, `MaxResults`, and `Delimiter` elements are present only if they were specified on the request URI. The `NextMarker` element has a value only if the list results aren't complete.  
  
Snapshots, blob metadata, and uncommitted blobs are included in the response only if they are specified with the `include` parameter on the request URI.  
  
In version 2009-09-19 and later, the blob's properties are encapsulated within a `Properties` element.  
  
Beginning with version 2009-09-19, `List Blobs` returns the following renamed elements in the response body:  
  
- `Last-Modified` (previously `LastModified`)  
  
- `Content-Length` (previously `Size`)  
  
- `Content-Type` (previously `ContentType`)  
  
- `Content-Encoding` (previously `ContentEncoding`)  
  
- `Content-Language` (previously `ContentLanguage`)  

The `Content-MD5` element appears for blobs created with version 2009-09-19 and later. In version 2012-02-12 and later, Blob Storage calculates the `Content-MD5` value when you upload a blob by using [Put Blob](Put-Blob.md). Blob Storage doesn't calculate this when you create a blob by using [Put Block List](Put-Block-List.md). You can explicitly set the `Content-MD5` value when you create the blob, or by calling the [Put Block List](Put-Block-List.md) or [Set Blob Properties](Set-Blob-Properties.md) operations.

For versions from 2009-09-19 and later, but prior to version 2015-02-21, you can't call `List Blobs` on a container that includes append blobs. The service returns status code 409 (Conflict) if the result of the listing contains an append blob.  

`LeaseState` and `LeaseDuration` appear only in version 2012-02-12 and later.

`CopyId`, `CopyStatus`, `CopySource`, `CopyProgress`, `CopyCompletionTime`, and `CopyStatusDescription` only appear in version 2012-02-12 and later, when this operation includes the `include={copy}` parameter. These elements don't appear if this blob has never been the destination in a `Copy Blob` operation. The elements don't appear if this blob has been modified after a concluded `Copy Blob` operation, by using `Set Blob Properties`, `Put Blob`, or `Put Block List`. These elements also don't appear with a blob created by [Copy Blob](Copy-Blob.md), before version 2012-02-12.

In version 2013-08-15 and later, the `EnumerationResults` element contains a `ServiceEndpoint` attribute that specifies the blob endpoint. This element also contains a `ContainerName` field that specifies the name of the container. In previous versions, these two attributes were combined together in the `ContainerName` field. Also in version 2013-08-15 and later, the `Url` element under `Blob` has been removed.

For version 2015-02-21 and later, `List Blobs` returns blobs of all types (block, page, and append blobs).  

For version 2015-12-11 and later, `List Blobs` returns the `ServerEncrypted` element. This element is set to `true` if the blob and application metadata are completely encrypted, and `false` otherwise.  

For version 2016-05-31 and later, `List Blobs` returns the `IncrementalCopy` element for incremental copy blobs and snapshots, with the value set to `true`.

For version 2017-04-17 and later, `List Blobs` returns the `AccessTier` element if an access tier has been explicitly set. For a list of allowed premium page blob tiers, see [High-performance premium storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). For Blob Storage or general-purpose v2 accounts, valid values are `Hot`, `Cool`, and `Archive`. If the blob is in the rehydrate pending state, then `ArchiveStatus` element is returned with one of the valid values (`rehydrate-pending-to-hot` or `rehydrate-pending-to-cool`). For detailed information about block blob tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).

For version 2017-04-17 and later, `List Blobs` returns the `AccessTierInferred` element on Blob Storage or general-purpose v2 accounts. If the block blob doesn't have the access tier set, tier information is inferred from storage account properties, and this value is set to `true`. This header is present only if the tier is inferred from the account property.

For version 2017-04-17 and later, `List Blobs` returns the `AccessTierChangeTime` element on Blob Storage or general-purpose v2 accounts. This is returned only if the tier on block blob was ever set. For more information, see [Representation of date-time values in headers](Representation-of-Date-Time-Values-in-Headers.md).

For version 2017-07-29 and later, `Deleted`, `DeletedTime`, and `RemainingRetentionDays` appear when this operation includes the `include={deleted}` parameter. These elements don't appear if this blob wasn't deleted. These elements appear for blobs or snapshots that are deleted with the `DELETE` operation, when the soft-delete feature was enabled. The `Deleted` element is set to `true` for blobs and snapshots that are soft-deleted. `Deleted-Time` corresponds to the time when the blob was deleted. `RemainingRetentionDays` indicates the number of days after which a soft-deleted blob is permanently deleted.

For version 2017-11-09 and later, `Creation-Time` returns the time at which this blob was created.

For version 2019-02-02 and later, `List Blobs` returns the `CustomerProvidedKeySha256` element if the blob is encrypted with a customer-provided key. The value will be set to the SHA-256 hash of the key used to encrypt the blob. Additionally, if the operation includes the `include={metadata}` parameter, and there is application metadata present on a blob encrypted with a customer-provided key, the `Metadata` element will have an `Encrypted="true"` attribute. This attribute indicates that the blob has metadata that can't be decrypted as part of the `List Blobs` operation. To access the metadata for these blobs, call [Get Blob Properties](Get-Blob-Properties.md) or [Get Blob Metadata](Get-Blob-Metadata.md) with the customer-provided key.

For version 2019-02-02 and later, `List Blobs` returns the `EncryptionScope` element if the blob is encrypted with an encryption scope. The value will be set to the name of the encryption scope used to encrypt the blob. If the operation includes the `include={metadata}` parameter, application metadata on the blob is transparently decrypted, and available in the `Metadata` element.

For version 2019-12-12 and later, `List Blobs` returns the `RehydratePriority` element on Blob Storage or general-purpose v2 accounts, if the object is in the `rehydrate pending` state. Valid values are `High` and `Standard`.

For version 2019-12-12 and later, `List Blobs` returns the `VersionId` element for blobs and generated blob versions, when versioning is enabled on the account.

For version 2019-12-12 and later, `List Blobs` returns the `IsCurrentVersion` element for the current version of the blob. The value is set to `true`. This element enables you to differentiate the current version from the read-only, automatically generated versions.

For version 2019-12-12 and later, `List Blobs` returns the `TagCount` element for blobs with any tags. The `Tags` element appears only when this operation includes the `include={tags}` parameter. These elements don't appear if there are no tags on the blob.

For version 2019-12-12 and later, `List Blobs` returns the `Sealed` element for append blobs. The `Sealed` element appears only when the append blob has been sealed. These elements don't appear if the append blob isn't sealed.

For version 2020-02-10 and later, `List Blobs` returns the `LastAccessTime` element. The element shows when the blob's data was last accessed, according to the storage account's last access time tracking policy. The element isn't returned if the storage account doesn't have this policy, or the policy is disabled. For information about setting the account's last access time tracking policy, see the [Blob Service API](/rest/api/storagerp/blobservices/setserviceproperties). The `LastAccessTime` element doesn't track the last time when the blob's metadata is accessed.

For version 2020-06-12 and later, `List Blobs` returns the `ImmutabilityPolicyUntilDate` and `ImmutabilityPolicyMode` elements, when this operation includes the `include={immutabilitypolicy}` parameter.

For version 2020-06-12 and later, `List Blobs` returns the `LegalHold` element, when this operation includes the `include={legalhold}` parameter.

For version 2020-06-12 and later, for accounts with a hierarchical namespace enabled, `List Blobs` returns the `Owner`, `Group`, `Permissions`, and `Acl` elements. The request must contain the `include={permissions}` parameter. Note that the `Acl` element is a combined list of access and default access control lists that were set on the file or directory.
  
For version 2020-06-12 and later, for accounts with a hierarchical namespace enabled, `List Blobs` with a delimiter returns the `Properties` element in the `BlobPrefix` element. This corresponds with the properties on the directory.

For version 2020-08-04 and later, for accounts with a hierarchical namespace enabled, `List Blobs` returns the `DeletionId` element for deleted blobs. `DeletionId` is an unsigned, 64-bit identifier. The element uniquely identifies a soft-deleted path, to distinguish it from other deleted blobs with the same path.

For version 2020-10-02 and later, for accounts with a hierarchical namespace enabled, `List Blobs` returns the `ResourceType` property element for the path. This can be either `file` or `directory`.   

For version 2021-02-12 and later, `List Blobs` will percent-encode (per RFC 2396) all `Blob` `Name` or `BlobPrefix` `Name` element values. Specifically, it will do so for those values that contain characters that aren't valid in XML (U+FFFE or U+FFFF). If encoded, the `Name` element will include an `Encoded=true` attribute. Note that this only occurs for the `Name` element values containing the characters invalid in XML, not the remaining `Name` elements in the response.
  
For version 2021-06-08 and later, for accounts with a hierarchical namespace enabled, `List Blobs` returns the `Placeholder` properties element. It returns this element in the `BlobPrefix` element for placeholder directories, when listing deleted blobs with a delimiter. These placeholder directories exist to facilitate navigation to soft-deleted blobs.

For version  2020-02-10 and later, for accounts with a hierarchical namespace enabled, `List Blobs` returns the `Expiry-Time` element for deleted blobs. `Expiry-Time` is the time when the file will expire, and is returned for the file if the expiry is set on the same. 

```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="http://myaccount.blob.core.windows.net/"  ContainerName="mycontainer">  
  <Prefix>string-value</Prefix>  
  <Marker>string-value</Marker>  
  <MaxResults>int-value</MaxResults>  
  <Delimiter>string-value</Delimiter>  
  <Blobs>  
    <Blob>  
      <Name>blob-name</name>  
      <Snapshot>date-time-value</Snapshot>  
      <VersionId>date-time-vlue</VersionId>
      <IsCurrentVersion>true</IsCurrentVersion>
      <Deleted>true</Deleted>
      <Properties> 
        <Creation-Time>date-time-value</Creation-Time>
        <Last-Modified>date-time-value</Last-Modified>  
        <Etag>etag</Etag>
        <Owner>owner user id</Owner>
        <Group>owning group id</Group>
        <Permissions>permission string</Permissions>
        <Acl>access control list</Acl>
        <ResourceType>file | directory</ResourceType>
        <Placeholder>true</Placeholder>
        <Content-Length>size-in-bytes</Content-Length>  
        <Content-Type>blob-content-type</Content-Type>  
        <Content-Encoding />  
        <Content-Language />  
        <Content-MD5 />  
        <Cache-Control />  
        <x-ms-blob-sequence-number>sequence-number</x-ms-blob-sequence-number>  
        <BlobType>BlockBlob|PageBlob|AppendBlob</BlobType>  
        <AccessTier>tier</AccessTier>  
        <LeaseStatus>locked|unlocked</LeaseStatus>  
        <LeaseState>available | leased | expired | breaking | broken</LeaseState>  
        <LeaseDuration>infinite | fixed</LeaseDuration>  
        <CopyId>id</CopyId>  
        <CopyStatus>pending | success | aborted | failed </CopyStatus>  
        <CopySource>source url</CopySource>  
        <CopyProgress>bytes copied/bytes total</CopyProgress>  
        <CopyCompletionTime>datetime</CopyCompletionTime>  
        <CopyStatusDescription>error string</CopyStatusDescription>  
        <ServerEncrypted>true</ServerEncrypted> 
        <CustomerProvidedKeySha256>encryption-key-sha256</CustomerProvidedKeySha256>
        <EncryptionScope>encryption-scope-name</EncryptionScope>
        <IncrementalCopy>true</IncrementalCopy>
        <AccessTierInferred>true</AccessTierInferred>
        <AccessTierChangeTime>datetime</AccessTierChangeTime>
        <DeletedTime>datetime</DeletedTime>
        <RemainingRetentionDays>no-of-days</RemainingRetentionDays>
        <TagCount>number of tags between 1 to 10</TagCount>
        <RehydratePriority>rehydrate priority</RehydratePriority>
        <Expiry-Time>date-time-value</Expiry-Time>
      </Properties>  
      <Metadata>     
        <Name>value</Name>  
      </Metadata>  
      <Tags>
          <TagSet>
              <Tag>
                  <Key>TagName</Key>
                  <Value>TagValue</Value>
              </Tag>
          </TagSet>
      </Tags>
      <OrMetadata />
    </Blob>  
    <BlobPrefix>  
      <Name>blob-prefix</Name>  
    </BlobPrefix>  
  </Blobs>  
  <NextMarker />  
</EnumerationResults>  
```  
  
### Sample response  

See [Enumerating blob resources](Enumerating-Blob-Resources.md) for a sample response.  
  
## <a name="authorization"></a> Authorization  

If the container's access control list (ACL) is set to allow anonymous access to the container, any client can call this operation. Otherwise, this operation can be called by the account owner, and by anyone with a shared access signature that has permission to list blobs in a container.  
  
## Remarks  

### Blob properties in the response  
  
If you have requested that uncommitted blobs be included in the enumeration, note that some properties aren't set until the blob is committed. Some properties might not be returned in the response.  
  
The `x-ms-blob-sequence-number` element is only returned for page blobs.  
 
The `OrMetadata` element is only returned for block blobs. 
  
For page blobs, the value returned in the `Content-Length` element corresponds to the value of the blob's `x-ms-blob-content-length` header.  
  
The `Content-MD5` element appears in the response body, only if it has been set on the blob by using version 2009-09-19 or later. You can set the `Content-MD5` property when the blob is created, or by calling [Set Blob Properties](Set-Blob-Properties.md). In version 2012-02-12 and later, `Put Blob` sets a block blob’s MD5 value, even when the `Put Blob` request doesn’t include an MD5 header.  
  
### Metadata in the response  
  
The `Metadata` element is present only if the `include=metadata` parameter was specified on the URI. Within the `Metadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name.  
  
Note that metadata requested with this parameter must be stored in accordance with the naming restrictions imposed by the 2009-09-19 version of Blob Storage. Beginning with this version, all metadata names must adhere to the naming conventions for [C# identifiers](/dotnet/csharp/language-reference).  
  
If a metadata name-value pair violates these naming restrictions, the response body indicates the problematic name within an `x-ms-invalid-name` element. The following XML fragment shows this:  
  
```  
  
…  
<Metadata>  
  <MyMetadata1>first value</MyMetadata1>  
  <MyMetadata2>second value</MyMetadata2>  
  <x-ms-invalid-name>invalid-metadata-name</x-ms-invalid-name>  
</Metadata>  
…  
  
```  

### Tags in the response
 
The `Tags` element is present only if the `include=tags` parameter was specified on the URI, and if there are tags on the blob. Within the `TagSet` element, up to 10 `Tag` elements are returned, each containing the `key` and `value` of the user-defined, blob index tags. The ordering of tags isn't guaranteed in the response. 
  
The `Tags` and `TagCount` elements aren't returned if there are no tags on the blob.

The storage service maintains strong consistency between a blob and its tags, but the secondary index is eventually consistent. Tags can be visible in a response to `List Blobs` before they are visible to `Find Blobs by Tags` operations.
  
### Snapshots in the response  
  
Snapshots are listed in the response only if the `include=snapshots` parameter was specified on the URI. Snapshots listed in the response don't include the `LeaseStatus` element, because snapshots can't have active leases.  
  
If you call `List Blobs` with a delimiter, you can't also include snapshots in the enumeration. A request that includes both returns an error (HTTP status code 400 – Bad Request).  
  
### Uncommitted blobs in the response  
  
Uncommitted blobs are listed in the response only if the `include=uncommittedblobs` parameter was specified on the URI. Uncommitted blobs listed in the response don't include any of the following elements:  
  
- `Last-Modified`  
  
- `Etag`  
  
- `Content-Type`  
  
- `Content-Encoding`  
  
- `Content-Language`  
  
- `Content-MD5`  
  
- `Cache-Control`  
  
- `Metadata`  

### Deleted blobs in the response  
  
Deleted blobs are listed in the response only if the `include=deleted` parameter was specified on the URI. Deleted blobs listed in the response don't include the **Lease** elements, because deleted blobs can't have active leases.

Deleted snapshots are included in list response if `include=deleted,snapshot` was specified on the URI.

### Object replication metadata in the response  
  
The `OrMetadata` element is present when an object replication policy has been evaluated on a blob, and the `List Blobs` call was made by using version 2019-12-12 or later. Within the `OrMetadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name. The format of the name is `or-{policy-id}_{rule-id}`, where `{policy-id}` is a GUID that represents the object replication policy identifier on the storage account. `{rule-id}` is a GUID that represents the rule identifier on the storage container. Valid values are `complete` or `failed`.
  
```  
  
…  
<OrMetadata>  
  <or-e524bba7-4323-4b93-91f8-d09d5d0b7057_d86c51de-ef02-4264-bdcf-dcd389a6c7ac>complete</or-e524bba7-4323-4b93-91f8-d09d5d0b7057_d86c51de-ef02-4264-bdcf-dcd389a6c7ac>  
  <or-2b302b5d-fcd5-44d6-a5ed-455bf27e17ea_4a398ff5-2a89-4090-879b-10248f23428e>failed</or-2b302b5d-fcd5-44d6-a5ed-455bf27e17ea_4a398ff5-2a89-4090-879b-10248f23428e>  
</OrMetadata>  
…  
  
```  

### Immutability policy in the response  
  
The `ImmutabilityPolicyUntilDate` and `ImmutabilityPolicyMode` elements are present only if the `include=immutabilitypolicy` parameter was specified on the URI.

```  
<Properties> 
   <ImmutabilityPolicyUntilDate>date-time-value</ImmutabilityPolicyUntilDate>   
   <ImmutabilityPolicyMode>unlocked | locked </ImmutabilityPolicyMode>  
</Properties> 
 ```  
 
### Legal hold in the response  
  
The `LegalHold` element is present only if the `include=legalhold` parameter was specified on the URI. 

```  
<Properties> 
  <LegalHold>true | false </LegalHold>  
</Properties> 
 ```  

### Returning result sets by using a marker value
  
If you specify a value for the `maxresults` parameter, and the number of blobs to return exceeds this value, or exceeds the default value for `maxresults`, the response body contains a `NextMarker` element. This element indicates the next blob to return on a subsequent request. In certain cases, the service might return the `NextMarker` element even though the number of results returned is less than the value of `maxresults`.

To return the next set of items, specify the value of `NextMarker` as the marker parameter on the URI for the subsequent request. Note that the value of `NextMarker` should be treated as opaque.  
  
### Using a delimiter to traverse the blob namespace  
  
The `delimiter` parameter enables the caller to traverse the blob namespace by using a user-configured delimiter. In this way, you can traverse a virtual hierarchy of blobs as though it were a file system. The delimiter can be a single character or a string.

When the request includes this parameter, the operation returns a `BlobPrefix` element. The `BlobPrefix` element is returned in place of all blobs with names that begin with the same substring, up to the appearance of the delimiter character. The value of the `BlobPrefix` element is *substring+delimiter*, where *substring* is the common substring that begins one or more blob names, and *delimiter* is the value of the `delimiter` parameter.  
  
You can use the value of `BlobPrefix` to make a subsequent call to list the blobs that begin with this prefix. You do this by specifying the value of `BlobPrefix` for the `prefix` parameter on the request URI.  
  
Note that each `BlobPrefix` element returned counts toward the maximum result, just as each `Blob` element does.  
  
Blobs are listed in alphabetical order in the response body, with upper-case letters listed first.  
  
### Copy errors in Copy Status Description  
  
`CopyStatusDescription` contains more information about the `Copy Blob` failure.  
  
- When a copy attempt fails, `CopyStatus` is set to `pending` if Blob Storage is still retrying the operation. The `CopyStatusDescription` text describes the failure that might have occurred during the last copy attempt.  
  
- When `CopyStatus` is set to `failed`, the `CopyStatusDescription` text describes the error that caused the copy operation to fail.  
  
The following table describes the fields of every `CopyStatusDescription` value.  
  
|Component|Description|  
|---------------|-----------------|  
|HTTP status code|Standard three-digit integer specifying the failure.|  
|Error code|Keyword that describes the error. It's provided by Azure in the <ErrorCode\> element. If no <ErrorCode\> element appears, the service returns a keyword that contains standard error text associated with the three-digit HTTP status code in the HTTP specification. For more information, see [Common REST API error codes](Common-REST-API-Error-Codes.md).|  
|Information|Detailed description of the failure, in quotes.|  
  
The following table describes the `CopyStatus` and `CopyStatusDescription` values of common failure scenarios.  
  
> [!IMPORTANT]
> Description text shown here can change without warning, even without a version change. Don't rely on matching this exact text.  
  
|Scenario|Copy Status value|Copy Status Description value|  
|--------------|----------------------|---------------------------------|  
|Copy operation completed successfully.|success|empty|  
|User aborted the copy operation before it completed.|aborted|empty|  
|A failure occurred when reading from the source blob during a copy operation. The operation will be retried.|pending|502 BadGateway "Encountered a retryable error when reading the source. Will retry. Time of failure: <time\>"|  
|A failure occurred when writing to the destination blob of a copy operation. The operation will be retried.|pending|500 InternalServerError "Encountered a retryable error. Will retry. Time of failure: <time\>"|  
|An unrecoverable failure occurred when reading from the source blob of a copy operation.|failed|404 ResourceNotFound "Copy failed when reading the source." When the service reports this underlying error, it returns `ResourceNotFound` in the <ErrorCode\> element. If no <ErrorCode\> element appeared in the response, a standard string representation of the HTTP status, such as `NotFound`, appears.|  
|The timeout period limiting all copy operations elapsed. (Currently the timeout period is two weeks.)|failed|500 OperationCancelled "The copy exceeded the maximum allowed time."|  
|The copy operation failed too often when reading from the source, and didn’t meet a minimum ratio of attempts to successes. (This timeout prevents retrying a very poor source over two weeks before failing).|failed|500 OperationCancelled "The copy failed when reading the source."|  
  
## See also  

[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)
