---
title: Get effective route table
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Get effective route table

This operations gets the effective route table for a network interface card.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}/effectiveRouteTable?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network interface exists. |
| resourceGroup | The name of the resource group that contains the network interface card. |
| networkInterfaceName | The name of the network interface card. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
Returns status code 200 (OK), if the route table was found   
Returns 404 if resource not found.  
  
```json  
{  
   "value":[  
      {  
         "userDefinedRoute":{  
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/{route-table-name}/routes/{route-name}"
         },
         "source":"User" | “VirtualNetworkGateway” | “Default”,
         "state":"Active" | “Invalid”,
         "addressPrefix":[  “Prefix1”, “Prefix2”,…]
          "nextHopType":“VirtualNetworkGateway” | “VnetLocal”| “Internet” | “VirtualAppliance” | “HyperNetGateway”| “VNetPeering “ | “None”,
         "nextHopIpAddress":[  “Valid IP Address1”, “Valid IP Address2”, …]
      },
   ]
}
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|id|The identifying URL of the effective route|  
|source|The source of the route table indicates who created the route <br /><br />Possible Values are:<br /><br /> **User**: Indicating you created the route<br /><br />**VirtualNetworkGateway**: Indicates the route was created due to the virtual network gateway<br /><br />**Default**: Indicates it is a route that is created by default|  
|state|Specify the state of effective route wther it is Active or Invalid|  
|addressPrefix|Specifies the address prefixes of the effective routes in CIDR notation|  
|nextHopType|The type of Azure hop the packet should be sent to.<br /><br /> Possible values are:<br /><br /> **VirtualNetworkGateway:** Represents an Azure S2S VPN Gateway.<br /><br /> **VnetLocal:** Represents the local virtual network. For instance, if you have two subnets, 10.1.0.0/16 and 10.2.0.0/16 in the same virtual network, the route for each subnet in the route table will have a next hop value of Local.<br /><br /> **Internet:** Represents the default Internet gateway provided by the Azure Infrastructure.<br /><br /> **VirtualAppliance:** Represents a virtual appliance you added to your Azure virtual network.<br /><br /> **HyperNetGateway:** Represents the Hypernet Gateway connected to your Azure virtual network.<br /><br />**VNetPeering:** Represents the virtual network that has a peering relationship with your Azure virtual network. <br /><br />**None:** Represents a black hole. Packets forwarded to a black hole will not be forwarded at all.|  
|nextHopIpAddress|Contains the IP address packets should be forwarded to|


## Remarks  
 For more information about routes, see [Get information about a route](get-information-about-a-route.md).
