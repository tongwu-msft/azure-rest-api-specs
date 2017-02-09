---
title: "Delete a local network gateway"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a6f853e6-5162-4f91-ac59-86ddbf070470
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
# Delete a local network gateway
Delete the specified local network gateway.  
  
## Request  
 See [Local Network Gateways ](../NetworkGatewayREST/local-network-gateways .md) for headers and parameters that are used by all requests related to local network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/localnetworkgateways/{local-network-gateway-name}?api-version={api-version}`|  
  
## Response  
  
 Status code: 200 (OK) if the action ws successful; otherwise, 404 (Not Found).