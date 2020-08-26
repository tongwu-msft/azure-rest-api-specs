---
title: Set Blob Expiry (REST API) - Azure Storage
description: The Set Blob Expiry operation sets an expiry time on the blob.
author: abar-msft
ms.date: 07/06/2020
ms.service: storage
ms.topic: reference
ms.author: abar
---
# Set Blob Expiry
The `Set Blob Expiry` operation sets an expiry time on a blob. This API is only allowed on an Hierarchical Namespace(HNS) enabled account.   
  
## Request  
 The `Set Blob Expiry` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=expiry`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=expiry`|HTTP/1.1|  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. See [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md) for more information.|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-expiry-option`|Required. Specify the expiry option for the request see  [Expiry Option](#ExpiryOption).|  
|`x-ms-expiry-time`|Required. The time when to expire the following corresponding to the x-ms-expiry-option.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### ExpiryOption
The following values can be sent as x-ms-expiry-option header. Please note this header is not case-sensitive.
|Expiry Option|Description|  
|---------------------|-----------------|  
|`RelativeToCreation `|Set the expiry relative to the time when the file was created. User will pass the number of milliseconds elapsed from creation time as x-ms-expiry-time.|  
|`RelativeToNow `|Set the expiry relative to the current time. User will pass the number of milliseconds elapsed from now as x-ms-expiry-time.|  
|`Absolute`|With this expiry-option user can give x-ms-expiry time as an Absolute time in RFC 1123 Format.|  
|`Neverexpire `|Set the file to never expire or removes the current expiry time set, x-ms-expiry-time is not needed to be specified with this option .|  

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
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
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
  
-   Set Expiry can only be set on a file not a directory.  

-   Set expiry with expiryOption as "Absolute" and expiryTime given in past is not allowed.  

-    Set expiry with expiryOption as “Never” and expiryTime non-null should fail will fail. 
  
## See Also  
 [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)