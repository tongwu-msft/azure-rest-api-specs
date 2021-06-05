---
title: Get File Service Properties (REST API) - Azure Storage
description: The Get File Service Properties operation gets properties for a storage account's File service endpoint.
author: wmgries

ms.date: 09/12/2020
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Get File Service Properties
The `Get File Service Properties` operation gets properties for a storage account's File service endpoint.
  
## Request
The `Get File Service Properties` request may be specified as follows. HTTPS is recommended. Replace `<account-name>` with the name of your storage account:  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|`https://<account-name>.file.core.windows.net/?restype=service&comp=properties`|HTTP/1.1|  
  
Note that the URI must always include the forward slash (/) to separate the host name from the path and query portions of the URI. In the case of this operation, the path portion of the URI is empty.  
  
### URI parameters
|URI parameter|Description|  
|-------------------|-----------------|  
|*restype=service&comp=properties*|Required. The combination of both query strings is required to set the storage service properties.|  
|*timeout*|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in versions 2015-02-21 and later. To retrieve metrics properties for the File service, you must specify version 2015-04-05 or later.<br /><br /> For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
  
### Request body
None.  
  
## Response
The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the service.|  
|`x-ms-version`|Specifies the version of the operation used for the response. For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Response body
The format of the response body for version 2020-02-10 is as follows:  
  
```xml
<?xml version="1.0" encoding="utf-8"?>  
<StorageServiceProperties>  
    <HourMetrics>  
        <Version>version-number</Version>  
        <Enabled>true|false</Enabled>  
        <IncludeAPIs>true|false</IncludeAPIs>  
        <RetentionPolicy>  
            <Enabled>true|false</Enabled>  
            <Days>number-of-days</Days>  
        </RetentionPolicy>  
    </HourMetrics>  
    <MinuteMetrics>  
        <Version>version-number</Version>  
        <Enabled>true|false</Enabled>  
        <IncludeAPIs>true|false</IncludeAPIs>  
        <RetentionPolicy>  
            <Enabled>true|false</Enabled>  
            <Days>number-of-days</Days>  
        </RetentionPolicy>  
    </MinuteMetrics>  
    <Cors>  
        <CorsRule>  
            <AllowedOrigins>comma-separated-list-of-allowed-origins</AllowedOrigins>  
            <AllowedMethods>comma-separated-list-of-HTTP-verb</AllowedMethods>  
            <MaxAgeInSeconds>max-caching-age-in-seconds</MaxAgeInSeconds>  
            <ExposedHeaders>comma-seperated-list-of-response-headers</ExposedHeaders>  
            <AllowedHeaders>comma-seperated-list-of-request-headers</AllowedHeaders>  
        </CorsRule>  
    </Cors>
    <ProtocolSettings>
        <SMB>
            <Multichannel>
                <Enabled>true|false</Enabled>
            </Multichannel>
        </SMB>
    </ProtocolSettings>
</StorageServiceProperties>  
```  

The following table describes the elements of the response body:  
  
|Name|Description|  
|-|-|  
|`HourMetrics`|Groups the Storage Analytics `HourMetrics` settings. The `HourMetrics` settings provide a summary of request statistics grouped by API in hourly aggregates.|  
|`MinuteMetrics`|Groups the Azure Analytics `MinuteMetrics` settings. The `MinuteMetrics` settings provide request statistics for each minute.|  
|`Version`|The version of Storage Analytics currently in use.|  
|`Enabled`|Indicates whether metrics are enabled for the File service.|  
|`IncludeAPIs`|Indicates whether metrics generate summary statistics for called API operations.|  
|`RetentionPolicy/Enabled`|Indicates whether a retention policy is enabled for the File service.|  
|`RetentionPolicy/Days`|Indicates the number of days that metrics data is retained. All data older than this value will be deleted on a best-effort basis.|  
|`Cors`|Groups all CORS rules.|  
|`CorsRule`|Groups settings for a CORS rule.|  
|`AllowedOrigins`|A comma-separated list of origin domains that are allowed via CORS, or "*" if all domains are allowed.|  
|`ExposedHeaders`|A comma-separated list of response headers to expose to CORS clients.|  
|`MaxAgeInSeconds`|The number of seconds that the client/browser should cache a preflight response.|  
|`AllowedHeaders`|A comma-separated list of headers allowed to be part of the cross-origin request.|  
|`AllowedMethods`|A comma-separated list of HTTP methods that are allowed to be executed by the origin. For Azure Storage, permitted methods are DELETE, GET, HEAD, MERGE, POST, OPTIONS or PUT.|  
|`ProtocolSettings`|Groups the settings for file system protocols.|
|`SMB`|Groups the settings for SMB.|
|`Multichannel`|Contains the settings for SMB Multichannel. This setting has one property: enabled/disabled.|
  
### Authorization
Only the storage account owner may call this operation.  
  
### Sample request and response
The following sample URI makes a request to get the File service properties for a storage account named *myaccount*:  
  
|Method|URL|Protocol|
|-|-|-|  
|GET|`https://myaccount.file.core.windows.net/?restype=service&comp=properties`|HTTP/1.1|  
  
The request is sent with the following headers:  
  
```
x-ms-version: 2020-02-10  
x-ms-date: <date>  
Authorization: SharedKey  
myaccount:Z1lTLDwtq5o1UYQluucdsXk6/iB7YxEu0m6VofAEkUE=  
Host: myaccount.file.core.windows.net  
```  
  
After the request has been sent, the following response is returned:  
  
```  
HTTP/1.1 200 OK  
Content-Length: 1020  
Content-Type: application/xml  
Date: <date>  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cb939a31-0cc6-49bb-9fe5-3327691f2a30  
x-ms-version: 2015-04-05  
```  
  
The response includes the following XML body:  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<StorageServiceProperties>  
    <HourMetrics>  
        <Version>1.0</Version>  
        <Enabled>true</Enabled>  
        <IncludeAPIs>false</IncludeAPIs>  
        <RetentionPolicy>  
            <Enabled>true</Enabled>  
            <Days>7</Days>  
        </RetentionPolicy>  
    </HourMetrics>  
    <MinuteMetrics>  
        <Version>1.0</Version>  
        <Enabled>true</Enabled>  
        <IncludeAPIs>true</IncludeAPIs>  
        <RetentionPolicy>  
            <Enabled>true</Enabled>  
            <Days>7</Days>  
        </RetentionPolicy>  
    </MinuteMetrics>  
    <Cors>  
        <CorsRule>  
            <AllowedOrigins>http://www.fabrikam.com,http://www.contoso.com</AllowedOrigins>  
            <AllowedMethods>GET,PUT</AllowedMethods>  
            <MaxAgeInSeconds>500</MaxAgeInSeconds>  
            <ExposedHeaders>x-ms-meta-data*,x-ms-meta-customheader</ExposedHeaders>  
            <AllowedHeaders>x-ms-meta-target*,x-ms-meta-customheader</AllowedHeaders>  
        </CorsRule>  
    </Cors>
    <ProtocolSettings>
        <SMB>
            <Multichannel>
                <Enabled>true</Enabled>
            </Multichannel>
        </SMB>
    </ProtocolSettings>
</StorageServiceProperties>  
```

## Remarks
For detailed information about CORS rules and evaluation logic, see [CORS Support for the Storage Services](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md).  
  
For additional information about Storage Analytics, see [Storage Analytics](Storage-Analytics.md).
