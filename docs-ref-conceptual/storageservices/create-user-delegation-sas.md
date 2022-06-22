---
title: Create a user delegation SAS - Azure Storage
description: You can secure a shared access signature token for access to a container, directory, or blob by using either Azure AD credentials or an account key. An SAS that's secured with Azure AD credentials is called a user delegation SAS, because the token that's used to create the SAS is requested on behalf of the user. Microsoft recommends that you use Azure AD credentials when possible as a security best practice. 
author: tamram

ms.date: 03/16/2022
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create a user delegation SAS

You can secure a shared access signature (SAS) token for access to a container, directory, or blob by using either Azure Active Directory (Azure AD) credentials or an account key. An SAS that's secured with Azure AD credentials is called a *user delegation* SAS. As a security best practice, we recommend that you use Azure AD credentials when possible, rather than the account key, which can be more easily compromised. When your application design requires shared access signatures, use Azure AD credentials to create a user delegation SAS to help ensure better security.

Every SAS is signed with a key. To create a user delegation SAS, you must first request a *user delegation key*, which you then use to sign the SAS. The user delegation key is analogous to the account key that's used to sign a service SAS or an account SAS, except that it relies on your Azure AD credentials. To request the user delegation key, call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation. You can then use the user delegation key to create the SAS.

A user delegation SAS is supported for Azure Blob Storage and Azure Data Lake Storage Gen2. Stored access policies are not supported for a user delegation SAS.

> [!CAUTION]
> Shared access signatures are keys that grant permissions to storage resources, and you should protect them just as you would protect an account key. It's important to protect an SAS from malicious or unintended use. Use discretion in distributing an SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

For information about using your account key to secure an SAS, see [Create a service SAS](create-service-sas.md) and [Create an account SAS](create-account-sas.md).

## User delegation SAS support for directory-scoped access

A user delegation SAS supports directory scope (`sr=d`) when the authorization version (`sv`) is 2020-02-10 or later and a hierarchical namespace (HNS) is enabled. The semantics for directory scope (`sr=d`) are similar to container scope (`sr=c`), except that access is restricted to a directory and any files and subdirectories within it. When `sr=d` is specified, the `sdd` query parameter is also required.

The string-to-sign format for authorization version 2020-02-10 is unchanged.

## User delegation SAS support for a user OID

User delegation SAS supports an optional user object identifier (OID) that's carried in either the `saoid` or `suoid` parameter when the authorization version (`sv`) is 2020-02-10 or later. This optional parameter provides an enhanced authorization model for multi-user cluster workloads such as Hadoop and Spark. 

SAS tokens can be constrained to a specific filesystem operation and user, which provides a less vulnerable access token that's safer to distribute across a multi-user cluster. One use case for these features is the integration of the Hadoop ABFS driver with Apache Ranger.

## Authorize a user delegation SAS

When a client accesses a Blob Storage resource with a user delegation SAS, the request to Azure Storage is authorized with the Azure AD credentials that were used to create the SAS. The role-based access control (RBAC) permissions that are granted for that Azure AD account, together with the permissions explicitly granted on the SAS, determine the client's access to the resource. This approach provides an additional level of security and helps you avoid having to store your account access key with your application code. For these reasons, creating an SAS by using Azure AD credentials is a security best practice.

The permissions granted to a client who possesses the SAS are the intersection of the permissions that were granted to the security principal that requested the user delegation key and the permissions that were granted to the resource on the SAS token using the `signedPermissions` (`sp`) field. If a permission that's granted to the security principal via RBAC isn't also granted on the SAS token, that permission isn't granted to the client who attempts to use the SAS to access the resource. When you're creating a user delegation SAS, make sure that the permissions granted via RBAC and the permissions granted via the SAS token both align to the level of access that's required by the client.  

To create a user delegation SAS, do the following:

1. Use RBAC to grant the desired permissions to the security principal who will request the user delegation key.
1. Acquire an OAuth 2.0 token from Azure AD.
1. Use the token to request the user delegation key by calling the [Get User Delegation Key](Get-User-Delegation-Key.md) operation.
1. Use the user delegation key to construct the SAS token with the appropriate fields.

## Assign permissions with RBAC

The security principal that requests the user delegation key needs to have the appropriate permissions to do so. An Azure AD security principal can be a user, a group, a service principal, or a managed identity.

To request the user delegation key, you must assign to a security principal the *Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey* action. The following built-in RBAC roles include the *Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey* action, either explicitly or as part of a wildcard definition:

- [Contributor](/azure/role-based-access-control/built-in-roles#contributor)
- [Storage Account Contributor](/azure/role-based-access-control/built-in-roles#storage-account-contributor)
- [Storage Blob Data Contributor](/azure/role-based-access-control/built-in-roles#storage-blob-data-contributor)
- [Storage Blob Data Owner](/azure/role-based-access-control/built-in-roles#storage-blob-data-owner)
- [Storage Blob Data Reader](/azure/role-based-access-control/built-in-roles#storage-blob-data-reader)
- [Storage Blob Delegator](/azure/role-based-access-control/built-in-roles#storage-blob-delegator)

Because the [Get User Delegation Key](Get-User-Delegation-Key.md) operation acts at the level of the storage account, the *Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey* action must be scoped at the level of the storage account, the resource group, or the subscription. If the security principal is assigned any of the previously listed, built-in roles or a custom role that includes the *Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey* action, at the level of the storage account, the resource group, or the subscription, the security principal can then request the user delegation key.

If the security principal is assigned a role that permits data access but is scoped to the level of a container, you can additionally assign the *Storage Blob Delegator* role to the security principal at the level of the storage account, resource group, or subscription. The *Storage Blob Delegator* role grants the security principal permissions to request the user delegation key.

For more information about RBAC roles for Azure Storage, see [Authorize with Azure Active Directory](authorize-with-azure-active-directory.md).

## Acquire an OAuth 2.0 token

To get the user delegation key, first request an OAuth 2.0 token from Azure AD. Provide the token with the Bearer scheme to authorize the call to the *Get User Delegation Key* operation. For more information about requesting an OAuth token from Azure AD, see [Authentication flows and application scenarios](/azure/active-directory/develop/authentication-flows-app-scenarios).

## Request the user delegation key

A call to the *Get User Delegation Key* operation returns the key as a set of values that are used as parameters on the user delegation SAS token. These parameters are described in the *Get User Delegation Key* reference and in the next section, "[Construct a user delegation SAS](#construct-a-user-delegation-sas)."

When a client requests a user delegation key by using an OAuth 2.0 token, Azure Storage returns the user delegation key on behalf of the security principal. The SAS that's created with the user delegation key is granted the permissions that have been granted to the security principal.  

After you have the user delegation key, you can use it to create any number of user delegation shared access signatures over the lifetime of the key. The user delegation key is independent of the OAuth 2.0 token that you use to acquire it, so the token doesn't need to be renewed as long as the key is still valid. You can specify that the key is valid for a period of up to seven days.

## Construct a user delegation SAS

The following table summarizes the fields that are supported for a user delegation SAS token. Subsequent sections provide additional detail about how to specify these parameters.

| SAS field name | SAS token parameter | Required or optional | Version support | Description |
|--|--|--|--|--|
| `signedVersion` | `sv` | Required | 2018-11-09 and later | Indicates the version of the service that's used to construct the signature field. It also specifies the service version that handles requests that are made with this SAS. |
| `signedResource` | `sr` | Required | All | Specifies which blob resources are accessible via the shared access signature. |
| `signedStart` | `st` | Optional | All | Optional. The time when the shared access signature becomes valid, expressed in one of the accepted ISO 8601 UTC formats. If this value is omitted, the current UTC time is used as the start time. For more information about accepted UTC formats, see [Format DateTime values](formatting-datetime-values.md).|
| `signedExpiry` | `se` | Required | All | The time when the shared access signature becomes invalid, expressed in one of the accepted ISO 8601 UTC formats. For more information about accepted UTC formats, see [Format DateTime values](formatting-datetime-values.md). |
| `signedPermissions` | `sp` | Required | All | Indicates which operations that a client who possesses the SAS may perform on the resource. Permissions may be combined. |
| `signedIp` | `sip` | Optional | 2015-04-05 and later | Specifies an IP address or an inclusive range of IP addresses from which to accept requests. |
| `signedProtocol` | `spr` | Optional | 2015-04-05 and later | Specifies the protocol that's permitted for a request made with the SAS. Include this field to require that requests made with the SAS token use HTTPS. |
| `signedObjectId` | `skoid` | Required | 2018-11-09 and later | Identifies an Azure AD security principal. |
| `signedTenantId` | `sktid` | Required | 2018-11-09 and later | Specifies the Azure AD tenant in which a security principal is defined. |
| `signedKeyStartTime` | `skt` | Optional. | 2018-11-09 and later | The value is returned by the *Get User Delegation Key* operation.  Indicates the start of the lifetime of the user delegation key, expressed in one of the accepted ISO 8601 UTC formats. If the value omitted, the current time is assumed. For more information about accepted UTC formats, see [Format DateTime values](formatting-datetime-values.md).|
| `signedKeyExpiryTime` | `ske` | Required | 2018-11-09 and later | The value is returned by the *Get User Delegation Key* operation. Indicates the end of the lifetime of the user delegation key, expressed in one of the accepted ISO 8601 UTC formats. For more information about accepted UTC formats, see [Format DateTime values](formatting-datetime-values.md).|
| `signedKeyService` | `sks` | Required | 2018-11-09 and later | Indicates the service for which the user delegation key is valid. Currently, only Blob Storage is supported. |
| `signedAuthorizedObjectId` | `saoid` | Optional | 2020-02-10 and later | Specifies the object ID for an Azure AD security principal that's authorized by the owner of the user delegation key to perform the action granted by the SAS token. No additional permission check on Portable Operating System Interface (POSIX) access control lists (ACLs) is performed. |
| `signedUnauthorizedObjectId` | `suoid` | Optional | 2020-02-10 and later | Specifies the object ID for an Azure AD security principal when a hierarchical namespace is enabled. Azure Storage performs a POSIX ACL check against the object ID before it authorizes the operation. |
| `signedCorrelationId` | `scid` | Optional | 2020-02-10 and later | Correlate the storage audit logs with the audit logs that are used by the principal that generates and distributes the SAS. |
| `signedDirectoryDepth` | `sdd` | Required when `sr=d` | 2020-02-10 and later | Indicates the number of directories within the root folder of the directory specified in the `canonicalizedResource` field of the string-to-sign. |
| `signedEncryptionScope` | `ses` | Optional | 2020-12-06 and later | Indicates the encryption scope to use to encrypt the request contents. |
| `signature` | `sig` | Required | All | The signature is a hash-based message authentication code (HMAC) that's computed over the string-to-sign and key by using the SHA256 algorithm, and then encoded by using Base64 encoding. |
| `Cache-Control` response header | `rscc` | Optional | 2013-08-15 and later | Azure Storage sets the `Cache-Control` response header to the value that's specified on the SAS token. |
| `Content-Disposition` response header | `rscd` | Optional | 2013-08-15 and later | Azure Storage sets the `Content-Disposition` response header to the value that's specified on the SAS token. |
| `Content-Encoding` response header | `rsce` | Optional | 2013-08-15 and later | Azure Storage sets the `Content-Encoding` response header to the value that's specified on the SAS token. |
| `Content-Language` response header | `rscl` | Optional | 2013-08-15 and later | Azure Storage sets the `Content-Language` response header to the value that's specified on the SAS token. |
| `Content-Type` response header | `rsct` | Optional | 2013-08-15 and later | Azure Storage sets the `Content-Type` response header to the value that's specified on the SAS token. |

### Specify the signed version field

The required `signedVersion` (`sv`) field specifies the service version for the shared access signature. This value indicates the version of the service that's used to construct the `signature` field, and it specifies the service version that handles a request made with this shared access signature. The value of the `sv` field must be version 2018-11-09 or later.
  
### Specify the signed resource field

The required `signedResource` (`sr`) field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a blob, container, or directory resource in the SAS token:  

| Resource | Parameter value | Supported versions | Description |
|---|---|---|---|
| Blob | b | All | Grants access to the content and metadata of the blob. |
| Blob version | bv | 2018-11-09 and later | Grants access to the content and metadata of the blob version, but not the base blob. |
| Blob snapshot | bs | 2018-11-09 and later | Grants access to the content and metadata of the blob snapshot, but not the base blob. |
| Container | c | All | Grants access to the content and metadata of any blob in the container, and to the list of blobs in the container. |
| Directory | d | 2020-02-10 and later | Grants access to the content and metadata of any blob in the directory, and to the list of blobs in the directory, in a storage account with a hierarchical namespace enabled. If a directory is specified for the `signedResource` field, the `signedDirectoryDepth` (`sdd`) parameter is also required. A directory is always within a container.|

### Specify the duration of signature validity

The `signedStart` (`st`) and `signedExpiry` (`se`) fields indicate the start and expiration times for the SAS. The `signedExpiry` field is required. The `signedStart` field is optional. It it's omitted, the current UTC time is used as the start time.

For a user delegation SAS, the start and expiration times for the SAS should be within the interval that's defined for the user delegation key. If a client attempts to use an SAS after the user delegation key has expired, the SAS will fail with an authorization error, regardless of whether the SAS itself is still valid.

For more information about accepted UTC formats, see [Format DateTime values](formatting-datetime-values.md).

### Specify permissions
  
The permissions that are specified for the `signedPermissions` (`sp`) field on the SAS token indicate which operations a client who possesses the SAS may perform on the resource.

Permissions can be combined to permit a client to perform multiple operations with the same SAS. When you construct the SAS, you must include permissions in the following order:

`racwdxltmeop`

Examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once isn't permitted.  

A user delegation SAS can't grant access to certain operations:
  
- Containers can't be created, deleted, or listed.
- Container metadata and properties can't be read or written.
- Containers can't be leased.  

To construct an SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-account-sas.md).
  
The permissions that are supported for each resource type are described in the following table:  

| Permission | URI symbol | Resource | Version support | Allowed operations |
|--|--|--|--|--|
| Read | r | Container<br />Directory<br />Blob | All | Read the content, blocklist, properties, and metadata of any blob in the container or directory. Use a blob as the source of a copy operation. |
| Add | a | Container<br />Directory<br />Blob | All | Add a block to an append blob. |
| Create | c | Container<br />Directory<br />Blob | All | Write a new blob, snapshot a blob, or copy a blob to a new blob. |
| Write | w | Container<br />Directory<br />Blob | All | Create or write content, properties, metadata, or blocklist. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. |
| Delete | d | Container<br />Directory<br />Blob | All | Delete a blob. For version 2017-07-29 and later, the Delete permission also allows breaking a lease on a blob. For more information, see the [Lease Blob](Lease-Blob.md) operation. |
| Delete version | x | Container<br />Blob | 2019-12-12 and later | Delete a blob version. |
| Permanent Delete | y | Blob | 2020-02-10 and later | Permanently delete a blob snapshot or version.|
| List | l | Container<br />Directory | All | List blobs non-recursively. |
| Tags | t | Blob | 2019-12-12 and later | Read or write the tags on a blob. |
| Move | m | Container<br />Directory<br />Blob | 2020-02-10 and later | Move a blob or a directory and its contents to a new location. This operation can optionally be restricted to the owner of the child blob, directory, or parent directory if the `saoid` parameter is included on the SAS token and the sticky bit is set on the parent directory. |
| Execute | e | Container<br />Directory<br />Blob | 2020-02-10 and later | Get the system properties and, if the hierarchical namespace is enabled for the storage account, get the POSIX ACL of a blob. If the hierarchical namespace is enabled and the caller is the owner of a blob, this permission grants the ability to set the owning group, POSIX permissions, and POSIX ACL of the blob. It doesn't permit the caller to read user-defined metadata. |
| Ownership | o | Container<br />Directory<br />Blob | 2020-02-10 and later | When the hierarchical namespace is enabled, this permission enables the caller to set the owner or the owning group, or to act as the owner when the caller renames or deletes a directory or blob within a directory that has the sticky bit set. |
| Permissions | p | Container<br />Directory<br />Blob | 2020-02-10 and later | When the hierarchical namespace is enabled, this permission allows the caller to set permissions and POSIX ACLs on directories and blobs. |
| Set Immutability Policy | i | Container<br/>Blob | 2020-06-12 and later | Set or delete the immutability policy or legal hold on a blob. |

### Specify an IP address or IP range  

The optional `signedIp` (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates doesn't match the IP address or address range that's specified on the SAS token, the request isn't authorized.  
  
When you specify a range of IP addresses, the range is inclusive. For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.  

The following table describes whether to include the `signedIp` field on an SAS token for a given scenario, based on the client environment and the location of the storage account.

| Client environment | Storage account location | Recommendation |
|--|--|--|
| Client running in Azure | In the same region as the client | An SAS that's provided to the client in this scenario shouldn't include an outbound IP address for the `signedIp` field. Requests that you make from within the same region by using an SAS with a specified outbound IP address will fail.<br /><br/> Instead, use an Azure virtual network to manage network security restrictions. Requests to Azure Storage from within the same region always take place over a private IP address. For more information, see [Configure Azure Storage firewalls and virtual networks](/azure/storage/common/storage-network-security). |
| Client running in Azure | In a different region from the client | An SAS that's provided to the client in this scenario may include a public IP address or range of addresses for the `signedIp` field. Requests that you make with the SAS must originate from the specified IP address or range of addresses. |
| Client running on-premises or in a different cloud environment | In any Azure region | An SAS that's provided to the client in this scenario may include a public IP address or range of addresses for the `signedIp` field. Requests that you make with the SAS must originate from the specified IP address or range of addresses.<br /><br /> If the request passes through a proxy or gateway, provide the public outbound IP address of that proxy or gateway for the `signedIp` field. |
  
### Specify the HTTP protocol  

The optional `signedProtocol` (`spr`) field specifies the protocol that's permitted for requests that are made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`). The default value is `https,http`.

> [!NOTE]
> It isn't possible to specify HTTP for the `spr` field.

### Specify the signed object ID

The `signedObjectId` (`skoid`) field is required for a user delegation SAS. The *Get User Delegation Key* operation returns this value as part of the response. The signed object ID is a GUID value that serves the immutable identifier for a security principal in the Microsoft identity platform.  

### Specify the signed tenant ID

The `signedTenantId` (`sktid`) field is required for a user delegation SAS. The *Get User Delegation Key* operation returns this value as part of the response. The signed tenant ID is a GUID value that represents the Azure AD tenant in which a security principal is defined.  

### Specify the signed key start time

The optional `signedKeyStartTime` (`skt`) field indicates the start of the lifetime of the user delegation key in ISO Date format. The *Get User Delegation Key* operation returns this value as part of the response. If the start time is omitted, the signed key start time is assumed to be the current time.  

### Specify the signed key expiration time

The `signedKeyExpiryTime` (`ske`) field is required for a user delegation SAS in ISO Date format. The *Get User Delegation Key* operation returns this value as part of the response. The signed key expiration time indicates the end of the lifetime of the user delegation key. The value of the expiration time may be a maximum of seven days from the start time of the SAS.

### Specify the signed key service

The `signedKeyService` (`sks`) field is required for a user delegation SAS. The *Get User Delegation Key* operation returns this value as part of the response. The signed key service field indicates the service for which the user delegation key is valid. The value for the signed key service field for Blob Storage is `b`.

### Specify the signed key version

The `signedkeyversion` (`skv`) field is required for a user delegation SAS. The *Get User Delegation Key* operation returns this value as part of the response. The `signedkeyversion` field specifies the storage service version that's used to get the user delegation key. This field must specify version 2018-11-09 or later.

### Specify a signed object ID for a security principal

The optional `signedAuthorizedObjectId` (`saoid`) and `signedUnauthorizedObjectId` (`suoid`) fields enable integration with Apache Hadoop and Apache Ranger for Azure Data Lake Storage Gen2 workloads. Use one of these fields on the SAS token to specify the object ID for a security principal:

- The `saoid` field specifies the object ID for an Azure AD security principal that's authorized by the owner of the user delegation key to perform the action granted by the SAS token. Azure Storage validates the SAS token and ensures that the owner of the user delegation key has the required permissions before Azure Storage grants access. No additional permission check on POSIX ACLs is performed.
- The `suoid` field specifies the object ID for an Azure AD security principal when a hierarchical namespace is enabled for a storage account. The `suoid` field is valid only for accounts that have a hierarchical namespace. When the `suoid` field is included on the SAS token, Azure Storage performs a POSIX ACL check against the object ID before it authorizes the operation. If this ACL check doesn't succeed, the operation fails. A hierarchical namespace must be enabled for the storage account if the `suoid` field is included on the SAS token. Otherwise, the permission check will fail with an authorization error.

The object ID for the security principal who requests the user delegation key is captured in the required `skoid` field. To specify an object ID on the SAS token with the `saoid` or `suoid` field, the security principal that's identified in the `skoid` field must be assigned an RBAC role that includes *Microsoft.Storage/storageAccounts/blobServices/containers/blobs/runAsSuperUser/action* or *Microsoft.Storage/storageAccounts/blobServices/containers/blobs/manageOwnership/action*. For more information about these actions, see [Azure resource provider operations](/azure/role-based-access-control/resource-provider-operations).

By specifying the object ID in the `saoid` or `suoid` field, you also restrict operations that are related to directory or blob ownership, in the following ways:

- If an operation creates a directory or blob, Azure Storage sets the owner of the directory or blob to the value that's specified by the object ID. If the object ID isn't specified, Azure Storage sets the owner of the directory or blob to the value that's specified by the `skoid` parameter.
- If the sticky bit is set on the parent directory and the operation deletes or renames a directory or blob, the object ID of the owner of the parent directory or the owner of the resource must match the value that's specified by the object ID.
- If an operation sets the owner for a directory or blob and the `x-ms-owner` header is specified, the value that's specified by the object ID must match the value that's specified by the `x-ms-owner` header.  
- If an operation sets the group for a directory or blob and the `x-ms-group` header is specified, the value that's specified by the object ID must be a member of the group that's specified by the `x-ms-group` header.
- If an operation sets the permissions or ACL for a directory or blob, one of the following two conditions must also be met:
  - The value that's specified for the object ID must be the owner of the directory or blob.
  - The value of the `signedPermissions` (`sp`) field must include the `Ownership` (`o`) permission in addition to the `Permissions` (`p`) permission.

The object ID that's specified in the `saoid` or `suoid` field is included in diagnostic logs when you make requests by using the SAS token.

The `saoid` or `suoid` field is supported only if the `signedVersion` (`sv`) field is set to version 2020-02-10 or later. Only one of these fields may be included on the SAS token.

### Specify a correlation ID

The `signedCorrelationId` (`scid`) field specifies a correlation ID that may be used to correlate the storage audit logs with the audit logs that are used by the principal that generates and distributes the SAS. For example, a trusted authorization service ordinarily has a managed identity that authenticates and authorizes users, generates an SAS, adds an entry to the local audit log, and returns the SAS to a user, who can then use the SAS to access Azure Storage resources. By including a correlation ID in both the local audit log and the storage audit log, you allow these events to be correlated later. The value is a GUID without braces and with lowercase characters.

This field is supported with version 2020-02-10 and later.

### Specify the directory depth

If the `signedResource` field specifies a directory (`sr=d`), you must also specify the `signedDirectoryDepth` (`sdd`) field to indicate the number of subdirectories under the root directory. The value of the `sdd` field must be a non-negative integer.

For example, the root directory `https://{account}.blob.core.windows.net/{container}/` has a depth of 0. Each subdirectory within the root directory adds to the depth by 1. The directory `https://{account}.blob.core.windows.net/{container}/d1/d2` has a depth of 2.  

This field is supported with version 2020-02-10 and later.

### Specify query parameters to override response headers

To define values for certain response headers to be returned when the shared access signature is used in a request, you can specify response headers in query parameters. The response headers and corresponding query parameters are as follows:  
  
| Response header name | Corresponding SAS query parameter |
|--|--|
| `Cache-Control` | `rscc` |
| `Content-Disposition` | `rscd` |
| `Content-Encoding` | `rsce` |
| `Content-Language` | `rscl` |
| `Content-Type` | `rsct` |
  
For example, if you specify the `rsct=binary` query parameter on an SAS token, the `Content-Type` response header is set to `binary`. This value overrides the `Content-Type` header value stored for the blob for a request using this shared access signature only.  
  
If you create a shared access signature that specifies response headers as query parameters, you must include those response headers in the string-to-sign that's used to construct the signature string. For more information, see the "[Specify the signature](#specify-the-signature)" section.  

### Specify the encryption scope

The `signed encryption scope` (`ses`) field specifies an encryption scope that the client application uses when you upload blobs by using the SAS token via the [Put Blob](Put-Blob.md) operation. The `signed encryption scope` field is supported when the signed version (`sv`) field on the SAS token is version 2020-12-06 or later. If the signed version field specifies a version that's earlier than the supported version, the service returns error response code 403 (Forbidden).

If the default encryption scope is set for the container or filesystem, the `ses` field respects the container encryption policy. If there's a mismatch between the `ses` query parameter and `x-ms-default-encryption-scope` header, and the `x-ms-deny-encryption-scope-override` header is set to `true`, the service returns error response code 403 (Forbidden).

If the `x-ms-encryption-scope` header and the `ses` query parameter are both provided in the PUT request and there's a mismatch, the service returns error response code 400 (Bad Request).

### Specify the signature

The `signature` (`sig`) field is used to authorize a request made by a client with the shared access signature. The string-to-sign is a unique string that's constructed from the fields that must be verified to authorize the request. The signature is an HMAC that's computed over the string-to-sign and key by using the SHA256 algorithm, and then encoded by using Base64 encoding.

To construct the signature string of a user delegation SAS, create the string-to-sign from the fields that make up the request, encode the string as UTF-8, and then compute the signature by using the HMAC-SHA256 algorithm. The fields that are included in the string-to-sign must be URL-decoded.

The fields that are required in the string-to-sign depend on the service version that's used for authorization (`sv` field). The following sections describe the string-to-sign configuration for versions that support the user delegation SAS. 

#### Version 2020-12-06 and later

The string-to-sign for authorization version 2020-12-06 and later has the following format:

```
StringToSign =  signedPermissions + "\n" +
                signedStart + "\n" +
                signedExpiry + "\n" +
                canonicalizedResource + "\n" +
                signedKeyObjectId + "\n" +
                signedKeyTenantId + "\n" +
                signedKeyStart + "\n" +
                signedKeyExpiry  + "\n" +
                signedKeyService + "\n" +
                signedKeyVersion + "\n" +
                signedAuthorizedUserObjectId + "\n" +
                signedUnauthorizedUserObjectId + "\n" +
                signedCorrelationId + "\n" +
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
                rsct
```

#### Version 2020-02-10

The string-to-sign for authorization version 2020-02-10 has the following format:

```
StringToSign =  signedPermissions + "\n" +
                signedStart + "\n" +
                signedExpiry + "\n" +
                canonicalizedResource + "\n" +
                signedKeyObjectId + "\n" +
                signedKeyTenantId + "\n" +
                signedKeyStart + "\n" +
                signedKeyExpiry  + "\n" +
                signedKeyService + "\n" +
                signedKeyVersion + "\n" +
                signedAuthorizedUserObjectId + "\n" +
                signedUnauthorizedUserObjectId + "\n" +
                signedCorrelationId + "\n" +
                signedIP + "\n" +
                signedProtocol + "\n" +
                signedVersion + "\n" +
                signedResource + "\n" +
                signedSnapshotTime + "\n" +
                rscc + "\n" +
                rscd + "\n" +
                rsce + "\n" +
                rscl + "\n" +
                rsct
```

#### Versions earlier than 2020-02-10

The string-to-sign for authorization versions that are earlier than 2020-02-10 has the following format:

```
StringToSign =  signedPermissions + "\n" +  
                signedStart + "\n" +  
                signedExpiry + "\n" +  
                canonicalizedResource + "\n" +  
                signedKeyObjectId + "\n" +
                signedKeyTenantId + "\n" +
                signedKeyStart + "\n" +
                signedKeyExpiry  + "\n" +
                signedKeyService + "\n" +
                signedKeyVersion + "\n" +
                signedAuthorizedUserObjectId + "\n" +
                signedUnauthorizedUserObjectId + "\n" +
                signedCorrelationId + "\n" +
                signedIP + "\n" +  
                signedProtocol + "\n" +  
                signedVersion + "\n" +  
                signedResource + "\n" +
                rscc + "\n" +
                rscd + "\n" +  
                rsce + "\n" +  
                rscl + "\n" +  
                rsct
```

#### Canonicalized resource

The `canonicalizedResource` portion of the string is a canonical path to the signed resource. It must include the Blob Storage endpoint and the resource name, and it must be URL-decoded. A blob path must include its container. A directory path must include the number of subdirectories that correspond to the `sdd` parameter. 

The canonicalized resource string for a container must omit the trailing slash (/) for an SAS that provides access to that container.

The following examples show how to construct the `canonicalizedResource` portion of the string, depending on the type of resource.  
  
##### Container example (Azure Blob Storage)
  
```
URL = https://myaccount.blob.core.windows.net/music  
canonicalizedResource = "/blob/myaccount/music"  
```  
  
##### Blob example (Azure Blob Storage)
  
```
URL = https://myaccount.blob.core.windows.net/music/intro.mp3  
canonicalizedResource = "/blob/myaccount/music/intro.mp3"  
```  

##### Container example (Azure Data Lake Storage Gen2)
  
```
URL = https://myaccount.dfs.core.windows.net/music  
canonicalizedResource = "/blob/myaccount/music"  
```  

##### Directory example (Azure Data Lake Storage Gen2)

```
URL = https://myaccount.dfs.core.windows.net/music/instruments/guitar/  
canonicalizedResource = "/blob/myaccount/music/instruments/guitar/"  
```  

##### Blob example (Azure Data Lake Storage Gen2)
  
```
URL = https://myaccount.dfs.core.windows.net/music/intro.mp3  
canonicalizedResource = "/blob/myaccount/music/intro.mp3"  
```  

#### Optional fields  

If a field is optional and not provided as part of the SAS token, specify an empty string for the field. Be sure to include the newline character (\n) after the empty string.  

## Revoke a user delegation SAS

If you believe that an SAS has been compromised, you should revoke it. You can revoke a user delegation SAS either by revoking the user delegation key, or by changing or removing RBAC role assignments for the security principal that's used to create the SAS.

> [!IMPORTANT]
> Both the user delegation key and RBAC role assignments are cached by Azure Storage, so there may be a delay between when you initiate the process of revocation and when an existing user delegation SAS becomes invalid.

### Revoke the user delegation key

You can revoke the user delegation key by calling the [Revoke User Delegation Keys](/rest/api/storagerp/storageaccounts/revokeuserdelegationkeys) operation. When you revoke the user delegation key, any shared access signatures that rely on that key become invalid. You can then call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation again and use the key to create new shared access signatures. This is the quickest way to revoke a user delegation SAS.

### Change or remove role assignments

You can change or remove the RBAC role assignment for the security principal that's used to create the SAS. When a client uses the SAS to access a resource, Azure Storage verifies that the security principal whose credentials were used to secure the SAS has the required permissions to the resource.

## See also

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Create a service SAS](create-service-sas.md)
- [Create an account SAS](create-account-sas.md)
- [SAS error codes](SAS-Error-Codes.md)
