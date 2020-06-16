---
title: Working with Blob Tags (REST API) - Azure Storage
description: In addition to application metadata, blobs support custom tags. Tags are user-defined key-value pairs that are stored with the blob and indexed by the blob service.
author: rerdmann

ms.date: 6/15/2020
ms.service: storage
ms.topic: reference
ms.author: rerdmann
---

# Working with Blob Tags
  
In addition to application metadata, blobs support custom tags. Tags are a special form of metadata that may be used to categorize objects.  Like application metadata, tags are user-defined key/value pairs that are stored with a blob and may be updated at any time.  
  
Properties stored as tags are indexed by the Blob service, and may be used to search for blobs across the entire storage account using the [Find Blobs by Tags](Find-Blobs-by-Tags.md) operation. Tags may also be used to apply object lifecycle policies. Unlike metadata, tags require special permission to read or write.  
  
## Operations on Blob Tags
The Blob service supports several operations on blob tags.  
  
### Determining Tag Existence
Unlike metadata, tags are not returned as HTTP headers in [Get Blob](Get-Blob.md) or [Get Blob Properties](Get-Blob-Properties.md) operations. However, the number of tags stored on the blob is returned in the `x-ms-tag-count` response header.  
  
**Request**  
`HEAD https://myaccount.blob.core.windows.net/mycontainer/myblob`  
  
**Response**  
```
HTTP 200 OK  
x-ms-tag-count: <N>  
...  
```
  
### Retrieving Blob Tags
The tags stored on a blob may be retrieved with the [Get Blob Tags](Get-Blob-Tags.md) operation. Tags are returned an XML document in the response body.  
  
**Request**  
`GET https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tags`  
  
**Response**  
```
HTTP 200 OK  
  
<?xml version="1.0" encoding="utf-8"?>  
<Tags>  
    <TagSet>  
        <Tag>  
            <Key>tag-name-1</Key>  
            <Value>tag-value-1</Value>  
        </Tag>  
    </TagSet>  
</Tags>  
```  
  
### Updating Blob Tags
The tags stored on a blob may be updated at any time with [Set Blob Tags](Set-Blob-Tags.md) operation. Tags are provided as an XML document in the request body. The tags provided in the request will overwrite any tags previously stored on the blob.  
  
**Request**  
```
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tags

<?xml version="1.0" encoding="utf-8"?>  
<Tags>  
    <TagSet>  
        <Tag>  
            <Key>tag-name-1</Key>  
            <Value>tag-value-1</Value>  
        </Tag>  
    </TagSet>  
</Tags>  
```  
  
### Setting Blob Tags
In addition to independently updating blob tags, tags may be added to a blob in the [Put Blob](Put-Blob.md), [Put Block List](Put-Block-List.md), [Copy Blob](Copy-Blob.md), and [Snapshot Blob](Snapshot-Blob.md) operations. Tags may be provided in the `x-ms-tags` request header, and will be set on the blob at the same time the blob is created.  
  
Tags provided in the `x-ms-tags` header must be query-string encoded, and may contain up to 2kb for tags. If more tags are required, use the [Set Blob Tags](Set-Blob-Tags.md) operation.
  
|`x-ms-tags` Header Value|Resulting Tag Set|  
|---|---|  
|`A=b`|"A" = 'b'|  
|`a=&b=c`|"a" = ''<br/>"b" = 'c'|  
|`%20%2B-.%2F%3A%3D_=%20%2B-.%2F%3A%3D_&foo=bar`|" +-./:=_" = ' +-./:=_'<br/>"foo" = 'bar'|  
  
**Request**  
```
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob
x-ms-tags: Tag1=Value1&Tag2=Value2
```
  
**Response**  
`HTTP 201 Created`  
  
### Finding Blobs by Tags
One of the most powerful features of blob tags is that the Blob service maintains a secondary index of all the tags in a storage account. The [Find Blobs by Tags](Find-Blobs-by-Tags.md) operation searches the storage account for blobs whose tags match a given query expression.  
  
While updates to a blob's tags are always strongly consistent with respect to the blob, the secondary index is eventually consistent and may not immediately reflect all updates.
  
For example, the following request finds all blobs in the storage account that are currently tagged as `Status=Pending` (URI encoding omitted for readability).
  
**Request**  
```
GET https://myaccount.blob.core.windows.net?comp=blobs&where=Status='Pending'
```
  
## Choosing Between Metadata and Tags
Both Tags and Metadata provide the ability to store arbitrary user-defined properties alongside a blob resource. They may be retrieved and set directly, without returning or altering the contents of the blob.   
  
Use metadata to store information that should be returned as HTTP headers in [Get Blob](Get-Blob.md) or [Get Blob Properties](Get-Blob-Properties.md) operations.  Also, since metadata is encrypted with the same encryption key used to encrypt the blob contents (including Customer Managed Key and Customer Provided Key), metadata is the appropriate choice for highly-sensitive data.  
  
Use tags to categorize blobs and search for blobs using the secondary index with the [Find Blobs by Tags](Find-Blobs-by-Tags.md) operation.  Also, use tags when separate permissions are needed to control access to the data.  
  
| |Application Metadata|Tags|  
|---|---|---|  
|Limits|No limit on number.<br/>8kb total.|10 tags per blob<br/>128 characters for keys and 256 characters for values.|  
|Updates|May be updated at any time.|May be updated at any time.|  
|Consistency|Strongly consistent with the blob.|Strongly consistent with the blob, and eventually consistent in the secondary index.|  
|Indexing|N/A|Tags are indexed and can be queried with the [Find Blobs by Tags](Find-Blobs-by-Tags.md) operation|  
|Conditions|N/A|Blob operations may use the `x-ms-if-tags` conditional header to only execute the operation if the tags match a given predicate expression.|  
|Encryption|Encrypted at rest with the same encryption key used for the blob.|Encrypted at rest with an encryption key managed by the storage platform.|  
|Pricing|Size of metadata is included in the storage costs for a blob.|Additional fixed cost per tag.|  
|Usage|Returned as headers in  [Get Blob](Get-Blob.md) or [Get Blob Properties](Get-Blob-Properties.md).|Only the Tag Count is returned in Get Blob.<br/>Access to tags is through a dedicated API, [Get Blob Tags](Get-Blob-Tags.md).|  
|Permissions|Read/write access to the blob extends to metadata.|Additional permissions are requried to read/write tags.|  
  
## Permissions
While read/write permissions for blobs extends to blob metadata, these permissions are not sufficient to authorize access to blob tags.
  
Account owners (Shared Key) are authorized to perform all operations against blob tags. However, there are dedicated permissions for callers authorizing with a Shared Access Signature (SAS) or Role-Based Access Control (RBAC). The required permissions are included in the following table.  
  
|Operation|Shared Key|SAS Permission|RBAC Permission|  
|---------|----------|---|----|  
|[Get Blob Tags](Get-Blob-Tags.md)|Authorized|Tags `t`|`Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/read`|  
|[Set Blob Tags](Set-Blob-Tags.md)|Authorized|Tags `t`|`Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/write`|  
|[Find Blobs by Tags](Find-Blobs-by-Tags.md)|Authorized|Find `f`|`Microsoft.Storage/storageAccounts/blobServices/containers/blobs/filter/action`|  
  
## Restrictions
A blob may hold at most 10 tags. Tag keys and values are case sensitive. Tag keys must be between 1 and 128 characters, and tag values must be between 0 and 256 characters. Valid tag key and value characters include:
  
- Lowercase and uppercase letters (a-z, A-Z)  
- Digits (0-9)  
- A space ( )  
- Plus (+), minus (-), period (.), solidus (/), colon (:), equals (=), and underscore (_)  
  
Any request that attempts to set tags beyond these limits will fail with error code 400 (Bad Request).
  
## Billing
The total size of the tags stored on a blob count towards the per-GB storage cost of the blob. In addition, each tag stored and indexed on a blob has a fixed monthly cost.  
  
See [Azure Storage Service Pricing](https://azure.microsoft.com/en-us/pricing/details/storage/) for more details.  
  
