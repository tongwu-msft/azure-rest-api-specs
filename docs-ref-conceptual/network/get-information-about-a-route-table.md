---
title: "Get information about a route table"
ms.custom: ""
ms.date: "2016-04-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 73209d73-1fb2-41bd-aaf7-7d951aede4a6
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
# Get information about a route table
## Request  
 See [Common parameters and headers](route-tables.md#bk_common) for headers and parameters that are used by all requests related to Route Tables.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables/{routeTableName}?api-version={api-version}`|  
  
 Replace {routeTableName} with the name of the route table which you want to get information for.  
  
## Response  
 Returns status code 200 (OK), if the route table was found   
Returns 404 if resource not found.  
  
```json  
{  
   "name": "myRouteTable",  
   "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable",  
   "location": "North US",  
   "tags": { "key": "value" },  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {   
      "provisioningState": "Updating|Deleting|Failed|Succeeded",  
      "routes": [   
         {  
            "name": "myRoute",  
            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute",  
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties": {   
               "provisioningState": "Updating|Deleting|Failed|Succeeded",  
               "addressPrefix": "*" | CIDR,  
               "nextHopType": "VirtualNetworkGateway" | "VNETLocal" | "Internet" | "VirtualAppliance" | "Null",  
               "nextHopIpAddress": "Valid IP Address",  
            }  
         }  
      ],  
      "subnets": [  
         {  
            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"  
         }  
      ]  
   }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|id|The identifying URL of the route table|  
|name|The name of the route table|  
|location|Specifies the supported Azure location of the route table. For more information, see List all of the available geo-locations|  
|tags|The tags and their values that are used by the route table.|  
|etag|System generated meta-data enabling concurrency control|  
|provisioningState|Provisioning state of the route table|  
|routes|Collection of routes contained within this route table.|  
|subnets|Collection of subnets with which this route table has been associated (if any).|  
  
## Remarks  
 For more information about routes, see [Get information about a route](get-information-about-a-route.md).
