---
title: Get a VPN device configuration script
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Get a VPN device configuration script
Get the configuration script for a VPN device that the local network gateway needs to establish a connection with the virtual network gateway.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/localnetworkgateways/{localNetworkGatewayName}/vpnDeviceConfiguration?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the local network gateway exists. |
| resourceGroup | The name of the resource group that contains the local network gateway. |
| localNetworkGatewayName | The name of the local network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found). 400 (Bad Request) can occur if the local network gateway exists but it doesn’t connect to a virtual network gateway.  
  
 The response is the stream of the VPN device configuration script.
