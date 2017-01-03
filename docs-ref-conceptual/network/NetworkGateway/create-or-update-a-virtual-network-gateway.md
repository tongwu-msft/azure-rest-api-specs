---
title: "Create or update a virtual network gateway"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e7c0f9c3-3775-4dd0-9be4-f21b1df5a9b1
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
# Create or update a virtual network gateway
Creates or updates a virtual network gateway.  
  
## Request  
 See [Virtual Network Gateways](../NetworkGateway/virtual-network-gateways.md) for headers and parameters that are used by all requests related to virtual network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|*PUT*|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/virtualNetworkGateways/{virtual-network-gateway-name}?api-version={api-version}`|  
|PATCH|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/virtualNetworkGateways/{virtual-network-gateway-name}?api-version={api-version}`|  
  
 The Patch method can be used to update individual properties.  
  
```  
{  
"name": "myvirtualgateway1",  
"location": "West US",  
"tags": { "key1": "value1" },  
"properties": {  
"gatewayType": "DynamicRouting",  
"gatewaySize": "Default",  
"bgpEnabled": True,  
"vpnClientAddressPool": [ "{vpnClientAddressPoolPrefix}" ],  
"defaultSites": [ "mysite1" ]  
}  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|name|Yes|String|The name of this virtual network gateway.|  
|location|Yes|String|The location that this virtual network gateway will be created in.|  
|gatewayType|Yes|String|The type of the gateway that is being created. This can be either `StaticRouting` or `DynamicRouting`.|  
|gatewaySize|Yes|String|The size of this gateway. This can be either `Default` or `HighPerformance`.|  
|bgpEnabled|Yes|Bool|Whether BGP is enabled for this virtual network gateway or not.|  
|vpnClientAddressPool|Yes|String|A single IP address prefix inside the list of prefixes that will be used when assigning IP addresses to incoming Point-to-Site client connection requests.|  
|defaultSite|Yes|String|The default local network site that forced tunneling traffic will be sent to when forced tunneling is enabled.|  
  
## Response  
 Status code: 200 (OK) if the action was successful; otherwise, 409 (Conflict).