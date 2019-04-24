---
title: "List Directories and Files"
ms.custom: na
ms.date: 2016-12-13
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 8e95397a-64b9-491c-a7cf-1b27b9e30761
caps.latest.revision: 9
author: tamram
manager: carolz
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# List Directories and Files
The `List Directories and Files` operation returns a list of files or directories under the specified share or directory. It lists the contents only for a single level of the directory hierarchy.  
  
## Request  
 The `List Directories and Files` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath?restype=directory&comp=list`|HTTP/1.1|  
|`GET`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath?restype=directory&sharesnapshot=<DateTime>&comp=list`|HTTP/1.1|  

 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*mydirectorypath*|The path to the directory.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI Parameters  
 The following additional parameters may be specified on the URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Optional. Version 2016-05-31 and newer. Filters the results to return only files and directories whose name begins with the specified prefix.|
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The share snapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query for the list of files and directories.|
|`marker`|Optional. A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a marker value within the response body if the list returned was not complete. The marker value may then be used in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of files and/or directories to return. If the request does not specify `maxresults` or specifies a value greater than 5,000, the server will return up to 5,000 items.<br /><br /> Setting `maxresults` to a value less than or equal to zero results in error response code 400 (Bad Request).|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
  
### Request Body  
 None.  
  
##  <a name="response"></a> Response  
 The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Specifies the format in which the results are returned. Currently this value is `application/xml`.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
  
### Response Body  
 The format of the XML response is as follows.  
  
 Note that the `Marker`, `ShareSnapshot` and `MaxResults` elements are present only if they were specified on the request URI. The `NextMarker` element has a value only if the list results are not complete.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.file.core.windows.net/” ShareName="myshare" ShareSnapshot="date-time" DirectoryPath="directory-path">  
  <Marker>string-value</Marker>  
  <MaxResults>int-value</MaxResults>
  <Prefix>prefix-value</Prefix>  
  <Entries>  
    <File>  
      <Name>file-name</Name>  
      <Properties>  
        <Content-Length>size-in-bytes</Content-Length>  
      </Properties>  
    </File>  
    <Directory>  
      <Name>directory-name</Name>  
    </Directory>  
  </Entries>  
  <NextMarker />  
</EnumerationResults>  
```  
  
 Note that the `Content-Length` element is returned in the listing. However, this value may not be up-to-date since an SMB client may have modified the file locally. The value of `Content-Length` may not reflect that fact until the handle is closed or the op-lock is broken. To retrieve current property values, call [Get File Properties](Get-File-Properties.md).  
  
##  <a name="authorization"></a> Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
 The value returned in the `Content-Length` element corresponds to the value of the file’s `x-ms-content-length` header.  
  
 Note that each `Directory` element returned counts toward the maximum result, just as each `File` element does. Files and directories are listed intermingled in lexically sorted order in the response body.  
  
 Listing is limited to a single level of the directory hierarchy. In order to list multiple levels, you can make multiple calls in an iterative manner by using the `Directory` value returned from one result in a subsequent call to `List Directories and Files`.  
  
## See Also  
 [Operations on Directories](Operations-on-Directories.md)
