---
title: Create Container (REST API) - Azure Storage
description: The Create Container operation creates a new container under the specified account. If the container with the same name already exists, the operation fails.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Create Container

The `Create Container` operation creates a new container under the specified account. If the container with the same name already exists, the operation fails.  
  
 The container resource includes metadata and properties for that container. It doesn't include a list of the blobs in the container.  
  
## Request  

 You can construct the `Create Container` request as shown here. We recommend that you use HTTPS. Your *mycontainer* value can include only lowercase characters. In the URL, replace *myaccount* with the name of your storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.blob.core.windows.net/mycontainer?restype=container`|HTTP/1.1|  
  
### Emulated storage service request  

 When you make a request against the emulated storage service, specify the emulator hostname and Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`http://127.0.0.1:10000/devstoreaccount1/mycontainer?restype=container`|HTTP/1.1|  
  
For more information, see [Use the Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters
  
 You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set time-outs for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

 The required and optional request headers are described in the following table:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. A name-value pair to associate with the container as metadata. **Note**: As of version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|  
|`x-ms-blob-public-access`|Optional. Specifies whether data in the container can be accessed publicly and the level of access. Possible values include:<br /><br /> - `container`: Specifies full public read access for container and blob data. Clients can enumerate blobs within the container via anonymous request, but they can't enumerate containers within the storage account.<br />- `blob:` Specifies public read access for blobs. Blob data within this container can be read via anonymous request, but container data isn't available. Clients can't enumerate blobs within the container via anonymous request.<br /><br /> If this header isn't included in the request, container data is private to the account owner.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  
  
### Request headers (encryption scopes)
  
As of version 2019-02-02, you can specify the following headers on a request to set a default encryption scope on a container. If you set an encryption scope, it is automatically used to encrypt all blobs that are uploaded to the container.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-default-encryption-scope`|Required. The encryption scope to set as the default on the container.|  
|`x-ms-deny-encryption-scope-override`|Required. Values are `true` or `false`. Setting this header to `true` ensures that every blob that's uploaded to this container uses the default encryption scope. When this header is `false`, a client can upload a blob with an encryption scope other than the default scope.|  
  
### Request body  

 None.  
  
### Sample request  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer?restype=container HTTP/1.1  
  
Request Headers:  
x-ms-version: 2011-08-18  
x-ms-date: Sun, 25 Sep 2011 22:50:32 GMT  
x-ms-meta-Name: StorageSample  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
## Response  

 The response includes an HTTP status code and a set of response headers.  
  
### Status code  

 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

 The response for this operation includes the headers that are described in the following table. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag for the container. If the request version is 2011-08-18 or later, the ETag value is enclosed in quotation marks.|  
|`Last-Modified`|Returns the date and time when the container was last modified. The date format follows RFC 1123. For more information, see [Representation of date/time values in headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the container or its properties or metadata updates the last modified time. Operations on blobs do not affect the last modified time of the container.|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the Blob Storage version that's used to execute the request. This header is returned for requests made against version 2009-09-19 or later.|  
|`Date`|The UTC date/time value generated by the service, which indicates the time at which the response was initiated.|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request, and the value contains no more than 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, the header won't be present in the response.|  
  
### Response body  
 None.  
  
### Sample response  
  
```  
Response status:  
HTTP/1.1 201 Created  
  
Response headers:  
Transfer-Encoding: chunked  
Date: Sun, 25 Sep 2011 23:00:12 GMT  
ETag: “0x8CB14C3E29B7E82”  
Last-Modified: Sun, 25 Sep 2011 23:00:06 GMT  
x-ms-version: 2011-08-18  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  

 Only the account owner may call this operation.  
  
## Remarks  

 Containers are created immediately within the storage account. It isn't possible to nest one container within another.  
  
 You can optionally create a default or root container for your storage account. The root container makes it possible to reference a blob from the top level of the storage account hierarchy, without referencing the container name.  
  
 To add the root container to your storage account, create a container named `$root`. Construct the request as follows:  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/$root?restype=container HTTP/1.1  
  
Request Headers:  
x-ms-version: 2011-08-18  
x-ms-date: Sun, 25 Sep 2011 22:50:32 GMT  
x-ms-meta-Name: StorageSample  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
 You can specify metadata for a container when you're creating it by including one or more metadata headers on the request. The format for the metadata header is `x-ms-meta-name:value`.  
  
 If a container by the same name is being deleted when `Create Container` is called, the server returns status code 409 (Conflict), and it provides additional error information that indicates that the container is being deleted.  
  
## See also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and error codes](Status-and-Error-Codes2.md)   
 [Blob Storage error codes](Blob-Service-Error-Codes.md)   
 [Name and reference containers, blobs, and metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md)   
 [Set and retrieve properties and metadata for blob resources](Setting-and-Retrieving-Properties-and-Metadata-for-Blob-Resources.md)   
 [Set Container ACL](Set-Container-ACL.md)
