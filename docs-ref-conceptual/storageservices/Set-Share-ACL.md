---
title: Set Share ACL (FileREST API) - Azure Files
description: The Set Share ACL operation sets stored access policies for the share that may be used with Shared Access Signatures.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Set Share ACL
The **Set Share ACL** operation sets a stored access policy for use with shared access signatures. For more information about setting access policies, See [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-sas-overview).  

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |

## Request
The **Set Share ACL** request may be constructed as follows. HTTPS is recommended. Replace `myaccount` with the name of your storage account:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=acl`|HTTP/1.1|  
  
### URI parameters
The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in versions 2015-02-21 and later.<br /><br /> For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-lease-id:<ID>`|Required if the destination file share has an active lease. Available for versions 2020-02-10 and newer. If the request does not include the lease ID or it is not valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination file share does not currently have an active lease, the operation will also fail with status code 412 (Precondition Failed).|
  
### Request body
To specify a stored access policy, provide a unique identifier and access policy in the request body for the **Set Share ACL** operation.  
  
The **SignedIdentifier** element includes the unique identifier, as specified in the **Id** element, and the details of the access policy, as specified in the **AccessPolicy** element. The maximum length of the unique identifier is 64 characters.  
  
The **Start** and **Expiry** fields must be expressed as UTC times and must adhere to a valid ISO 8061 format. Supported ISO 8061 formats include the following:  
  
- `YYYY-MM-DD`  
- `YYYY-MM-DDThh:mmTZD`  
- `YYYY-MM-DDThh:mm:ssTZD`  
- `YYYY-MM-DDThh:mm:ss.fffffffTZD`  
  
For the date portion of these formats, `YYYY` is a four-digit year representation, `MM` is a two-digit month representation, and `DD` is a two-digit day representation. For the time portion, `hh` is the hour representation in 24-hour notation, `mm` is the two-digit minute representation, `ss` is the two-digit second representation, and `fffffff` is the seven-digit millisecond representation. A time designator `T` separates the date and time portions of the string, while a time zone designator `TZD` specifies a time zone.  
  
```XML
<?xml version="1.0" encoding="utf-8"?>  
<SignedIdentifiers>  
  <SignedIdentifier>   
    <Id>unique-64-character-value</Id>  
    <AccessPolicy>  
      <Start>start-time</Start>  
      <Expiry>expiry-time</Expiry>  
      <Permission>abbreviated-permission-list</Permission>  
    </AccessPolicy>  
  </SignedIdentifier>  
</SignedIdentifiers>  
```  
  
### Sample request
  
```
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=acl HTTP/1.1  
  
Request Headers:  
x-ms-version: 2015-02-21  
x-ms-date: <date>  
Authorization: SharedKey myaccount:V47F2tYLS29MmHPhiR8FyiCny9zO5De3kVSF0RYQHmo=  
  
Request Body:  
<?xml version="1.0" encoding="utf-8"?>  
<SignedIdentifiers>  
  <SignedIdentifier>   
    <Id>MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI=</Id>  
    <AccessPolicy>  
      <Start>2015-07-01T08:49:37.0000000Z</Start>  
      <Expiry>2015-07-02T08:49:37.0000000Z</Expiry>  
      <Permission>rwd</Permission>  
    </AccessPolicy>  
  </SignedIdentifier>  
</SignedIdentifiers>  
```  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|Returns the date and time the container was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).|  
|`Last-Modified`|Any operation that modifies the share or its properties or metadata updates the last modified time, including setting the file’s permissions. Operations on files do not affect the last modified time of the share.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Sample response

```
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Transfer-Encoding: chunked  
Date: <date>  
ETag: "0x8CB171613397EAB"  
Last-Modified: <date>  
x-ms-version: 2015-02-21  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization
Only the account owner may call this operation.  
  
## Remarks
Only the account owner may access resources in a particular share, unless the owner has specified that share resources are available for public access by setting the permissions on the share, or has issued a shared access signature for a resource within the share.  
  
When you set permissions for a container, the existing permissions are replaced. To update the container's permissions, call [Get Share ACL](Get-Share-ACL.md) to fetch all access policies associated with the container, modify the access policy that you wish to change, and then call **Set Share ACL** with the complete set of data to perform the update.  
  
**Establishing share-level access policies**  
  
A stored access policy can specify the start time, expiry time, and permissions for the shared access signatures with which it is associated. Depending on how you want to control access to your share or file resource, you can specify all of these parameters within the stored access policy, and omit them from the URL for the shared access signature. Doing so permits you to modify the associated signature's behavior at any time, as well as to revoke it. Or you can specify one or more of the access policy parameters within the stored access policy, and the others on the URL. Finally, you can specify all of the parameters on the URL. In this case, you can use the stored access policy to revoke the signature, but not to modify its behavior. See [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-sas-overview) for more information about setting access policies.  
  
Together the shared access signature and the stored access policy must include all fields required to authorize the signature. If any required fields are missing, the request will fail. Likewise, if a field is specified both in the shared access signature URL and in the stored access policy, the request will fail with status code 400 (Bad Request). See [Using a Shared Access Signature](/azure/storage/common/storage-dotnet-shared-access-signature-part-1) for more information about the fields that comprise a shared access signature.
  
At most five separate access policies can be set for a given share at any time. If more than five access policies are passed in the request body, then the service returns status code 400 (Bad Request).  
  
A shared access signature can be issued on a share or a file regardless of whether container data is available for anonymous read access. A shared access signature provides a greater measure of control over how, when, and to whom a resource is made accessible.

An access policy cannot be set or retrieved for a share snapshot. If an attempt is made to set an access policy, then the service returns status code 400 (InvalidQueryParameterValue)  
  
> [!NOTE]
> When you establish a stored access policy on a container, it may take up to 30 seconds to take effect. During this interval, a shared access signature that is associated with the stored access policy will fail with status code 403 (Forbidden), until the access policy becomes active.  
  
## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
