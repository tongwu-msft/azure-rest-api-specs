---
title: Create a user delegation SAS (preview) - Azure Storage
description: A user delegation SAS 
ms.date: 07/25/2019
ms.prod: azure
ms.service: storage
ms.topic: reference
ms.author: tamram
author: tamram
---

# Create a user delegation SAS (preview)

A SAS token for access to a container or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a *user delegation* SAS (preview), because the token used to create the SAS is requested on behalf of the user. Microsoft recommends that you use Azure AD credentials when possible as a security best practice, rather than using the account key, which can be more easily compromised. When your application design requires shared access signatures, use Azure AD credentials to create a user delegation SAS for superior security.

A user delegation SAS is supported only for the Blob service. Stored access policies are not supported for a user delegation SAS.

> [!CAUTION]
> Any client that possesses a valid SAS can access data in your storage account as permitted by that SAS. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. For more information, see ....???. 

For information about using your account key to secure a SAS, see [Create a service SAS](create-a-service-sas.md) and [Create an account SAS](create-an-account-sas.md).

## Authorization

A user delegation SAS is secured using Azure AD credentials. When a client uses a SAS that is secured with Azure AD credentials to access a Blob service resource, the request to Azure Storage is authorized with the Azure AD credentials used to create the SAS. The role-based access control (RBAC) permissions granted for that Azure AD account determine the client's access to the resource. The request is also authorized according to the permissions granted by the SAS token. This approach provides an additional level of security and avoids the need to store your account access key with your application code. For these reasons, creating a SAS using Azure AD credentials is a security best practice.

To create a user delegation SAS, follow these steps:

1. Use RBAC to grant the desired permissions to the security principal who will request the user delegation key.
1. Acquire an OAuth 2.0 token from Azure AD.
1. Use the token to request a user delegation key by calling the [Get User Delegation Key](Get-User-Delegation-Key.md) operation. The user delegation key is used to sign the shared access signature.
1. Use the user delegation key to construct the SAS token with the appropriate fields.

While securing a SAS with Azure AD credentials is recommended, in some scenarios you may need to secure a SAS with your account key. To use an account key to secure a SAS for a container or blob, or to grant access via a SAS to a resource in a different Azure Storage service, create a service SAS. For more information, see [Create a service SAS](create-a-service-sas.md). You can use the account key to sign an account SAS, which can grant access to resources in more than one storage service with a single signature, or to account-level operations that are not supported with a service SAS or user delegation SAS. For more information on creating an account SAS, see [Create an account SAS](create-an-account-sas.md).

## Request the user delegation key

Every SAS is signed with a key. To create a user delegation SAS, you must first request a user delegation key, which is then used to sign the SAS. The user delegation key is analogous to the account key used to sign a service SAS or an account SAS, except that it relies on your Azure AD credentials. To request the user delegation key, call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation.

A call to the **Get User Delegation Key** operation returns the key as a set of values that are used as parameters on the user delegation SAS token. These parameters are described in the **Get User Delegation Key** reference and in the section titled [Construct the user delegation SAS](#construct-the-user-delegation-sas).

When a client requests a user delegation key using an OAuth 2.0 token, Azure Storage returns the user delegation key on behalf of the user. This action relies on the OAuth 2.0 On-Behalf-Of (OBO) authentication flow. For more information about the OBO flow in the Microsoft Identity Platform, see [Microsoft identity platform and OAuth 2.0 On-Behalf-Of flow](/azure/active-directory/develop/v2-oauth2-on-behalf-of-flow).

To request the user delegation key, a security principal must be assigned the **Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey** action, and this permission must be scoped at the level of the storage account, the resource group, or the subscription. The built-in RBAC roles that provide access to the Blob service include this permission. For more information about RBAC roles, see [Authorize with Azure Active Directory](authorize-with-active-directory.md).

Once you have the user delegation key, you can use that key to create any number of user delegation shared access signatures, over the lifetime of the key. The user delegation key is independent of the OAuth 2.0 token used to acquire it, so the token does not need to be renewed so long as the key is still valid. You can specify that the key is valid for a period of up to 7 days.

## Construct the user delegation SAS

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

Both fields must be expressed as UTC times and must adhere to a valid UTC format that is compatible ISO 8601 format. Supported ISO 8601 formats include the following:  
  
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
  
- Containers, queues, and tables cannot be created, deleted, or listed.  
- Container metadata and properties cannot be read or written.
- Containers cannot be leased.  

To construct a SAS that grants access to these operations, use an account SAS. For more information, see [Create an account SAS](create-an-account-sas.md).
  
> [!IMPORTANT]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

The tables in the following sections show the permissions supported for each resource type.  
  
#### Permissions for a blob
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata and block list. Use the blob as the source of a copy operation.|  
|Add|a|Add a block to an append blob.|  
|Create|c|Write a new blob, snapshot a blob, or copy a blob to a new blob.|  
|Write|w|Create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation.|  
|Delete|d|Delete the blob. For version 2017-07-29 and later, the `Delete` permission also allows breaking a lease on a blob. See [Lease Blob](Lease-Blob.md) for more information.|  
  
#### Permissions for a container  
  
|Permission|URI symbol|Allowed operations|  
|----------------|----------------|------------------------|  
|Read|r|Read the content, properties, metadata or block list of any blob in the container. Use any blob in the container as the source of a copy operation.|  
|Add|a|Add a block to any append blob in the container.|  
|Create|c|Write a new blob to the container, snapshot any blob in the container, or copy a blob to a new blob in the container.|  
|Write|w|For any blob in the container, create or write content, properties, metadata, or block list. Snapshot or lease the blob. Resize the blob (page blob only). Use the blob as the destination of a copy operation. **Note:**  You cannot grant permissions to read or write container properties or metadata, nor to lease a container, with a service SAS. Use an account SAS instead.|  
|Delete|d|Delete any blob in the container. **Note:**  You cannot grant permissions to delete a container with a service SAS. Use an account SAS instead. For version 2017-07-29 and later, the `Delete` permission also allows breaking a lease on a container. See [Lease Container](Lease-Container.md) for more information.|  
|List|l|List blobs in the container.|  

### Specify an IP address or IP range  

The optional signed IP (`sip`) field specifies an IP address or a range of IP addresses from which to accept requests. If the IP address from which the request originates does not match the IP address or address range specified on the SAS token, the request is not authorized.  
  
When specifying a range of IP addresses, note that the range is inclusive.  
  
For example, specifying `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70` on the SAS restricts the request to those IP addresses.  
  
### Specify the HTTP protocol  

The optional signed protocol (`spr`) field specifies the protocol permitted for a request made with the SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`). The default value is `https,http`. Note that HTTP only is not a permitted value.  

### Specify the signed object ID

The signed object ID (`skoid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed object ID is a GUID value that serves the immutable identifier for a security principal in the Microsoft identity platform.  

### Specify the signed tenant ID

The signed tenant ID (`sktid`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed tenant ID is a GUID value that represents the Azure AD tenant in which a security principal is defined.  

### Specify the signed key start time

The optional signed key  time (`skt`) field indicates the start of the lifetime of the user delegation key. The **Get User Delegation Key** operation returns this value as part of the response in ISO Date format. If omitted, the signed key start time is assumed to be the current time.  

### Specify the signed key expiry time

The signed key expiry time (`ske`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response in ISO Date format. The signed key expiry time indicates the end of the lifetime of the user delegation key.  

### Specify the signed key service

The signed key service (`ske`) field is required for a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key service field indicates the service for which the user delegation key is valid. The value for the signed key service field for the Blob service is `b`.

### Specify the signed key version

The signed key version field is required for a a user delegation SAS. The **Get User Delegation Key** operation returns this value as part of the response. The signed key version field specifies the storage service version used to get the user delegation key. This field must specify version 2018-11-09 or later.

### Specify the signature

The signature (`sig`) field is used to authorize the request made with the shared access signature. Azure Storage uses a Shared Key authorization scheme to authorize a service SAS. The following table describes how to specify the signature on the URI.  
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signature`|`sig`|The string-to-sign is a unique string constructed from the fields that must be verified in order to authenticate the request. The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding.|  
  
#### Constructing the signature string  

To construct the signature string of a shared access signature, first construct the string-to-sign from the fields comprising the request, then encode the string as UTF-8 and compute the signature using the HMAC-SHA256 algorithm. Note that fields included in the string-to-sign must be URL-decoded.  

When constructing the string to be signed, keep in mind the following:  
  
- If a field is optional and not provided as part of the request, specify an empty string for that field. Be sure to include the newline character (\n) after the empty string.  
  
- String-to-sign for a table must include the additional parameters, even if they are empty strings.  
  
- The `signedpermission` portion of the string must include the permission designations in a fixed order that is specific to each resource type. Any combination of these permissions is acceptable, but the order of permission letters must match the order in the following table.  
  
    |Resource type|Ordering of permissions|  
    |-------------------|-----------------------------|  
    |Blob or File|rwd|  
    |Container or Share|rwdl|  
    |Queue|raup|  
    |Table|raud|  
  
     For example, valid permissions settings for a container or share include `rw`, `rd`, `rl`, `wd`, `wl`, and `rl`. Invalid settings include `wr`, `dr`, `lr`, and `dw`. Specifying a permission designation more than once is not permitted.  
  
- The `canonicalizedresouce` portion of the string is a canonical path to the signed resource. It must include the service name (blob, table, queue or file) for version 2015-02-21 or later, the storage account name, and the resource name, and must be URL-decoded. Names of blobs must include the blob’s container. Table names must be lower-case. The following examples show how to construct the `canonicalizedresource` portion of the string, depending on the type of resource.  
  
     **Containers**  
  
     For version 2015-02-21 and later:  
  
    ```  
    URL = https://myaccount.blob.core.windows.net/music  
    canonicalizedresource = "/blob/myaccount/music"  
    ```  
  
     For versions prior to 2015-02-21:  
  
    ```  
    URL = https://myaccount.blob.core.windows.net/music   
    canonicalizedresource = "/myaccount/music"  
    ```  
  
     **Blobs**  
  
     For version 2015-02-21 and later:  
  
    ```  
    URL = https://myaccount.blob.core.windows.net/music/intro.mp3  
    canonicalizedresource = "/blob/myaccount/music/intro.mp3"  
  
    ```  
  
     For versions prior to 2015-02-21:  
  
    ```  
    URL = https://myaccount.blob.core.windows.net/music/intro.mp3   
    canonicalizedresource = "/myaccount/music/intro.mp3"  
    ```  
  


## See also

[Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-shared-access-signatures.md).
