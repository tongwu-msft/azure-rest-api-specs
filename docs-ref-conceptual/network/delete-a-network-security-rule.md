---
title: "Delete a network security rule"
ms.custom: ""
ms.date: "04/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 71e24920-7a52-4438-b16e-42be4ac46155
caps.latest.revision: 7
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
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
# Delete a network security rule
## Request  
 See [Common parameters and headers](network-security-rules.md#bk_common) for headers and parameters that are used by all requests related to network security rules.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/networkSecurityGroups/{network-security-group-name}/securityRules/{security-rule-name}?api-version={api-version}`|  
  
 Replace {network-security-group-name} and {security-rule-name} with the name of the Network Security Rule you want deleted.  
  
## Response  
 **Status code:** 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204. Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header. Returns 204-No Content if resource does not exist.
