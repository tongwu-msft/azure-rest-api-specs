---
title: List Queues (REST API) - Azure Storage
description: The List Queues operation lists all of the queues in a particular storage account.
author: pemari-msft
ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# List Queues

This operation lists all of the queues in a particular storage account.  
  
## Request  

You can construct the `List Queues` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.queue.core.windows.net?comp=list`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Queue Storage port as `127.0.0.1:10001`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`http://127.0.0.1:10001/devstoreaccount1?comp=list`|HTTP/1.1|  
  
### URI Parameters  

You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Filters the results to return only queues with names that begin with the specified prefix.|  
|`marker`|A string value that identifies the portion of the list to be returned with the next list operation. The operation returns a `NextMarker` element within the response body, if the list returned wasn't complete. You can then use this value as a query parameter in a subsequent call to request the next portion of the list of queues.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Specifies the maximum number of queues to return. If `maxresults` isn't specified, the server will return up to 5,000 items.|  
|`include=metadata`|Optional. Include this parameter to specify that the container's metadata be returned as part of the response body.<br /><br /> Note that metadata requested with this parameter must be stored in accordance with the naming restrictions imposed by the 2009-09-19 version of Queue Storage. Beginning with this version, all metadata names must adhere to the naming conventions for [C# identifiers](/dotnet/csharp/language-reference).|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Queue Storage operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Queue Storage](/azure/storage/queues/monitor-queue-storage).|  
  
### Request body  

None.  
  
### Sample request  

Refer to the section "Sample request and response" later in this article.  
  
## Response  

The response includes an HTTP status code, a set of response headers, and a response body containing the list of queues.  
  
### Status code  

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Queue Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

The format of the response body is as follows. Note that the `Prefix`, `Marker`, and `MaxResults` elements are only present if you specified them on the URI. The `NextMarker` element has a value only if the list results aren't complete.  
  
For version 2013-08-15 and later, the `AccountName` attribute for the `EnumerationResults` element has been renamed to `ServiceEndpoint`. In addition, the `Url` element under `Queue` has been removed.  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.queue.core.windows.net/">  
  <Prefix>string-value</Prefix>  
  <Marker>string-value</Marker>  
  <MaxResults>int-value</MaxResults>  
  <Queues>  
    <Queue>  
      <Name>string-value</Name>  
      <Metadata>  
      <metadata-name>value</metadata-name>  
    <Metadata>  
    </Queue>  
  <NextMarker />  
</EnumerationResults>  
```  
  
The `Metadata` element is present only if the `include=metadata` parameter was specified on the URI. Within the `Metadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name.  
  
If a metadata name-value pair violates the naming restrictions enforced by the 2009-09-19 version, the response body indicates the problematic name within an `x-ms-invalid-name` element, as shown in the following XML fragment:  
  
```  
  
…  
<Metadata>  
  <MyMetadata1>first value</MyMetadata1>  
  <MyMetadata2>second value</MyMetadata2>  
  <x-ms-invalid-name>invalid-metadata-name</x-ms-invalid-name>  
<Metadata>  
…  
  
```  
  
### Sample response  

Refer to the section "Sample request and response" later in this article.
  
## Authorization  

Only the account owner can call this operation.  
  
## Remarks  

If you specify a value for the `maxresults` parameter, and the number of queues to return exceeds this value, or exceeds the default value for `maxresults`, the response body contains a `NextMarker` element. This element indicates the next queue to return on a subsequent request. To return the next set of items, specify the value of `NextMarker` as the marker parameter on the URI for the subsequent request.  
  
Note that the value of `NextMarker` should be treated as opaque.  
  
Queues are listed in alphabetical order in the response body.  
  
## Sample request and response  

Here is a sample URI that requests the list of queues for an account. It sets the maximum results to return for the initial operation to three.  
  
```  
GET https://myaccount.queue.core.windows.net?comp=list&maxresults=3&include=metadata HTTP/1.1  
```  
  
The request is sent with these headers:  
  
```  
x-ms-version: 2013-08-15  
x-ms-date: Wed, 23 Oct 2013 00:55:16 GMT  
Authorization: SharedKey myaccount:Q7tar7qqM2LD/Wey7OQNPP3hMNap9wjg+g9AlAYeFls=  
```  
  
The status code and response headers are returned as follows:  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/xml  
Date: Wed, 23 Oct 2013 00:56:38 GMT  
x-ms-version: 2013-08-15  
Server: Windows-Azure-Queue/1.0 Microsoft-HTTPAPI/2.0  
```  
  
The response XML for this request is as follows. Note that the `NextMarker` element follows the set of queues, and includes the name of the next queue to be returned.  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.queue.core.windows.net/">  
  <Prefix>q</Prefix>  
  <MaxResults>3</MaxResults>  
  <Queues>  
    <Queue>  
      <Name>q1</Name>  
      <Metadata>  
        <Color>red</Color>  
        <SomeMetadataName>SomeMetadataValue</SomeMetadataName>  
      <Metadata>  
    </Queue>  
    <Queue>  
      <Name>q2</Name>  
      <Metadata>  
        <Color>blue</Color>  
        <SomeMetadataName>SomeMetadataValue</SomeMetadataName>  
      <Metadata>  
    </Queue>  
    <Queue>  
      <Name>q3</Name>  
      <Metadata>  
        <Color>yellow</Color>  
        <SomeMetadataName>SomeMetadataValue</SomeMetadataName>  
      <Metadata>  
    </Queue>  
  </Queues>  
  <NextMarker>q4</NextMarker>  
</EnumerationResults>  
```  
  
The subsequent list operation specifies the marker on the request URI, as follows. The next set of results is returned, beginning with the queue specified by the marker. Here is the URI for the subsequent request:  
  
```  
https://myaccount.queue.core.windows.net?comp=list&maxresults=3&include=metadata&prefix=q&marker=q4  
```  
  
The response body for this operation is as follows:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.queue.core.windows.net/">  
  <Prefix>q</Prefix>  
  <Marker>q4</Marker>  
  <MaxResults>3</MaxResults>  
  <Queues>  
    <Queue>  
      <Name>q4</Name>  
      <Metadata>  
        <Color>green</Color>  
        <SomeMetadataName>SomeMetadataValue</SomeMetadataName>  
      <Metadata>  
    </Queue>  
    <Queue>  
      <Name>q5</Name>  
      <Metadata>  
        <Color>violet</Color>  
        <SomeMetadataName>SomeMetadataValue</SomeMetadataName>  
      <Metadata>  
    </Queue>  
  </Queues>  
  <NextMarker />  
</EnumerationResults>  
```  
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Queue Storage error codes](Queue-Service-Error-Codes.md)