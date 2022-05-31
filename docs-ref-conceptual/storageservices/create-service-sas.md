---
title: Create a service SAS - Azure Storage
description: A service shared access signature (SAS) delegates access to a resource in Azure Blob Storage, Azure Queue Storage, Azure Table Storage, or Azure Files.
author: tamram

ms.date: 11/02/2021
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create a service SAS

A service shared access signature (SAS) delegates access to a resource in just one of the storage services: Azure Blob Storage, Azure Queue Storage, Azure Table Storage, or Azure Files. The URI for a service-level SAS consists of the URI to the resource for which the SAS will delegate access, followed by the SAS token. 

The SAS token is the query string that includes all the information that's required to authorize a request. The token specifies the resource that a client may access, the permissions granted, and the time period during which the signature is valid. 

An SAS can also specify the supported IP address or address range from which requests can originate, the supported protocol with which a request can be made, or an optional access policy identifier that's associated with the request. 

Finally, every SAS token includes a signature.  

> [!CAUTION]
> Shared access signatures are keys that grant permissions to storage resources, and you should protect them just as you would protect an account key. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and SAS URIs should be distributed only on a secure connection, such as HTTPS.  
  
## Authorize a service SAS

You secure an account SAS by using a storage account key. When you create an account SAS, your client application must possess the account key.

To use Azure Active Directory (Azure AD) credentials to secure a SAS for a container or blob, [create a user delegation SAS](create-user-delegation-sas.md).

## Service SAS support for directory-scoped access

A service SAS supports directory scope (`sr=d`) when the authorization version (`sv`) is 2020-02-10 or later and a hierarchical namespace is enabled. The semantics for directory scope (`sr=d`) are similar to those for container scope (`sr=c`), except that access is restricted to a directory and any files and subdirectories within it. When `sr=d` is specified, the `sdd` query parameter is also required.

The string-to-sign format for authorization version 2020-02-10 is unchanged.

## Construct a service SAS

The following image represents the parts of the shared access signature URI. The required parts appear in orange. The fields that make up the SAS token are described in subsequent sections.  

:::image type="content" source="media/ElementsofaSharedAccessSignatureURL.png" alt-text="Diagram of the parameter elements of a shared access signature URL.":::
  
The following sections describe how to specify the parameters that make up the service SAS token.
  
### Specify the `signedVersion` field

The `signedVersion` (`sv`) field contains the service version of the shared access signature. This value specifies the version of Shared Key authorization that's used by this shared access signature (in the `signature` field). The value also specifies the service version for requests that are made with this shared access signature. 

For information about which version is used when you execute requests via a shared access signature, see [Versioning for Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).

For information about how this parameter affects the authorization of requests made with a shared access signature, see [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md).
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedVersion`|`sv`|Required. Supported in version 2012-02-12 and later. The storage service version to use to authorize and handle requests that you make with this shared access signature. For more information, see [Versioning for Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|

#### Determine the version of a legacy SAS request

In legacy scenarios where `signedVersion` isn't used, Blob Storage applies rules to determine the version. For more information about these rules, see [Versioning for Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).  
  
> [!IMPORTANT]
> Client software might experience unexpected protocol behavior when you use a shared access signature URI that uses a storage service version that's newer than the client software. Code that constructs shared access signature URIs should rely on versions that are understood by the client software that makes storage service requests.  
  
### Specify the signed resource (Blob Storage only)

The required `signedResource` (`sr`) field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a blob or container resource in the SAS token.  

| Resource | Parameter value | Supported versions | Description |
|--|--|--|--|
| Blob | b | All | Grants access to the content and metadata of the blob. |
| Blob version | bv | 2018-11-09 and later | Grants access to the content and metadata of the blob version, but not the base blob. |
| Blob snapshot | bs | 2018-11-09 and later | Grants access to the content and metadata of the blob snapshot, but not the base blob. |
| Container | c | All | Grants access to the content and metadata of any blob in the container, and to the list of blobs in the container. |
| Directory | d | 2020-02-10 and later | Grants access to the content and metadata of any blob in the directory, and to the list of blobs in the directory, in a storage account with a hierarchical namespace enabled. If a directory is specified for the `signedResource` field, the `signedDirectoryDepth` (`sdd`) parameter is also required. A directory is always nested within a container. |

### Specify the signed resource (Azure Files)

SAS is supported for Azure Files version 2015-02-21 and later.  
  
The `signedResource` field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a file or share resource on the URI.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedResource`|`sr`|Required.<br /><br /> Specify `f` if the shared resource is a file. Doing so grants access to the content and metadata of the file.<br /><br /> Specify `s` if the shared resource is a share. Doing so grants access to the content and metadata of any file in the share, and to the list of directories and files in the share.|  
  
### Specify query parameters to override response headers (Blob Storage and Azure Files only)

To define values for certain response headers to be returned when the shared access signature is used in a request, you can specify response headers in query parameters. This feature is supported as of version 2013-08-15 for Blob Storage and version 2015-02-21 for Azure Files. Shared access signatures that use this feature must include the `sv` parameter set to `2013-08-15` or later for Blob Storage, or to `2015-02-21` or later for Azure Files.  
  
The response headers and corresponding query parameters are listed in the following table: 
  
|Response header name|Corresponding SAS query parameter|  
|--- |--- |  
|`Cache-Control`|`rscc`|  
|`Content-Disposition`|`rscd`|  
|`Content-Encoding`|`rsce`|  
|`Content-Language`|`rscl`|  
|`Content-Type`|`rsct`|  
  
For example, if you specify the `rsct=binary` query parameter on a shared access signature that's created with version 2013-08-15 or later, the `Content-Type` response header is set to `binary`. This value overrides the `Content-Type` header value that's stored for the blob for a request that uses this shared access signature only.  
  
If you create a shared access signature that specifies response headers as query parameters, you must include them in the string-to-sign that's used to construct the signature string. For more information, see the "[Construct the signature string](#construct-the-signature-string)" section later in this article. For additional examples, see [Service SAS examples](Service-SAS-Examples.md).  
  
### Specify the table name (Table Storage only)

The `tableName` field specifies the name of the table to share.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`tableName`|`tn`|Required. The name of the table to share.|  
  
### Specify the access policy

The access policy portion of the URI indicates the period of time during which the shared access signature is valid and the permissions to be granted to the user. The parts of the URI that make up the access policy are described in the following table: 
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedStart`|`st`|Optional. The time when the shared access signature becomes valid, expressed in one of the accepted ISO 8601 UTC formats. If this parameter is omitted, the current UTC time is used as the start time.<br /><br /> In versions that are earlier than 2012-02-12, the duration between `signedStart` and `signedExpiry` can't exceed one hour unless a container policy is used. For more information about accepted UTC formats, see [Format date/time values](formatting-datetime-values.md).|  
|`signedExpiry`|`se`|Required. The time when the shared access signature becomes invalid, expressed in one of the accepted ISO 8601 UTC formats. You must omit this field if it has been specified in an associated stored access policy. For more information about accepted UTC formats, see [Format date/time values](formatting-datetime-values.md).|  
|`signedPermissions`<sup>1</sup>|`sp`|Required. The permissions that are associated with the shared access signature. The user is restricted to operations that are allowed by the permissions. You must omit this field if it has been specified in an associated stored access policy.|  
|`startPk`<sup>2</sup><br /><br /> `startRk`<sup>2</sup>|`spk`<br /><br /> `srk`|Table Storage only.<br /><br /> Optional, but `startPk` must accompany `startRk`. The minimum partition and row keys that are accessible with this shared access signature. Key values are inclusive. If they're omitted, there's no lower bound on the table entities that can be accessed.|  
|`endPk`<sup>2</sup><br /><br /> `endRk`<sup>2</sup>|`epk`<br /><br /> `erk`|Table Storage only.<br /><br /> Optional, but `endPk` must accompany `endRk`. The maximum partition and row keys that are accessible with this shared access signature. Key values are inclusive. If they're omitted, there's no upper bound on the table entities that can be accessed.|  
  
<sup>1</sup> The `signedPermissions` field is required on the URI unless it's specified as part of a stored access policy.  
<sup>2</sup> The `startPk`, `startRk`, `endPk`, and `endRk` fields can be specified only on Table Storage resources.  
  
### Specify permissions
  
The permissions that are specified for the `signedPermissions` (`sp`) field on the SAS token indicate which operations a client may perform on the resource.

You can combine permissions to permit a client to perform multiple operations with the same SAS. When you construct the SAS, you must include permissions in the following order:

`racwdxltmeop`

Examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. You can't specify a permission designation more than once.  
  
A service SAS can't grant access to certain operations:
  
- Containers, queues, and tables can't be created, deleted, or listed.  
- Container metadata and properties can't be read or written.  
- Queues can't be cleared, and their metadata can't be written.  
- Containers can't be leased.  

To construct a SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-account-sas.md).
  
> [!IMPORTANT]
> Shared access signatures are keys that grant permissions to storage resources, and you should protect them just as you would protect an account key. Perform operations that use shared access signatures only over an HTTPS connection, and distribute shared access signature URIs only on a secure connection, such as HTTPS.  

The permissions that are supported for each resource type are described in the following sections.  
  
#### Permissions for a directory, container, or blob
  
The permissions that are supported for each resource type are described in the following table: 

| Permission | URI symbol | Resource | Version support | Allowed operations |
|--|--|--|--|--|
| Read | r | Container<br />Directory<br />Blob | All | Read the content, blocklist, properties, and metadata of any blob in the container or directory. Use a blob as the source of a copy operation. |
| Add | a | Container<br />Directory<br />Blob | All | Add a block to an append blob. |
| Create | c | Container<br />Directory<br />Blob | All | Write a new blob, snapshot a blob, or copy a blob to a new blob. |
| Write | w | Container<br />Directory<br />Blob | All | Create or write content, properties, metadata, or blocklist. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. |
| Delete | d | Container<br />Directory<br />Blob | All | Delete a blob. For version 2017-07-29 and later, the Delete permission also allows breaking a lease on a blob. For more information, see the [Lease Blob](Lease-Blob.md) operation. |
| Delete version | x | Container<br />Blob | 2019-12-12 and later | Delete a blob version. |
| Permanent delete | y | Blob | 2020-02-10 and later | Permanently delete a blob snapshot or version.|
| List | l | Container<br />Directory | All | List blobs non-recursively. |
| Tags | t | Blob | 2019-12-12 and later | Read or write the tags on a blob. |
| Find | f | Container | 2019-12-12 and later | Find blobs with index tags. |
| Move | m | Container<br />Directory<br />Blob | 2020-02-10 and later | Move a blob or a directory and its contents to a new location. This operation can optionally be restricted to the owner of the child blob, directory, or parent directory if the `saoid` parameter is included on the SAS token and the sticky bit is set on the parent directory. |
| Execute | e | Container<br />Directory<br />Blob | 2020-02-10 and later | Get the system properties and, if the hierarchical namespace is enabled for the storage account, get the POSIX ACL of a blob. If the hierarchical namespace is enabled and the caller is the owner of a blob, this permission grants the ability to set the owning group, POSIX permissions, and POSIX ACL of the blob. doesn't permit the caller to read user-defined metadata. |
| Ownership | o | Container<br />Directory<br />Blob | 2020-02-10 and later | When the hierarchical namespace is enabled, this permission enables the caller to set the owner or the owning group, or to act as the owner when renaming or deleting a directory or blob within a directory that has the sticky bit set. |
| Permissions | p | Container<br />Directory<br />Blob | 2020-02-10 and later | When the hierarchical namespace is enabled, this permission allows the caller to set permissions and POSIX ACLs on directories and blobs. |
| Set Immutability Policy | i | Container<br/>Blob | 2020-06-12 and later | Set or delete the immutability policy or legal hold on a blob. |
  
#### Permissions for a file
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata. Use the file as the source of a copy operation.|  
|Create|c|Create a new file or copy a file to a new file.|  
|Write|w|Create or write content, properties, metadata. Resize the file. Use the file as the destination of a copy operation.|  
|Delete|d|Delete the file.|  
  
#### Permissions for a share  
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, or metadata of any file in the share. Use any file in the share as the source of a copy operation.|  
|Create|c|Create a new file in the share, or copy a file to a new file in the share.|  
|Write|w|For any file in the share, create or write content, properties, or metadata. Resize the file. Use the file as the destination of a copy operation. **Note**: You can't grant permissions to read or write share properties or metadata by using a service SAS. Use an account SAS instead.|  
|Delete|d|Delete any file in the share. **Note**: You can't grant permissions to delete a share by using a service SAS. Use an account SAS instead.|  
|List|l|List files and directories in the share.|  
  
#### Permissions for a queue
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read metadata and properties, including message count. Peek at messages.|  
|Add|a|Add messages to the queue.|  
|Update|u|Update messages in the queue. **Note**: Use the Process permission with Update so that you can first get the message that you want to update.|  
|Process|p|Get and delete messages from the queue.|  
  
#### Permissions for a table
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Query|r|Get entities and query entities.|  
|Add|a|Add entities. **Note**: Add and Update permissions are required for upsert operations.|  
|Update|u|Update entities. **Note**: Add and Update permissions are required for upsert operations.|  
|Delete|d|Delete entities.|  

### Specify an IP address or IP range  

As of version 2015-04-05, the optional `signedIp` (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates doesn't match the IP address or address range that's specified on the SAS token, the request isn't authorized.  
  
When you're specifying a range of IP addresses, note that the range is inclusive. For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.

The following table describes whether to include the `signedIp` field on an SAS token for a specified scenario, based on the client environment and the location of the storage account.

| Client environment | Storage account location | Recommendation |
|--|--|--|
| Client running in Azure | In the same region as the client | An SAS that's provided to the client in this scenario shouldn't include an outbound IP address for the `signedIp` field. Requests that are made from within the same region that use an SAS with a specified outbound IP address will fail.<br /><br/> Instead, use an Azure virtual network to manage network security restrictions. Requests to Azure Storage from within the same region always take place over a private IP address. For more information, see [Configure Azure Storage firewalls and virtual networks](/azure/storage/common/storage-network-security). |
| Client running in Azure | In a different region from the client | An SAS that's provided to the client in this scenario may include a public IP address or range of addresses for the `signedIp` field. A request made with the SAS must originate from the specified IP address or range of addresses. |
| Client running on-premises or in a different cloud environment | In any Azure region | An SAS that's provided to the client in this scenario may include a public IP address or range of addresses for the `signedIp` field. A request made with the SAS must originate from the specified IP address or range of addresses.<br /><br /> If the request passes through a proxy or gateway, provide the public outbound IP address of that proxy or gateway for the `signedIp` field. |
  
### Specify the HTTP protocol  

As of version 2015-04-05, the optional `signedProtocol` (`spr`) field specifies the protocol that's permitted for a request made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`).  The default value is `https,http`.  Note that HTTP only isn't a permitted value.  
  
### Specify table access ranges  

The `startPk`, `startRk`, `endPk`, and `endRk` fields define a range of table entities that are associated with a shared access signature. Table queries return only results that are within the range, and attempts to use the shared access signature to add, update, or delete entities outside this range will fail. 

If `startPk` equals `endPk`, the shared access signature authorizes access to entities in only one partition in the table. 

If `startPk` equals `endPk` and `startRk` equals `endRk`, the shared access signature can access only one entity in one partition. 

To understand how these fields constrain access to entities in a table, refer to the following table:  
  
|Fields present|Scope of constraint|  
|--------------------|-------------------------|  
|`startPk`|partitionKey >= `startPk`|  
|`endPk`|partitionKey <= `endPk`|  
|`startPk`, `startRk`|(partitionKey > `startPk`) \|\| (partitionKey == `startPk` && rowKey >= `startRk`)|  
|`endPk`, `endRk`|(partitionKey < `endPk`) \|\| (partitionKey == `endPk` && rowKey <= `endRk`)|  

### Specify the directory depth

When a hierarchical namespace is enabled and the `signedResource` field specifies a directory (`sr=d`), you must also specify the `signedDirectoryDepth` (`sdd`) field to indicate the number of subdirectories under the root directory. The value of the `sdd` field must be a non-negative integer.

For example, the root directory `https://{account}.blob.core.windows.net/{container}/` has a depth of 0. Each subdirectory within the root directory adds to the depth by 1. The directory `https://{account}.blob.core.windows.net/{container}/d1/d2` has a depth of 2.  

This field is supported with version 2020-02-10 or later.
  
### Specify the signed identifier  

When you specify the `signedIdentifier` field on the URI, you relate the specified shared access signature to a corresponding stored access policy. A stored access policy provides an additional measure of control over one or more shared access signatures, including the ability to revoke the signature if needed. Each container, queue, table, or share can have up to five stored access policies.  
  
The following table describes how to refer to a signed identifier on the URI:  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedIdentifier`|`si`|Optional. A unique value of up to 64 characters that correlates to an access policy that's specified for the container, queue, or table.|  
  
A stored access policy includes a signed identifier, a value of up to 64 characters that's unique within the resource. You can specify the value of this signed identifier for the `signedidentifier` field in the URI for the shared access signature. When you specify a signed identifier on the URI, you associate the signature with the stored access policy. To establish a container-level access policy by using the REST API, see [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md).  

### Specify the encryption scope

By using the `signedEncryptionScope` field on the URI, you can specify the encryption scope that the client application can use. It enforces the server-side encryption with the specified encryption scope when you upload blobs (PUT) with the SAS token. The GET and HEAD will not be restricted and performed as before. 

The following table describes how to refer to a signed encryption scope on the URI:

|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedEncryptionScope`|`ses`|Optional. Indicates the encryption scope to use to encrypt the request contents.| 

This field is supported with version 2020-12-06 or later. If you add the `ses` before the supported version, the service returns error response code 403 (Forbidden).

If you set the default encryption scope for the container or file system, the `ses` query parameter respects the container encryption policy. If there's a mismatch between the `ses` query parameter and `x-ms-default-encryption-scope` header, and the `x-ms-deny-encryption-scope-override` header is set to `true`, the service returns error response code 403 (Forbidden).

When you provide the `x-ms-encryption-scope` header and the `ses` query parameter in the PUT request, the service returns error response code 400 (Bad Request) if there's a mismatch.

### Specify the signature  

You use the signature part of the URI to authorize the request that's made with the shared access signature. Azure Storage uses a Shared Key authorization scheme to authorize a service SAS. 

The following table describes how to specify the signature on the URI:  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signature`|`sig`|The string-to-sign is a unique string that's constructed from the fields and that must be verified to authorize the request. The signature is a hash-based message authentication code (HMAC) that you compute over the string-to-sign and key by using the SHA256 algorithm, and then encode by using Base64 encoding.|  
  
#### Construct the signature string  

To construct the signature string of a shared access signature, first construct the string-to-sign from the fields that make up the request, encode the string as UTF-8, and then compute the signature by using the HMAC-SHA256 algorithm. The fields that are included in the string-to-sign must be URL-decoded.  

##### Version 2020-12-06 and later

Version 2020-12-06 adds support for the signed encryption scope field. To construct the string-to-sign for Blob Storage resources, use the following format: 

``` 
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedVersion + "\n" +  
               signedResource + "\n" +
               signedSnapshotTime + "\n" +
               signedEncryptionScope + "\n" +
               rscc + "\n" +  
               rscd + "\n" +  
               rsce + "\n" +  
               rscl + "\n" +  
```

##### Version 2018-11-09 and later
  
Version 2018-11-09 adds support for the signed resource and signed blob snapshot time fields. These fields must be included in the string-to-sign. To construct the string-to-sign for Blob Storage resources, use the following format: 
  
``` 
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedVersion + "\n" +  
               signedResource + "\n"
               signedSnapshotTime + "\n" +
               rscc + "\n" +  
               rscd + "\n" +  
               rsce + "\n" +  
               rscl + "\n" +  
               rsct  
```  

##### Version 2015-04-05 and later
  
Version 2015-04-05 adds support for the signed IP and signed protocol fields. These fields must be included in the string-to-sign. To construct the string-to-sign for Blob Storage or Azure Files resources, use the following format: 
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedVersion + "\n" +  
               rscc + "\n" +  
               rscd + "\n" +  
               rsce + "\n" +  
               rscl + "\n" +  
               rsct  
```  
  
 To construct the string-to-sign for Table Storage resources, use the following format: 
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedVersion + "\n" +  
               startingPartitionKey + "\n"  
               startingRowKey + "\n"  
               endingPartitionKey + "\n"  
               endingRowKey  
  
```  
  
 To construct the string-to-sign for Queue Storage resources, use the following format: 
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedVersion  
  
```  
  
##### Version 2013-08-15 through 2015-02-21
  
To construct the string-to-sign for Blob Storage or Azure Files resources by using version 2013-08-15 through 2015-02-21, use the following format. For Azure Files, SAS is supported as of version 2015-02-21.  
  
```  
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedVersion + "\n" +  
               rscc + "\n" +  
               rscd + "\n" +  
               rsce + "\n" +  
               rscl + "\n" +  
               rsct  
```  
  
To construct the string-to-sign for a table, use the following format: 
  
```  
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedVersion + "\n" +  
               startPk + "\n" +  
               startRk + "\n" +  
               endPk + "\n" +  
               endRk  
  
```  
  
To construct the string-to-sign for a queue, use the following format: 
  
```  
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedVersion 
```  
  
##### Version 2012-02-12
  
To construct the string-to-sign for Blob Storage resources for version 2012-02-12, use the following format: 
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedVersion  
```  
  
##### Versions earlier than 2012-02-12
  
 To construct the string-to-sign for Blob Storage resources for versions that are earlier than 2012-02-12, use the following format: 
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier  
  
```  
  
When you're constructing the string to be signed, keep in mind the following: 
  
- If a field is optional and not provided as part of the request, specify an empty string for that field. Be sure to include the newline character (\n) after the empty string.  
  
- String-to-sign for a table must include the additional parameters, even if they're empty strings.  
  
- The `signedpermission` portion of the string must include the permission designations in a fixed order that's specific to each resource type. Any combination of these permissions is acceptable, but the order of permission letters must match the order in the following table.  
  
    |Resource type|Order of permissions|  
    |-------------------|-----------------------------|  
    |Blob|racwd|  
    |Container|racwdl|  
    |Queue|raup|  
    |File|rcwd|  
    |Share|rcwdl|  
    |Table|raud|  
  
    For example, examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once isn't permitted.  

- Provide a value for the `signedIdentifier` portion of the string if you're associating the request with a stored access policy.  
  
- A shared access signature that specifies a storage service version that's earlier than 2012-02-12 can share only a blob or container, and it must omit `signedVersion` and the newline character before it.  
  
- The `canonicalizedResource` portion of the string is a canonical path to the signed resource. It must include the service name (Blob Storage, Table Storage, Queue Storage, or Azure Files) for version 2015-02-21 or later, the storage account name, and the resource name, and it must be URL-decoded. Names of blobs must include the blob’s container. Table names must be lowercase.

The canonicalized resource string for a container, queue, table, or file share must omit the trailing slash (/) for a SAS that provides access to that object.

The following examples show how to construct the `canonicalizedResource` portion of the string, depending on the type of resource.  
  
**Containers**  

For version 2015-02-21 and later: 

```
URL = https://myaccount.blob.core.windows.net/music  
canonicalizedResource = "/blob/myaccount/music"  
```  

For versions earlier than 2015-02-21: 

```  
URL = https://myaccount.blob.core.windows.net/music
canonicalizedResource = "/myaccount/music"  
```  

**Blobs**  

For version 2015-02-21 and later: 

```  
URL = https://myaccount.blob.core.windows.net/music/intro.mp3  
canonicalizedResource = "/blob/myaccount/music/intro.mp3"  

```  

For versions earlier than 2015-02-21: 

```  
URL = https://myaccount.blob.core.windows.net/music/intro.mp3
canonicalizedResource = "/myaccount/music/intro.mp3"  
```  

**File Shares**  

```  
URL = https://myaccount.file.core.windows.net/music
canonicalizedResource = "/file/myaccount/music"  
```  

**Files**  

```  
URL = https://myaccount.file.core.windows.net/music/intro.mp3
canonicalizedResource = "/file/myaccount/music/intro.mp3"  
```  

**Queues**  

For version 2015-02-21 and later: 

```  
URL = https://myaccount.queue.core.windows.net/thumbnails  
canonicalizedResource = "/queue/myaccount/thumbnails"  

```  

For versions earlier than 2015-02-21: 

```  
URL = https://myaccount.queue.core.windows.net/thumbnails  
canonicalizedResource = "/myaccount/thumbnails"  

```  

**Tables**  

If the signed resource is a table, ensure that the table name is lowercase in the canonicalized format.  

For version 2015-02-21 and later: 

```  
URL = https://myaccount.table.core.windows.net/Employees(PartitionKey='Jeff',RowKey='Price')  
canonicalizedResource = "/table/myaccount/employees"  

```  

For versions earlier than 2015-02-21: 

```  
URL = https://myaccount.table.core.windows.net/Employees(PartitionKey='Jeff',RowKey='Price')  
canonicalizedResource = "/myaccount/employees"  

```  

## Lifetime and revocation of a shared access signature  

Shared access signatures grant users access rights to storage account resources. When you're planning to use a SAS, think about the lifetime of the SAS and whether your application might need to revoke access rights under certain circumstances.  

### Ad hoc SAS versus stored access policy

A service SAS can take one of two forms:

- **Ad hoc SAS**: When you create an ad hoc SAS, the start time, expiration time, and permissions for the SAS are all specified in the SAS URI (or implied, if the start time is omitted). Any type of SAS can be an ad hoc SAS.

    You can manage the lifetime of an ad hoc SAS by using the `signedExpiry` field. If you want to continue to grant a client access to the resource after the expiration time, you must issue a new signature. We recommend that you keep the lifetime of a shared access signature short. Prior to version 2012-02-12, a shared access signature not associated with a stored access policy could not have an active period that exceeded one hour.

- **SAS with stored access policy**: A stored access policy is defined on a resource container, which can be a blob container, table, queue, or file share. You can use the stored access policy to manage constraints for one or more shared access signatures. When you associate a SAS with a stored access policy, the SAS inherits the constraints (that is, the start time, expiration time, and permissions) that are defined for the stored access policy.

    The stored access policy is represented by the `signedIdentifier` field on the URI. A stored access policy provides an additional measure of control over one or more shared access signatures, including the ability to revoke the signature if needed.  

### Revoke a SAS

Because a SAS URI is a URL, anyone who obtains the SAS can use it, regardless of who originally created it. If a SAS is published publicly, it can be used by anyone in the world. An SAS grants access to resources to anyone who possesses it until one of four things happens:

* The expiration time that's specified on an ad hoc SAS is reached.

* The expiration time that's specified on the stored access policy referenced by the SAS is reached, if a stored access policy is referenced and the access policy specifies an expiration time. 

  The expiration time can be reached either because the interval elapses or because you've modified the stored access policy to have an expiration time in the past, which is one way to revoke the SAS.

* The stored access policy that's referenced by the SAS is deleted, which revokes the SAS. If Azure Storage can't locate the stored access policy that's specified in the shared access signature, the client can't access the resource that's indicated by the URI.

    If you re-create the stored access policy with exactly the same name as the deleted policy, all existing SAS tokens will again be valid, according to the permissions associated with that stored access policy. This assumes that the expiration time on the SAS has not passed. If you intend to revoke the SAS, be sure to use a different name when you re-create the access policy with an expiration time in the future.

* The account key that was used to create the SAS is regenerated. Regenerating an account key causes all application components that use that key to fail to authorize until they're updated to use either the other valid account key or the newly regenerated account key. Regenerating the account key is the only way to immediately revoke an ad hoc SAS.

> [!IMPORTANT]
> A shared access signature URI is associated with the account key that's used to create the signature and the associated stored access policy, if applicable. If no stored access policy is specified, the only way to revoke a shared access signature is to change the account key.

As a best practice, we recommend that you use a stored access policy with a service SAS. If you choose not to use a stored access policy, be sure to keep the period during which the ad hoc SAS is valid short. For more information about associating a service SAS with a stored access policy, see [Define a stored access policy](define-stored-access-policy.md).  
  
## Service SAS example

The following example shows a service SAS URI that provides read and write permissions to a blob. 

```
https://myaccount.blob.core.windows.net/sascontainer/sasblob.txt?sv=2019-02-02&st=2019-04-29T22%3A18%3A26Z&se=2019-04-30T02%3A23%3A26Z&sr=b&sp=rw&sip=168.1.5.60-168.1.5.70&spr=https&sig=Z%2FRHIX5Xcg0Mq2rqI3OlWTjEg2tYkboXr1P9ZUXDtkk%3D
```

Each part of the URI is described in the following table:

| Name | SAS portion | Description |
| --- | --- | --- |
| Resource URI |`https://myaccount.blob.core.windows.net/sascontainer/sasblob.txt` |The address of the blob. We highly recommend that you use HTTPS. |
| Azure Storage version |`sv=2019-02-02` |For Azure Storage version 2012-02-12 and later, this parameter indicates the version to use. |
| Start time |`st=2019-04-29T22%3A18%3A26Z` |Specified in UTC time. If you want the SAS to be valid immediately, omit the start time. |
| Expiration time |`se=2019-04-30T02%3A23%3A26Z` |Specified in UTC time. |
| Resource |`sr=b` |The resource is a blob. |
| Permissions |`sp=rw` |The permissions granted by the SAS include Read (r) and Write (w). |
| IP range |`sip=168.1.5.60-168.1.5.70` |The range of IP addresses from which a request will be accepted. |
| Protocol |`spr=https` |Only requests that use HTTPS are permitted. |
| Signature |`sig=Z%2FRHIX5Xcg0Mq2rqI3OlWTjEg2tYkboXr1P9ZUXDtkk%3D` |Used to authorize access to the blob. The signature is an HMAC that's computed over a string-to-sign and key by using the SHA256 algorithm, and then encoded by using Base64 encoding. |
  
## See also

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Create a user delegation SAS](create-user-delegation-sas.md)
- [Create an account SAS](create-account-sas.md)
- [SAS error codes](SAS-Error-Codes.md)
