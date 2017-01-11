---
title: "StreamingEndpoint"
ms.custom: ""
ms.date: "2016-29-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: d42211cd-8a20-4566-97ec-9885a00732e7
caps.latest.revision: 35
author: "Juliako"
ms.author: "juliako"
manager: "erikre"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"

---

# StreamingEndpoint

> [!IMPORTANT]
>  Starting with Media Services 2.7, the `Origin` entity was renamed to `StreamingEndpoint`.  
  
The `StreamingEndpoint` entity represents a streaming service that can deliver content directly to a client player application, or to a Content Delivery Network (CDN) for further distribution. Starting with version 2.9, Microsoft Azure Media Services provides the Azure CDN integration (for more information, see the `CdnEnabled` property documented below). The outbound stream from a StreamingEndpoint service can be a live stream, or a video on demand Asset in your Media Services account.
 
Each Azure Media Services (AMS) account includes a default StreamingEndpoint; additional StreamingEndpoints can be created under the account. Starting with Media Services 2.15 (released on January 10th 2017) there are two StreamingEndpoint versions: **1.0** and **2.0**. Also, there are three types of StreamingEndpoints: **Classic**, **Standard** or **Premium**. 

Media Services accounts created before AMS REST 2.15 update, by default include **Classic** streaming endpoints, version **1.0**. You can upgrade to version **2.0**, you cannot downgrade to **1.0**. AMS accounts created after the 2.15 update, by default include **Standard** streaming endpoints, version **2.0**. Version **2.0** streaming endpoints have billing and feature changes. For more detailed information, see the `StreamingEndpointVersion` property documented below.

The automatically provisioned StreamingEndpoint has the name "Default" and it cannot be deleted. The state of the StreamingEndpoint is **Stopped**. To start streaming, you need to start the streaming endpoint. 

If you created the account via Azure Management Portal and Azure CDN is available in the region, the account will have the CDN integration by default ("CdnEnabled":true, "CdnProvider":StandardVerizon and "CdnProfile":AzureMediaStreamingPlatformCdnProfile). 

In most cases you should keep CDN enabled. However, if you are anticipating max concurrency lower than 500 viewers then it is recommended to disable CDN since CDN scales best with concurrency.

##  <a name="StreamingEndpointTypes"></a> Classic, Standard, Premium streaming endpoints overview

**Advanced features** described in this section include [dynamic packaging](https://docs.microsoft.com/azure/media-services/media-services-dynamic-packaging-overview) and [dynamic encryption](https://docs.microsoft.com/azure/media-services/media-services-content-protection-overview).

The table summarizes the behavior:  

|Type|Version|ScaleUnits|Advanced features|CDN|Billing|SLA| 
|--------------|----------|--------------|--------|--------|--------|--------|     
|**Classic**|1.0|0|NA|NA|Free|NA|
|**Standard Streaming Endpoint** (recommended)|2.0|0|Yes|Yes|Paid|Yes|
|**Premium Streaming Endpoint**|1.0|>0|Yes|Yes|Paid|Yes|
|**Premium Streaming Endpoint**|2.0|>0|Yes|Yes|Paid|Yes|
 

It is recommended to upgrade your **Classic** streaming endpoints to **Standard** streaming endpoints to get a better experience and advanced features.  **Standard** streaming also scales outbound bandwidth automatically. 

The **Standard** type is the recommended option for virtually all streaming scenarios and audience sizes. For customers with extremely demanding requirements AMS also offers **Premium** streaming endpoints which can be used to scale out capacity for the largest internet audiences. If you expect very large audiences and concurrent viewers, please contact us for guidance on whether you need to move to the **Premium** type. A good guide post is to [contact us](amsstreaming@microsoft.com) if you expect a concurrent audience size larger than 10,000 viewers.

You move to a **Premium** type by adjusting scale units. Scale units provide you with dedicated egress capacity that can be purchased in increments of 200 Mbps. When using the **Premium** type, each enabled unit provides additional bandwidth capacity to the application. For more information, see [How to Scale StreamingEndpoint](https://docs.microsoft.com/azure/media-services/media-services-portal-scale-streaming-endpoints/).  

For more information, see [Streaming endpoints overview](https://docs.microsoft.com/azure/media-services/media-services-streaming-endpoints-overview).

## StreamingEndpoint properties and operations  

> [!IMPORTANT]
>  When working with the Media Services REST API, the following considerations apply:  
>   
>  -   When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. For more information, see [Setup for Media Services REST API Development](http://msdn.microsoft.com/en-us/42ae6204-93bc-4797-bf40-1c68512cfb73).  
> -   After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
>   
>      For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 This section gives an overview of the `StreamingEndpoint` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [Create StreamingEndpoint](#create_streaming_endpoints)  

-   [Start StreamingEndpoint](#start_create_streaming_endpoints)  
  
-   [Stop StreamingEndpoints](#stop_create_streaming_endpoints)  
  
-   [Scale StreamingEndpoints](#scale_create_streaming_endpoints)  
  
-   [List StreamingEndpoints](#list_create_streaming_endpoints)  
  
-   [Update StreamingEndpoints](#update_create_streaming_endpoints)  
  
-   [Delete StreamingEndpoints](#delete_create_streaming_endpoints)  
  
## StreamingEndpoint Entity  

 The `StreamingEndpoint` entity contains the following properties.  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Id`<br /><br /> Read-only. Set by Media Services.|Edm.String|The StreamingEndpoint ID, assigned upon creation. The format is: nb:oid:UUID:\<GUID>.|  
|`Name`|Edm.String|Friendly name for the StreamingEndpoint service.<br /><br /> - Must be unique within your Media Services account.<br /><br /> - Maximum length = 32 characters.<br /><br /> - Cannot contain spaces.<br /><br /> - Hyphens and alphanumeric characters only.<br /><br /> - Cannot begin or end with a hyphen.|  
|`Description`|Edm.String|Description of the StreamingEndpoint. The maximum length is 256 characters.|  
|`Created`<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|Created by the Microsoft Azure Media Services Live Streaming Preview service.|  
|`State`<br /><br /> Read-only. Set by Media Services.|Edm.Int32|Values for the property include:<br /><br /> - Stopped. The initial state of a StreamingEndpoint after creation.<br /><br /> - Starting. The StreamingEndpoint is transitioning to the running state.<br /><br /> - Running. The StreamingEndpoint is able to stream content to clients.<br /><br /> - Scaling. The streaming units (ScaleUnits) are being increased or decreased.<br /><br /> - Stopping. The StreamingEndpoint is transitioning to the stopped state.|  
|`HostName`<br /><br /> Read-only. Set by Media Services.|Edm.String|Default streaming endpoint hostname.|  
|`LastModified`<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|Last update time for this entity.|  
|`ScaleUnits`<br /><br /> Read-only.<br /><br /> |Edm.Int32|The number of premium streaming endpoints allocated for the StreamingEndpoint deployment. When the StreamingEndpoint is in the `Running` state, the streaming units on the StreamingEndpoint can be scaled up by calling the `Scale` operation.<br /><br /> This property also controls the streaming endpoint **type** with the combination of streaming endpoint **version**. If your streaming endpoint version is 1.0 and ScaleUnits=0 the streaming endpoint is of a **classic** type.<br /><br />The following StreamingEndpoint’s properties can only be configured if your streaming endpoint is **standard** or **premium**:  `AccessControl`, `CustomHostNames`, `CacheControl`, `CrossSiteAccessPolicies`.|  
|`CdnEnabled`<br /><br /> This property was added in Media Services 2.9.|`Edm.Boolean`|Indicates whether or not the Azure CDN integration for this StreamingEndpoint is enabled (disabled by default.)<br /><br /> To set the `CdnEnabled` to true, the StreamingEndpoint must have at least one premium streaming endpoint (`ScaleUnits`) for version 1.0 StreamingEndpoints and be in the stopped state. You can set this property if StreamingEndpoint version is 2.0 regardless of ScaleUnits value (please refer to **Standard** streaming endpoint) Use the [Operation](../operations/operation.md) REST API to check the status. Once it is enabled, the following configurations get disabled: `CustomHostNames` and `AccessControl`.<br /><br /> **Note**: Not all data centers support the Azure CDN integration. To check whether or not your data center has the Azure CDN integration available do the following:<br /><br /> - Try to set the `CdnEnabled` to true.<br /><br /> - Check the returned result for an `HTTP Error Code 412` (PreconditionFailed) with a message of  "Streaming endpoint CdnEnabled property cannot be set to true as CDN capability is not available in the current region."<br /><br /> If you get this error, the data center does not support it. You should try another data center.|  
|`CdnProvider`<br /><br /> This property was added in Media Services 2.15.|Edm.String|When CDN is enabled ("CdnEnabled":true) you can also pass CdnProvider values. CdnProvider controls which provider will be used. Currently, three values are supported: "StandardVerizon", "PremiumVerizon" and "StandardAkamai". If no value is provided and "CdnEnabled":true, "StandardVerizon" is used (that is the default value.) <br/>Example: "CdnProvider":"StandardAkamai".<br /><br /> **Note**: StreamingEndpoints which are "CDNEnabled":true with older AMS versions (<2.15) has a legacy CDN integration and uses "StandardVerizon" CDN provider. It is recommended to migrate your StreamingEndpoints to the newer CDN integration to get a better experince and full features.|
|`CdnProfile`<br /><br />This property was added in Media Services 2.15.|Edm.String|When CDN is enabled ("CdnEnabled":true) you can also pass CdnProfile values. "CdnProfile" is the name of the CDN profile where the CDN endpoint point will be created. You can provide an existing CdnProfile or use a new one. If value is NULL and "CdnEnabled":true, the default value "AzureMediaStreamingPlatformCdnProfile" is used. If the provided CdnProfile already exists than an endpoint is created under it. If the profile does not exists, a new profile automatically gets created. <br/>Example: "CdnProfile":"AzureMediaStreamingPlatformCdnProfile".|
|`FreeTrialEndTime`<br /> Read-only.<br /><br />This property was added in Media Services 2.15.|Edm.DateTime|When a new media services account gets created, a default standard streaming endpoint also automatically gets provisioned  under the account, in stopped state. This endpoint includes a 15 day free trial period and trial period starts when the endpoint gets started for the first time. Free trial doesn’t apply to existing accounts and end date doesn’t change with state transitions such as stop/start. Free trial starts the first time you start the streaming endpoint and ends after 15 calendar days. The free trial only applies to the default streaming endpoint and doesn't apply to additional streaming endpoints. <br/><br/>When the endpoint is just created, and is in stopped state, the value of "FreeTrialEndTime" is set to "0001-01-01T00:00:00Z". When it is started, 15 days are added to the start date and the value starts representing the free trial end date "FreeTrialEndTime":"2016-12-16T18:01:47.8524725Z".<br/>Values for streaming endpoints which are not eligible for free trial will be always "FreeTrialEndTime":"0001-01-01T00:00:00Z" regardless of the state. <br/>Examples:<br/> "FreeTrialEndTime":"2016-12-16T18:01:47.8524725Z"<br/>"FreeTrialEndTime":"0001-01-01T00:00:00Z"|
|`StreamingEndpointVersion`<br /><br />This property was added in Media Services 2.15.|Edm.String|Combination of  StreamingEndpointVersion and ScaleUnits controls the streaming endpoint type. Any streaming endpoint created before the 2.15 (January 10th 2017) update will have "StreamingEndpointVersion":"1.0" and streaming endpoints created after the update will have "StreamingEndpointVersion":"2.0". <br/> Streaming Endpoints which are version 1.0 will not be automaticaly upgraded to version 2.0, but can be explicitly upgraded to "StreamingEndpointVersion":"2.0".<br/>Streaming endpoints with "ScaleUnits":0 and "StreamingEndpointVersion":"1.0" will be considered **classic** streaming endpoints which don't have the advanced features such as dynamic packaging or dynamic encryption.<br/>Streaming endpoints with "ScaleUnits" > 0 (whether the "StreamingEndpointVersion" is set to version "1.0" or version "2.0") are **premium** units.<br/> Standard streaming endpoints with "ScaleUnits":0 and "StreamingEndpointVersion":"2.0" will include the same features as premium units (which includes dynamic packaging and dynamic encryption.) <br/> You can upgrade a **classic** streaming endpoint to **standard** by setting version to "StreamingEndpointVersion":"2.0". <br />This is a one-way operation; you cannot downgrade version 2.0 to 1.0. Beware that this operation cannot be rolled back and has a pricing impact. It can take up to 30 minutes for this new configuration to propagate. During this timeframe the endpoint will work in degraded mode and you might encounter failures for dynamic packaging and dynamic encryption requests.<br/><br/>Examples: <br/>"StreamingEndpointVersion":"2.0"<br/>"StreamingEndpointVersion":"1.0"|
|`CustomHostNames`<br /><br /> Optional.|Collection(Edm.String)|Used to configure a streaming endpoint to accept traffic directed to a custom host name. This allows for easier traffic management configuration through a Global Traffic Manager (GTM) and also for branded domain names to be used as the streaming endpoint name.<br /><br /> The ownership of the domain name must be confirmed by Azure Media Services. Azure Media Services verifies the domain name ownership by requiring a `CName` record containing the Azure Media Services account ID as a component to be added to the domain in use. As an example, for “sports.contoso.com” to be used as a custom host name for the Streaming Endpoint, a record for “\<accountId>.contoso.com” must be configured to point to one of Media Services verification host names. The verification host name is composed of verifydns.\<mediaservices-dns-zone>. The following table contains the expected DNS zones to be used in the verify record for different Azure regions.<br /><br /> North America, Europe, Singapore, Hong Kong, Japan:<br /><br /> - mediaservices.windows.net<br /><br /> - verifydns.mediaservices.windows.net<br /><br /> China:<br /><br /> - mediaservices.chinacloudapi.cn<br /><br /> - verifydns.mediaservices.chinacloudapi.cn<br /><br /> For example, a `CName` record that maps "945a4c4e-28ea-45cd-8ccb-a519f6b700ad.contoso.com" to "verifydns.mediaservices.windows.net" proves that the Azure Media Services ID 945a4c4e-28ea-45cd-8ccb-a519f6b700ad has the ownership of the contoso.com domain, thus enabling any name under contoso.com to be used as a custom host name for a streaming endpoint under that account.<br /><br /> To find the Media Service ID value, go to the [Azure portal](https://portal.azure.com/) and select your Media Service account. The MEDIA SERVICE ID appears on the right of the DASHBOARD page.<br /><br /> **Warning**: If there is an attempt to set a custom host name without a proper verification of the `CName` record, the DNS response will fail and then be cached for some time. Once a proper record is in place it might take a while until the cached response is revalidated. Depending on the DNS provider for the custom domain, it could take anywhere from a few minutes to an hour to revalidate the record.<br /><br /> In addition to the `CName` that maps `<accountId>.<parent domain>` to `verifydns.<mediaservices-dns-zone>`, you must create another `CName` that maps the custom host name (for example, `sports.contoso.com`) to your Media Services StreamingEndpont’s host name (for example, `amstest.streaming.mediaservices.windows.net`).<br /><br /> **Note**: Streaming endpoints located in the same data center, cannot share the same custom host name.<br /> This property is valid for Standard and premium streaming endpoints and can be set when "CdnEnabled":false<br/><br/> Note that, currently, AMS doesn’t support SSL with custom domains.  |  
|`AccessControl`|StreamingEndpointAccessControl ComplexType|Used to configure the following security settings for this streaming endpoint: Akamai signature header authentication keys and IP addresses that are allowed to connect to this endpoint.<br /> **Note**: This property is valid for Standard and premium streaming endpoints and can be set when "CdnEnabled":false|  
|`CacheControl`|[StreamingEndpointCacheControl](#StreamingEndpointCacheControl)|Used to configure asset cache lifetime for assets served through this streaming endpoint.|  
|`CrossSiteAccessPolicies`|[CrossSiteAccessPolicies](../operations/crosssiteaccesspolicies.md)|Used to specify cross site access policies for various clients. For more information, see [Cross-domain policy file specification](http://www.adobe.com/devnet/articles/crossdomain_policy_file_spec.html) and [Making a Service Available Across Domain Boundaries](http://msdn.microsoft.com/library/cc197955\(v=vs.95\).aspx).|  
  
###  <a name="StreamingEndpointCacheControl"></a> StreamingEndpointCacheControl  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|`MaxAge`<br /><br /> Optional.|Edm.Int64|Overrides the default max-age HTTP cache control header set by the streaming endpoint on media fragments and on-demand manifests. The value is set in seconds.|  
  
###  <a name="StreamingEndpointAccessControl"></a> StreamingEndpointAccessControl ComplexType  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|`Akamai`|[AkamaiAccessControl](#AkamaiAccessControl)|Akamai access control.|  
|`IP`|[IPAccessControl](#IPAccessControl)|IP access control.|  
  
###  <a name="AkamaiAccessControl"></a> AkamaiAccessControl  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|AkamaiSignatureHeaderAuthenticationKeyList|[AkamaiSignatureHeaderAuthenticationKey ComplexType](#AkamaiSignatureHeaderAuthenticationKey)|Contains information about Akamai Signature Header Authentication keys.|  
  
###  <a name="IPAccessControl"></a> IPAccessControl  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|Allow|[IPRange ComplexType](#IPRange)|Defines the IP addresses that can connect to a streaming endpoint.<br /><br /> **Note**: Setting this value to null allows all IP source addresses to connect. Setting it to an empty string (“”) allows no one to connect.|  
  
###  <a name="AkamaiSignatureHeaderAuthenticationKey"></a> AkamaiSignatureHeaderAuthenticationKey ComplexType  
 This type describes Akamai G20 authentication settings. Akamai Authentication is a keyed-hash message authentication scheme. The authentication key is a secret shared by the Akamai CDN and the Azure Media Origin Streaming Service. Azure Media Services only supports version 3, which uses HMAC-MD5.  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|`Identifier`|Edm.String|The identifier for the authentication key.  This is the nonce provided by Akamai.|  
|`Expiration`|Edm.DateTime|DateTime value that specifies when the Akamai authentication expires|  
|`Base64Key`|Edm.String|Base64-encoded authentication key that will be used by the CDN.  The authentication key provided by Akamai is an ASCII encoded string, and must be converted to bytes and then base64 encoded.|  
  
 The following C# example shows how to convert Akamai authentication key to base64:  
  
```  
string akamaiKey = "01234567890123456789012345678901";  
string base64Key = Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(akamaiKey);  
  
```  
  
###  <a name="IPRange"></a> IPRange ComplexType  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|`Name`|Edm.String|A friendly name for this IP Range.|  
|`Address`|Edm.String|The base IP address for the subnet representation (for example:192.168.0.1).|  
|`SubnetPrefixLength`|Edm.Int32|The number of significant bits for the subnet mask (for example, in the following IP address 192.168.0.1/24, 24 represents the number of significant bits).|  
  
##  <a name="create_streaming_endpoints"></a> Create StreamingEndpoint  
 Create a new StreamingEndpoint service.  
  
### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://media.windows.net/api/StreamingEndpoint|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/StreamingEndpoints HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 Request body:  
  
```  
{    
   "Id":null,  
   "Name":"teststreamingendpoint001",  
   "Description":"",  
   "Created":"0001-01-01T00:00:00",  
   "LastModified":"0001-01-01T00:00:00",  
   "State":null,  
   "HostName":null,  
   "ScaleUnits":0,  
   "CustomHostNames":[    
  
   ],  
   "AccessControl":{    
      "Akamai":{    
         "AkamaiSignatureHeaderAuthenticationKeyList":[    
            {    
               "Identifier":"My key",  
               "Expiration":"2015-08-08T21:45:34.463Z",  
               "Base64Key":"/31iWKdqNC7YUnj8zQ3XHA=="  
            }  
         ]  
      },  
      "IP":{    
         "Allow":[    
            {    
               "Name":"Allow all",  
               "Address":"0.0.0.0",  
               "SubnetPrefixLength":0  
            }  
         ]  
      }  
   },  
   "CacheControl":{    
      "MaxAge":"1800"  
   },  
   "CrossSiteAccessPolicies":{    
      "ClientAccessPolicy":"<access-policy><cross-domain-access><policy><allow-from http-request-headers='*'><domain uri='http://*' /></allow-from><grant-to><resource path='/' include-subpaths='false' /></grant-to></policy></cross-domain-access></access-policy>",  
      "CrossDomainPolicy":"<?xml version='1.0'?><!DOCTYPE cross-domain-policy SYSTEM 'http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd'><cross-domain-policy><allow-access-from domain='*' /></cross-domain-policy>"  
   }  
}  
  
```  
  
 If successful, a **202 Accepted** status code is returned along with a representation of the created entity in the response body.  
  
```  
HTTP/1.1 202 Accepted  
Cache-Control: no-cache  
Content-Length: 1185  
Content-Type: application/json;odata=minimalmetadata;streaming=true;charset=utf-8  
Location: https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3Ad2742eb8-ce32-44b8-aae8-83f21364c291')  
Server: Microsoft-IIS/8.5  
request-id: 917c74d3-ebc7-48b6-8484-a103054a9e34  
x-ms-request-id: 917c74d3-ebc7-48b6-8484-a103054a9e34  
operation-id: nb:opid:UUID:ec2e517c-9b33-4af5-baca-e6136acfb40f  
X-Content-Type-Options: nosniff  
DataServiceVersion: 3.0;  
X-Powered-By: ASP.NET  
Date: Sun, 10 Aug 2014 00:31:28 GMT  
  
{    
   "odata.metadata":"https://testrest.cloudapp.net/api/$metadata#StreamingEndpoints/@Element",  
   "Id":"nb:oid:UUID:d2742eb8-ce32-44b8-aae8-83f21364c291",  
   "Name":"teststreamingendpoint001",  
   "Description":"",  
   "Created":"2014-08-10T00:31:28.6760592Z",  
   "LastModified":"2014-08-10T00:31:28.6760592Z",  
   "State":"Stopped",  
   "HostName":null,  
   "ScaleUnits":0,  
   "CustomHostNames":[    
  
   ],  
   "AccessControl":{    
      "Akamai":{    
         "AkamaiSignatureHeaderAuthenticationKeyList":[    
            {    
               "Identifier":"My key",  
               "Expiration":"2015-08-08T21:45:34.463Z",  
               "Base64Key":"/31iWKdqNC7YUnj8zQ3XHA=="  
            }  
         ]  
      },  
      "IP":{    
         "Allow":[    
            {    
               "Name":"Allow all",  
               "Address":"0.0.0.0",  
               "SubnetPrefixLength":0  
            }  
         ]  
      }  
   },  
   "CacheControl":{    
      "MaxAge":"1800"  
   },  
   "CrossSiteAccessPolicies":{    
      "ClientAccessPolicy":"<access-policy><cross-domain-access><policy><allow-from http-request-headers='*'><domain uri='http://*' /></allow-from><grant-to><resource path='/' include-subpaths='false' /></grant-to></policy></cross-domain-access></access-policy>",  
      "CrossDomainPolicy":"<?xml version='1.0'?><!DOCTYPE cross-domain-policy SYSTEM 'http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd'><cross-domain-policy><allow-access-from domain='*' /></cross-domain-policy>"  
   }  
}  
  
```  
  
 The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
##  <a name="start_create_streaming_endpoints"></a> Start StreamingEndpoint  

Start the specified StreamingEndpoint. A StreamingEndpoint can only be started when it is in the **Stopped** state.  Some time after starting the StreamingEdpoint, the state changes to `Running`.</br> To stop streaming at a later point in time, call the **Stop** operation. 

Available actions when in the **Running** state.  

|State|Streaming Units|Description|Available Actions|  
|-----------|---------------------|-----------------|-----------------------|  
|Running|0|Streaming from Standard Streaming Endpoint.|Stop, Scale|  
|Running|>0|Streaming from Premium Streaming Endpoint.|Stop, Scale|  

### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*')/Start|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3A32ad7fa6-f780-4345-bbc6-45a79a914427')/Start HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 If successful, a **202 Accepted** status code is returned. The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
##  <a name="stop_create_streaming_endpoints"></a> Stop StreamingEndpoints  
Stop the specified StreamingEndpoint. A StreamingEndpoint can be stopped only when it is in the **Running** state.  

Available actions when in the **Stopped** state.
 
|State|Streaming Units|Description|Available Actions|  
|-----------|---------------------|-----------------|-----------------------|  
|Stopped|0|Not streaming.|Start, Scale|  
|Stopped|>0|Not streaming.|Start, Scale|  

### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*')/Stop|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3A32ad7fa6-f780-4345-bbc6-45a79a914427')/Start HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 If successful, a **202 Accepted** status code is returned. The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
##  <a name="scale_create_streaming_endpoints"></a> Scale StreamingEndpoints  

Dynamically updates the streaming unit capacity while in the running state and changes type from Standard Streaming Endpoint to Premium Streaming Endpoint if updated from "ScaleUnits":0.

### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*')/Scale|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3A32ad7fa6-f780-4345-bbc6-45a79a914427')/Scale HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 Request body:  
  
```  
{"scaleUnits" : 2}  
```  
  
 If successful, a **202 Accepted** status code is returned. The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
##  <a name="list_create_streaming_endpoints"></a> List StreamingEndpoints  
StreamingEndpoints are retrieved using a GET HTTP request.  
  
### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|Get all StreamingEndpoints:<br /><br /> https://media.windows.net/api/StreamingEndpoints<br /><br /> Get the specified StreamingEndpoint.<br /><br /> https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*’)|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
GET https://testrest.cloudapp.net/api/StreamingEndpoints HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 If successful, this operation returns a **200 OK** status code and a list of all of the StreamingEndpoints created in your Media Services account.  
  
##  <a name="update_create_streaming_endpoints"></a> Update StreamingEndpoints  
 Update a StreamingEndpoint with new property values. This is an asynchronous operation if the StreamingEndpoint is running and the settings are changed.  

### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PATCH/PUT/MERGE<br /><br /> For more information about these operations, see [PATCH/PUT/MERGE](http://msdn.microsoft.com/library/dd541276.aspx).|https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*’)|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab. The example updates the **MaxAge** value.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
PATCH https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3A32ad7fa6-f780-4345-bbc6-45a79a914427') HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 Request body:  
  
```  
{"CacheControl":{"MaxAge":"2000"}}  
```  
  
 If the update completes synchronously, it returns a **204 No Content** status code; otherwise it returns a **202 Accepted** status code. The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
##  <a name="delete_create_streaming_endpoints"></a> Delete StreamingEndpoints  
 Delete a StreamingEndpoint. A StreamingEndpoint can be deleted only when it is in the **Stopped** state.  

### Request

|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|DELETE|https://media.windows.net/api/StreamingEndpoints(‘*StreamingEndpointId*’)|HTTP/1.1|  
  
### Sample Request  
  
> [!IMPORTANT]
>  After successfully connecting to https://media.windows.net, you will receive a 301 redirect specifying another Media Services URI. You must make subsequent calls to the new URI.  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 Make sure to use valid redirected host URI and authorization bearer token values. For more information, see [Connecting to Media Services with the Media Services REST API](http://msdn.microsoft.com/en-us/426d52db-1ac1-4ede-85be-da8ff5a7973f).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
DELETE https://testrest.cloudapp.net/api/StreamingEndpoints('nb%3Aoid%3AUUID%3A32ad7fa6-f780-4345-bbc6-45a79a914427') HTTP/1.1  
Content-Type: application/json;odata=minimalmetadata  
Accept: application/json;odata=minimalmetadata  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
x-ms-version: 2.15  
Authorization: Bearer <token value>  
  
```  
  
 If successful, a **202 Accepted** status code is returned. The **202 Accepted** status code indicates an asynchronous operation, in which case the operation-id header value is also provided for use in polling and tracking the status of long-running operations, such as starting or stopping a StreamingEndpoint. Pass the operation-id header value into the Operation Entity to retrieve the status. For more information, see [Manually Polling Long-Running Operations](http://msdn.microsoft.com/en-us/3f8c9717-b557-47b8-bbef-18f867e98019).  
  
  
## See Also  
 [Channel](../operations/channel.md)   
 [Program](../operations/program.md)   
 [Operation](../operations/operation.md)
