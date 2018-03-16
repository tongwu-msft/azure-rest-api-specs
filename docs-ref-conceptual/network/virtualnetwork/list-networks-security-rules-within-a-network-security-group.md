---
title: List networks security rules within a network security group
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# List networks security rules within a network security group

This operation lists all network security rules in a network security group.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkSecurityGroups/{networkSecurityGroupName}/securityRules?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network security group exists. |
| resourceGroup | The name of the resource group that contains the network security group. |
| networkSecurityGroupName | The name of the network security group. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200  
  
```json  
[  
   {  
      "name": "rule1",  
      "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg/securityRules/rule1",  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties": {  
         "provisioningState": "Succeeded",  
         "description": "description-of-this-rule",  
         "protocol": "*",  
         "sourcePortRange": "source-port-range",  
         "destinationPortRange": "destination-port-range",  
         "sourceAddressPrefix": "*",  
         "destinationAddressPrefix": "*",  
         "access": "Allow",  
         "priority": priority-of-the-rule,  
         "direction": "Inbound"  
      }  
   }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|description|A description for this rule.|  
|protocol|Network protocol this rule applies to.|  
|sourcePortRange|Source Port or Range.|  
|destinationPortRange|Destination Port or Range.|  
|sourceAddressPrefix|CIDR or source IP range or * to match any IP.|  
|destinationAddressPrefix|CIDR or destination IP range or * to match any IP.|  
|access|Specifies whether network traffic is allowed or denied.|  
|priority|Specifies the priority of the rule.|  
|direction|The direction specifies if rule will be evaluated on incoming or outgoing traffic.|
