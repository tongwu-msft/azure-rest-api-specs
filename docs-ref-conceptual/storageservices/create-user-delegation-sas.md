---
title: Create a user delegation SAS (preview) - Azure Storage
description: A SAS token for access to a container or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a user delegation SAS (preview), because the token used to create the SAS is requested on behalf of the user. Microsoft recommends that you use Azure AD credentials when possible as a security best practice. 
author: tamram

ms.date: 08/06/2019
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create a user delegation SAS (preview)

A SAS token for access to a container or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a *user delegation* SAS (preview). Microsoft recommends that you use Azure AD credentials when possible as a security best practice, rather than using the account key, which can be more easily compromised. When your application design requires shared access signatures, use Azure AD credentials to create a user delegation SAS for superior security.

Every SAS is signed with a key. To create a user delegation SAS, you must first request a *user delegation key*, which is then used to sign the SAS. The user delegation key is analogous to the account key used to sign a service SAS or an account SAS, except that it relies on your Azure AD credentials. To request the user delegation key, call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation. You can then use the user delegation key to create the SAS.

A user delegation SAS is supported only for the Blob service. Stored access policies are not supported for a user delegation SAS.

> [!CAUTION]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

For information about using your account key to secure a SAS, see [Create a service SAS](create-service-sas.md) and [Create an account SAS](create-account-sas.md).

## Authorization of a user delegation SAS

When a client accesses a Blob service resource with a user delegation SAS, the request to Azure Storage is authorized with the Azure AD credentials that were used to create the SAS. The role-based access control (RBAC) permissions granted for that Azure AD account, together with the permissions explicitly granted on the SAS, determine the client's access to the resource. This approach provides an additional level of security and avoids the need to store your account access key with your application code. For these reasons, creating a SAS using Azure AD credentials is a security best practice.

The permissions granted to a client who possesses the SAS are the union of the permissions granted to the security principal that requested the user delegation key, and the permissions granted to the resource on the SAS token using the `signedpermissions` (`sp`) field. If a permission granted to the security principal via RBAC is not also granted on the SAS token, then that permission is not granted to the client who attempts to use the SAS to access the resource. When creating a user delegation SAS, make sure that the permissions granted via RBAC and the permissions granted via the SAS token both align to the level of access required by the client.  

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

The following sections describe how to specify the parameters that comprise the user delegation SAS token.

### Specify the signed version field

The `signedversion` (`sv`) field specifies the service version for the shared access signature. This value indicates the version of the service used to construct the `signature` field, and also specifies the service version that handles a request made with this shared access signature.
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedversion`|`sv`|Required. For a user delegation SAS, must be version 2018-11-09 or later. The storage service version to use to authorize requests made with this shared access signature, and the service version to use when handling requests made with this shared access signature.|

### Specify the signed resource field

The `signedresource` (`sr`) field specifies which resources are accessible via the shared access signature. The following table describes how to refer to a blob or container resource in the SAS token.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedresource`|`sr`|Required.<br /><br /> Specify `b` if the shared resource is a blob. This parameter grants access to the content and metadata of the blob.<br /><br /> Specify `c` if the shared resource is a container. This parameter grants access to the content and metadata of any blob in the container, and to the list of blobs in the container.<br /><br /> Specify `bs` if the shared resource is a blob snapshot. This parameter grants access to the content and metadata of the specific snapshot, but not the corresponding root blob.|  

### Specify the signature validity interval

The `signedstart` (`st`) and `signedexpiry` (`se`) fields indicate the start time and expiry time for the SAS. The `signedexpiry` field is required. The `signedstart` field is optional; if omitted, the current UTC time is used as the start time.

For a user delegation SAS, the start time and expiry time for the SAS should be within the interval defined for the user delegation key. If a client attempts to use a SAS after the user delegation key has expired, the SAS will fail with an authorization error, regardless of whether the SAS itself is still valid.

Both fields must be expressed as UTC times and must adhere to a valid UTC format that is compatible ISO 8601 format. Supported ISO 8601 formats include:  
  
- `YYYY-MM-DD`  
- `YYYY-MM-DDThh:mmTZD`  
- `YYYY-MM-DDThh:mm:ssTZD`  
  
> [!NOTE]
> All values for `signedstart` and `signedexpiry` must be in UTC time.
  
For the date portion of these formats, `YYYY` is a four-digit year representation, `MM` is a two-digit month representation, and `DD` is a two-digit day representation. For the time portion, `hh` is the hour representation in 24-hour notation, `mm` is the two-digit minute representation, and `ss` is the two-digit second representation. A time designator `T` separates the date and time portions of the string, while a time zone designator `TZD` specifies a time zone (UTC).

### Specify permissions
  
The permissions specified for the `signedpermissions` (`sp`) field on the SAS token indicate which operations a client who possesses the SAS may perform on the resource.

Permissions can be combined to permit a client to perform multiple operations with the same SAS. When you construct the SAS, you must include permissions in the order that they appear in the table for the resource type. For example, to grant all permissions to a container, the SAS token must specify `sp=rwdl`. To grant only read/write permissions, the URI must specify `sp=rw`.  

A user delegation SAS cannot grant access to certain operations:
  
- Containers cannot be created, deleted, or listed.
- Container metadata and properties cannot be read or written.
- Containers cannot be leased.  

To construct a SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-account-sas.md).
  
The tables in the following sections show the permissions supported for each resource type.  
  
#### Permissions for a blob
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata, and block list. Use the blob as the source of a copy operation.|  
|Add|a|Add a block to an append blob.|  
|Create|c|Write a new blob, snapshot a blob, or copy a blob to a new blob.|  
|Write|w|Create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation.|  
|Delete|d|Delete the blob. For version 2017-07-29 and later, the `Delete` permission also allows breaking a lease on a blob. For more information, see the [Lease Blob](Lease-Blob.md) operation.|  
  
#### Permissions for a container  
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata, or block list of any blob in the container. Use any blob in the container as the source of a copy operation.|  
|Add|a|Add a block to any append blob in the container.|  
|Create|c|Write a new blob to the container, snapshot any blob in the container, or copy a blob to a new blob in the container.|  
|Write|w|For any blob in the container, create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. **Note:**  You cannot grant permissions to read or write container properties or metadata, nor to lease a container, with a service SAS. Use an account SAS instead.|  
|Delete|d|Delete any blob in the container. **Note:**  You cannot grant permissions to delete a container with a service SAS. Use an account SAS instead. For version 2017-07-29 and later, the `Delete` permission also allows breaking a lease on a container. For more information, see [Lease Container](Lease-Container.md).|  
|List|l|List blobs in the container.|  

### Specify an IP address or IP range  

The optional signed IP (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates does not match the IP address or address range specified on the SAS token, the request is not authorized.  
  
When you specify a range of IP addresses, the range is inclusive.  
  
For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.  
  
### Specify the HTTP protocol  

The optional signed protocol (`spr`) field specifies the protocol permitted for a request made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`). The default value is `https,http`.

> [!NOTE]
> It is not possible to specify HTTP for the `spr` field.

### Specify the signed object ID

The signed object ID (`skoid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed object ID is a GUID value that serves the immutable identifier for a security principal in the Microsoft identity platform.  

### Specify the signed tenant ID

The signed tenant ID (`sktid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed tenant ID is a GUID value that represents the Azure AD tenant in which a security principal is defined.  

### Specify the signed key start time

The optional signed key  time (`skt`) field indicates the start of the lifetime of the user delegation key in ISO Date format. The **Get User Delegation Key** operation returns this value as part of the response. If omitted, the signed key start time is assumed to be the current time.  

### Specify the signed key expiry time

The signed key expiry time (`ske`) field is required for a user delegation SAS in ISO Date format. The **Get User Delegation Key** operation returns this value as part of the response. The signed key expiry time indicates the end of the lifetime of the user delegation key. The value of the expiry time may be a maximum of seven days from the start time of the SAS.

### Specify the signed key service

The signed key service (`sks`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key service field indicates the service for which the user delegation key is valid. The value for the signed key service field for the Blob service is `b`.

### Specify the signed key version

The signed key version field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key version field specifies the storage service version used to get the user delegation key. This field must specify version 2018-11-09 or later.

### Specify query parameters to override response headers

To define values for certain response headers to be returned when the shared access signature is used in a request, you can specify response headers in query parameters. The response headers and corresponding query parameters are as follows:  
  
|Response header name|Corresponding SAS query parameter|  
|--------------------------|---------------------------------------|  
|`Cache-Control`|`rscc`|  
|`Content-Disposition`|`rscd`|  
|`Content-Encoding`|`rsce`|  
|`Content-Language`|`rscl`|  
|`Content-Type`|`rsct`|  
  
For example, if you specify the `rsct=binary` query parameter on a SAS token, the `Content-Type` response header is set to `binary`. This value overrides the `Content-Type` header value stored for the blob for a request using this shared access signature only.  
  
If you create a shared access signature that specifies response headers as query parameters, you must include those response headers in the string-to-sign that is used to construct the signature string. See the **Constructing the Signature String** section below for details.  

### Specify the signature

The signature (`sig`) field is used to authorize a request made by a client with the shared access signature. Azure Storage uses Azure AD to authorize a user delegation SAS. The following table describes how to specify the signature on the URI.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signature`|`sig`|The string-to-sign is a unique string constructed from the fields that must be verified in order to authorize the request. The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding.|  
  
To construct the signature string of a user delegation SAS, first create the string-to-sign from the fields comprising the request, then encode the string as UTF-8 and compute the signature using the HMAC-SHA256 algorithm. Fields included in the string-to-sign must be URL-decoded. Use the following format for the string-to-sign:

```
StringToSign = signedpermissions + "\n" +  
               signedstart + "\n" +  
               signedexpiry + "\n" +  
               canonicalizedresource + "\n" +  
               signedidentifier + "\n" +
               signedoid + "\n" +
               signedtid + "\n" + 
               signedkeystart + "\n" +
               signedkeyexpiry  + "\n" +
               signedkeyservice + "\n" +
               signedkeyverion + "\n" +
               signedIP + "\n" +  
               signedProtocol + "\n" +  
               signedversion + "\n" +  
               rscc + "\n" +
               rscd + "\n" +  
               rsce + "\n" +  
               rscl + "\n" +  
               rsct
```  

#### Canonicalized resource

The `canonicalizedresouce` portion of the string is a canonical path to the signed resource. It must include the Blob service endpoint and the resource name, and must be URL-decoded. The name of a blob must include its container. The following examples show how to construct the `canonicalizedresource` portion of the string, depending on the type of resource.  
  
##### Container example
  
```
URL = https://myaccount.blob.core.windows.net/music  
canonicalizedresource = "/blob/myaccount/music"  
```  
  
##### Blob example
  
```
URL = https://myaccount.blob.core.windows.net/music/intro.mp3  
canonicalizedresource = "/blob/myaccount/music/intro.mp3"  
```  

#### Optional fields  

If a field is optional and not provided as part of the SAS token, then specify an empty string for that field. Be sure to include the newline character (\n) after the empty string.  

#### Order of permissions

The `signedpermission` portion of the string must include the permission designations in a fixed order that is specific to each resource type. Any combination of these permissions is acceptable, but the order of permission letters must match the order in the following table.  
  
|Resource type|Ordering of permissions|  
|-------------------|-----------------------------|  
|Blob|racwd|  
|Container|racwdl|  

For example, examples of valid permissions settings for a container include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Examples of invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once is not permitted.  

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
