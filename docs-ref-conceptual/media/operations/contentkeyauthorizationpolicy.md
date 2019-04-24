---
title: "ContentKeyAuthorizationPolicy"
ms.custom: ""
ms.date: "03/14/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 1261f6eb-cf9f-484c-9f0f-08bd38b5e65e
caps.latest.revision: 9
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
# ContentKeyAuthorizationPolicy
Media Services supports multiple ways of authenticating users who make key requests. The content key authorization policy must be configured by you and met by the client (player) in order for the key to be delivered to the client. The content key authorization policy could have one or more authorization restrictions: open, token restriction, or IP restriction. You use [ContentKeyAuthorizationPolicyOption](../operations/contentkeyauthorizationpolicyoption.md) to specify the authorization options. You then add the created options to `ContentKeyAuthorizationPolicy`.  
  
 If you plan to have multiple content keys that require the sample policy configuration, it is strongly recommended to create a single authorization policy and reuse it with multiple content keys.  
  
 Note that the Key Delivery service caches `ContentKeyAuthorizationPolicy` and its related objects (policy options and restrictions) for 15 minutes.  If you create a `ContentKeyAuthorizationPolicy` and specify to use a “Token” restriction, then test it, and then update the policy to “Open” restriction, it will take roughly 15 minutes before the policy switches to the “Open” version of the policy.  
  
 This topic describes `ContentKeyAuthorizationPolicy` and shows how to use this entity.  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

##  <a name="mediaprocessor_entity_properties"></a> ContentKeyAuthorizationPolicy Entity Properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Id`<br /><br /> Read-only. Set by Media Services.|Edm.String|Unique identifier.|  
|`Name`|Edm.String|Friendly name of the content key authorization policy.|  
|`Options`|A collection of [ContentKeyAuthorizationPolicyOption](../operations/contentkeyauthorizationpolicyoption.md)s.|A list of different ways a client can be authorized to access the content key.|  
  
## Create ContentKeyAuthorizationPolicy  
  

 The following example creates a ContentKeyAuthorizationPolicy. You can try out the example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/ContentKeyAuthorizationPolicies  
  
Content-Type: application/json  
DataServiceVersion: 1.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json  
Accept-Charset: UTF-8  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
  
```  
  
 Request body:  
  
```  
{"Name" : "Authorization Policy" }   
```  
  
 If successful, a **HTTP/1.1 201 Created** status code is returned along with a representation of the created entity in the response body.  
  
## Create ContentKeyAuthorizationPolicyOption  
  
 The following example creates a ContentKeyAuthorizationPolicyOption with the following values set: an `Open` authorization restriction (`"KeyRestrictionType":0`) and BaselineHttp (MPEG baseline HTTP key protocol) key delivery method (`"KeyDeliveryType":2`). You can try out the example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/ContentKeyAuthorizationPolicyOptions HTTP/1.1  
  
Content-Type: application/json  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json  
Accept-Charset: UTF-8  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
```  
  
 Request body:  
  
```  
  
{    
   "Name":"policy",  
   "KeyDeliveryType":2,  
   "KeyDeliveryConfiguration":"",  
   "Restrictions":[    
      {    
         "Name":"HLS Open Authorization Policy",  
         "KeyRestrictionType":0,  
         "Requirements":null  
      }  
   ]  
}  
```  
  
 If successful, a **HTTP/1.1 201 Created** status code is returned along with a representation of the created entity in the response body.  
  
 The following example creates a ContentKeyAuthorizationPolicyOption with the following values set: a `Token` authorization restriction (`"KeyRestrictionType":1`) and BaselineHttp (MPEG baseline HTTP key protocol) key delivery method (`"KeyDeliveryType":2`).  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https:/testrest.cloudapp.net/api/ContentKeyAuthorizationPolicyOptions HTTP/1.1  
  
Content-Type: application/json  
DataServiceVersion: 3.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json  
Accept-Charset: UTF-8  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
  
```  
  
 Request body:  
  
```  
{    
   "Name":"Token option for HLS",  
   "KeyDeliveryType":2,  
   "KeyDeliveryConfiguration":null,  
   "Restrictions":[    
      {    
         "Name":"Token Authorization Policy",  
         "KeyRestrictionType":1,  
         "Requirements":"<TokenRestrictionTemplate xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://schemas.microsoft.com/Azure/MediaServices/KeyDelivery/TokenRestrictionTemplate/v1\"><AlternateVerificationKeys><TokenVerificationKey i:type=\"SymmetricVerificationKey\"><KeyValue>dliLr1QQJrATxNuoss2Btvk1KxcDJDHvTgu7fII5LEMGAt1p6J1YAD7I0EVd6D69nEkNUlkSDXfgaJ3cswrf8g==</KeyValue></TokenVerificationKey></AlternateVerificationKeys><Audience>urn:test</Audience><Issuer>http://testacs.com/</Issuer><PrimaryVerificationKey i:type=\"SymmetricVerificationKey\"><KeyValue>tqdCrSPGDZYJ4l3YyWR1NH7OdTvucBm7bU/ZQKPszV/hR54saMgyJK9bA9bay996NtNpcA0OruHETvy885g46A==</KeyValue></PrimaryVerificationKey><RequiredClaims><TokenClaim><ClaimType>urn:microsoft:azure:mediaservices:contentkeyidentifier</ClaimType><ClaimValue i:nil=\"true\" /></TokenClaim></RequiredClaims><TokenType>JWT</TokenType></TokenRestrictionTemplate>"  
      }  
   ]  
}  
  
```  
  
## Associate options with ContentKeyAuthorizationPolicy  
  
 The following example associates ContentKeyAuthorizationPolicy with ContentKeyAuthorizationPolicyOption. You can try out the example in the [Fiddler](http://www.telerik.com/download/fiddler)’s Composer tab.  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
 Request headers:  
  
```  
POST https://testrest.cloudapp.net/api/ContentKeyAuthorizationPolicies('nb%3Ackpid%3AUUID%3Ac0a7c7cb-09c2-4306-86f5-9e9dc718cd90')/$links/Options  
  
DataServiceVersion: 1.0;NetFx  
MaxDataServiceVersion: 3.0;NetFx  
Accept: application/json  
Accept-Charset: UTF-8  
Content-Type: application/json  
User-Agent: Microsoft ADO.NET Data Services  
Authorization: Bearer <token value>  
x-ms-version: 2.11  
  
```  
  
 Request body:  
  
```  
{ "uri":"https://wamsbayclus001rest-hs.cloudapp.net/api/ContentKeyAuthorizationPolicyOptions('nb%3Ackpoid%3AUUID%3A288f8084-e93b-4d04-90c0-a7af9145b7ae')" }  
  
```  
  
 If successful, a **HTTP/1.1 200 OK** status code is returned along with a representation of the created entity in the response body.