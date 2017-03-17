---
title: "List subnets within a virtual network"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# List subnets within a virtual network
## Request  
 See [Common parameters and headers](subnets.md#bk_common) for headers and parameters that are used by all requests related to subnets.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualNetworks/{virtual-network-name}/subnets`|  
  
## Response  
 **Status code:** 200  
  
```json  
[   
   {   
      "name":"mysubnet1",  
      "id":"/subscriptions/{guid}/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/mysubnet1",  
      "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties":{   
         "provisioningState":"Succeeded",  
         "addressPrefix":"10.1.0.0/24",  
         "networkSecurityGroup":{   
            "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNSG1"  
         },  
         "routeTable": { "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRT1" },  
         "ipConfigurations":[   
            {   
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"  
            },  
            {   
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/lb1/frontendIpConfigurations/ip1"  
            },  
            {   
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/vpnGateways/gw1/ipConfigurations/ip1"  
            }  
         ]  
      }  
   }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|id|The identifying URL of the Subnet.|  
|name|The name of the Subnet.|  
|etag|System generated meta-data enabling concurrency control|  
|provisioningState|Provisioning state of the subnet|  
|addressPrefix|Address prefix for the subnet|  
|networkSecurityGroup|Reference to NSG that will be applied to all NICs in the subnet by default.|  
|networkSecurityGroup.id|URI of the network security group resource|  
|routeTable|Reference to route table that will be applied to this subnet.|  
|routeTable.id|URI of the route table resource|  
|ipConfigurations|Collection of IP Configurations with IPs within this subnet.|  
|ipConfigurations.id|URI of specific IP Configurations contained within this subnet.|
