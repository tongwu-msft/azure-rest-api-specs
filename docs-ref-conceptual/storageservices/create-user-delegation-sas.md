---
title: Create a user delegation SAS - Azure Storage
description: A SAS token for access to a container, directory, or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a user delegation SAS, because the token used to create the SAS is requested on behalf of the user. Microsoft recommends that you use Azure AD credentials when possible as a security best practice. 
author: tamram

ms.date: 12/22/2020
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create a user delegation SAS

A SAS token for access to a container, directory, or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a *user delegation* SAS. Microsoft recommends that you use Azure AD credentials when possible as a security best practice, rather than using the account key, which can be more easily compromised. When your application design requires shared access signatures, use Azure AD credentials to create a user delegation SAS for superior security.

Every SAS is signed with a key. To create a user delegation SAS, you must first request a *user delegation key*, which is then used to sign the SAS. The user delegation key is analogous to the account key used to sign a service SAS or an account SAS, except that it relies on your Azure AD credentials. To request the user delegation key, call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation. You can then use the user delegation key to create the SAS.

A user delegation SAS is supported for Azure Blob storage and Azure Data Lake Storage Gen2. Stored access policies are not supported for a user delegation SAS.

> [!CAUTION]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

For information about using your account key to secure a SAS, see [Create a service SAS](create-service-sas.md) and [Create an account SAS](create-account-sas.md).

## User delegation SAS support for directory scoped access

A user delegation SAS supports directory scope (`sr=d`) when the authentication version (`sv`) is 2020-02-10 or higher and a hierarchical namespace (HNS) is enabled. The semantics for directory scope (`sr=d`) are similar to container scope (`sr=c`), except that access is restricted to a directory and any files and subdirectories beneath it. When `sr=d` is specified, the `sdd` query parameter is also required.

The string-to-sign format for authentication version 2020-02-10 is unchanged.

## User delegation SAS support for user OID

User Delegation SAS supports an optional user OID carried in either the `saoid` or `suoid` parameter when the authentication version (`sv`) is 2020-02-10 or higher. This optional parameter provides an enhanced authorization model for multi-user cluster workloads like Hadoop and Spark. SAS tokens may be constrained to a specific filesystem operation and user, providing a less vulnerable access token that is safer for the purpose of distributing across a multi-user cluster. One use case for these features is the integration of the Hadoop ABFS driver with Apache Ranger.

## Authorization of a user delegation SAS

When a client accesses a Blob storage resource with a user delegation SAS, the request to Azure Storage is authorized with the Azure AD credentials that were used to create the SAS. The role-based access control (RBAC) permissions granted for that Azure AD account, together with the permissions explicitly granted on the SAS, determine the client's access to the resource. This approach provides an additional level of security and avoids the need to store your account access key with your application code. For these reasons, creating a SAS using Azure AD credentials is a security best practice.

The permissions granted to a client who possesses the SAS are the intersection of the permissions granted to the security principal that requested the user delegation key and the permissions granted to the resource on the SAS token using the `signedPermissions` (`sp`) field. If a permission granted to the security principal via RBAC is not also granted on the SAS token, then that permission is not granted to the client who attempts to use the SAS to access the resource. When creating a user delegation SAS, make sure that the permissions granted via RBAC and the permissions granted via the SAS token both align to the level of access required by the client.  

To create a user delegation SAS, follow these steps:

1. Use RBAC to grant the desired permissions to the security principal who will request the user delegation key.
1. Acquire an OAuth 2.0 token from Azure AD.
1. Use the token to request the user delegation key by calling the [Get User Delegation Key](Get-User-Delegation-Key.md) operation.
1. Use the user delegation key to construct the SAS token with the appropriate fields.

## Assign permissions with RBAC

The security principal that requests the user delegation key needs to have the appropriate permissions to do so. An Azure AD security principal may be a user, a group, a service principal, or a managed identity.

To request the user delegation key, a security principal must be assigned the **Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey** action. The following built-in RBAC roles include the **Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey** action, either explicitly or as part of a wildcard definition:

- [Contributor](/azure/role-based-access-control/built-in-roles#contributor)
- [Storage Account Contributor](/azure/role-based-access-control/built-in-roles#storage-account-contributor)
- [Storage Blob Data Contributor](/azure/role-based-access-control/built-in-roles#storage-blob-data-contributor)
- [Storage Blob Data Owner](/azure/role-based-access-control/built-in-roles#storage-blob-data-owner)
- [Storage Blob Data Reader](/azure/role-based-access-control/built-in-roles#storage-blob-data-reader)
- [Storage Blob Delegator](/azure/role-based-access-control/built-in-roles#storage-blob-delegator)

Because the [Get User Delegation Key](Get-User-Delegation-Key.md) operation acts at the level of the storage account, the **Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey** action must be scoped at the level of the storage account, the resource group, or the subscription. If the security principal is assigned any of the built-in roles listed above, or a custom role that includes the **Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey** action, at the level of the storage account, the resource group, or the subscription, the security principal will be able to request the user delegation key.

In the case where the security principal is assigned a role that permits data access but is scoped to the level of a container, you can additionally assign the **Storage Blob Delegator** role to that security principal at the level of the storage account, resource group, or subscription. The **Storage Blob Delegator** role grants the security principal permissions to request the user delegation key.

For more information about RBAC roles for Azure Storage, see [Authorize with Azure Active Directory](authorize-with-azure-active-directory.md).

## Acquire an OAuth 2.0 token

To get the user delegation key, first request an OAuth 2.0 token from Azure AD. Provide the token with the Bearer scheme to authorize the call to the **Get User Delegation Key** operation. For more information about requesting an OAuth token from Azure AD, see [Authentication flows and application scenarios](/azure/active-directory/develop/authentication-flows-app-scenarios).

## Request the user delegation key

A call to the **Get User Delegation Key** operation returns the key as a set of values that are used as parameters on the user delegation SAS token. These parameters are described in the **Get User Delegation Key** reference and in the section titled [Construct a user delegation SAS](#construct-a-user-delegation-sas).

When a client requests a user delegation key using an OAuth 2.0 token, Azure Storage returns the user delegation key on behalf of the security principal. The SAS that is created with the user delegation key is granted the permissions that have been granted to the security principal.  

Once you have the user delegation key, you can use that key to create any number of user delegation shared access signatures, over the lifetime of the key. The user delegation key is independent of the OAuth 2.0 token used to acquire it, so the token does not need to be renewed so long as the key is still valid. You can specify that the key is valid for a period of up to seven days.

## Construct a user delegation SAS

The following table summarizes the fields supported for a user delegation SAS token. Subsequent sections provide additional detail about how to specify these parameters.

| SAS field name | SAS token parameter | Required or optional | Version support | Description |
|--|--|--|--|--|
| `signedVersion` | `sv` | Required | 2018-11-09 or later | Indicates the version of the service used to construct the signature field, and also specifies the service version that handles a request made with this shared access signature. |
| `signedResource` | `sr` | Required | All | Specifies which blob resources are accessible via the shared access signature. |
| `signedStart` | `st` | Optional | All | Optional. The time at which the shared access signature becomes valid, expressed in one of the accepted ISO 8601 UTC formats. If omitted, the current UTC time is used as the start time. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).|
| `signedExpiry` | `se` | Required | All | The time at which the shared access signature becomes invalid, expressed in one of the accepted ISO 8601 UTC formats. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md). |
| `signedPermissions` | `sp` | Required | All | Indicates which operations a client who possesses the SAS may perform on the resource. Permissions may be combined. |
| `signedIp` | `sip` | Optional | 2015-04-05 or later | Specifies an IP address or an inclusive range of IP addresses from which to accept requests. |
| `signedProtocol` | `spr` | Optional | 2015-04-05 or later | Specifies the protocol permitted for a request made with the SAS. Include this field to require that requests made with the SAS token use HTTPS. |
| `signedObjectId` | `skoid` | Required | 2018-11-09 or later | Identifies an Azure AD security principal. |
| `signedTenantId` | `sktid` | Required | 2018-11-09 or later | Specifies the Azure AD tenant in which a security principal is defined. |
| `signedKeyStartTime` | `skt` | Optional. | 2018-11-09 or later | Value is returned by the **Get User Delegation Key** operation.  Indicates the start of the lifetime of the user delegation key, expressed in one of the accepted ISO 8601 UTC formats. If omitted, the current time is assumed. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).|
| `signedKeyExpiryTime` | `ske` | Required | 2018-11-09 or later | Value is returned by the **Get User Delegation Key** operation. Indicates the end of the lifetime of the user delegation key, expressed in one of the accepted ISO 8601 UTC formats. For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).|
| `signedKeyService` | `sks` | Required | 2018-11-09 or later | Indicates the service for which the user delegation key is valid. Currently only the Blob service is supported. |
| `signedAuthorizedObjectId` | `saoid` | Optional | 2020-02-10 or later | Specifies the object ID for an Azure AD security principal that is authorized by the owner of the user delegation key to perform the action granted by the SAS token. No additional permission check on POSIX ACLs is performed. |
| `signedUnauthorizedObjectId` | `suoid` | Optional | 2020-02-10 or later | Specifies the object ID for an Azure AD security principal when a hierarchical namespace is enabled. Azure Storage performs a POSIX ACL check against the object ID before authorizing the operation. |
| `signedCorrelationId` | `scid` | Optional | 2020-02-10 or later | Correlate the storage audit logs with the audit logs used by the principal generating and distributing SAS. |
| `signedDirectoryDepth` | `sdd` | Required when `sr=d` | 2020-02-10 or later | Indicates the number of directories beneath the root folder of the directory specified in the `canonicalizedResource` field of the string-to-sign. |
| `signature` | `sig` | Required | All | The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding. |
| `Cache-Control` response header | `rscc` | Optional | 2013-08-15 or later | Azure Storage sets the `Cache-Control` response header to the value specified on the SAS token. |
| `Content-Disposition` response header | `rscd` | Optional | 2013-08-15 or later | Azure Storage sets the `Content-Disposition` response header to the value specified on the SAS token. |
| `Content-Encoding` response header | `rsce` | Optional | 2013-08-15 or later | Azure Storage sets the `Content-Encoding` response header to the value specified on the SAS token. |
| `Content-Language` response header | `rscl` | Optional | 2013-08-15 or later | Azure Storage sets the `Content-Language` response header to the value specified on the SAS token. |
| `Content-Type` response header | `rsct` | Optional | 2013-08-15 or later | Azure Storage sets the `Content-Type` response header to the value specified on the SAS token. |

### Specify the signed version field

The required `signedVersion` (`sv`) field specifies the service version for the shared access signature. This value indicates the version of the service used to construct the `signature` field, and also specifies the service version that handles a request made with this shared access signature. The value of the `sv` field must be version 2018-11-09 or later.
  
### Specify the signed resource field

The required `signedResource` (`sr`) field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a blob, container, or directory resource in the SAS token.  

| Resource | Parameter value | Supported versions | Description |
|---|---|---|---|
| Blob | b | All | Grants access to the content and metadata of the blob. |
| Blob version | bv | Version 2018-11-09 and later | Grants access to the content and metadata of the blob version, but not the base blob. |
| Blob snapshot | bs | Version 2018-11-09 and later | Grants access to the content and metadata of the blob snapshot, but not the base blob. |
| Container | c | All | Grants access to the content and metadata of any blob in the container, and to the list of blobs in the container. |
| Directory | d | Version 2020-02-10 and later | Grants access to the content and metadata of any blob in the directory, and to the list of blobs in the directory, in a storage account with a hierarchical namespace enabled. If a directory is specified for the `signedResource` field, then the `signedDirectoryDepth` (`sdd`) parameter is also required. A directory is always beneath a container.|

### Specify the signature validity interval

The `signedStart` (`st`) and `signedExpiry` (`se`) fields indicate the start time and expiry time for the SAS. The `signedExpiry` field is required. The `signedStart` field is optional; if omitted, the current UTC time is used as the start time.

For a user delegation SAS, the start time and expiry time for the SAS should be within the interval defined for the user delegation key. If a client attempts to use a SAS after the user delegation key has expired, the SAS will fail with an authorization error, regardless of whether the SAS itself is still valid.

For more information about accepted UTC formats, see [Formatting DateTime values](formatting-datetime-values.md).

### Specify permissions
  
The permissions specified for the `signedPermissions` (`sp`) field on the SAS token indicate which operations a client who possesses the SAS may perform on the resource.

Permissions can be combined to permit a client to perform multiple operations with the same SAS. When you construct the SAS, you must include permissions in the following order:

`racwdxltmeop`

Examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once is not permitted.  

A user delegation SAS cannot grant access to certain operations:
  
- Containers cannot be created, deleted, or listed.
- Container metadata and properties cannot be read or written.
- Containers cannot be leased.  

To construct a SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-account-sas.md).
  
The following table shows the permissions supported for each resource type.  

| Permission | URI symbol | Resource | Version support | Allowed operations |
|--|--|--|--|--|
| Read | r | Container<br />Directory<br />Blob | All | Read the content, block list, properties, and metadata of any blob in the container or directory. Use a blob as the source of a copy operation. |
| Add | a | Container<br />Directory<br />Blob | All | Add a block to an append blob. |
| Create | c | Container<br />Directory<br />Blob | All | Write a new blob, snapshot a blob, or copy a blob to a new blob. |
| Write | w | Container<br />Directory<br />Blob | All | Create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. |
| Delete | d | Container<br />Directory<br />Blob | All | Delete a blob. For version 2017-07-29 and later, the Delete permission also allows breaking a lease on a blob. For more information, see the [Lease Blob](Lease-Blob.md) operation. |
| Delete version | x | Container<br />Blob | Version 2019-12-12 or later | Delete a blob version. |
| Permanent Delete | y | Blob | Version 2020-02-10 or later | Permanently delete a blob snapshot or version.|
| List | l | Container<br />Directory | All | List blobs non-recursively. |
| Tags | t | Blob | Version 2019-12-12 or later | Read or write the tags on a blob. |
| Move | m | Container<br />Directory<br />Blob | Version 2020-02-10 or later | Move a blob or a directory and its contents to a new location. This operation can optionally be restricted to the owner of the child blob, directory, or parent directory if the `saoid` parameter is included on the SAS token and the sticky bit is set on the parent directory. |
| Execute | e | Container<br />Directory<br />Blob | Version 2020-02-10 or later | Get the system properties and, if the hierarchical namespace is enabled for the storage account, get the POSIX ACL of a blob. If the hierarchical namespace is enabled and the caller is the owner of a blob, this permission grants the ability to set the owning group, POSIX permissions, and POSIX ACL of the blob. Does not permit the caller to read user-defined metadata. |
| Ownership | o | Container<br />Directory<br />Blob | Version 2020-02-10 or later | When the hierarchical namespace is enabled, this permission enables the caller to set the owner or the owning group, or to act as the owner when renaming or deleting a directory or blob within a directory that has the sticky bit set. |
| Permissions | p | Container<br />Directory<br />Blob | Version 2020-02-10 or later | When the hierarchical namespace is enabled, this permission allows the caller to set permissions and POSIX ACLs on directories and blobs. |

### Specify an IP address or IP range  

The optional `signedIp` (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates does not match the IP address or address range specified on the SAS token, the request is not authorized.  
  
When you specify a range of IP addresses, the range is inclusive. For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.  

> [!IMPORTANT]
> A SAS used by a client that is in the same Azure region as the storage account may not include a public outbound IP address for the `signedIp` field. Requests made from within the same region using a SAS with a public outbound IP address specified will fail.
  
### Specify the HTTP protocol  

The optional `signedProtocol` (`spr`) field specifies the protocol permitted for a request made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`). The default value is `https,http`.

> [!NOTE]
> It is not possible to specify HTTP for the `spr` field.

### Specify the signed object ID

The `signedObjectId` (`skoid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed object ID is a GUID value that serves the immutable identifier for a security principal in the Microsoft identity platform.  

### Specify the signed tenant ID

The `signedTenantId` (`sktid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed tenant ID is a GUID value that represents the Azure AD tenant in which a security principal is defined.  

### Specify the signed key start time

The optional `signedKeyStartTime` (`skt`) field indicates the start of the lifetime of the user delegation key in ISO Date format. The **Get User Delegation Key** operation returns this value as part of the response. If omitted, the signed key start time is assumed to be the current time.  

### Specify the signed key expiry time

The `signedKeyExpiryTime` (`ske`) field is required for a user delegation SAS in ISO Date format. The **Get User Delegation Key** operation returns this value as part of the response. The signed key expiry time indicates the end of the lifetime of the user delegation key. The value of the expiry time may be a maximum of seven days from the start time of the SAS.

### Specify the signed key service

The `signedKeyService` (`sks`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key service field indicates the service for which the user delegation key is valid. The value for the signed key service field for the Blob service is `b`.

### Specify the signed key version

The `signedkeyversion` (`skv`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key version field specifies the storage service version used to get the user delegation key. This field must specify version 2018-11-09 or later.

### Specify a signed object ID for a security principal

The optional `signedAuthorizedObjectId` (`saoid`) and `signedUnauthorizedObjectId` (`suoid`) fields enable integration with Apache Hadoop and Apache Ranger for Azure Data Lake Storage Gen2 workloads. Use one of these fields on the SAS token to specify the object ID for a security principal:

- The `saoid` field specifies the object ID for an Azure AD security principal that is authorized by the owner of the user delegation key to perform the action granted by the SAS token. Azure Storage validates the SAS token and ensures that the owner of the user delegation key has the required permissions before granting access. No additional permission check on POSIX ACLs is performed.
- The `suoid` field specifies the object ID for an Azure AD security principal when a hierarchical namespace is enabled for a storage account. The `suoid` field is valid only for accounts that have a hierarchical namespace. When the `suoid` field is included on the SAS token, Azure Storage performs a POSIX ACL check against the object ID before authorizing the operation. If this ACL check does not succeed, then the operation fails. A hierarchical namespace must be enabled for the storage account if the `suoid` field is included on the SAS token. Otherwise, the permission check will fail with an authorization error.

The object ID for the security principal who requests the user delegation key is captured in the required `skoid` field. To specify an object ID on the SAS token with the `saoid` or `suoid` field, the security principal identified in the `skoid` field must be assigned an RBAC role that includes the **Microsoft.Storage/storageAccounts/blobServices/containers/blobs/runAsSuperUser/action** or **Microsoft.Storage/storageAccounts/blobServices/containers/blobs/manageOwnership/action**. For more information about these actions, see [Azure resource provider operations](/azure/role-based-access-control/resource-provider-operations).

Specifying the object ID in the `saoid` or `suoid` field also restricts operations related to directory or blob ownership:

- If an operation creates a directory or blob, then Azure Storage sets the owner of the directory or blob to the value specified by the object ID. If the object ID is not specified, then Azure Storage sets the owner of the directory or blob to the value specified by the `skoid` parameter.
- If the sticky bit is set on the parent directory and the operation deletes or renames a directory or blob, then the object ID of the owner of the parent directory or the owner of the resource must match the value specified by the object ID.
- If an operation sets the owner for a directory or blob and the `x-ms-owner` header is specified, then the value specified by the object ID must match the value specified by the `x-ms-owner` header.  
- If an operation sets the group for a directory or blob and the `x-ms-group` header is specified, then the value specified by the object ID must be a member of the group specified by the `x-ms-group` header.
- If an operation sets the permissions or ACL for a directory or blob, then one of the following two conditions must also be met:
  - The value specified for the object ID must be owner of the directory or blob.
  - The value of the `signedPermissions` (`sp`) field must include the `Ownership` (`o`) permission in addition to the `Permissions` (`p`) permission.

The object ID specified in the the `saoid` or `suoid` field is included in diagnostic logs when a request is made using the SAS token.

The `saoid` or `suoid` field is supported only if the `signedVersion` (`sv`) field is set to version 2020-02-10 or later. Only one of these fields may be included on the SAS token.

### Specify a correlation ID

The `signedCorrelationId` (`scid`) field specifies a correlation ID that may be used to correlate the storage audit logs with the audit logs used by the principal that generates and distributes the SAS. For example, a trusted authorization service will typically have a managed identity that authenticates and authorizes users, generates a SAS, adds an entry to the local audit log, and returns the SAS to a user, who can then use the SAS to access Azure Storage resources. Including a correlation ID in both the local audit log and the storage audit log allows these events to later be correlated. The value is a GUID without braces in lower case.

This field is supported with version 2020-02-10 or later.

### Specify the directory depth

If the `signedResource` field specifies a directory (`sr=d`), then you must also specify the `signedDirectoryDepth` (`sdd`) field to indicate the number of subdirectories under the root directory. The value of the `sdd` field must be a non-negative integer.

For example, the root directory `https://{account}.blob.core.windows.net/{container}/` has a depth of 0. Each subdirectory beneath the root directory adds to the depth by one. The directory `https://{account}.blob.core.windows.net/{container}/d1/d2` has a depth of two.  

This field is supported with version 2020-02-10 or later.

### Specify query parameters to override response headers

To define values for certain response headers to be returned when the shared access signature is used in a request, you can specify response headers in query parameters. The response headers and corresponding query parameters are as follows:  
  
| Response header name | Corresponding SAS query parameter |
|--|--|
| `Cache-Control` | `rscc` |
| `Content-Disposition` | `rscd` |
| `Content-Encoding` | `rsce` |
| `Content-Language` | `rscl` |
| `Content-Type` | `rsct` |
  
For example, if you specify the `rsct=binary` query parameter on a SAS token, the `Content-Type` response header is set to `binary`. This value overrides the `Content-Type` header value stored for the blob for a request using this shared access signature only.  
  
If you create a shared access signature that specifies response headers as query parameters, you must include those response headers in the string-to-sign that is used to construct the signature string. See the **Constructing the Signature String** section below for details.  

### Specify the user OID

User Delegation SAS supports an optional user OID carried in either the Signed Authorized User Object Id (`saoid`) or Signed Unauthorized User Object Id (`suoid`) parameter when the authentication version (sv) is 2020-02-10 or higher:

- The user delegating access (skoid) must have **Microsoft.Storage/storageAccounts/blobServices/containers/blobs/runAsSuperUser/action** or **Microsoft.Storage/storageAccounts/blobServices/containers/blobs/manageOwnership/action** RBAC permission when using a SAS with an optional user OID.
- If the sticky bit is set on the parent folder and the operation is delete or rename, then the owner of the parent folder or the owner of the resource must match the value specified by the optional user OID.
- If the operation is SetAccessControl and x-ms-owner is being set, the value of x-ms-owner must match the value specified by the optional user OID.
- If the operation is SetAccessControl and x-ms-group is being set, then the value specified by the optional user OID must be a member of the group specified by x-ms-group.

### Specify the correlation ID

User Delegation SAS supports an optional correlation ID carried in the scid parameter when the authentication version (sv) is 2020-02-10 or higher. This is a GUID value that will be logged in the storage diagnostic logs and can be used to correlate SAS generation with storage resource access.

### Specify the signature

The `signature` (`sig`) field is used to authorize a request made by a client with the shared access signature. The string-to-sign is a unique string constructed from the fields that must be verified in order to authorize the request. The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding.

To construct the signature string of a user delegation SAS, first create the string-to-sign from the fields comprising the request, then encode the string as UTF-8 and compute the signature using the HMAC-SHA256 algorithm. Fields included in the string-to-sign must be URL-decoded. Use the following format for the string-to-sign:

```
StringToSign = sp + "\n" +  
 st + "\n" +  
 se + "\n" +  
 canonicalizedResource + "\n" +  
 skoid + "\n" +
 sktid + "\n" +
 skt + "\n" +
 ske  + "\n" +
 sks + "\n" +
 skv + "\n" +
 saoid + "\n" +
 suoid + "\n" +
 scid + "\n" +
 sip + "\n" +  
 spr + "\n" +  
 sv + "\n" +  
 sr + "\n" +
 rscc + "\n" +
 rscd + "\n" +  
 rsce + "\n" +  
 rscl + "\n" +  
 rsct
```  

The string-to-sign for authentication version 2020-02-10 or higher has the following format:

```
StringToSign = signedPermissions + "\n" +
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

#### Canonicalized resource

The `canonicalizedresouce` portion of the string is a canonical path to the signed resource. It must include the Blob service endpoint and the resource name, and must be URL-decoded. A blob path must include its container. A directory path must include the number of subdirectories corresponding to the `sdd` parameter. 

The canonicalized resource string for a container must omit the trailing slash ('/') for a SAS that provides access to that container.

The following examples show how to construct the `canonicalizedResource` portion of the string, depending on the type of resource.  
  
##### Container example (Azure Blob storage)
  
```
URL = https://myaccount.blob.core.windows.net/music  
canonicalizedResource = "/blob/myaccount/music"  
```  
  
##### Blob example (Azure Blob storage)
  
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

If a field is optional and not provided as part of the SAS token, then specify an empty string for that field. Be sure to include the newline character (\n) after the empty string.  

## Revoke a user delegation SAS

If you believe that a SAS has been compromised, then you should revoke the SAS. You can revoke a user delegation SAS either by revoking the user delegation key, or by changing or removing RBAC role assignments for the security principal used to create the SAS.

> [!IMPORTANT]
> Both the user delegation key and RBAC role assignments are cached by Azure Storage, so there may be a delay between when you initiate the process of revocation and when an existing user delegation SAS becomes invalid.

### Revoke the user delegation key

You can revoke the user delegation key by calling the [Revoke User Delegation Keys](/rest/api/storagerp/storageaccounts/revokeuserdelegationkeys) operation. When you revoke the user delegation key, any shared access signatures relying on that key become invalid. You can then call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation again and use the key to create new shared access signatures. This approach is the quickest way to revoke a user delegation SAS.

### Change or remove role assignments

You can change or remove the RBAC role assignment for the security principal used to create the SAS. When a client uses the SAS to access a resource, Azure Storage verifies that the security principal whose credentials were used to secure the SAS has the specified permissions to the resource.

## See also

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Create a service SAS](create-service-sas.md)
- [Create an account SAS](create-account-sas.md)
- [SAS Error Codes](SAS-Error-Codes.md)
