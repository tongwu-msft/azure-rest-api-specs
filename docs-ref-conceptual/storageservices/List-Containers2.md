---
title: List Containers (REST API) - Azure Storage
description: The List Containers operation returns a list of the containers under the specified storage account.  
author: pemari-msft
ms.date: 03/22/2022
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# List Containers

The `List Containers` operation returns a list of the containers under the specified storage account.  
  
## <a name="Request"></a> Request  

You can construct the `List Containers` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`https://myaccount.blob.core.windows.net/?comp=list`|HTTP/1.1|  
  
Note that the URI must always include the forward slash (/) to separate the host name from the path and query portions of the URI. In the case of the `List Containers` operation, the path portion of the URI is empty.  
  
### Emulated storage service request  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET`|`http://127.0.0.1:10000/devstoreaccount1?comp=list`|HTTP/1.1|  
  
Note that emulated storage only supports blob sizes up to 2 GiB.  
  
For more information, see [Use Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite) and [Differences between the Storage emulator and Azure Storage services](/azure/storage/storage-use-emulator#differences-between-the-storage-emulator-and-azure-storage).  
  
### URI parameters  

You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`prefix`|Optional. Filters the results to return only containers with a name that begins with the specified prefix.|  
|`marker`|Optional. A string value that identifies the portion of the list of containers to be returned with the next listing operation. The operation returns the `NextMarker` value within the response body, if the listing operation didn't return all containers remaining to be listed with the current page. You can use the `NextMarker` value as the value for the `marker` parameter in a subsequent call to request the next page of list items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of containers to return. If the request doesn't specify `maxresults`, or specifies a value greater than 5000, the server will return up to 5000 items. <br /><br />Note that if the listing operation crosses a partition boundary, then the service will return a continuation token for retrieving the remainder of the results. For this reason, it's possible that the service will return fewer results than specified by `maxresults`, or than the default of 5000. <br /><br />If the parameter is set to a value less than or equal to zero, the server returns status code 400 (Bad Request).|  
|`include={metadata,deleted,system}`|Optional. Specifies one or more datasets to include in the response:<br /><br /> -`metadata`: Note that metadata requested with this parameter must be stored in accordance with the naming restrictions imposed by the 2009-09-19 version of Blob Storage. Beginning with this version, all metadata names must adhere to the naming conventions for [C# identifiers](/dotnet/csharp/language-reference).<br /> -`deleted`: Version 2019-12-12 and later. Specifies that soft-deleted containers should be included in the response.<br />-`system`: Version 2020-10-02 and later. Specifies if system containers are to be included in the response. Including this option will list system containers, such as `$logs` and `$changefeed`. Note that the specific system containers returned will vary, based on which service features are enabled on the storage account.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  
  
### Request body  

None.  
  
## <a name="Response"></a> Response  

The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code  

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response also includes additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Standard HTTP/1.1 header. Specifies the format in which the results are returned. Currently, this value is `application/xml`.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

The format of the response body is as follows.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.blob.core.windows.net">  
  <Prefix>string-value</Prefix>  
  <Marker>string-value</Marker>  
  <MaxResults>int-value</MaxResults>  
  <Containers>  
    <Container>  
      <Name>container-name</Name>  
      <Version>container-version</Version>
      <Deleted>true</Deleted>
      <Properties>  
        <Last-Modified>date/time-value</Last-Modified>  
        <Etag>etag</Etag>  
        <LeaseStatus>locked | unlocked</LeaseStatus>  
        <LeaseState>available | leased | expired | breaking | broken</LeaseState>  
        <LeaseDuration>infinite | fixed</LeaseDuration> 
        <PublicAccess>container | blob</PublicAccess>
        <HasImmutabilityPolicy>true | false</HasImmutabilityPolicy>
        <HasLegalHold>true | false</HasLegalHold>
        <DeletedTime>datetime</DeletedTime>
        <RemainingRetentionDays>no-of-days</RemainingRetentionDays>
      </Properties>  
      <Metadata>  
        <metadata-name>value</metadata-name>  
      </Metadata>  
    </Container>  
  </Containers>  
  <NextMarker>marker-value</NextMarker>  
</EnumerationResults>  
```  
  
`LeaseStatus`, `LeaseState`, and `LeaseDuration` only appear in version 2012-02-12 and later.  
  
Beginning with version 2013-08-15, the `AccountName` attribute for the `EnumerationResults` element has been renamed to `ServiceEndpoint`. The `URL` element has also been removed from the `Container` element. For versions prior to 2013-08-15, the container's URL, as specified by the `URL` field, doesn't include the `restype=container` parameter. If you use this value to make subsequent requests against the enumerated containers, be sure to append this parameter to indicate that the resource type is a container.  
  
The `Prefix`, `Marker`, and `MaxResults` elements are only present if you specify them on the URI. The `NextMarker` element has a value only if the list results aren't complete.  
  
The `Metadata` element is present only if you specify the `include=metadata` parameter on the URI. Within the `Metadata` element, the value of each name-value pair is listed within an element corresponding to the pair's name.  
  
If a metadata name-value pair violates the naming restrictions enforced by the 2009-09-19 version, the response body indicates the problematic name within an `x-ms-invalid-name` element. The following XML fragment shows this:  
  
```  
  
<Metadata>  
  <MyMetadata1>first value</MyMetadata1>  
  <MyMetadata2>second value</MyMetadata2>  
  <x-ms-invalid-name>invalid-metadata-name</x-ms-invalid-name>  
</Metadata>  
  
```  

Beginning with the 2016-05-31 version, the container public permissions are provided in the `PublicAccess` property. It indicates whether data in the container can be accessed publicly, and the level of access. Possible values include:

- `container`: Indicates full, public read access for container and blob data. Clients can enumerate blobs within the container via anonymous request, but can't enumerate containers within the storage account.
- `blob`: Indicates public read access for blobs. Blob data within this container can be read via anonymous request, but container data isn't available. Clients can't enumerate blobs within the container via anonymous request.

If this property isn't specified in the `<properties>` section, the container is private to the account owner.

`HasImmutabilityPolicy` and `HasLegalHold` only appear in version 2017-11-09 and later.
`HasImmutabilityPolicy` is `true` if the container has an immutability policy set on it, and `false` otherwise.
`HasLegalHold` is `true` if the container has one or more legal holds on it, and `false` otherwise.

> [!NOTE]
> Beginning with version 2009-09-19, the response body for `List Containers` returns the container's last modified time, in an element named `Last-Modified`. In previous versions, this element was named `LastModified`.  

The `Version`, `Deleted`, `DeletedTime`, and `RemainingRetentiondays` elements only appear in version 2019-12-12 and later if you specify the `deleted` value for the query parameter `include`. These elements only appear if the container is soft deleted and is eligible to be restored. The `Version`, `Deleted`, `DeletedTime`, and `RemainingRetentiondays` elements only appear in version 2019-12-12 and later if the deleted value is specified for the `include` query parameter and if the container is soft deleted and eligible to be restored.
  
## <a name="Authorization"></a> Authorization  

Only the account owner can call this operation.  
  
## Remarks  

If you specify a value for the `maxresults` parameter, and the number of containers to return exceeds this value, or exceeds the default value for `maxresults`, the response body will contain the `NextMarker` element. (This is also referred to as a *continuation token*). 

`NextMarker` indicates the next container to return on a subsequent request. To return the next set of items, specify the value of `NextMarker` for the `marker` parameter on the URI for the subsequent request. Note that the value of `NextMarker` should be treated as opaque.

If the listing operation crosses a partition boundary, then the service will return a value for the `NextMarker` element for retrieving the remainder of the results from the next partition. A listing operation that spans more than one partition results in a smaller set of items being returned than is specified by `maxresults`, or than the default of 5000. Your application should always check for the presence of the `NextMarker` element when you perform a listing operation, and handle it accordingly.
  
Containers are listed in alphabetical order in the response body.  
  
The `List Containers` operation times out after 30 seconds.  
  
## <a name="Samplerequestandresponse"></a> Sample request and response  

The following sample URI requests the list of containers for an account, setting the maximum results to return for the initial operation to three.  
  
```  
GET https://myaccount.blob.core.windows.net/?comp=list&maxresults=3 HTTP/1.1  
```  
  
The request is sent with these headers:  
  
```  
x-ms-version: 2016-05-31  
x-ms-date: Wed, 26 Oct 2016 22:08:44 GMT  
Authorization: SharedKey myaccount:CY1OP3O3jGFpYFbTCBimLn0Xov0vt0khH/D5Gy0fXvg=  
```  
  
The status code and response headers are returned as follows:  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/xml  
Date: Wed, 26 Oct 2016 22:08:54 GMT  
x-ms-version: 2016-05-31  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
  
```  
  
The response XML for this request is as follows. Note that the `NextMarker` element follows the set of containers, and includes the name of the next container to be returned.  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint="https://myaccount.blob.core.windows.net/">  
  <MaxResults>3</MaxResults>  
  <Containers>  
    <Container>  
      <Name>audio</Name>  
      <Properties>  
        <Last-Modified>Wed, 26 Oct 2016 20:39:39 GMT</Last-Modified>  
        <Etag>0x8CACB9BD7C6B1B2</Etag> 
        <PublicAccess>container</PublicAccess> 
      </Properties>  
    </Container>  
    <Container>  
      <Name>images</Name>  
      <Properties>  
        <Last-Modified>Wed, 26 Oct 2016 20:39:39 GMT</Last-Modified>  
        <Etag>0x8CACB9BD7C1EEEC</Etag>  
      </Properties>  
    </Container>  
    <Container>  
      <Name>textfiles</Name>  
      <Properties>  
        <Last-Modified>Wed, 26 Oct 2016 20:39:39 GMT</Last-Modified>  
        <Etag>0x8CACB9BD7BACAC3</Etag>  
      </Properties>  
    </Container>  
  </Containers>  
  <NextMarker>video</NextMarker>  
</EnumerationResults>  
```  
  
The subsequent list operation specifies the marker on the request URI, as follows. The next set of results is returned, beginning with the container specified by the marker.  
  
```  
https://myaccount.blob.core.windows.net/?comp=list&maxresults=3&marker=video  
```  
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Enumerating blob resources](Enumerating-Blob-Resources.md)   
[Using the Azure Storage emulator for development and testing](/azure/storage/storage-use-emulator)   
[Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md)