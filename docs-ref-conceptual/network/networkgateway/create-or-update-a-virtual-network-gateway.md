---
title: Create or update a virtual network gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Create or update a virtual network gateway
Creates or updates a virtual network gateway.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/virtualNetworkGateways/{virtualNetworkGatewayName}?api-version={api-version}`|  
|PATCH|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/virtualNetworkGateways/{virtualNetworkGatewayName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network gateway exists. |
| resourceGroup | The name of the resource group that contains the virtual network gateway. |
| virtualNetworkGatewayName | The name of the virtual network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
The Patch method can be used to update individual properties.  
  
```json  
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
