---
title: Get information about a subnet
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Get information about a subnet

This operations gets information about a subnet.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/virtualNetworks/{virtualNetworkName}/subnets/{subnetName}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the subnet exists. |
| resourceGroup | The name of the resource group that contains the subnet. |
| virtualNetworkName | The name of the virtual network. |
| subnetName | The name of the subnet. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200  
  
```json  
{   
   "name":"mysubnet1",  
   "id":"/subscriptions/{subscriptionId}/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/mysubnet1",  
   "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties":{   
      "provisioningState":"Succeeded",  
      "addressPrefix":"10.1.0.0/24",  
      "networkSecurityGroup":{   
         "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNSG1"  
      },  
      "routeTable": { "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRT1" },  
      "ipConfigurations":[   
         {   
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"  
         },  
         {   
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/lb1/frontendIpConfigurations/ip1"  
         },  
         {   
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/vpnGateways/gw1/ipConfigurations/ip1"  
         }  
      ]  
   }  
}  
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
