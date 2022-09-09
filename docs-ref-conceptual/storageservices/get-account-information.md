---
title: Get Account Information (REST API) - Azure Storage
description: The Get Account Information operation returns the SKU name, account kind, and whether a hierarchical namespace is enabled for the specified account.
author: pemari-msft

ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Get Account Information

The `Get Account Information` operation returns the SKU name and account kind for the specified account. It's available on version 2018-03-28 and later versions of the service.
  
## Request 

You can construct the `Get Account Information` request by using a valid request that's authorized through shared key or shared access signature (SAS) authorization.  

If you add a `restype` value of `account` and a `comp` value of `properties`, the request will use the `Get Account Information` operation. The following table shows examples:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET/HEAD`|`https://myaccount.blob.core.windows.net/?restype=account&comp=properties`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.blob.core.windows.net/?restype=account&comp=properties&sv=myvalidsastoken`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.blob.core.windows.net/mycontainer/?restype=account&comp=properties&sv=myvalidsastoken`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?restype=account&comp=properties&sv=myvalidsastoken`|HTTP/1.1|  
  
### URI parameters
  
You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`restype`|Required. The `restype` parameter value must be `account`.|  
|`comp`|Required. The `comp` parameter value must be `properties`.|  
  
### Request headers  

The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date or x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For this operation, the version must be 2018-03-28 or later. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Use logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  

### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Version 2009-09-19 and later. Indicates the version of Azure Blob Storage that's used to execute the request.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`Content-Length`| Specifies the length of the request body. For this operation, the content length will always be zero.|  
|`x-ms-sku-name`|Identifies the [SKU name](../storagerp/SRP_SKU_Types.md) of the specified account.|  
|`x-ms-account-kind`|Identifies the [account kind](../storagerp/SRP_SKU_Types.md) of the specified account. The possible values are `Storage`, `BlobStorage`, and `StorageV2`. The header distinguishes between General Purpose v1 (GPv1) and General Purpose v2 (GPv2) storage accounts by using the substring `V2` for GPv2 accounts.|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|  
|`x-ms-is-hns-enabled`|Version 2019-07-07 and later. Indicates if the account has a hierarchical namespace enabled.|  

### Response body  

None.  
  
### Sample response  
  
```  
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Date: Sat, 28 Mar 2018 12:43:08 GMT  
x-ms-version: 2018-03-28  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
Content-Length: 0  
x-ms-sku-name: Standard_LRS  
x-ms-account-kind: StorageV2  
```  
  
## Authorization  

This operation can be authorized through:

- A shared key.
- A valid account or service SAS with at least one available permission.

> [!NOTE]
> This operation doesn't support OAuth-based authorization via an access token from Azure Active Directory/MSI or a user delegation SAS.
  
## Remarks  

The URL path of the request does not affect the information that this operation gives. Its purpose is to allow the request to correctly authorize with a SAS token that specifies the allowed resource.  

The specified resource does not need to exist for this operation to succeed. For example, a SAS token generated with a nonexistent blob and valid permissions will succeed with a URL path that includes the correct account name, the correct container name, and the nonexistent blob's name.  
