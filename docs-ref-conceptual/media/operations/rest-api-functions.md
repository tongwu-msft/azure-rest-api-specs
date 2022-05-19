---
title: "REST API Functions"
description: REST API functions support the Microsoft Azure Media Services entities by performing various tasks such as canceling jobs, retrieving protection keys, and so on.
ms.custom: ""
ms.date: "03/14/2018"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bfc1d354-ea94-4a23-9a13-feb2126f21df
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
# REST API Functions
The following functions support the Microsoft Azure Media Services entities by performing various tasks such as canceling jobs, retrieving protection keys, and so on.  
  
 `CancelJob`. Takes the following parameter: *jobid* of `Edm.String` type.  
  
 `GetProtectionKeyId`. Takes the following parameter: *contentKeyType* of `Edm.Int32` type. Returns `Edm.String`.  
  
 `GetProtectionKey`. Takes the following parameter: *protectionKeyId* of `Edm.String` type. Returns `Edm.String`.  
  
 `CreateFileInfos`. Takes the following parameter: *assetid* of `Edm.String` type.  
  
 `RebindContentKey`. Takes the following parameters: *id* of `Edm.String` type, *x509Certificate* of `Edm.String` type. Returns `Edm.String`.  
  
 `Publish`. Takes the following parameter: *assetid* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Asset` type.  
  
 `GetKeyDeliveryUrl`. Takes the following parameters: *contentKey* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.ContentKey` type, *keyDeliveryType* of `Edm.String` type. Returns `Edm.Int32`.  
  
 `Start`. Takes the following parameter: *streamingEndpoint* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.StreamingEndpoint` type.  
  
 `Start`. Takes the following parameter: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type.  
  
 `Start`. Takes the following parameter: *program* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Program` type.  
  
 `Stop`. Takes the following parameter: *streamingEndpoint* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.StreamingEndpoint` type.  
  
 `Stop`. Takes the following parameter: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type.  
  
 `Stop`. Takes the following parameter: *program* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Program` type.  
  
 `Scale`. Takes the following parameters: *streamingEndpoint* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.StreamingEndpoint` type, *scaleUnits* of `Edm.String` type.  
  
 `ShowSlate`. Takes the following parameters: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type, *duration* of `Edm.Time` type, *assetId* of `Edm.String` type.  
  
 `StartAdvertisement`. Takes the following parameters: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type, *duration* of `Edm.Time` type, *cueId* of `Edm.Int32` type, *showSlate* of `Edm.Boolean` type.  
  
 `HideSlate`. Takes the following parameter: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type.  
  
 `EndAdvertisement`. Takes the following parameters: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type, *cueId* of `Edm.Int32` type.  
  
 `Reset`. Takes the following parameter: *channel* of `Microsoft.Cloud.Media.Vod.Rest.Data.Models.Channel` type.  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

 The rest of the topic shows a few examples of how to call functions using REST.  
  
##  <a name="canceljob"></a> CancelJob  
 Running Jobs can be canceled by calling CancelJob and passing in the Job Id of a currently running Job.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/CancelJob?jobid='*URL-encodedvalue*'|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/CancelJob?jobid='nb%3ajid%3aUUID%3a9e9533ba-2b9b-fa4c-a33d-73eebd49039b' HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
```  
  
##  <a name="createfileinfos"></a> CreateFileInfos  
 A File entity is created using the CreateFileInfos function and passing in the Asset Id that is associated with the media file you uploaded into blob storage. For more information, see [Upload a file to blob storage](https://msdn.microsoft.com/efeb5012-9a00-4d02-9712-5fe4b2043257).  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/CreateFileInfos?assetid='*URL-encodedvalue*'|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/CreateFileInfos?assetid='nb%3Acid%3AUUID%3Ac80d312d-7cb1-44aa-bb23-2c35d10c44bd' HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
Content-Length: 0  
  
```  
  
##  <a name="getprotectionkeyid"></a> GetProtectionKeyId  
 The GetProtectionKeyId function retrieves an X.509 certificate thumbprint that is used to ensure that you have the correct certificate installed on your machine when encrypting your user-defined content key. The list of possible values for the contentKeyType parameter map to the ContentKeyType enumeration values on the ContentKey entity. For more information, see [ContentKey Entity Properties](../operations/contentkey.md#contentkey_properties).  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/GetProtectionKeyId?contentKeyType=*value*|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/GetProtectionKeyId?contentKeyType=1 HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
  
```  
  
##  <a name="getprotectionkey"></a> GetProtectionKey  
 GetProtectionKey retrieves the specific X.509 certificate that should be used to encrypt your user-defined content key.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/GetProtectionKey?ProtectionKeyId='*value*'|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/GetProtectionKey?ProtectionKeyId='B2FE17BEF56FFCB9A3FC4267D0F2AFE25CD2DE22' HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
  
```  
  
##  <a name="rebindcontentkey"></a> RebindContentKey  
 If you want to retrieve your encrypted content key back from Media Services, then call RebindContentKey and pass in your ContentKey Id and the X.509 certificate (with only the public key) that was used to encrypt the clear storage encryption/common protection content keys. If you call RebindContentKey and pass in an empty string to the x509Certificate parameter, then your content key is base64-encoded and returned in clear.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/RebindContentKey?id='*contentkeyid*'&x509Certificate='*URL-encodedvalue*'|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/RebindContentKey?id='nb%3akid%3aUUID%3a2eeba14e-613e-4af7-a926-413372cca8d5'&x509Certificate='' HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.19  
Authorization: Bearer <token value>  
Host: media.windows.net  
```  
  
## See Also  
 [Media Services REST](../operations/azure-media-services-rest-api-reference.md)
