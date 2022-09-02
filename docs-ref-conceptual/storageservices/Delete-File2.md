---
title: Delete File (FileREST API) - Azure Files
description: The Delete File operation immediately removes the file from the storage account.   
author: wmgries
ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Delete File

The `Delete File` operation immediately removes the file from the storage account.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `Delete File` request as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`myparentdirectorypath`|Optional. The path to the parent directory.|  
|`myfile`|The name of the file.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters

You can specify the following additional parameters in the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
## Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id:<ID>`|Required if the file has an active lease. Available for version 2019-02-02 and later. |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|

## Request body

None.  
  
## Response

The response includes an HTTP status code and a set of response headers.  
  
## Status code

A successful operation returns status code 202 (Accepted). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
## Response headers

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?LinkId=73147).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|
  
## Response body

None.  
  
## Authorization

Only the account owner can call this operation.  
  
## Remarks

When you successfully delete a file, the file is immediately removed from the storage account's index, and is no longer accessible to clients. The file's data is later removed from the service during garbage collection.  
  
If the file has an active lease, the client must specify a valid lease ID on the request in order to delete it.  
  
If the file is open on an SMB client, `Delete File` fails with status code 409 (Conflict) and error code `SharingViolation`.  
  
`Delete File` isn't supported on a share snapshot, which is a read-only copy of a share. If you attempt to perform this operation on a share snapshot, the service returns error 400 (Invalid Query Parameter Value).

## See also

[Operations on files](Operations-on-Files.md)