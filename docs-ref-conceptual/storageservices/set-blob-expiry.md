---
title: Set Blob Expiry (REST API) - Azure Storage
description: The Set Blob Expiry operation sets an expiry time on an existing blob. This operation is only allowed on Hierarchical Namespace enabled accounts.
author: pemari-msft

ms.date: 10/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Set Blob Expiry

The `Set Blob Expiry` operation sets an expiry time on an existing blob. This operation is only allowed on Hierarchical Namespace enabled accounts. Applies to service version 2020-02-10 and above.

## Request  

The `Set Blob Expiry` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=expiry`|HTTP/1.1|  
  
### Emulated Storage Service URI  

When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=expiry`|HTTP/1.1|  
  
For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  

The following additional parameters may be specified on the request URI.

|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  

The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. See [Authentication for the Azure Storage Services](authorize-requests-to-azure-storage.md) for more information.|
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorize-requests-to-azure-storage.md).|
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-expiry-option`|Required. Specify the expiry option for the request see [ExpiryOption](#expiryoption).|  
|`x-ms-expiry-time`|Optional. The time when to expire the file. The format for expiry time varies corresponding to the x-ms-expiry-option, see [ExpiryOption](#expiryoption)|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server.|  
  
### ExpiryOption

The following values can be sent as x-ms-expiry-option header. Please note this header is not case-sensitive.

|Expiry Option|Description|  
|---------------------|-----------------|  
|`RelativeToCreation `|Sets the expiry time relative to the file creation time, x-ms-expiry-time must be specified as the number of milliseconds to elapse from creation time.|  
|`RelativeToNow `|Sets the expiry relative to the current time, x-ms-expiry-time must be specified as the number of milliseconds to elapse from now.|  
|`Absolute`|x-ms-expiry-time must be specified as an absolute time in RFC 1123 Format.|  
|`NeverExpire `|Sets the file to never expire or removes the current expiry time, x-ms-expiry-time must not to be specified.|  

### Request Body  

The request body for this request is empty.
  
### Sample Request  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=expiry HTTP/1.1  
  
Request Headers:  
x-ms-version: 2020-02-10  
x-ms-date: Sun, 25 Sep 2020 14:37:35 GMT
x-ms-expiry-option: RelativeTonow
x-ms-expiry-time: 30000  
Authorization: SharedKey myaccount:J4ma1VuFnlJ7yfk/Gu1GxzbfdJloYmBPWlfhZ/xn7GI=    
```  

## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status Code  

A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  

The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the file, in quotes.|  
|`Last-Modified`|Returns the date and time the directory was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the directory or its properties updates the last modified time. Operations on files do not affect the last modified time of the directory.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Date: Sun, 25 Sep 2011 23:47:09 GMT  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  

This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  
  
## Remarks  

The semantics for setting expiry on a blob are as follows:  
  
- Set Expiry can only be set on a file not a directory.  

- Set expiry with expiryTime given in past is not allowed.  

- ExpiryTime should not be specified with expiryOption as “Never” . 
  
## See Also

- [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)
- [Status and error codes](Status-and-Error-Codes2.md)
- [Blob service error codes](Blob-Service-Error-Codes.md)
