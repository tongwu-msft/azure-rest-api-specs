---
title: List all of the virtual network gateways
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# List all of the virtual network gateways
List all of the virtual network gateways in a resource group.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/virtualNetworkGateways?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network gateways exists. |
| resourceGroup | The name of the resource group that contains the virtual network gateway. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
    
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
