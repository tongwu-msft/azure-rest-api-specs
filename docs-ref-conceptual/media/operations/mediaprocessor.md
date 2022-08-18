---
title: "MediaProcessor"
description: Learn how a media processor transforms media content into a different output and how to execute various operations with the Media Services REST API.
ms.custom: ""
ms.date: "03/14/2018"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 32cf9c3a-c246-4e1b-9a1f-c40029e9d553
caps.latest.revision: 24
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
# MediaProcessor
A media processor transforms media content into a different output. For example, you can use a media processor to transcode video from one bitrate and codec into another or to watermark a video. For a list of Microsoft Azure Media Services MediaProcessors, see [Get a Media Processor](https://msdn.microsoft.com/76910667-c9db-4217-b7f7-c4a1a86c1a19).  
  
 This topic gives an overview of the `MediaProcessor` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [MediaProcessor Entity Properties](../operations/mediaprocessor.md#mediaprocessor_entity_properties)  
  
-   [List MediaProcessors](../operations/mediaprocessor.md#list_mediaprocessors)  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

##  <a name="mediaprocessor_entity_properties"></a> MediaProcessor Entity Properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Id`<br /><br /> Read-only. Set by Media Services.|Edm.String|Unique identifier.|  
|`Name`<br /><br /> Read-only. Set by Media Services.|Edm.String|The friendly name of the MediaProcessor.|  
|`Description`<br /><br /> Read-only. Set by Media Services.|Edm.String|A description about the MediaProcessor.|  
|`Sku`<br /><br /> Read-only. Set by Media Services.|Edm.String|The SKU of the MediaProcessor.|  
|`Vendor`<br /><br /> Read-only. Set by Media Services.|Edm.String|The vendor name of the MediaProcessor|  
|`Version`<br /><br /> Read-only. Set by Media Services.|Edm.String|The version of the MediaProcessor.|  
  
##  <a name="list_mediaprocessors"></a> List MediaProcessors  
 MediaProcessors can be retrieved using a GET HTTP request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/MediaProcessors|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/MediaProcessors HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
```  
  
## See Also  
 [ContentKey](../operations/contentkey.md)   
 [Asset](../operations/asset.md)   
 [AccessPolicy](../operations/accesspolicy.md)   
 [AssetFile](../operations/assetfile.md)   
 [JobTemplate](../operations/jobtemplate.md)   
 [Locator](../operations/locator.md)   
 [Job](../operations/job.md)   
 [Task](../operations/task.md)   
 [TaskTemplate](../operations/tasktemplate.md)   
 [Quotas and Limitations](https://msdn.microsoft.com/82f7e538-6bdf-4883-aa50-24574cc4996e)