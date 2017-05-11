---
title: Create or update a local network gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Create or update a local network gateway&#160;
Create or update a representation of your on-premises network VPN gateway device.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/localnetworkgateways/{localNetworkGatewayName}?api-version={api-version}`|  
|PATCH|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/localnetworkgateways/{localNetworkGatewayName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the local network gateway exists. |
| resourceGroup | The name of the resource group that contains the local network gateway. |
| localNetworkGatewayName | The name of the local network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
The Patch method can be used to update individual properties.  
  
```json  
{  
   "name": "mylocalgateway1",  
   "tags": { "key1": "value1" },  
   "properties": {  
      "ipAddress": "{ipAddress}",  
      "subnet": [ "{subnetIPAddressPrefix}" ],  
      "vendor": "device vendor",  
      "platform": "device platform",  
      "osFamily": "family"  
   }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|name|Yes|String|The name of the local network gateway.|  
|ipAddress|Yes|String|The ip address of the local network gateway.|  
|subnet|Yes|String|One of the prefixes that is contained within the local network site.|  
|vendor|Yes|String|The vendor of the vpn device.|  
|platform|Yes|String|The platform of the vpn device.|  
|osFamily|Yes|String|The OS family of the vpn device.|  
  
## Response  
  
 Status code: 200 (OK) if the action is successful; otherwise, 409 (Conflict).  
  
```json  
{  
   "name": "mylocalgateway1",  
   "id": "/subscriptions/{subscription-id}/resourceGroups/<resourceGroupName>/providers/microsoft.network/localNetworkGateways/mylocalgateway1",  
   "tags": { "key1": "value1" },  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {  
      "ipAddress": "{ipAddress}",  
      "subnet": [ "{subnetIPAddressPrefix}" ],  
      "vendor": "device vendor",  
      "platform": "device platform",  
      "osFamily": "family"  
   }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the local network gateway.|  
|ipAddress|The ip address of the local network gateway.|  
|subnet|One of the prefixes that is contained within the local network site.|  
|vendor|The vendor of the vpn device.|  
|platform|The platform of the vpn device.|  
|osFamily|The OS family of the vpn device.|
