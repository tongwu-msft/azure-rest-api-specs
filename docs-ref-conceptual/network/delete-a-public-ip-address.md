---
title: "Delete a public IP address&#160;"
ms.custom: ""
ms.date: "2016-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 98679248-e853-4112-820a-778dff3a994f
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
# Delete a public IP address&#160;
## Request  
 See [Common parameters and headers](public-ip-addresses.md#bk_common) for headers and parameters that are used by all requests related to public IP addresses.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/publicIPAddresses/{public-IP-address-name}?api-version={api-version}`|  
  
 Replace {public-IP-address-name} with the name of the public IP address you want deleted.  
  
## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted.   
When asynchronous delete operation completes, GET \<Location header> returns 204.   
Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.   
Returns 204-No Content if resource does not exist.
