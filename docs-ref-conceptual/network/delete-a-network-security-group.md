---
title: "Delete a network security group"
ms.custom: ""
ms.date: "2016-04-27"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7b7648c7-3adc-4e6c-bc90-bbdfc1405260
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
# Delete a network security group
## Request  
 See [Common parameters and headers](network-security-groups.md#bk_common) for headers and parameters that are used by all requests related to network security groups.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/networkSecurityGroups/{network-security-group-name}?api-version={api-version}`|  
  
 Replace {network-security-group-name} with the name of the network security group you want deleted.  
  
## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
 Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
 Returns 204-No Content if resource does not exist.
