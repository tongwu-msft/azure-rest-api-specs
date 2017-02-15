---
title: "List load balancers within a subscription"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 55cce2d8-0553-4de2-b7d3-8d3bb3bb99bb
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
# List load balancers within a subscription
## Request  
 See [Common parameters and headers](load-balancer.md#bk_common) for headers and parameters that are used by all requests related to load balancers.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscription-id}/providers/Microsoft.Network/loadBalancers?api-version={api-version}`|  
  
## Response  
 **Status code:** 200.  
  
```json 
[   
   {   
      "name":"mylb1",  
      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1",  
      "location":"North US",  
      "tags":{   
         "key":"value"  
      },  
      "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties":{   
         "resourceGuid":"6ECBD4C1-0DC1-4D86-9F6E-4A58F83C9023",  
         "provisioningState":"Succeeded",           
         "frontendIPConfigurations":{   
            "name":"myip1",  
            "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/frontendIPConfigurations/myip1",  
            "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
            "properties":{   
               "provisioningState":"Succeeded",  
               "subnet":{   
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"  
               },  
               "privateIPAddress":"10.0.0.10",  
               "privateIPAllocationMethod":"Static",  
               "publicIPAddress":{   
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPAddresses/myip1"  
               },  
               "loadBalancingRules":[   
                  {   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"  
                  }  
               ],  
               "inboundNatRules":[   
                  {   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/rule1"  
                  }  
               ]  
            }  
         },  
         "backendAddressPools":[   
            {   
               "name":"pool1",  
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/backendAddressPools/pool1",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "backendIPConfigurations":[   
                     {   
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"  
                     }  
                  ],  
                  "loadBalancingRules":[   
                     {   
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"  
                     }  
                  ]  
               }  
            }  
         ],  
         "loadBalancingRules":[   
            {   
               "name":"HTTP Traffic",  
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/loadBalancingRules/rule1",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "frontendIPConfiguration":{   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"  
                  },  
                  "backendAddressPool":{   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/backendAddressPool/pool1"  
                  },  
                  "protocol":"Tcp",  
                  "frontendPort":80,  
                  "backendPort":8080,  
                  "probe":{   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/probe1"  
                  },  
                  "enableFloatingIP":true,  
                  "idleTimeoutInMinutes":4,  
                  "loadDistribution":"Default",  
  
               }  
            }  
         ],  
         "probes":[   
            {   
               "name":"my probe 1",  
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/my probe 1",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "protocol":"Tcp",  
                  "port":8080,  
                  "requestPath":"myprobeapp1/myprobe1.svc",  
                  "intervalInSeconds":5,  
                  "numberOfProbes":16,  
                  "loadBalancingRules":[   
                     {   
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"  
                     }  
                  ],  
  
               }  
            }  
         ],  
         "inboundNatRules":[   
            {   
               "name":"RDP Traffic",  
               "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDP Traffic",  
               "etag":"W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties":{   
                  "provisioningState":"Succeeded",  
                  "frontendIPConfiguration":{   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"  
                  },  
                  "backendIPConfiguration":{   
                     "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"  
                  },  
                  "protocol":"Tcp",  
                  "frontendPort":3389,  
                  "backendPort":3389  
               }  
            }  
         ],  
         "inboundNatPools":[  
            {  
               "name": "RDPForVMSS1",  
               "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers /Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDPForVMSS1",  
               "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
               "properties": {   
                  "provisioningState": "Updating|Deleting|Failed|Succeeded",      
                  "frontendIPConfiguration": {   
                     "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"  
                  },  
                  "protocol": "Tcp",  
                  "frontendPortRangeStart": 50000,  
                  "frontendPortRangeEnd": 50500,  
                  "backendPort": 3389  
               }  
            }  
         ]  
      }  
   }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Load Balancer.|  
|id|The identifying URL of the Load Balancer.|  
|location|Specifies the supported Azure location of the Load Balancer. For more information, see List all of the available geo-locations|  
|tags|The tags and their values that are used by the Load Balancer.|  
|etag|System generated meta-data enabling concurrency control|  
|resourceGuid|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the Load Balancer|  
|frontendIPConfigurations.name|User-defined name of the Frontend IP configuration.|  
|frontendIPConfigurations.id|The identifying URL of the Frontend IP Configuration|  
|frontendIPConfigurations.etag|System generated meta-data enabling concurrency control|  
|frontendIPConfigurations.provisioningState|Provisioning state of the Frontend IP Configuration|  
|frontendIPConfigurations.subnet.id|Reference to subnet associated with the IP Configuration|  
|frontendIPConfigurations.privateIPAddress|Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned.|  
|frontendIPConfigurations.publicIPAddress.id|Reference to Public IP address to be associated with the Load Balancer|  
|frontendIPConfigurations.loadBalancingRules.id|Reference to Load Balancing Rule using use this Frontend IP Configuration|  
|frontendIPConfigurations.inboundNatRules.id|Reference to Inbound Nat Rule using this Frontend IP Configuration|  
|backendAddressPools.name|User-defined name of the Backend Address Pool|  
|backendAddressPools.id|The identifying URL of the Backend Address Pool|  
|backendAddressPools.etag|System generated meta-data enabling concurrency control|  
|backendAddressPools.provisioningState|Provisioning state of the Backend Address Pool|  
|backendAddressPools.backendIPConfigurations.id|Reference to backend IP Configuration over which this LB will operate|  
|backendAddressPools.loadBalancingRules.id|Reference to Load Balancing Rule used by this Backend Address Pool|  
|loadBalancingRules.name|Name of the Load Balancing Rule|  
|loadBalancingRules.id|The identifying URL of the Load Balancing Rule|  
|loadBalancingRules.etag|System generated meta-data enabling concurrency control|  
|loadBalancingRules.provisioningState|Provisioning state of the Load Balancing Rule|  
|loadBalancingRules.frontendIPConfiguration.id|A reference to frontend IP Address|  
|loadBalancingRules.backendAddressPool.id|A reference to a Backend Address Pool over which this Load Balancing Rule operates|  
|loadBalancingRules.protocol|The transport protocol for the external endpoint. Possible values are Udp or Tcp|  
|loadBalancingRules.frontendPort|The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive|  
|loadBalancingRules.backendPort|The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive|  
|loadBalancingRules.probe.id|A reference to a Probe used by this Load Balancing Rule.|  
|loadBalancingRules.enableFloatingIP|Floating IP is pertinent to failover scenarios: a “floating” IP is reassigned to a secondary server in case the primary server fails. Floating IP is required for SQL AlwaysOn.|  
|loadBalancingRules.idleTimeoutInMinutes|Specifies the timeout for the Tcp idle connection. The value can be set between 4 and 30 minutes. The default value is 4 minutes. This element is only used when the protocol is set to Tcp.|  
|loadBalancingRules.loadDistribution|Specifies the load balancing distribution type to be used by the Load Balancer. Possible values are:  Default – The load balancer is configured to use a 5 tuple hash to map traffic to available servers. SourceIP – The load balancer is configured to use a 2 tuple hash to map traffic to available servers. SourceIPProtocol– The load balancer is configured to use a 3 tuple hash to map traffic to available servers|  
|probes.name|The name of the Load Balancer Probe. The name must be unique|  
|probes.id|Unique reference to this Probe|  
|probes.etag|System generated meta-data enabling concurrency control|  
|probes.provisioningState|Provisioning state of the Load Balancer Probe|  
|probes.protocol|Specifies the protocol of the end point. Possible values are Http or Tcp. If Tcp is specified, a received ACK is required for the probe to be successful. If Http is specified, a 200 OK response from the specified URI is required for the probe to be successful.|  
|probes.port|Port on which the Probe queries the backend endpoint. Possible values range from 1 to 65535, inclusive.|  
|probes.requestPath|The URI used for requesting health status from the backend endpoint. Required if protocol is set to Http. Otherwise, it is not allowed.|  
|probes.intervalInSeconds|The interval, in seconds between probes to the backend endpoint for health status. The default value is 15, the minimum value is 5.|  
|probes.numberOfProbes|The number of failed probe attempts after which the backend endpoint is removed from rotation. The default value is 2. NumberOfProbes multiplied by intervalInSeconds value must be greater or equal to 10. Endpoints are returned to rotation when at least one probe is successful.|  
|probes.loadBalancingRules.id|A reference to a Load Balancing Rule that uses this Probe.|  
|inboundNatRules.name|User-defined name of the Inbound Nat Rule|  
|inboundNatRules.id|Unique reference to this Inbound Nat Rule|  
|inboundNatRules.etag|System generated meta-data enabling concurrency control|  
|inboundNatRules.provisioningState|Provisioning state of the Inbound Nat Rule|  
|inboundNatRules.frontendIPConfiguration.id|Reference to the Frontend IP Configuration exposing this Inbound Nat Rule|  
|inboundNatRules.backendIPConfiguration.id|Reference to the Backend IP Configuration exposed by this Inbound Nat Rule|  
|inboundNatRules.protocol|The transport protocol for the external endpoint. Possible values are Udp or Tcp|  
|inboundNatRules.frontendPort|The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive|  
|inboundNatRules.backendPort|The port used for the internal endpoint. Possible values range between 1 and 65535, inclusive|  
|inboundNatPool.name|User-defined name of the Inbound Nat Pool|  
|inboundNatPool.id|Unique reference to this Inbound Nat Pool|  
|inboundNatPool.etag|System generated meta-data enabling concurrency control|  
|inboundNatPool.provisioningState|Provisioning state of the Inbound Nat Pool|  
|inboundNatPool.frontendIPConfiguration.id|Reference to the Frontend IP Configuration exposing this Inbound Nat Pool|  
|inboundNatPool.protocol|The transport protocol for the external endpoint. Possible values are Udp or Tcp|  
|inboundNatPool.frontendPortRangeStart|The last port number in the range of external ports that will be used to provide Inbound Nat to NICs associated with this Load Balancer. Possible values range between 1 and 65534, inclusive|  
|inboundNatPool.frontendPortRangeEnd|The last port number in the range of external ports that will be used to provide Inbound Nat to NICs associated with this Load Balancer. Possible values range between 1 and 65534, inclusive|  
|inboundNatPool.backendPort|The port used for the internal endpoint. Possible values range between 1 and 65535, inclusive|
