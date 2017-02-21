---
title: "Get a VPN device configuration script"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 00e0ec24-a5a3-4f71-bce9-ea32eee0558d
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
# Get a VPN device configuration script
Get the configuration script for a VPN device that the local network gateway needs to establish a connection with the virtual network gateway.  
  
## Request  
 See [Local Network Gateways ](local-network-gateways.md) for headers and parameters that are used by all requests related to local network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/localnetworkgateways/{local-network-gateway-name}/vpnDeviceConfiguration?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found). 400 (Bad Request) can occur if the local network gateway exists but it doesn’t connect to a virtual network gateway.  
  
 The response is the stream of the VPN device configuration script.
