---
title: List Shares (FileREST API) - Azure Files
description: The List Shares operation returns a list of the shares and share snapshots under the specified account.
author: wmgries
ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# List Shares

The `List Shares` operation returns a list of the shares and share snapshots under the specified account. This API is fully supported, but it's a legacy management API. Use [File Shares - List](/rest/api/storagerp/file-shares/list), provided by the storage resource provider (Microsoft.Storage), instead. To learn more about programmatically interacting with `FileShare` resources by using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request

You can construct the `List Shares` request as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.file.core.windows.net/?comp=list`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Optional. Filters the results to return only shares that have names that begin with the specified prefix.|  
|`marker`|Optional. A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a marker value within the response body, if the list returned wasn't complete. You can then use the marker value in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of shares to return. If the request doesn't specify `maxresults`, or specifies a value greater than 5,000, the server will return up to 5,000 items. If the parameter is set to a value less than or equal to zero, the server will return status code 400 (Bad Request).|  
|`include=metadata,snapshots,deleted`|Optional. Specifies one or more datasets to include in the response:<br /><br /> -   `snapshots`: Version 2017-04-17 and later. Specifies that share snapshots should be included in the response. Share snapshots are listed from oldest to newest in the response.<br />-   `metadata`: Specifies that share metadata should be returned in the response.<br /> -   `deleted`: Specifies that deleted file shares should be included in the response.<br /><br /> To specify more than one of these options on the URI, you must separate each option with a URL-encoded comma ("%82").<br /><br /> All metadata names must adhere to the naming conventions for [C# identifiers](/dotnet/csharp/language-reference).|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds.  For more information, see [Setting timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
  
### Request body

None.
  
## Response

The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers

The response for this operation includes the following headers. The response also includes additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Standard HTTP/1.1 header. Specifies the format in which the results are returned. Currently, this value is `application/xml`.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date` or `x-ms-date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|
  
### Response body

The format of the response body is as follows.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults AccountName="https://myaccount.file.core.windows.net">  
  <Prefix>string-value</Prefix>  
  <Marker>string-value</Marker>  
  <MaxResults>int-value</MaxResults>  
  <Shares>  
    <Share>  
      <Name>share-name</Name>  
      <Snapshot>Date-Time Value</Snapshot>
      <Version>01D2AC0C18EDFE36</Version> 
      <Deleted>true</Deleted>  
      <Properties>  
        <Last-Modified>date/time-value</Last-Modified>  
        <Etag>etag</Etag>  
        <Quota>max-share-size</Quota>
        <DeletedTime>Mon, 24 Aug 2020 04:56:10 GMT</DeletedTime>  
        <RemainingRetentionDays>360</RemainingRetentionDays>
        <AccessTier>TransactionOptimized</AccessTier>
        <AccessTierChangeTime>Mon, 24 Aug 2020 03:56:10 GMT</AccessTierChangeTime>
        <AccessTierTransitionState>pending-from-cool</AccessTierTransitionState>
        <EnabledProtocols>SMB</EnabledProtocols>
      </Properties>  
      <Metadata>  
        <metadata-name>value</metadata-name>  
      </Metadata>  
    </Share>  
  </Shares>  
  <NextMarker>marker-value</NextMarker>  
</EnumerationResults>  
```  

- The `EnabledProtocols` element appears in the response body only in version 2020-02-10 and later.
- The `RootSquash` element appears in the response body only in version 2020-02-10 and later, when the enabled protocols contain NFS.
- The `Quota` element appears in the response body only in version 2015-02-21 and later.  
- The `Version`, `Deleted`, `DeletedTime`, and `RemainingRetentionDays` elements appear in the response body only in version 2019-12-12 and later.  
- The `Prefix`, `Marker`, and `MaxResults` elements are only present if you specify them on the URI. The `NextMarker` element has a value only if the list results aren't complete.  
- The `Metadata` element is present only if you specify the `include=metadata` parameter on the URI. Within the `Metadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name.  
- The snapshots are included in the response only if you specify the`include=snapshots` parameter with the `include` parameter on the request URI.
- The `AccessTier` element holds the tier of the share. If the share's tier hasn't been changed, this property will be the default tier `TransactionOptimized` on general-purpose version 2 (GPv2) storage accounts. On Azure Files storage accounts, the property will be `Premium`, which is the only tier supported.
- The `AccessTierChangeTime` element is present only if you explicitly set the access tier on the share.
- The `AccessTierTransitionState` element is present only if the share is transitioning from one tier to another. It indicates the tier it is transitioning from.
- The `ProvisionedIngressMBps` element is present only for `Premium` Azure Files accounts, and version 2019-07-07 or later. It shows provisioned ingress in MiB/s.
- The `ProvisionedEgressMBps` element is present only for `Premium` Azure Files accounts, and version 2019-07-07 or later. It shows provisioned egress in MiB/s.
- The `ProvisionedBandwidthMiBps` element is present only for `Premium` Azure Files accounts, and version 2021-02-12 or later. It shows provisioned bandwidth (ingress + egress combined) in MiB/s.

### Sample response

See the [Sample request and response](#sample-request-and-response) section later in this topic.
  
## Authorization

Only the account owner can call this operation.  
  
## Remarks

If you specify a value for the `maxresults` parameter, and the number of shares to return exceeds this value, or exceeds the default value for `maxresults`, the response body contains a `NextMarker` element. This element indicates the next share to return on a subsequent request. To return the next set of items, specify the value of `NextMarker` as the marker parameter on the URI for the subsequent request.  
  
Note that the value of `NextMarker` should be treated as opaque.  
  
Shares are listed in alphabetical order in the response body.  
  
The `List Shares` operation times out after 30 seconds.  
  
## Sample request and response

The following sample URI requests the list of shares for an account. It sets the maximum results to return for the initial operation to three.  
  
```
GET https://myaccount.file.core.windows.net/?comp=list&maxresults=3&include=snapshots HTTP/1.1  
```  
  
The request is sent with these headers:  
  
```
x-ms-version: 2020-02-10  
x-ms-date: <date>  
Authorization: SharedKey myaccount:CY1OP3O3jGFpYFbTCBimLn0Xov0vt0khH/D5Gy0fXvg=  
```  
  
The status code and response headers are returned as follows:  
  
```
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/xml  
Date: <date>  
x-ms-version: 2020-02-10  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
The response XML for this request is as follows. Note that the `NextMarker` element follows the set of shares, and includes the name of the next share to be returned.  
  
```xml
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint=" https://myaccount.file.core.windows.net">  
  <MaxResults>3</MaxResults>  
  <Shares>  
    <Share>  
      <Name>audio</Name>  
      <Properties>  
        <Last-Modified><date></Last-Modified>  
        <Etag>0x8CACB9BD7C6B1B2</Etag>  
        <Quota>55</Quota>
        <AccessTier>Premium</AccessTier>
        <EnabledProtocols>SMB</EnabledProtocols>
      </Properties>  
    </Share>  
    <Share>  
      <Name>images</Name>  
      <Properties>  
        <Last-Modified><date></Last-Modified>  
        <Etag>0x8CACB9BD7C1EEEC</Etag>
        <AccessTier>Premium</AccessTier>
        <EnabledProtocols>SMB</EnabledProtocols>
      </Properties>  
    </Share>  
    <Share>
      <Name>textfiles</Name>
      <Snapshot>2017-05-12T20:52:22.0000000Z</Snapshot>
      <Properties>
        <Last-Modified><date></Last-Modified>
        <Etag>0x8D3F2E1A9D14700</Etag>
        <Quota>30</Quota>
        <AccessTier>Premium</AccessTier>
        <EnabledProtocols>NFS</EnabledProtocols>
        <RootSquash>RootSquash</RootSquash>
      </Properties>
    </Share>
    <Share>  
      <Name>textfiles</Name>  
      <Properties>  
        <Last-Modified><date></Last-Modified>  
        <Etag>0x8CACB9BD7BACAC3</Etag>  
        <Quota>30</Quota>
        <AccessTier>Premium</AccessTier>
        <EnabledProtocols>NFS</EnabledProtocols>
        <RootSquash>AllSquash</RootSquash>  
      </Properties>  
    </Share>
  </Shares>  
  <NextMarker>video</NextMarker>  
</EnumerationResults>  
```  
  
The subsequent list operation specifies the marker on the request URI, as follows. The next set of results is returned, beginning with the share specified by the marker.  
  
```
https://myaccount.file.core.windows.net/?comp=list&maxresults=3&marker=video  
```  
  
## See also

[Azure Files REST API](File-Service-REST-API.md)