---
title: "Filter"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: cb50c7b1-61ce-4686-bab0-d64511844d41
caps.latest.revision: 15
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
# Filter
`Filter`s are used to define filters for assets’ streaming manifests. Defined filters can be applied to any of the following streaming protocols: HLS, MPEG-DASH, Smooth Streaming, and HDS. Media Services dynamically generates manifests based on specified filters. Filters can be defined at a global level (`Filter`) or asset level ([AssetFilter](../operations/assetfilter.md)). Use `Filter` to apply filters to any of your assets. Use `AssetFilter` to apply filters to a specific asset.  
  
 For a detailed overview and code samples of dynamically generated manifests, see [Dynamic manifests overview](https://azure.microsoft.com/documentation/articles/media-services-dynamic-manifest-overview/).  
  
 This topic gives an overview of the `Filter` entity (used to define global filters) and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [Filter Properties](#filter_properties)  
  
-   [Create a Filter](#create_a_filter)  
  
-   [List Filters](#list_filters)  
  
-   [Update a Filter](#update_a_filter)  
  
-   [Delete a Filter](#delete_a_filter)  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

##  <a name="filter_properties"></a> Filter properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Name`|Edm.String|Friendly name of the filter.|  
|`PresentationTimeRange`|[PresentationTimeRange](../operations/presentationtimerange.md)|The `PresentationTimeRange` rule group is used for filtering manifest start/end points, presentation window length, and the live start position. Media Services uses intersections of multiple ranges to define the final presentation window.|  
|`Tracks`|[FilterTrackSelect](../operations/filtertrackselect.md)|Contains a collection of `FilterTrackPropertyCondition`s.|  
|`FirstQuality`|FirstQuality|First Quality of Manifest Filter, indicates the first quality bitrate for HLS.|  
  
##  <a name="create_a_filter"></a> Create a filter  
 Create a filter using HTTP POST request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters|HTTP/1.1|  
  
### Sample Request  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers  
  
```  
POST https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters HTTP/1.1  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
Content-Type: application/json  
Accept: application/json  
Accept-Charset: UTF-8  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
x-ms-client-request-id: 00000000-0000-0000-0000-000000000000  
Host: media.windows.net  
  
```  
  
 Request body  
  
```  
{  
   "Name":"Mobile",  
   "PresentationTimeRange":{    
      "StartTimestamp":"0",  
      "EndTimestamp":"9223372036854775807",  
      "PresentationWindowDuration":"12000000000",  
      "LiveBackoffDuration":"0",  
      "Timescale":"10000000"  
   },  
   "Tracks":[    
      {    
         "PropertyConditions":[    
            {    
               "Property":"Type",  
               "Value":"video",  
               "Operator":"Equal"  
            },  
            {    
               "Property":"Bitrate",  
               "Value":"550000-1350000",  
               "Operator":"Equal"  
            }  
         ]  
      }  
   ]  
}  
```  
  
### Response  
  
```  
HTTP/1.1 201 Created  
. . .  
  
```  
  
##  <a name="list_filters"></a> List filters  
 Filters can be retrieved using a HTTP GET request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters|HTTP/1.1|  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters('*filterName*')|HTTP/1.1|  
  
### Sample Request  
  
 
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters HTTP/1.1  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
Accept: application/json  
Accept-Charset: UTF-8  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
Host: media.windows.net  
  
```  
  
##  <a name="update_a_filter"></a> Update a filter  
 Use PATCH, PUT or MERGE to update a Filter with new property values.  
  
> [!NOTE]
>  If you update a filter, it can take up to 2 minutes for streaming endpoint to refresh the rules. If the content was served using this filter (and cached in proxies and CDN caches), updating this filter can result in player failures. It is recommend to clear the cache after updating the filter. If this option is not possible, consider using a different filter.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PATCH/PUT/MERGE<br /><br /> For more information about these operations, see [PATCH/PUT/MERGE](http://msdn.microsoft.com/library/dd541276.aspx).|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters(‘*filterName*’)|HTTP/1.1|  
  
### Sample Request  
  
 
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
 
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
PATCH https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters('filterName') HTTP/1.1  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
Content-Type: application/json  
Accept: application/json  
Accept-Charset: UTF-8  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
x-ms-client-request-id: 00000000-0000-0000-0000-000000000000  
Host: media.windows.net  
  
```  
  
 Request body:  
  
```  
{  
   "Tracks":[    
      {    
         "PropertyConditions":  
         [    
            {    
               "Property":"Type",  
               "Value":"audio",  
               "Operator":"Equal"  
            },  
            {    
               "Property":"Bitrate",  
               "Value":"0-2147483647",  
               "Operator":"Equal"  
            }  
         ]  
      }  
   ]  
}  
  
```  
  
##  <a name="delete_a_filter"></a> Delete a filter  
 Filters can be deleted using a HTTP DELETE request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|DELETE|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters('*filterName*')|HTTP/1.1|  
  
### Sample Request  
  
 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
DELETE https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Filters('Mobile') HTTP/1.1  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
Accept: application/json  
Accept-Charset: UTF-8  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
Host: media.windows.net  
  
```