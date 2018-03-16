---
title: Get effective network security group
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Get effective network security group

This operations gets the effective network security groups for a network interface card.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}/effectiveNetworkSecurityGroups?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network interface exists. |
| resourceGroup | The name of the resource group that contains the network interface card. |
| networkInterfaceName | The name of the network interface card. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200; otherwise a 404 will be returned.  
  
```json  
"value":[  
   {  
      "networkSecurityGroup":{  
         "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg"
      },
      “association”:{  
         “subnet”:{  
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
         },
         “networkInterface”:{  
            "id":"/subscriptions/{subscriptionId}/resourceGroups/myrg1/providers/Microsoft.Network/networkInterfaces/vm1nic1"
         }
      },
      "effectiveSecurityRules":[  
         {  
            "name":"myNsRule",
            "protocol":“Tcp” | “Udp” | "*",
            "sourcePortRange":"source-port-range",
            "destinationPortRange":"destination-port-range",
            "sourceAddressPrefix":“VirtualNetwork” | "subnet" | “*” | {IP address},
            “expandedSourceAddressPrefix”:[],
            "destinationAddressPrefix":“VirtualNetwork” | "subnet" | “*” | {IP-address},
            “expandedDestinationAddressPrefix”:[],
            "access":"Allow" | “Deny”,
            "priority":"priority-pf-the-rule",
            "direction":"Inbound" | “Outbound”
         },
      ]
   },
]
```  
  
|Element name|Description|  
|------------------|-----------------|  
|networkSecurityGroup.id| The identifying URL of the Network Security Group.|  
|tags|The tags and their values that are used by the Network Security Group.|  
|association.subnet.id| The identifying URL of the subnet the network security group is associated to. If not associated, this field is not present in the response |
|association.networkInterface.id| The identifying URL of the network interface |
|name| The name of the security rule |
|protocol| Network protocol this rule applies to. Possible values are: **TCP**, **UDP** and *.|
|sourcePortRange| Source port or range|
|destinationPortRange| Destination port or range|
|sourceAddressPrefix| CIDR or source IP range or * to match any IP|
|expandedSourceAddressPrefix| Expanded list of source address prefixes|
|destinationAddressPrefix| CIDR or destination IP range or * to match any IP|
|expandedDestinationAddressPrefix| Expanded list of destination address prefixes|
|access| Specifies whether network traffic is allowed or denied|
|priority| Specifies the priority of the rule|
|direction| The direction specifies if rule will be evaluated on incoming or outgoing traffic.|


## Remarks  
 For more information about Network Security Rules, see [Get information about a network security rule ](get-information-about-a-network-security-rule.md).
