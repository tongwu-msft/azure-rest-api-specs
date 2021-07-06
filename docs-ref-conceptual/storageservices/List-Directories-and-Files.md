---
title: List Directories and Files (FileREST API) - Azure Files
description: The List Directories and Files operation returns a list of files or directories under the specified share or directory. It lists the contents only for a single level of the directory hierarchy.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# List Directories and Files
The `List Directories and Files` operation returns a list of files or directories under the specified share or directory. It lists the contents only for a single level of the directory hierarchy.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request
The `List Directories and Files` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath?restype=directory&comp=list`|HTTP/1.1|  
|`GET`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath?restype=directory&sharesnapshot=<DateTime>&comp=list`|HTTP/1.1|  

Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|The path to the directory.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
The following additional parameters may be specified on the URI.  
  
| Parameter | Description |  
|-|-|  
| `prefix` | Optional. Version 2016-05-31 and newer. Filters the results to return only files and directories whose name begins with the specified prefix. |
| `sharesnapshot` | Optional. Version 2017-04-17 and newer. The share snapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query for the list of files and directories. |
| `marker` | Optional. A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a marker value within the response body if the list returned was not complete. The marker value may then be used in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client. |
| `maxresults` | Optional. Specifies the maximum number of files and/or directories to return. If the request does not specify `maxresults` or specifies a value greater than 5,000, the server will return up to 5,000 items.<br /><br /> Setting `maxresults` to a value less than or equal to zero results in error response code 400 (Bad Request). |
| `include={Timestamps, ETag, Attributes, PermissionKey}` | Optionally available starting in version 2020-04-08. Specifies one or more properites to include in the response:<br /><ul><li>Timestamps</li><li>ETag</li><li>Attributes (Win32 file attributes)</li><li>PermissionKey</li></ul><br /><br />To specify more than one of these options on the URI, you must separate each option with a URL-encoded comma (`%82`).<br /><br />The header in `x-ms-file-extended-info` is implicitly assumed to be true when this parameter is specified.  |
| `timeout` | Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md). |
  
### Request headers
The following table describes required and optional request headers.  
  
| Request header | Description |  
|--------------------|-----------------|  
| `Authorization` | Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md). |  
| `Date` or `x-ms-date` | Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md). |  
| `x-ms-version` | Required for all authorized requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md). |
| `x-ms-client-request-id` | Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage). |
| `x-ms-file-extended-info: {true}` | Optional. Version 2020-04-08 and newer. This header is implicitly assumed to be true if `include` query parameter is not empty. If true, the `Content-Length` property will be up to date. `FileId` will be returned in response only if this header is true. |

### Request body
None.  
  
## Response
The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
| Response header | Description |
|-|-|  
| `Content-Type` | Specifies the format in which the results are returned. Currently this value is `application/xml`. |  
| `x-ms-request-id` | This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md). |
| `x-ms-version` | Indicates the version of the File service used to execute the request. |
| `Date` or `x-ms-date` | A UTC date/time value generated by the service that indicates the time at which the response was initiated. |
| `x-ms-client-request-id` | This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response. |
  
### Response body
The format of the XML response is as follows.  
  
Note that the `Marker`, `ShareSnapshot` and `MaxResults` elements are present only if they were specified on the request URI. The `NextMarker` element has a value only if the list results are not complete.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.file.core.windows.net/" ShareName="myshare" ShareSnapshot="date-time" DirectoryPath="directory-path">  
  <Marker>string-value</Marker>
  <Prefix>string-value</Prefix>
  <MaxResults>int-value</MaxResults>
  <DirectoryId>directory-id</DirectoryId>
  <Entries>
    <File>
      <FileId>file-id</FileId>
      <Name>file-name</Name>  
      <Properties>  
        <Content-Length>size-in-bytes</Content-Length>
        <CreationTime>datetime</CreationTime>
        <ChangeTime>datetime</ChangeTime>
        <Last-Modified>datetime</Last-Modified>
        <Etag>etag</Etag>
      </Properties>
      <Attributes>Archive|Hidden|Offline|ReadOnly</Attributes>
      <PermissionKey>4066528134148476695*1</PermissionKey>
    </File>  
    <Directory>
      <FileId>file-id</FileId>
      <Name>directory-name</Name>  
      <Properties>
        <CreationTime>datetime</CreationTime>
        <ChangeTime>datetime</ChangeTime>
        <Last-Modified>datetime</Last-Modified>
        <Etag>etag</Etag>
      </Properties>
      <Attributes>Archive|Hidden|Offline|ReadOnly</Attributes>
      <PermissionKey>4066528134148476695*1</PermissionKey>
    </Directory>  
  </Entries>  
  <NextMarker />  
</EnumerationResults>  
```  
  
Note that the `Content-Length` element is returned in the listing. However, this value may not be up-to-date since an SMB client may have modified the file locally. The value of `Content-Length` may not reflect that fact until the handle is closed or the op-lock is broken. To retrieve current property values, call [Get File Properties](Get-File-Properties.md).

In versions 2020-04-08, 2020-06-12 and 2020-08-04, `FileId` will be returned for files and directories if the header `x-ms-file-extended-info` is true. In versions 2020-10-02 and newer, `FileId` will always be returned for files and directories.

In version 2020-04-08, `include={timestamps}` will return following 3 timestamp properties – `CreationTime`, `LastAccessTime` and `LastWriteTime`. In versions `2020-06-12` and newer, `include={timestamps}` will return following 5 timestamp properties – `CreationTime`, `LastAccessTime` and `LastWriteTime`, `ChangeTime` and `Last-Modified`.

In versions 2020-10-02 and newer, `DirectoryId` is returned in the response. It specifies the `FileId` of the directory the API is being called on.

### Datetime format and API version for timestamp fields
| Element | Datetime format | Sample value | API version |
|-|-|-|-|
| `CreationTime` | ISO 8601 | `2020-09-17T13:38:03.2740000Z` | 2020-04-08 and newer |
| `LastAccessTime` | ISO 8601 | `2020-09-17T13:38:03.2740000Z` | 2020-04-08 and newer |
| `LastWriteTime` | ISO 8601 | `2020-09-17T13:38:03.2740000Z` | 2020-04-08 and newer |
| `ChangeTime` | ISO 8601 | `2020-09-17T13:38:03.2740000Z` | 2020-06-12 and newer |
| `Last-Modified` | RFC 1123 | `Thu, 17 Sep 2020 13:38:07 GMT` | 2020-06-12 and newer |

## Authorization
Only the account owner may call this operation.  
  
## Remarks
The value returned in the `Content-Length` element corresponds to the value of the file's `x-ms-content-length` header.  
  
Note that each `Directory` element returned counts toward the maximum result, just as each `File` element does. Files and directories are listed intermingled in lexically sorted order in the response body.  
  
Listing is limited to a single level of the directory hierarchy. In order to list multiple levels, you can make multiple calls in an iterative manner by using the `Directory` value returned from one result in a subsequent call to `List Directories and Files`.  
  
## See also  
[Operations on Directories](Operations-on-Directories.md)
