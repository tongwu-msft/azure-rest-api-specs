---
title: "Get information about a route"
ms.custom: ""
ms.date: "2016-04-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c3912937-0b30-4411-8a0e-389e6c5128f3
caps.latest.revision: 12
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
# Get information about a route
## Request  
 See [Common parameters and headers](routes.md#bk_common) for headers and parameters that are used by all requests related to Routes.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables/{routeTableName}/routes/{routeName}?api-version={api-version}`|  
  
 Replace {routeName} with the route name you want to get.  
  
## Response  
 **Status code:**  
  
 Returns status code 200 (OK), if the operation was successful.  
  
 Returns status code 404, if the route resource is not found.  
  
```json  
{  
   "name": "myRoute",  
   "id": "/subscriptions/{guid}/../resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute",  
   "etag": "W/\”00000000-0000-0000-0000-000000000000\"",  
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
|nextHopType|The type of Azure hop the packet should be sent to.<br /><br /> Possible values are:<br /><br /> **VirtualNetworkGateway:** Represents an Azure S2S VPN Gateway.<br /><br /> **VnetLocal:** Represents the local virtual network. For instance, if you have two subnets, 10.1.0.0/16 and 10.2.0.0/16 in the same virtual network, the route for each subnet in the route table will have a next hop value of Local.<br /><br /> **Internet:** Represents the default Internet gateway provided by the Azure Infrastructure.<br /><br /> **VirtualAppliance:** Represents a virtual appliance you added to your Azure virtual network.<br /><br /> **None:** Represents a black hole. Packets forwarded to a black hole will not be forwarded at all.|  
|nextHopIpAddress|Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is **VirtualAppliance**.|
