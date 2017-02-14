---
title: "Create or update a virtual network"
ms.custom: ""
ms.date: "2016-07-08"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d1059519-b6d3-49ef-822c-9a18fb77b4aa
caps.latest.revision: 11
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
# Create or update a virtual network
## Request  
 See [Common parameters and headers](virtual-networks.md#bk_common) for headers and parameters that are used by all requests related to Virtual Networks.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualNetworks/{virtual-network-name}?api-version={api-version}`|  
  
 Replace {virtual-network-name} with the name of the Virtual Network which you want to create or update.  
  
```json  
[    
   {    
      "location":"North US",  
      "tags":{    
         "key":"value"  
      },  
      "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties":{    
         "addressSpace":{    
            "addressPrefixes":[    
               "10.1.0.0/16",  
               "10.2.0.0/16"  
            ]  
         },  
         "dhcpOptions":{    
            "dnsServers":[    
               "10.1.0.5",  
               "10.1.0.6"  
            ]  
         }  
         "subnets":[    
            {    
               "name":"mysubnet1",  
               "properties":{    
                  "provisioningState":"Succeeded",  
                  "addressPrefix":"10.1.0.0/24",  
                  "networkSecurityGroup":{    
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNSG1"  
                  }  
               }  
            }  
         ]  
      }  
   }  
]  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|location|Yes|String|Specifies the supported Azure location of the Virtual Network. For more information, see List all of the available geo-locations|  
|tags|No|Complex Type|The tags and their values that are used by the Virtual Network.|  
|addressSpace|No|Complex Type|AddressSpace contains an array of IP address ranges that can be used by subnets of the virtual network.|  
|addressSpace.addressPrefixes|No|String|List of address blocks reserved for this virtual network in CIDR notation|  
|dhcpOptions|No|Complex Type|Optional. DhcpOptions contains an array of DNS servers available to VMs deployed in the virtual network.|  
|dnsServers|No|String|Optional. List of DNS servers IP addresses.|  
|name|Yes|String|Name of the subnet. The name is unique within virtual network|  
|addressPrefix|No|Complex Type|Address prefix for the subnet|  
|networkSecurityGroup|No|Complex Type|Reference to NSG that will be applied to all NICs in the subnet by default.|  
|id|No|String|URI of the network security group resource|  
  
## Response  
 **Status code:** 200.  
  
```json 
{    
   "name":" myvnet1",  
   "id":"/subscriptions/{guid}/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1",  
   "location":"North US",  
   "tags":{    
      "key":"value"  
   },  
   "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties":{   
      "resourceGuid":"FA0F0F1A-158F-4725-ACCE-C7B6D5CD937F",   
      "provisioningState":"Succeeded",  
      "addressSpace":{    
         "addressPrefixes":[    
            "10.1.0.0/16",  
            "10.2.0.0/16"  
         ]  
      },  
      "dhcpOptions":{    
         "dnsServers":[    
            "10.1.0.5",  
            "10.1.0.6"  
         ]  
      },  
      "subnets":[    
         {    
            "name":"mysubnet1",  
            "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1",  
            "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties":{    
               "provisioningState":"Succeeded",  
               "addressPrefix":"10.1.0.0/24",  
               "networkSecurityGroup":{    
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNSG1"  
               },  
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
   }  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|id|The identifying URL of the Virtual Network.|  
|name|The name of the Virtual Network.|  
|type|Specifies that this is of type Microsoft.Network/virtualNetworks|  
|location|Specifies the supported Azure location of the Virtual Network. For more information, see List all of the available geo-locations|  
|tags|The tags and their values that are used by the Virtual Network.|  
|etag|System generated meta-data enabling concurrency control|  
|resourceGuid|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the Virtual Network|  
|addressSpace|AddressSpace contains an array of IP address ranges that can be used by subnets of the virtual network.|  
|addressSpace.addressPrefixes|List of address blocks reserved for this virtual network in CIDR notation|  
|dhcpOptions|DhcpOptions contains an array of DNS servers available to VMs deployed in the virtual network.|  
|dhcpOptions.dnsServers|List of DNS servers IP addresses.|  
|subnets|Collection of subnets contained within this Virtual Network|  
  
## Remarks  
 For more information about subnets, see [Get information about a subnet](get-information-about-a-subnet.md).
