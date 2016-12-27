---
title: "Delete Media Services Account"
ms.custom: ""
ms.date: "2016-03-08"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 2dea6c04-a017-48f1-9729-c34706ed8b47
caps.latest.revision: 7
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
# Delete Media Services Account

> [!NOTE]
>  It is now recommended to use  the Azure Resource Manager (ARM) REST API endpoints, as described in [Media Services management REST API reference](../../../docs-ref-autogen/media/MediaService.json). 

 The `DELETE` request method described in this topic deletes the specified Media Services account in the specified subscription.  

 The request may be specified as follows (replace `<subscription-id>` with your subscription ID, and `<accountName>` with your account name):  

|||  
|-|-|  
|Method|Request URI|  
|DELETE|https://endpoint/\<subscriptionId>/services/mediaservices/Accounts/\<accountName>|  

 A successful operation returns status code 200 (OK). For information about error codes, see [Media Services Management Error Codes](media-services-management-error-codes.md).  

## Example  

See [How to: Use Media Services Management REST API](how-to-use-media-services-management-rest-api.md).  
