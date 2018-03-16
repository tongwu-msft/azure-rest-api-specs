---
title: "Update Entity"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ef56be71-bc51-48a1-838c-13c4a680c5d5
caps.latest.revision: 10
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
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
# Update Entity
Updates a messaging entity.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|https://{serviceNamespace}.servicebus.windows.net/{Entity Path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
|If-Match|Set this header to “*” to update the entity. You must provide all the property values that are desired on the updated entity. Any values not provided are set to the service default values. If this header is missing, the update call returns an error indicating that this entity already exists.|  
  
### Request Body  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you update an entity with a name containing special or encoded characters (for example, "test?Name=value&"), which gets encoded to "test%3FName%3Dvalue%26"), a (401) unauthorized exception will be generated.  
  
|Code|Description|  
|----------|-----------------|  
|201|Entity updated.|  
|400|Invalid request body.|  
|401|Authorization failure.|  
|403|Quota exceeded; entity not updated.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 The entity description is returned. Some description properties might contain default values if they were missing from the PUT request.