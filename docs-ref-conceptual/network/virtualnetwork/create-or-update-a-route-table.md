---
title: Create or update a route table
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Create or update a route table

This operations creates or updates a route table.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
 
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/routeTables/{routeTableName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the route table exists. |
| resourceGroup | The name of the resource group that contains the route table. |
| routeTableName | The name of the route table. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
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
