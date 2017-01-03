---
title: "Delete a virtual network gateway"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8f451c27-3c54-48a8-ab11-74cb593d7326
caps.latest.revision: 4
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
# Delete a virtual network gateway
Delete an existing virtual network gateway.  
  
## Request  
 See [Virtual Network Gateways](../NetworkGateway/virtual-network-gateways.md) for headers and parameters that are used by all requests related to virtual network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/virtualNetworkGateways/{virtual-network-gateway-name}?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the virtual network gateway was successfully deleted; otherwise, 404 (Not Found). 409 (Conflict) can occur if the virtual network gateway is in a Provisioning or Deprovisioning state.