---
title: "List Shares"
ms.custom: na
ms.date: 2016-06-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: e731d02f-4447-4d91-8228-b233e8a28c1d
caps.latest.revision: 12
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
# List Shares
The `List Shares` operation returns a list of the shares and share snapshots under the specified account.  
  
##  <a name="Request"></a> Request  
 The `List Shares` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.file.core.windows.net/?comp=list`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Optional. Filters the results to return only shares whose name begins with the specified prefix.|  
|`marker`|Optional. A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a marker value within the response body if the list returned was not complete. The marker value may then be used in a subsequent call to request the next set of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of shares to return. If the request does not specify `maxresults`, or specifies a value greater than 5,000, the server will return up to 5,000 items. If the parameter is set to a value less than or equal to zero, the server will return status code 400 (Bad Request).|  
|`include=metadata,snapshots`|Optional. Specifies one or more datasets to include in the response:<br /><br /> -   `snapshots`: Version 2017-04-17 and newer. Specifies that share snapshots should be included in the enumeration. Share Snapshots are listed from oldest to newest in the response.<br />-   `metadata`: Specifies that share metadata should be returned in the response.<br /><br /> To specify more than one of these options on the URI, you must separate each option with a URL-encoded comma ("%82").<br /><br /> All metadata names must adhere to the naming conventions for [C# identifiers](http://msdn.microsoft.com/library/aa664670\(VS.71\).aspx).|  
|`timeout`|Optional. The timeout parameter is expressed in seconds.  For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
  
### Request Body  
 None.  
  
### Sample Request  
 See the [Sample Request and Response](#samplerequestandresponse) section later in this topic.  
  
##  <a name="Response"></a> Response  
 The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response also includes additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Standard HTTP/1.1 header. Specifies the format in which the results are returned. Currently, this value is application/xml.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
  
### Response Body  
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
      <Properties>  
        <Last-Modified>date/time-value</Last-Modified>  
        <Etag>etag</Etag>  
        <Quota>max-share-size</Quota>  
      </Properties>  
      <Metadata>  
        <metadata-name>value</metadata-name>  
      </Metadata>  
    </Share>  
  </Shares>  
  <NextMarker>marker-value</NextMarker>  
</EnumerationResults>  
```  
  
 The `Quota` element appears in the response body only in versions 2015-02-21 and later.  
  
 The `Prefix`, `Marker`, and `MaxResults` elements are only present if they were specified on the URI. The `NextMarker` element has a value only if the list results are not complete.  
  
 The `Metadata` element is present only if the `include=metadata` parameter was specified on the URI. Within the `Metadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name.  

 The `Snapshots` are included in the response only if the`include=snapshots` parameter was specified with the include parameter on the request URI.
  
### Sample Response  
 See the [Sample Request and Response](#samplerequestandresponse) section later in this topic.  
  
##  <a name="Authorization"></a> Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
 If you specify a value for the `maxresults` parameter and the number of shares to return exceeds this value, or exceeds the default value for `maxresults`, the response body will contain a `NextMarker` element that indicates the next share to return on a subsequent request. To return the next set of items, specify the value of `NextMarker` as the marker parameter on the URI for the subsequent request.  
  
 Note that the value of `NextMarker` should be treated as opaque.  
  
 Shares are listed in alphabetical order in the response body.  
  
 The `List Shares` operation times out after 30 seconds.  
  
##  <a name="Samplerequestandresponse"></a> Sample Request and Response  
 The following sample URI requests the list of shares for an account, setting the maximum results to return for the initial operation to 3.  
  
```  
GET https://myaccount.file.core.windows.net/?comp=list&maxresults=3&include=snapshots HTTP/1.1  
```  
  
 The request is sent with these headers:  
  
```  
x-ms-version: 2017-04-17  
x-ms-date: <date>  
Authorization: SharedKey myaccount:CY1OP3O3jGFpYFbTCBimLn0Xov0vt0khH/D5Gy0fXvg=  
```  
  
 The status code and response headers are returned as follows:  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/xml  
Date: <date>  
x-ms-version: 2017-04-17  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
 The response XML for this request is as follows. Note that the `NextMarker` element follows the set of shares and includes the name of the next share to be returned.  
  
```  
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
   </Properties>  
  </Share>  
  <Share>  
   <Name>images</Name>  
   <Properties>  
    <Last-Modified><date></Last-Modified>  
    <Etag>0x8CACB9BD7C1EEEC</Etag>  
   </Properties>  
  </Share>  
  <Share>
   <Name>textfiles</Name>
   <Snapshot>2017-05-12T20:52:22.0000000Z</Snapshot>
   <Properties>
     <Last-Modified><date></Last-Modified>
     <Etag>0x8D3F2E1A9D14700</Etag>
     <Quota>30</Quota>
   </Properties>
  </Share>
  <Share>  
   <Name>textfiles</Name>  
   <Properties>  
    <Last-Modified><date></Last-Modified>  
    <Etag>0x8CACB9BD7BACAC3</Etag>  
    <Quota>30</Quota>  
   </Properties>  
  </Share>
 </Shares>  
 <NextMarker>video</NextMarker>  
</EnumerationResults>  
```  
  
 The subsequent list operation specifies the marker on the request URI, as follows. The next set of results is returned beginning with the share specified by the marker.  
  
```  
https://myaccount.file.core.windows.net/?comp=list&maxresults=3&marker=video  
```  
  
## See Also  
 [File Service REST API](File-Service-REST-API.md)
