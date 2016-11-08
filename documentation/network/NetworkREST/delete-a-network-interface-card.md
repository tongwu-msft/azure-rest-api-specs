---
title: "Delete a network interface card"
ms.custom: ""
ms.date: "2016-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 084f8233-cedd-4c4a-9be9-75e8d3b5f40e
caps.latest.revision: 9
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
# Delete a network interface card
## Request  
 See [Common parameters and headers](../NetworkREST/network-interface-cards.md#bk_common) for headers and parameters that are used by all requests related to network interface cards.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/networkInterfaces/{network-interface-name}?api-version={api-version}`|  
  
 Replace {network-interface-name} with the name of the network interface card you want deleted.  
  
## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
 Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
 Returns 204-No Content if resource does not exist.