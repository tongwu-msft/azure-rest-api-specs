---
title: List all of the connections for a virtual network gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# List all of the connections for a virtual network gateway&#160;
List all of the connections for the specific virtual network gateway.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/virtualNetworkGateways/{virtualNetworkGatewayName}/connections?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network gateway exists. |
| resourceGroup | The name of the resource group that contains the virtual network gateway. |
| virtualNetworkGatewayName | The name of the virtual network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found).  
  
```json  
  
[  
   {  
      "name": "connection1",  
      "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/connections/connection1",  
      "location": "West US",  
      "tags": { "key1": "value1" },  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties": {  
         "gateway1": {  
            "name": "firstgateway",  
            "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/SiteToSite/firstgateway"  
         },  
         "gateway2": {  
            "name": "secondgateway",  
            "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/SiteToSite/secondgateway"  
         },  
         "connectionType": "SiteToSite",  
         "connectivityState": "Connected",  
         "allocatedIPAddresses": [ "{ip-address}" ],  
         "ipsecParameters": {  
            "encryptionType": "{encryptionType}",  
            "pfsGroup": {pfsGroup}",  
            "saDataSizeKilobytes": "{saDataSizeKilobytes}",  
            "saLifeTimeSeconds": "{saLifeTimeSeconds}",  
            "hashAlgorithm": "{hashAlgorithm}"  
         }  
      }  
   }  
]  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the request connection.|  
|location|The location value for the NRP instance that will receive this request. Connections are global objects, so this could be any location.|  
|gateway1|The name of the first gateway in this connection.|  
|gateway2|The name of the second gateway in this connection.|  
|connectionType|The type of this connection. This could be either `SiteToSite`, `PointToSite`, or `Dedicated`.|  
|connectivityState|The current state of this connection. Valid values are `Connected` or `Disconnected`.|  
|allocatedIPAddress|An IP address that has been allocated to a client in a PointToSite connection.|  
|encryptionType|The type of encryption that will be used in a SiteToSite connection.|  
|pfsGroup|The pfs group that will be used in a SiteToSite connection.|  
|saDataSizeKilobytes|The number of kilobytes that can be sent across a SiteToSite connection before the connection’s IPsec SA will need to be renegotiated.|  
|saLifeTimeSeconds|The number of seconds that a SiteToSite connection’s IPsec SA will be valid before it needs to be renegotiated.|  
|hashAlgorithm|The hash algorithm that will be used when negotiating SiteToSite IPsec SAs.|
