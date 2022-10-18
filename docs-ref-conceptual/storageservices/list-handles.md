---
title: List Handles (FileREST API) - Azure Files
description: The List Handles operation returns a list of open handles on a directory or a file. Optionally, it can recursively enumerate opened handles on directories and files.
author: wmgries
ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# List Handles

The `List Handles` operation returns a list of open handles on a directory or a file. Optionally, it can recursively enumerate opened handles on directories and files. This API is available beginning in version 2018-11-09.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `List Handles` request as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfileordirectory?comp=listhandles`|HTTP/1.1|  

Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the directory.|
|`myfileordirectory`|The name of the file or directory.|
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameters on the URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`marker`|Optional. A string value that identifies the portion of the list to be returned with the next `List Handles` operation. The operation returns a marker value within the response body, if the list returned wasn't complete. You can then use the marker value in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of handles taken on files or directories to return. <br /><br /> Setting `maxresults` to a value less than or equal to zero results in error response code 400 (Bad Request).|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|
|`sharesnapshot`|Optional. The `sharesnapshot` parameter is an opaque `DateTime` value that, when present, specifies the share snapshot to query for the list of handles.|
  
### Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
|`x-ms-recursive`|Optional. A Boolean value that specifies if the operation should also apply to the files and subdirectories of the directory specified in the URI.|
  
### Request body

None.
  
## Response

The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Specifies the format in which the results are returned. Currently this value is `application/xml`.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|
  
### Response body

The format of the XML response is as follows. Note that the `Marker`, `ShareSnapshot`, and `MaxResults` elements are present only if you specified them on the request URI. The `NextMarker` element has a value only if the list results aren't complete.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults>
    <HandleList>
        <Handle>
            <HandleId>handle-id</HandleId>
            <Path>file-or-directory-name-including-full-path</Path>
            <FileId>file-id</FileId>
            <ParentId>parent-file-id</ParentId>
            <SessionId>session-id</SessionId>
            <ClientIp>client-ip</ClientIp>
            <OpenTime>opened-time</OpenTime>
            <LastReconnectTime>lastreconnect-time</LastReconnectTime>
        </Handle>
        ...
    </HandleList>
    <NextMarker>next-marker</NextMarker>
</EnumerationResults>
```  
  
The following table describes fields of the response body:

|Field  |Description  |Purpose  |
|---------|---------|---------|
|`HandleId`     |XSMB service handle ID, UINT64.         |Used to identify handle.         |
|`Path`     |File name, including the full path, starting from the share root. String.         |Used to identify the name of the object for which the handle is open.         |
|`ClientIp`     |Client IP that opened the handle. String.         |Used to decide if the handle might have been leaked. |
|`OpenTime`     |Time handle was opened (UTC). `DateTime` as String.         |Used to decide if handle might have been leaked. Leaked handles have typically been open for a long time.          |
|`LastReconnectTime`     |Time handle was opened (UTC). `DateTime` as String.         |Used to decide if handle was reopened after a client/server disconnect, due to networking or other faults. The field is included in the response body only if the disconnect event occurred and the handle was reopened.         |
|`FileId`     |File ID, UINT64.         |`FileId` uniquely identifies the file. It is useful during renames, because the `FileId` doesn't change.         |
|`ParentId`     |Parent File ID, UINT64.         |`ParentId` uniquely identifies the directory. This is useful during renames, because the `ParentId` doesn't change.         |
|`SessionId`     |SMB session ID that specifies the context in which the file handle was opened. UINT64.         |`SessionId` is included in event viewer logs when sessions are forcibly disconnected. It allows you to associate a specific batch of leaked handles with a specific network incident.         |
|`NextMarker`    |A string that describes the next handle to be listed. It is returned when more handles need to be listed in order to complete the request.| The string is used in subsequent requests to list remaining handles. The absence of `NextMarker` indicates that all relevant handles were listed.|

## Authorization

Only the account owner can call this operation.  
  
## Remarks

The `HandleId` is a service-side handle ID, distinct from the client handle ID. Mapping between the two is possible at the client.
  
## See also

- [Operations on files](Operations-on-Files.md)
- [Operations on directories](Operations-on-Directories.md)