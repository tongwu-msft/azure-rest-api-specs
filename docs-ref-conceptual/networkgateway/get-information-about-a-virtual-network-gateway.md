---
title: "Get information about a virtual network gateway"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 03c21a46-f60b-416e-92d0-3831e1e84f0c
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
# Get information about a virtual network gateway
Get information about the specified virtual network gateway.  
  
## Request  
 See [Virtual Network Gateways](virtual-network-gateways.md) for headers and parameters that are used by all requests related to virtual network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/virtualNetworkGateways/{virtual-network-gateway-name}?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the action was successful; otherwise, 404 (Not Found).  
  
```json  
{  
"name": "myvirtualgateway1",  
"id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/microsoft.network/virtualNetworkGateways/myvirtualgateway1",  
"location": "West US",  
"tags": { "key1": "value1" },  
"etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
"properties": {  
"gatewayType": "DynamicRouting",  
"gatewaySize": "Default",  
"subnet": {  
"id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/microsoft.network/virtualNetworks/<virtualNetworkName>/subnets/subnet1"  
},  
  
"vipAddress": "{vipAddress}",  
"bgpEnabled": True,  
"vpnClientAddressPool": [ "{vpnClientAddressPoolPrefix}" ],  
"defaultSites": [ "mysite1" ]  
}  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of this virtual network gateway.|  
|location|The location that this virtual network gateway will be created in.|  
|gatewayType|The type of the gateway that is being created. This can be either **StaticRouting** or **DynamicRouting**.|  
|gatewaySize|The size of this gateway. This can be either **Default** or **HighPerformance**.|  
|vipAddress|The virtual IP address that has been assigned to this virtual network gateway.|  
|bgpEnabled|Whether BGP is enabled for this virtual network gateway or not.|  
|vpnClientAddressPool|A single IP address prefix inside the list of prefixes that will be used when assigning IP addresses to incoming Point-to-Site client connection requests.|  
|defaultSite|The default local network site that forced tunneling traffic will be sent to when forced tunneling is enabled.|
