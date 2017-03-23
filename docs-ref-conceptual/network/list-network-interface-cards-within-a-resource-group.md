---
title: List network interface cards within a resource group
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# List network interface cards within a resource group

This operation lists all network interface cards within a resource group.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request   
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkInterfaces?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network interface exists. |
| resourceGroup | The name of the resource group that contains the network interface card. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200  
  
```json  
[  
{   
   "name":"mynic1",  
   "id":"/subscriptions/{subscriptionId}/resourceGroups/myrg1/providers/Microsoft.Network/networkInterfaces/vm1mynic1",  
   "location":"North US",  
   "tags":{   
      "key":"value"  
   },  
   "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
   "type":"Microsoft.Network/NetworkInterfaces",  
   "properties":{  
      "resourcesubscriptionId":"5ED47B81-9F1C-4ACE-97A5-7B8CE08C5002",   
      "provisioningState":"Succeeded",        
      "virtualMachine":{   
         "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/vm1"  
      },  
      "macAddress":"00-00-00-00-00-00",  
      "networkSecurityGroup":{   
         "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNSG1"  
      },  
      "ipConfigurations":[   
         {   
            "name":"myip1",  
            "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1mynic1/ipConfigurations/myip1",  
            "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties":{   
               "provisioningState":"Succeeded",  
               "subnet":{   
                  "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysub1"  
               },  
               "privateIPAddress":"10.0.0.8",  
               "privateIPAllocationMethod":"Static",   
               "privateIPAddressVersion":"IPv4",  
               "publicIPAddress":{   
                  "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPAddresses/mypip1"  
               },  
               "loadBalancerBackendAddressPools":[   
                  {   
                     "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/backendAddressPools/pool1"  
                  }  
               ],  
               "loadBalancerInboundNatRules":[   
                  {   
                     "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/inboundNatRules/rdp for myvm1"  
                  },  
                  {   
                     "id":"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/inboundNatRules/powershell for myvm1"  
                  }  
               ]  
            }  
         }  
      ],  
      "dnsSettings":{   
         "dnsServers":[   
            "10.0.0.4",  
            "10.0.0.5"  
         ],  
         "appliedDnsServers": ["1.0.0.1", "2.0.0.2", "3.0.0.3"],  
         "internalDnsNameLabel": "IdnsVm1",  
         "internalFqdn": "IdnsVm1.a2ftlxfjn2iezihj3udx1wfn4d.hx.internal.cloudapp.net",  
         "internalDomainNameSuffix": "a2ftlxfjn2iezihj3udx1wfn4d.hx.internal.cloudapp.net"  
      },  
      "enableIPForwarding": false  
   }  
}  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Network Interface Card.|  
|id|The identifying URL of the Network Interface Card.|  
|location|Specifies the supported Azure location of the Network Interface Card. For more information, see List all of the available geo-locations.|  
|type|The type of the resource.|  
|tags|The tags and their values that are used by the Network Interface Card.|  
|etag|System generated meta-data enabling concurrency control.|  
|resourcesubscriptionId|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the Network Interface Card.|  
|virtualMachine|Reference to a VM with which this NIC has been associated.|  
|macAddress|The media access control (MAC) address of the network interface.|  
|networkSecurityGroup.id|A reference to Network Security Group to be applied to this NIC|  
|ipConfigurations|Collection of ipConfigurations associated with this NIC|  
|ipConfigurations.name|The name of the IP Configuration|  
|ipConfigurations.id|The ID of the IP Configuration|  
|ipConfigurations.etag|System generated meta-data enabling concurrency control|  
|ipConfigurations.provisioningState|Provisioning state of the IP Configuration|  
|ipConfigurations.subnet.id|Reference to a subnet in which this NIC has been created|  
|ipConfigurations.privateIPAddress|Static IP Address. The last one and first four IPs in any range are reserved and cannot be manually assigned.|  
|ipConfigurations.privateIPAllocationMethod|Defines how a private IP address is assigned. Options are Static or Dynamic.|  
|ipConfigurations.privateIPAddressVersion|Only available from api-version 2016-03-30 onwards, it defines whether the specific ipconfiguration is of type IPv4 or IPv6.|  
|ipConfigurations.publicIPAddress.id|Reference to a Public IP Address to associate with this NIC|  
|ipConfigurations.loadBalancerBackendAddressPools.id|Reference to a Load Balancer Backend Address Pool containing this NIC|  
|ipConfigurations.loadBalancerInboundNatRules.id|Reference to a Load Balancer Inbound Nat Rule containing this NIC|  
|dnsSettings.dnsServers|List of DNS servers IP addresses.|  
|dnsSettings.appliedDnsServers|If the VM that uses this NIC is part of an Availability Set, then this list will have the union of all DNS servers from all NICs that are part of the Availability Set. This property is what is configured on each of those VMs|  
|dnsSettings.internalDnsNameLabel|Relative DNS name for this NIC used for internal communications between VMs in the same VNet|  
|dnsSettings.internalFqdn|Fully qualified DNS name supporting internal communications between VMs in the same VNet|  
|internalDomainNameSuffix|Even if internalDnsNameLabel is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internalDomainNameSuffix.|  
|enableIPForwarding|Indicates whether IP forwarding is enabled on this NIC.|  
|primary|This field is returned when the NIC is associated with a VM, and indicates whether the NIC is the primary NIC of the VM.|
