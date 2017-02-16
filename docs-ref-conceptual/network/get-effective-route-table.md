---
title: "Get effective route table"
ms.custom: ""
ms.date: "2017-02-15"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 73209d73-1fb2-41bd-aaf7-7d951aede4a6
caps.latest.revision: 12
author: "anavinahar"
ms.author: "annahar"
manager: "narayan"
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
# Get effective route table
## Request  
 See [Common parameters and headers](route-tables.md#bk_common) for headers and parameters that are used by all requests related to Route Tables.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}/effectiveRouteTable?api-version={api-version}`|  
  
 Replace {networkInterfacename} with the name of the Network Interface you want to get information for.  
  
## Response  
Returns status code 200 (OK), if the route table was found   
Returns 404 if resource not found.  
  
```json  
{  
   "value":[  
      {  
         "userDefinedRoute":{  
            "id":"/subscriptions/{guid}/../resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/{route-table-name}/routes/{route-name}"
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
