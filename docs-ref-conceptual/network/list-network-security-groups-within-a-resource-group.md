---
title: List network security groups within a resource group
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# List network security groups within a resource group

This operations lists all network security groups in a resource group.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request   
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkSecurityGroups?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network security group exists. |
| resourceGroup | The name of the resource group that contains the network security group. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  

## Response  
 **Status code:** 200  
  
```json  
[   
   {   
      "name":"myNsg",  
      "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg",  
      "location":"North US",  
      "tags":{   
         "key":"value"  
      },  
      "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties":{   
         "resourcesubscriptionId":"AF6A2C41-9F74-46B3-9F65-F5286FFEE3DE",  
         "provisioningState":"Succeeded",  
         "securityRules":[   
            {   
               "name":"myNsRule",  
               "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg/securityRules/myNsRule",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "description":"description-of-this-rule",  
                  "protocol": "*",  
                  "sourcePortRange":"source-port-range",  
                  "destinationPortRange":"destination-port-range",  
                  "sourceAddressPrefix":"*",  
                  "destinationAddressPrefix":"*",  
                  "access":"Allow",  
                  "priority":priority-of-the-rule,  
                  "direction":"Inbound"  
               }  
            }  
         ],  
         "defaultSecurityRules":[   
            {   
               "name":"AllowVnetInBound",  
               "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg/defaultSecurityRules/AllowVnetInBound",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "description":"description-of-this-rule",  
                  "protocol": "*",  
                  "sourcePortRange":"*",  
                  "destinationPortRange":"*",  
                  "sourceAddressPrefix":"VirtualNetwork",  
                  "destinationAddressPrefix":"VirtualNetwork",  
                  "access":"Allow ",  
                  "priority":65000,  
                  "direction":"Inbound"  
               }  
            }  
         ],  
         "networkInterfaces":[   
            {   
               "id":"/subscriptions/{subscriptionId}/resourceGroups/myrg1/providers/Microsoft.Network/networkInterfaces/vm1nic1 "  
            }            {   
               "id":"/subscriptions/{subscriptionId}/resourceGroups/myrg1/providers/Microsoft.Network/networkInterfaces/vm1nic2"  
            }  
         ],  
         "subnets":[   
            {   
               "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"  
            }  
         ]  
      }  
   }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Network Security Group.|  
|id|The identifying URL of the Network Security Group.|  
|location|Specifies the supported Azure location of the Network Security Group. For more information, see List all of the available geo-locations.|  
|tags|The tags and their values that are used by the Network Security Group.|  
|etag|System generated meta-data enabling concurrency control.|  
|resourcesubscriptionId|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the Network Security Group.|  
|securityRules|A collection of Network Security Rules within this Network Security Group.|  
|defaultSecurityRules|A collection of Default Network Security Rules within this Network Security Group.|  
|networkInterfaces.id|A collection of references to Network Interface Cards that reference this Network Security Group.|  
|Subnets.id|A collection of references to Subnets that reference this Network Security Group.|  
  
## Remarks  
 For more information about Network Security Rules, see [Get information about a network security rule ](get-information-about-a-network-security-rule.md).
