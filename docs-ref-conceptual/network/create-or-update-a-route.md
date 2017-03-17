---
title: Create or update a route
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Create or update a route

This operations creates or updates a route.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/routeTables/{routeTableName}/routes/{routeName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the route exists. |
| resourceGroup | The name of the resource group that contains the route. |
| routeTableName | The name of the route table. |
| routeName | The name of the route. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
```json  
{  
   "properties": {  
      "addressPrefix": "10.1.0.0/16",   
      "nextHopType": "VirtualNetworkGateway" | "VnetLocal" | "Internet" | "VirtualAppliance" | "None",  
      "nextHopIpAddress": "Valid IP Address",  
   }  
}  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|addressPrefix|Yes|String|The destination CIDR to which the route applies, such as 10.1.0.0/16|  
|nextHopType|Yes|String|The type of Azure hop the packet should be sent to.<br /><br /> Possible values are:<br /><br /> **VirtualNetworkGateway**: Represents an Azure S2S VPN Gateway.<br /><br /> **VnetLocal**: Represents the local virtual network. For instance, if you have two subnets, 10.1.0.0/16 and 10.2.0.0/16 in the same virtual network, the route for each subnet in the route table will have a next hop value of Local.<br /><br /> **Internet**: Represents the default Internet gateway provided by the Azure Infrastructure<br /><br /> **VirtualAppliance**: Represents a virtual appliance you added to your Azure virtual network.<br /><br /> **None**: Represents a black hole. Packets forwarded to a black hole will not be forwarded at all.|  
|nextHopIpAddress|No|String|Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is **VirtualAppliance**.|  
  
## Response  
 **Status code:** Returns status code 200 (OK), if the operation was successful. Returns 412 (Precondition Failed) if the resource's ETag doesn’t match one specified in If-Match header.  
  
```json  
{  
   "name": "myRoute",  
   "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute",  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {   
      "provisioningState": "Updating|Deleting|Failed|Succeeded",  
      "addressPrefix": "10.1.0.0/16",  
      "nextHopType": "VirtualNetworkGateway" | "VnetLocal" | "Internet" | "VirtualAppliance" | "None",  
      "nextHopIpAddress": "Valid IP Address",  
   }  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|Name of the route entry|  
|id|URI of the route entry|  
|addressPrefix|The destination CIDR to which the route applies, such as 10.1.0.0/16|  
|nextHopType|The type of Azure hop the packet should be sent to.<br /><br /> Possible values are:<br /><br /> **VirtualNetworkGateway**: Represents an Azure S2S VPN Gateway.<br /><br /> **VnetLocal**: Represents the local virtual network. For instance, if you have two subnets, 10.1.0.0/16 and 10.2.0.0/16 in the same virtual network, the route for each subnet in the route table will have a next hop value of Local.<br /><br /> **Internet**: Represents the default Internet gateway provided by the Azure Infrastructure<br /><br /> **VirtualAppliance**: Represents a virtual appliance you added to your Azure virtual network.<br /><br /> **None**: Represents a black hole. Packets forwarded to a black hole will not be forwarded at all.|  
|nextHopIpAddress|Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is **VirtualAppliance**.|
