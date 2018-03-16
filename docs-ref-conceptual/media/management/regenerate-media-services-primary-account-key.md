---
title: "Regenerate Media Services Primary Account Key"
ms.custom: ""
ms.date: "2016-03-08"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: f2c9eca7-8c98-4236-8338-07263a2f7021
caps.latest.revision: 8
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
# Regenerate Media Services Primary Account Key

> [!NOTE]
>  It is now recommended to use  the Azure Resource Manager (ARM) REST API endpoints, as described in [Media Services management REST API reference](../../../docs-ref-autogen/media/MediaService.json).
   
  
 The `POST` request method described in this topic request to regenerate the specified Media Services account primary identity key.  
  
 The request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<accountName>` with your account name:  
  
|||  
|-|-|  
|Method|Request URI|  
|POST|https://endpoint/\<subscriptionId>/services/mediaservices/Accounts/\<accountName>/AccountKeys/Primary/Regenerate|  
  
 A successful operation returns status code 204 (NoContent). For information about error codes, see [Media Services Management Error Codes](media-services-management-error-codes.md).  
  
## Example  

See [How to: Use Media Services Management REST API](how-to-use-media-services-management-rest-api.md).  
  
#