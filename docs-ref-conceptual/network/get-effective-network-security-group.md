---
title: "Get effective network security group"
ms.custom: ""
ms.date: "2017-02-15"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c2abb3af-3c14-42d3-bdce-e4ab73e2c94d
caps.latest.revision: 10
author: "anavinahar"
ms.author: "annahar"
manager: "narayan"
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
# Get effective network security group
## Request  
 See [Common parameters and headers](network-security-groups.md#bk_common) for headers and parameters that are used by all requests related to network security groups.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}/effectiveNetworkSecurityGroups?api-version={api-version}`|  

 Replace {networkInterfacename} with the name of the Network Interface you want to get information for.  
  
## Response  
 **Status code:** 200; otherwise a 404 will be returned.  
  
```json  
"value":[  
   {  
      "networkSecurityGroup":{  
         "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg"
      },
      “association”:{  
         “subnet”:{  
            "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
         },
         “networkInterface”:{  
            "id":"/subscriptions/{guid}/resourceGroups/myrg1/providers/Microsoft.Network/networkInterfaces/vm1nic1"
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