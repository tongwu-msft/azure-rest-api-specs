---
title: "EncodingReservedUnitType"
description: "Encoding Media Reserved Units API details"
ms.custom: ""
ms.date: "08/24/2021"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 15c36cc3-1cbd-4927-9780-935241768161
caps.latest.revision: 13
author: "jiayali-ms"
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
# EncodingReservedUnitType
By default, Media Reserved Units are no longer needed to be used for Azure Media Services accounts. For compatability purposes, you can continue to use the Azure APIs to manage and scale MRUs. However, by default, none of the MRU configurations that you set will be used to control encoding concurrency or performance. Be sure to review the [Scale Media Processing Overview page](/MicrosoftDocs/azure-docs-pr/articles/media-services/previous/media-services-scale-media-processing-overview) to get more information about scaling media processing.
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](/MicrosoftDocs/azure-docs-pr/articles/media-services/previous/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](/MicrosoftDocs/azure-docs-pr/articles/media-services/previous/media-services-use-aad-auth-to-access-ams-api).  

This topic gives an overview of the `EncodingReservedUnitType` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
* [Get EncodingReservedUnitType](#get_EncodingReservedUnitType)  
  
* [Update EncodingReservedUnitType](#update_EncodingReservedUnitType)  
  
## EncodingReservedUnitType Entity

> [!Note]
> As described above, Reserved Units are no longer offered by Azure Media Services. The following information is for compatibility issues only.

The `EncodingReservedUnitType` entity contains the following properties.  
  
|Name|Type|Description|  
|----------|----------|-----------------|  
|`AccountId`<br /><br /> Required. Read-Only|Edm.GUID|Media Services account Id.|  
|`ReservedUnitType`<br /><br /> Required.|Edm.Int|Reserved unit type can be one of the following: `S1` (0), `S2` (1), `S3` (2).|  
|`CurrentReservedUnits`<br /><br /> Required.|Edm.Int|Current reserved units. The number of the encoding reserved units that you want to be provisioned for this account.<br /><br /> By default, every Media Services account can scale to up to 25 encoding units. To request a higher limit, see [How to request a higher limit for updatable quotas](https://msdn.microsoft.com/82f7e538-6bdf-4883-aa50-24574cc4996e).|  
|`MaxReservableUnits`<br /><br /> Read-only.|Edm.Int|Maximum number of units that can be reserved for the account.|  
  
##  <a name="get_EncodingReservedUnitType"></a> Get EncodingReservedUnitType  
 Details about the encoding reserved unit type associated with your account can be retrieved by using a GET HTTP request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|Gets information about the encoding reserved unit type associated with your account.<br /><br /> https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/EncodingReservedUnitTypes|HTTP/1.1|  
  
### Sample Request  
  

 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
GET https://testrest.cloudapp.net/api/EncodingReservedUnitTypes HTTP/1.1  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json;odata=minimalmetadata  
Accept-Charset: UTF-8  
x-ms-version: 2.19  
Content-Type: application/json;odata=minimalmetadata  
Host: <host URI>  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
  
```  
  
 If successful, this operation returns **HTTP/1.1 200 OK**.  
  
##  <a name="update_EncodingReservedUnitType"></a> Update EncodingReservedUnitType  
 Updates EncodingReservedUnitType properties.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PATCH/PUT/MERGE<br /><br /> For more information about these operations, see [PATCH/PUT/MERGE](https://msdn.microsoft.com/library/dd541276.aspx).|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/EncodingReservedUnitTypes(guid'*accountid*')|HTTP/1.1|  
  
### Sample Request  

 You can try out the following example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
  
PUT https://testrest.cloudapp.net/api/EncodingReservedUnitTypes(guid'61318ce3-0629-4400-8a1b-e716bc501314') HTTP/1.1  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json;odata=minimalmetadata  
Accept-Charset: UTF-8  
x-ms-version: 2.19  
Content-Type: application/json;odata=minimalmetadata  
Host: <host URI>  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
  
```  
  
 Request body:  
  
```  
{CurrentReservedUnits:1}  
```  
  
 If successful, this operation returns **HTTP/1.1 204 No Content**.