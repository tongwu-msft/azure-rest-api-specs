---
title: Create a service SAS - Azure Storage
description: A service shared access signature (SAS) delegates access to a resource in the Blob, Queue, Table, or File service.
author: tamram

ms.date: 12/22/2020
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create a service SAS

A service SAS delegates access to a resource in just one of the storage services: the Blob, Queue, Table, or File service. The URI for a service-level shared access signature (SAS) consists of the URI to the resource for which the SAS will delegate access, followed by the SAS token. The SAS token is the query string that includes all of the information required to authorize a request. It specifies the resource that a client may access, the permissions granted, and the time interval over which the signature is valid. A SAS may also specify the supported IP address or address range from which requests can originate, the supported protocol with which a request can be made, an optional access policy identifier associated with the request. Finally, every SAS token includes a signature.  

> [!CAUTION]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  
  
## Authorization of a service SAS

A service SAS is secured using the storage account key. To create a service SAS, a client application must possess the account key.

To use Azure AD credentials to secure a SAS for a container or blob, create a user delegation SAS. For more information, see [Create a user delegation SAS](create-user-delegation-sas.md).

## Service SAS support for directory scoped access

A service SAS supports directory scope (`sr=d`) when the authentication version (`sv`) is 2020-02-10 or higher and a hierarchical namespace (HNS) is enabled. The semantics for directory scope (`sr=d`) are similar to container scope (`sr=c`), except that access is restricted to a directory and any files and subdirectories beneath it. When `sr=d` is specified, the `sdd` query parameter is also required.

The string-to-sign format for authentication version 2020-02-10 is unchanged.

## Construct a service SAS

The following figure represents the parts of the shared access signature URI. Required parts appear in orange. The fields comprising the SAS token are described in the subsequent sections.  

:::image type="content" source="media/ElementsofaSharedAccessSignatureURL.png" alt-text="Parameter elements of a SAS URL":::
  
The following sections describe how to specify the parameters that comprise the service SAS token.
  
### Specifying the signed version field

The `signedVersion` (`sv`) field contains the service version of the shared access signature. This value specifies the version of Shared Key authorization used by this shared access signature (in the `signature` field), and also specifies the service version for requests made with this shared access signature. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) for information on which version is used when to execute requests via a shared access signature. See [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md) for details about how this parameter affects the authorization of requests made with a shared access signature.
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedVersion`|`sv`|Required. Supported in versions 2012-02-12 and newer. The storage service version to use to authorize requests made with this shared access signature, and the service version to use when handling requests made with this shared access signature. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md for information about which version is used when to execute requests via a shared access signature, and how clients executing the request can control the version using the `api-version` query parameter or the `x-ms-version` header.|

#### Determining the version of a legacy shared access signature request

In legacy scenarios where `signedVersion` is not used, the Blob service applies rules to determine the version. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) for more information about these rules.  
  
> [!IMPORTANT]
> Client software might experience unexpected protocol behavior when using a shared access signature URI that uses a storage service version that is newer than the client software. Code that constructs shared access signature URIs should rely on versions that are understood by client software that makes storage service requests.  
  
### Specifying the signed resource (Blob service only)

The required `signedResource` (`sr`) field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a blob, or container resource in the SAS token.  

| Resource | Parameter value | Supported versions | Description |
|--|--|--|
| Blob | b | All | Grants access to the content and metadata of the blob. |
| Blob version | bv | Version 2018-11-09 and later | Grants access to the content and metadata of the blob version, but not the base blob. |
| Blob snapshot | bs | Version 2018-11-09 and later | Grants access to the content and metadata of the blob snapshot, but not the base blob. |
| Container | c | All | Grants access to the content and metadata of any blob in the container, and to the list of blobs in the container. |
| Directory | d | Version 2020-02-10 and later | Grants access to the content and metadata of any blob in the directory, and to the list of blobs in the directory, in a storage account with a hierarchical namespace enabled. If a directory is specified for the `signedResource` field, then the `signedDirectoryDepth` (`sdd`) parameter is also required. A directory is always beneath a container. |

### Specifying the signed resource (File service)

SAS is supported for the File service in version 2015-02-21 and later.  
  
The `signedResource` field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a file or share resource on the URI.  
  
|Field name|Query Parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedResource`|`sr`|Required.<br /><br /> Specify `f` if the shared resource is a file. This grants access to the content and metadata of the file.<br /><br /> Specify `s` if the shared resource is a share. This grants access to the content and metadata of any file in the share, and to the list of directories and files in the share.|  
  
### Specifying query parameters to override response headers (Blob and File services only)

To define values for certain response headers to be returned when the shared access signature is used in a request, you can specify response headers in query parameters. This feature is supported beginning with version 2013-08-15 for the Blob service and version 2015-02-21 for the File service. Shared access signatures using this feature must include the `sv` parameter set to `2013-08-15` or later for the Blob service, or to `2015-02-21` or later for the File service.  
  
The response headers and corresponding query parameters are as follows:  
  
|Response header name|Corresponding SAS query parameter|  
|--------------------------|---------------------------------------|  
|`Cache-Control`|`rscc`|  
|`Content-Disposition`|`rscd`|  
|`Content-Encoding`|`rsce`|  
|`Content-Language`|`rscl`|  
|`Content-Type`|`rsct`|  
  
For example, if you specify the `rsct=binary` query parameter on a shared access signature created with version 2013-08-15 or later, the `Content-Type` response header is set to `binary`. This value overrides the `Content-Type` header value stored for the blob for a request using this shared access signature only.  
  
If you create a shared access signature that specifies response headers as query parameters, you must include those in the string-to-sign that is used to construct the signature string. See the **Constructing the Signature String** section below for details, and [Service SAS Examples](Service-SAS-Examples.md) for additional examples.  
  
### Specifying the table name (Table service only)

The `tableName` field specifies the name of the table to share.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`tableName`|`tn`|Required. The name of the table to share.|  
  
### Specifying the access policy

The access policy portion of the URI indicates the period of time over which the shared access signature is valid and the permissions to be granted to the user. The parts of the URI described in the following table comprise the access policy.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedStart`|`st`|Optional. The time at which the shared access signature becomes valid, expressed in one of the accepted ISO 8601 UTC formats. If omitted, the current UTC time is used as the start time.<br /><br /> In versions before 2012-02-12, the duration between `signedStart` and `signedExpiry` cannot exceed one hour unless a container policy is used. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).|  
|`signedExpiry`|`se`|Required. The time at which the shared access signature becomes invalid, expressed in one of the accepted ISO 8601 UTC formats. This field must be omitted if it has been specified in an associated stored access policy. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).|  
|`signedPermissions`|`sp`|Required. The permissions associated with the shared access signature. The user is restricted to operations allowed by the permissions. This field must be omitted if it has been specified in an associated stored access policy.|  
|`startPk`<br /><br /> `startRk`|`spk`<br /><br /> `srk`|Table service only.<br /><br /> Optional, but `startPk` must accompany `startRk`. The minimum partition and row keys accessible with this shared access signature. Key values are inclusive. If omitted, there is no lower bound on the table entities that can be accessed.|  
|`endPk`<br /><br /> `endRk`|`epk`<br /><br /> `erk`|Table service only.<br /><br /> Optional, but `endPk` must accompany `endRk`. The maximum partition and row keys accessible with this shared access signature. Key values are inclusive. If omitted, there is no upper bound on the table entities that can be accessed.|  
  
The `signedPermissions` field is required on the URI unless it is specified as part of a stored access policy. The `startPk`, `startRk`, `endPk`, and `endRk` fields can only be specified on a table resource.  
  
### Specifying permissions
  
The permissions specified for the `signedPermissions` (`sp`) field on the SAS token indicate which operations a client may perform on the resource.

Permissions can be combined to permit a client to perform multiple operations with the same SAS. When you construct the SAS, you must include permissions in the following order:

`racwdxltmeop`

Examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once is not permitted.  
  
A service SAS cannot grant access to certain operations:
  
- Containers, queues, and tables cannot be created, deleted, or listed.  
- Container metadata and properties cannot be read or written.  
- Queues cannot be cleared and their metadata may not be written.  
- Containers cannot be leased.  

To construct a SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-account-sas.md).
  
> [!IMPORTANT]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

The tables in the following sections show the permissions supported for each resource type.  
  
#### Permissions for a directory, container, or blob
  
The following table shows the permissions supported for each resource type.  

| Permission | URI symbol | Resource | Version support | Allowed operations |
|--|--|--|--|--|
| Read | r | Container<br />Directory<br />Blob | All | Read the content, block list, properties, and metadata of any blob in the container or directory. Use a blob as the source of a copy operation. |
| Add | a | Container<br />Directory<br />Blob | All | Add a block to an append blob. |
| Create | c | Container<br />Directory<br />Blob | All | Write a new blob, snapshot a blob, or copy a blob to a new blob. |
| Write | w | Container<br />Directory<br />Blob | All | Create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. |
| Delete | d | Container<br />Directory<br />Blob | All | Delete a blob. For version 2017-07-29 and later, the Delete permission also allows breaking a lease on a blob. For more information, see the [Lease Blob](Lease-Blob.md) operation. |
| Delete version | x | Container<br />Blob | Version 2019-12-12 or later | Delete a blob version. |
| Permanent delete | y | Blob | Version 2020-02-10 or later | Permanently delete a blob snapshot or version.|
| List | l | Container<br />Directory | All | List blobs non-recursively. |
| Tags | t | Blob | Version 2019-12-12 or later | Read or write the tags on a blob. |
| Move | m | Container<br />Directory<br />Blob | Version 2020-02-10 or later | Move a blob or a directory and its contents to a new location. This operation can optionally be restricted to the owner of the child blob, directory, or parent directory if the `saoid` parameter is included on the SAS token and the sticky bit is set on the parent directory. |
| Execute | e | Container<br />Directory<br />Blob | Version 2020-02-10 or later | Get the system properties and, if the hierarchical namespace is enabled for the storage account, get the POSIX ACL of a blob. If the hierarchical namespace is enabled and the caller is the owner of a blob, this permission grants the ability to set the owning group, POSIX permissions, and POSIX ACL of the blob. Does not permit the caller to read user-defined metadata. |
| Ownership | o | Container<br />Directory<br />Blob | Version 2020-02-10 or later | When the hierarchical namespace is enabled, this permission enables the caller to set the owner or the owning group, or to act as the owner when renaming or deleting a directory or blob within a directory that has the sticky bit set. |
| Permissions | p | Container<br />Directory<br />Blob | Version 2020-02-10 or later | When the hierarchical namespace is enabled, this permission allows the caller to set permissions and POSIX ACLs on directories and blobs. |
  
#### Permissions for a file
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata. Use the file as the source of a copy operation.|  
|Create|c|Create a new file or copy a file to a new file.|  
|Write|w|Create or write content, properties, metadata. Resize the file. Use the file as the destination of a copy operation.|  
|Delete|d|Delete the file.|  
  
#### Permission for a share  
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties or metadata of any file in the share. Use any file in the share as the source of a copy operation.|  
|Create|c|Create a new file in the share, or copy a file to a new file  in the share.|  
|Write|w|For any file in the share, create or write content, properties or metadata. Resize the file. Use the file as the destination of a copy operation. **Note:**  You cannot grant permissions to read or write share properties or metadata with a service SAS. Use an account SAS instead.|  
|Delete|d|Delete any file in the share. **Note:**  You cannot grant permissions to delete a share with a service SAS. Use an account SAS instead.|  
|List|l|List files and directories in the share.|  
  
#### Permissions for a queue
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read metadata and properties, including message count. Peek at messages.|  
|Add|a|Add messages to the queue.|  
|Update|u|Update messages in the queue. **Note:**  Use the Process permission with Update so you can first get the message you want to update.|  
|Process|p|Get and delete messages from the queue.|  
  
#### Permissions for a table
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Query|r|Get entities and query entities.|  
|Add|a|Add entities. **Note:**  Add and Update permissions are required for upsert operations.|  
|Update|u|Update entities. **Note:**  Add and Update permissions are required for upsert operations.|  
|Delete|d|Delete entities.|  

### Specifying IP address or IP range  

Beginning with version 2015-04-05, the optional `signedIp` (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates does not match the IP address or address range specified on the SAS token, the request is not authorized.  
  
When specifying a range of IP addresses, note that the range is inclusive. For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.  
  
> [!IMPORTANT]
> A SAS used by a client that is in the same Azure region as the storage account may not include a public outbound IP address for the `signedIp` field. Requests made from within the same region using a SAS with a public outbound IP address specified will fail.

### Specifying the HTTP protocol  

Beginning with version 2015-04-05, the optional `signedProtocol` (`spr`) field specifies the protocol permitted for a request made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`).  The default value is `https,http`.  Note that HTTP only is not a permitted value.  
  
### Specifying table access ranges  

The `startPk`, `startRk`, `endPk`, and `endRk` fields define a range of table entities associated with a shared access signature. Table queries will only return results that are within the range, and attempts to use the shared access signature to add, update, or delete entities outside this range will fail. If `startPk` equals `endPk`, the shared access signature only authorizes access to entities in one partition in the table. If `startPk` equals `endPk` and `startRk` equals `endRk`, the shared access signature can only access one entity  in one partition. Use the following table to understand how these fields constrain access to entities in a table.  
  
|Fields present|Scope of constraint|  
|--------------------|-------------------------|  
|`startPk`|partitionKey >= `startPk`|  
|`endPk`|partitionKey <= `endPk`|  
|`startPk`, `startRk`|(partitionKey > `startPk`) &#124;&#124; (partitionKey == `startPk` && rowKey >= `startRk`)|  
|`endPk`, `endRk`|(partitionKey < `endPk`) &#124;&#124; (partitionKey == `endPk` && rowKey <= `endRk`)|  

### Specify the directory depth

When a hierarchical namespace is enabled and the `signedResource` field specifies a directory (`sr=d`), then you must also specify the `signedDirectoryDepth` (`sdd`) field to indicate the number of subdirectories under the root directory. The value of the `sdd` field must be a non-negative integer.

For example, the root directory `https://{account}.blob.core.windows.net/{container}/` has a depth of 0. Each subdirectory beneath the root directory adds to the depth by one. The directory `https://{account}.blob.core.windows.net/{container}/d1/d2` has a depth of two.  

This field is supported with version 2020-02-10 or later.
  
### Specifying the signed identifier  

Specifying the `signedIdentifier` field on the URI relates the given shared access signature to a corresponding stored access policy. A stored access policy provides an additional measure of control over one or more shared access signatures, including the ability to revoke the signature if needed. Each container, queue, table, or share can have up to 5 stored access policies.  
  
The following table describes how to refer to a signed identifier on the URI.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedIdentifier`|`si`|Optional. A unique value up to 64 characters in length that correlates to an access policy specified for the container, queue, or table.|  
  
A stored access policy includes a signed identifier, a value up to 64 characters long that is unique within the resource. The value of this signed identifier can be specified for the `signedidentifier` field in the URI for the shared access signature. Specifying a signed identifier on the URI associates the signature with the stored access policy. To establish a container-level access policy using the REST API, see [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md).  

### Specifying the signature  

The signature part of the URI is used to authorize the request made with the shared access signature. Azure Storage uses a Shared Key authorization scheme to authorize a service SAS. The following table describes how to specify the signature on the URI.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signature`|`sig`|The string-to-sign is a unique string constructed from the fields that must be verified in order to authorize the request. The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding.|  
  
#### Constructing the signature string  

To construct the signature string of a shared access signature, first construct the string-to-sign from the fields comprising the request, then encode the string as UTF-8 and compute the signature using the HMAC-SHA256 algorithm. Note that fields included in the string-to-sign must be URL-decoded.  

##### Version 2018-11-09 and later
  
Version 2018-11-09 adds support for the signed resource and signed blob snapshot time fields. These must be included in the string-to-sign. To construct the string-to-sign for Blob service resources, use the following format:  
  
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
  
 Version 2015-04-05 adds support for the signed IP  and signed protocol fields. These must be included in the string-to-sign. To construct the string-to-sign for Blob or File service resources, use the following format:  
  
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
  
 To construct the string-to-sign for Table service resources, use the following format:  
  
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
  
 To construct the string-to-sign for Queue service resources, use the following format:  
  
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
  
##### Version 2013-08-15 through version 2015-02-21
  
To construct the string-to-sign for Blob or File service resources using the 2013-08-15 version through version 2015-02-21, use the following format. Note that for the File service, SAS is supported beginning with version 2015-02-21.  
  
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
  
To construct the string-to-sign for Blob service resources for version 2012-02-12, use the following format:  
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier + "\n" +  
               signedVersion  
```  
  
##### Versions Prior to 2012-02-12
  
 To construct the string-to-sign for Blob service resources for versions prior to 2012-02-12, use the following format:  
  
```
StringToSign = signedPermissions + "\n" +  
               signedStart + "\n" +  
               signedExpiry + "\n" +  
               canonicalizedResource + "\n" +  
               signedIdentifier  
  
```  
  
When constructing the string to be signed, keep in mind the following:  
  
- If a field is optional and not provided as part of the request, specify an empty string for that field. Be sure to include the newline character (\n) after the empty string.  
  
- String-to-sign for a table must include the additional parameters, even if they are empty strings.  
  
- The `signedpermission` portion of the string must include the permission designations in a fixed order that is specific to each resource type. Any combination of these permissions is acceptable, but the order of permission letters must match the order in the following table.  
  
    |Resource type|Ordering of permissions|  
    |-------------------|-----------------------------|  
    |Blob|racwd|  
    |Container|racwdl|  
    |Queue|raup|  
    |File|rcwd|  
    |Share|rcwdl|  
    |Table|raud|  
  
    For example, examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once is not permitted.  

- Provide a value for the `signedIdentifier` portion of the string if you are associating the request with a stored access policy.  
  
- A shared access signature that specifies a storage service version before 2012-02-12 can only share a blob or container, and must omit `signedVersion` and the newline before it.  
  
- The `canonicalizedResource` portion of the string is a canonical path to the signed resource. It must include the service name (blob, table, queue or file) for version 2015-02-21 or later, the storage account name, and the resource name, and must be URL-decoded. Names of blobs must include the blob’s container. Table names must be lower-case.

The canonicalized resource string for a container, queue, table, or file share must omit the trailing slash ('/') for a SAS that provides access to that object.

The following examples show how to construct the `canonicalizedResource` portion of the string, depending on the type of resource.  
  
**Containers**  

For version 2015-02-21 and later:  

```
URL = https://myaccount.blob.core.windows.net/music  
canonicalizedResource = "/blob/myaccount/music"  
```  

For versions prior to 2015-02-21:  

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

For versions prior to 2015-02-21:  

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

For versions prior to 2015-02-21:  

```  
URL = https://myaccount.queue.core.windows.net/thumbnails  
canonicalizedResource = "/myaccount/thumbnails"  

```  

**Tables**  

If the signed resource is a table, assure the table name is lower-case in the canonicalized format.  

For version 2015-02-21 and later:  

```  
URL = https://myaccount.table.core.windows.net/Employees(PartitionKey='Jeff',RowKey='Price')  
canonicalizedResource = "/table/myaccount/employees"  

```  

For versions prior to 2015-02-21:  

```  
URL = https://myaccount.table.core.windows.net/Employees(PartitionKey='Jeff',RowKey='Price')  
canonicalizedResource = "/myaccount/employees"  

```  

## Lifetime and revocation of a shared access signature  

Shared access signatures grant users access rights to storage account resources. When planning to use a SAS, think about the lifetime of the SAS and whether your application may need to revoke access rights under certain circumstances.  

### Ad hoc SAS versus stored access policy

A service SAS can take one of two forms:

- **Ad hoc SAS:** When you create an ad hoc SAS, the start time, expiry time, and permissions for the SAS are all specified in the SAS URI (or implied, if start time is omitted). Any type of SAS can be an ad hoc SAS.

    You can manage the lifetime of an ad hoc SAS via the `signedExpiry` field. If you want to continue to grant a client access to the resource after the expiry time, you must issue a new signature. It’s recommended that you keep the lifetime of a shared access signature short. Prior to version 2012-02-12, a shared access signature not associated with a stored access policy could not have an active period that exceeded one hour.

- **SAS with stored access policy:** A stored access policy is defined on a resource container, which can be a blob container, table, queue, or file share. The stored access policy can be used to manage constraints for one or more shared access signatures. When you associate a SAS with a stored access policy, the SAS inherits the constraints&mdash;the start time, expiry time, and permissions&mdash;defined for the stored access policy.

    The stored access policy is represented by the `signedIdentifier` field on the URI. A stored access policy provides an additional measure of control over one or more shared access signatures, including the ability to revoke the signature if needed.  

### Revocation of a SAS

Because a SAS URI is a URL, anyone that obtains the SAS can use it, regardless of who originally created it. If a SAS is published publicly, it can be used by anyone in the world. A SAS grants access to resources to anyone possessing it until one of four things happens:

1. The expiry time specified on an ad hoc SAS is reached.

1. The expiry time specified on the stored access policy referenced by the SAS is reached, if a stored access policy is referenced, and if the access policy specifies an expiry time. The expiry time can be reached either because the interval elapses, or because you've modified the stored access policy to have an expiry time in the past, which is one way to revoke the SAS.

1. The stored access policy referenced by the SAS is deleted, which revokes the SAS. If Azure Storage cannot locate the stored access policy specified in the shared access signature, the client is not able to access the resource indicated by the URI.

    If you recreate the stored access policy with exactly the same name as the deleted policy, all existing SAS tokens will again be valid according to the permissions associated with that stored access policy, assuming that the expiry time on the SAS has not passed. If you are intending to revoke the SAS, be sure to use a different name if you recreate the access policy with an expiry time in the future.

1. The account key that was used to create the SAS is regenerated. Regenerating an account key will cause all application components using that key to fail to authorize until they're updated to use either the other valid account key or the newly regenerated account key. Regenerating the account key is the only way to immediately revoke an ad hoc SAS.

> [!IMPORTANT]
> A shared access signature URI is associated with the account key used to create the signature, and the associated stored access policy (if any). If no stored access policy is specified, the only way to revoke a shared access signature is to change the account key.

Best practices recommend that you use a stored access policy with a service SAS. If you choose not to use a stored access policy, then be sure to keep the interval over which the ad hoc SAS is valid short. For more information on associating a service SAS with a stored access policy, see [Define a stored access policy](define-stored-access-policy.md).  
  
## Service SAS example

The following example shows a service SAS URI that provides read and write permissions to a blob. The table breaks down each part of the URI:

```
https://myaccount.blob.core.windows.net/sascontainer/sasblob.txt?sv=2019-02-02&st=2019-04-29T22%3A18%3A26Z&se=2019-04-30T02%3A23%3A26Z&sr=b&sp=rw&sip=168.1.5.60-168.1.5.70&spr=https&sig=Z%2FRHIX5Xcg0Mq2rqI3OlWTjEg2tYkboXr1P9ZUXDtkk%3D
```

| Name | SAS portion | Description |
| --- | --- | --- |
| Resource URI |`https://myaccount.blob.core.windows.net/sascontainer/sasblob.txt` |The address of the blob. Note that using HTTPS is highly recommended. |
| Storage services version |`sv=2019-02-02` |For storage services version 2012-02-12 and later, this parameter indicates the version to use. |
| Start time |`st=2019-04-29T22%3A18%3A26Z` |Specified in UTC time. If you want the SAS to be valid immediately, omit the start time. |
| Expiry time |`se=2019-04-30T02%3A23%3A26Z` |Specified in UTC time. |
| Resource |`sr=b` |The resource is a blob. |
| Permissions |`sp=rw` |The permissions granted by the SAS include Read (r) and Write (w). |
| IP range |`sip=168.1.5.60-168.1.5.70` |The range of IP addresses from which a request will be accepted. |
| Protocol |`spr=https` |Only requests using HTTPS are permitted. |
| Signature |`sig=Z%2FRHIX5Xcg0Mq2rqI3OlWTjEg2tYkboXr1P9ZUXDtkk%3D` |Used to authorize access to the blob. The signature is an HMAC computed over a string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding. |
  
## See also

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Create a user delegation SAS](create-user-delegation-sas.md)
- [Create an account SAS](create-account-sas.md)
- [SAS Error Codes](SAS-Error-Codes.md)
