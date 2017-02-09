---
title: "List route tables within a resource group"
ms.custom: ""
ms.date: "2016-04-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0b119ab0-17ff-432d-90c0-544889c2e00f
caps.latest.revision: 16
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
# List route tables within a resource group
## Request  
 See [Common parameters and headers](route-tables.md#bk_common) for headers and parameters that are used by all requests related to Route Tables.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables?api-version={api-version}`|  
  
## Response  
 **Status code:** 200 (OK)  
  
```json  
[  
{  
    "name": "myRouteTable-1",  
    "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable-1",  
    "location": "North US",  
    "tags": { "key": "value" } ,  
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
    "properties": {  
        "resourceGuid":"175BDC61-FDFD-4205-91F7-64868AB026D8",   
        "provisioningState": "Updating|Deleting|Failed|Succeeded",  
        "routes": [   
           {  
              "name": "myRoute1",  
              "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute1",  
              "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
              "properties": {   
                 "provisioningState": "Updating|Deleting|Failed|Succeeded",  
                 "addressPrefix": "10.1.0.0/16",  
                 "nextHopType": "VirtualNetworkGateway" | "VnetLocal" | "Internet" | "VirtualAppliance" | "None",  
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
},  
{  
   "name": "myRouteTable-2”,  
   "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable-2",  
   "location": "North US",  
   "tags": { "key": "value" } ,  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {   
      "provisioningState": “Updating|Deleting|Failed|Succeeded”,  
      "routes": [   
         {  
            "name": "myRoute2",  
            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute2",  
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties": {   
               "provisioningState": "Updating|Deleting|Failed|Succeeded",  
               "addressPrefix": "10.1.0.0/16",  
               "nextHopType": "VirtualNetworkGateway" | "VnetLocal" | "Internet" | "VirtualAppliance" | "None",  
               "nextHopIpAddress": "Valid IP Address",  
            }  
         }  
     ],  
     "subnets": [  
        {  
           "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet2"  
        }  
     ]  
  }  
}  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|id|The identifying URL of the route table|  
|name|The name of the route table|  
|location|Specifies the supported Azure location of the route table. For more information, see List all of the available geo-locations|  
|tags|The tags and their values that are used by the route table.|  
|etag|System generated meta-data enabling concurrency control|  
|resourceGuid|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the route table|  
|routes|Collection of routes contained within this route table.|  
|subnets|Collection of subnets with which this route table has been associated (if any).|  
  
## Remarks  
 For more information about routes, see  [Get information about a route](get-information-about-a-route.md).
