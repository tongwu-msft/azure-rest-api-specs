---
title: List route tables within a resource group
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# List route tables within a resource group

This operations lists all route tables in a resource group

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request   
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/routeTables?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the route table exists. |
| resourceGroup | The name of the resource group that contains the route table. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200 (OK)  
  
```json  
[  
{  
    "name": "myRouteTable-1",  
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable-1",  
    "location": "North US",  
    "tags": { "key": "value" } ,  
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
    "properties": {  
        "resourcesubscriptionId":"175BDC61-FDFD-4205-91F7-64868AB026D8",   
        "provisioningState": "Updating|Deleting|Failed|Succeeded",  
        "routes": [   
           {  
              "name": "myRoute1",  
              "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute1",  
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
              "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"  
           }  
        ]  
    }  
},  
{  
   "name": "myRouteTable-2”,  
   "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable-2",  
   "location": "North US",  
   "tags": { "key": "value" } ,  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {   
      "provisioningState": “Updating|Deleting|Failed|Succeeded”,  
      "routes": [   
         {  
            "name": "myRoute2",  
            "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute2",  
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
           "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet2"  
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
|resourcesubscriptionId|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the route table|  
|routes|Collection of routes contained within this route table.|  
|subnets|Collection of subnets with which this route table has been associated (if any).|  
  
## Remarks  
 For more information about routes, see  [Get information about a route](get-information-about-a-route.md).
