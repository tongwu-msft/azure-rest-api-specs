---
title: "Create or update a local network gateway&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 00a0bdd1-19aa-45cb-88d1-318fe94c737e
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
# Create or update a local network gateway&#160;
Create or update a representation of your on-premises network VPN gateway device.  
  
## Request  
 See [Local Network Gateways ](../NetworkGatewayREST/local-network-gateways .md) for headers and parameters that are used by all requests related to local network gateways.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/localnetworkgateways/{local-network-gateway-name}?api-version={api-version}`|  
|PATCH|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/localnetworkgateways/{local-network-gateway-name}?api-version={api-version}`|  
  
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
