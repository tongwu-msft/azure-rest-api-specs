---
title: Set File Service Properties (REST API) - Azure Storage
description: The Set File Service Properties operation sets properties for a storage account’s File service endpoint.
author: pemari-msft

ms.date: 10/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Set File Service Properties

The `Set File Service Properties` operation sets properties for a storage account's File service endpoint.
  
## Request  

The `Set File Service Properties` request may be specified as follows. HTTPS is recommended. Replace <account-name> with the name of your storage account:  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`https://<account-name>.file.core.windows.net/?restype=service&comp=properties`|HTTP/1.1|  
  
Note that the URI must always include the forward slash (/) to separate the host name from the path and query portions of the URI. In the case of this operation, the path portion of the URI is empty.  
  
### URI parameters

|URI parameter|Description|  
|-------------------|-----------------|  
|`restype=service&comp=properties`|Required. The combination of both query strings is required to set the storage service properties.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date or x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in versions 2015-02-21 and later. To enable metrics for the File service, you must specify version 2015-04-05 or later.<br /><br /> For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request body  

The format of the request body for version 2020-02-10 is as follows:  
  
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
  
It is not necessary to specify every root element on the request. If you omit a root element, the existing settings for the service for that functionality are preserved. However, if you do specify a given root element, you must specify every child element for that element. The root elements include:  
  
- `HourMetrics`  
- `MinuteMetrics`  
- `Cors`
- `ProtocolSettings`
  
The following table describes the elements of the request body:  
  
|Element name|Description|  
|------------------|-----------------|
|`HourMetrics`|Optional for version 2015-04-05 or later; not applicable for earlier versions. Groups the Storage Analytics `HourMetrics` settings. The `HourMetrics` settings provide a summary of request statistics grouped by API in hourly aggregates.|  
|`MinuteMetrics`|Optional for version 2015-04-05 or later; not applicable for earlier versions. Groups the Azure Analytics `MinuteMetrics` settings. The `MinuteMetrics` settings provide request statistics for each minute.|  
|`Version`|Required  if metrics are enabled. The version of Storage Analytics to configure. Use "1.0" for this value.|  
|`Enabled`|Required. Indicates whether metrics are enabled for the File service.|  
|`IncludeAPIs`|Required only if metrics are enabled. Indicates whether metrics should generate summary statistics for called API operations.|  
|`RetentionPolicy/Enabled`|Required. Indicates whether a retention policy is enabled for the File service. If false, metrics data is retained, and the user is responsible for deleting it.|  
|`RetentionPolicy/Days`|Required only if a retention policy is enabled. Indicates the number of days that metrics data should be retained. All data older than this value will be deleted. The minimum value you can specify is `1`; the largest value is `365` (one year). Metrics data is deleted on a best-effort basis after the retention period expires.|  
|`Cors`|Optional. The `Cors` element is supported for version 2015-02-21 or later. Groups all CORS rules.Omitting this element group will not overwrite existing CORS settings.|  
|`CorsRule`|Optional. Specifies a CORS rule for the File service. You can include up to five `CorsRule` elements in the request. If no `CorsRule` elements are included in the request body, all CORS rules will be deleted, and CORS will be disabled for the File service.|  
|`AllowedOrigins`|Required if `CorsRule` element is present. A comma-separated list of origin domains that will be allowed via CORS, or "*" to allow all domains. Limited to 64 origin domains. Each allowed origin can have up to 256 characters.|  
|`ExposedHeaders`|Required if `CorsRule` element is present. A comma-separated list of response headers to expose to CORS clients. Limited to 64 defined headers and two prefixed headers. Each header can be up to 256 characters.|  
|`MaxAgeInSeconds`|Required if `CorsRule` element is present. The number of seconds that the client/browser should cache a preflight response.|  
|`AllowedHeaders`|Required if `CorsRule` element exists. A comma-separated list of headers allowed to be part of the cross-origin request. Limited to 64 defined headers and 2 prefixed headers. Each header can be up to 256 characters.|  
|`AllowedMethods`|Required if `CorsRule` element exists. A comma-separated list of HTTP methods that are allowed to be executed by the origin. For Azure Storage, permitted methods are DELETE, GET, HEAD, MERGE, POST, OPTIONS or PUT.|  
|`ProtocolSettings`|Optional. Groups the settings for file system protocols.|
|`SMB`|Groups the settings for SMB.|
|`Multichannel`|Contains the settings for SMB multichannel. SMB multichannel contains the `Enabled` boolean property which toggles the state of SMB multichannel. |
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code

A successful operation returns status code 202 (Accepted).  
  
### Response headers  

The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the service.|  
|`x-ms-version`|Specifies the version of the operation used for the response. For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|   
  
### Response body

None.  
  
## Authorization  

Only the account owner may call this operation.  
  
## Remarks  

The following restrictions and limitations apply to CORS rules in Azure Storage:  
  
- A maximum of five rules can be stored.  
  
- The maximum size of all CORS rules settings on the request, excluding XML tags, should not exceed 2 KiB.  
  
- The length of an allowed header, exposed header, or allowed origin should not exceed 256 characters.  
  
- Allowed headers and exposed headers may be either:  

  - Literal headers, where the exact header name is provided, such as x-ms-meta-processed. A maximum of 64 literal headers may be specified on the request.  
  
  - Prefixed headers, where a prefix of the header is provided, such as x-ms-meta-data*. Specifying a prefix in this manner allows or exposes any header that begins with the given prefix. A maximum of two prefixed headers may be specified on the request.  
  
- The methods (or HTTP verbs) specified in the `AllowedMethods` element must conform to the methods supported by Azure storage service APIs. Supported methods are DELETE, GET, HEAD, MERGE, POST, OPTIONS and PUT.  
  
Specifying CORS rules on the request is optional. If you call `Set File Service Properties` without specifying the Cors element in the request body, any existing CORS rules are maintained.  
  
To disable CORS, call `Set File Service Properties` with an empty CORS rules settings (*i.e.*,</Cors\>) and no inner CORS rules. This call deletes any existing rules, disabling CORS for the File service.  
  
All CORS rule elements are required if the `CorsRule` element is specified. The request will fail with error code 400 (Bad Request) if any element is missing.  
  
For detailed information about CORS rules and evaluation logic, see [Cross-Origin Resource Sharing (CORS) support for Azure Storage](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md).  
  
## Sample Request and Response  

The following sample URI makes a request to change the File service properties for a storage account named *myaccount*:  
  
`PUT https://myaccount.file.core.windows.net/?restype=service&comp=properties HTTP/1.1`  
  
The request is sent with the following headers:  
  
```  
x-ms-version: 2020-02-10  
x-ms-date: <date>  
Authorization: SharedKey myaccount:Z1lTLDwtq5o1UYQluucdsXk6/iB7YxEu0m6VofAEkUE=  
Host: myaccount.file.core.windows.net  
```  
  
The request is sent with the following XML body:  
  
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
  
After the request has been sent, the following response is returned:  
  
```  
HTTP/1.1 202 Accepted  
Connection: Keep-Alive  
Transfer-Encoding: chunked  
Date: <date>  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cb939a31-0cc6-49bb-9fe5-3327691f2a30  
x-ms-version: 2015-04-05  
```

## See also

For detailed information about CORS rules and evaluation logic, see [CORS Support for the Storage Services](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md).  
  
For additional information about Storage Analytics, see [Storage Analytics](Storage-Analytics.md).
