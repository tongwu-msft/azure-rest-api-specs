---
title: "Delete a virtual network peering"
ms.custom: ""
ms.date: "2017-02-22"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d1059519-b6d3-49ef-822c-9a18fb77b4aa
caps.latest.revision: 11
author: "anavinahar"
ms.author: "annahar"
manager: "narayan"
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
# Delete a virtual network
## Request  
 See [Common parameters and headers](virtual-networks.md#bk_common) for headers and parameters that are used by all requests related to Virtual Networks.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualNetworks/{virtual-network-name}/virtualNetworkPeerings/{virtual-network-peering-name}?api-version={api-version}`|  
  

Replace {virtual-network-peering-name} with the name of the Virtual Network Peering you want deleted and {virtual-network-name} with the Virtual Network the peering is associated to.

## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
 Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
 Returns 204-No Content if resource does not exist.
## Remarks  
 For more information about Virtual Network Peering, see [Create or update a virtual network peering](create-or-update-a-virtual-network-peering.md).