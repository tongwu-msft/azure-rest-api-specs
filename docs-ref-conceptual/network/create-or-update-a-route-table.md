---
title: "Create or update a route table"
ms.custom: ""
ms.date: "2016-04-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 126d56f0-a065-4944-beae-418e37715984
caps.latest.revision: 17
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
# Create or update a route table
## Request  
 See [Common parameters and headers](route-tables.md#bk_common) for headers and parameters that are used by all requests related to route table.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables/{routeTableName}?api-version={api-version}`|  
  
 Replace {routeTableName} with the name of the route table which you want to create or update.  
  
```json  
{    
      "location":"North US",  
      "tags":{    
         "key":"value"  
      },  
      "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties":{  
            "routes": [   
   		{  
            	      "name": "myRouteTable",  
            	      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute",  
            	      "properties": {   
                	        "addressPrefix": "10.1.0.0/16",  
                	        "nextHopType": "VirtualNetworkGateway" | "VnetLocal"| "Internet" | "VirtualAppliance" | "None",  
                	        "nextHopIpAddress": "Valid IP Address",  
            	      }  
            	}  
           ]    
      }  
}  
```  
  
|Element Name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|location|Yes|String|Specifies the supported Azure location of the route table. For more information, see List all of the available geo-locations|  
|tags|No|Complex Type|The tags and their values that are used by the route table.|  
|routes|No|Complex Type|Collection of routes contained within this route table. See [Create or update a route](create-or-update-a-route.md) for information on creating routes.|  
  
## Response  
 Returns status code 200 (OK), if the operation was successful  
 Returns 412 (Precondition Failed) if the resource's ETag doesn’t match one specified in If-Match header.  
  
```json  
{  
    "name": "myRouteTable",  
    "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/microsoft.network/routeTables/myRouteTable",  
    "location": "North US",  
    "tags": { "key": "value" } ,  
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
    "properties": {  
        "resourceGuid":"175BDC61-FDFD-4205-91F7-64868AB026D8",   
        "provisioningState": "Updating|Deleting|Failed|Succeeded",  
        "routes": [   
        {  
            "name": "myRoute",  
            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRouteTable/routes/myRoute",  
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties": {   
                "provisioningState": "Updating|Deleting|Failed|Succeeded",  
                "addressPrefix": "10.1.0.0/16",  
                "nextHopType": "VirtualNetworkGateway" | "VNETLocal" | "Internet" | "VirtualAppliance" | "Null",  
                "nextHopIpAddress": "Valid IP Address",  
            }  
        }  
  
        ],  
        "subnets": [  
                {"id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"}  
        ]  
    }  
}  
```  
  
|Element Name|Description|  
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
 For more information about routes, see [Get information about a route](get-information-about-a-route.md).
