---
title: List all of the local network gateways
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# List all of the local network gateways
List all of the local network gateways in a resource group.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/localnetworkgateways?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the local network gateways exists. |
| resourceGroup | The name of the resource group that contains the local network gateway. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found).  
  
```json  
[  
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
]  
```  
  
|Element Name|Description|  
|------------------|-----------------|  
|name|The name of the request local network gateway.|  
|ipAddress|The ip address of the local network gateway.|  
|subnet|One of the prefixes that is contained within the local network site.|  
|vendor|The vendor of the vpn device.|  
|platform|The platform of the vpn device.|  
|osFamily|The OS family of the vpn device.|  
|Element Name|Description|
