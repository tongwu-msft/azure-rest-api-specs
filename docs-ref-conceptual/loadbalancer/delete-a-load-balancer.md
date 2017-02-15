---
title: "Delete a load balancer"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 13fa1ab3-e20f-4d43-aca8-4999eb2221cc
caps.latest.revision: 8
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
# Delete a load balancer
## Request  
 See [Common parameters and headers](load-balancer.md#bk_common) for headers and parameters that are used by all requests related to load balancers  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/loadBalancers/{load-balancer-name}/{subnet-name}?api-version={api-version}`|  
  
 Replace {load-balancer-name} with the name of the load balancer you want deleted.  
  
## Response  
 **Status code:**  
  
-   202-Accepted if resource exists and the request is accepted.  
  
-   When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
-   Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
-   Returns 204-No Content if resource does not exist.
