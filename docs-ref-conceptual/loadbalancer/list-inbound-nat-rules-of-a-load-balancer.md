---
title: "List inbound NAT rules of a load balancer"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 76059820-5f15-4237-9030-b4e037292a77
caps.latest.revision: 6
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
---
# List inbound NAT rules of a load balancer
## Request  
 See [Common parameters and headers](load-balancer.md#bk_common) for headers and parameters that are used by all requests related to load balancer inbound NAT rules.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/loadBalancers/{load-balancer-name}/inboundNatRules?api-version={api-version}`|  
  
## Response  
 **Status code:** Returns status code 200 - OK, or 201 - Created.  
  
```json  
{  
    "name": "{rule-name}",  
    "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/{rule-name}",  
    “etag”: “W/\”00000000-0000-0000-0000-000000000000\”“,  
    "properties": {   
        "provisioningState": “Updating|Deleting|Failed|Succeeded”,  
        "frontendIPConfiguration": { "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"},  
        "backendIPConfiguration": { "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"},  
        "protocol": "Tcp",  
        "frontendPort": 3389,  
        "backendPort": 3389  
    }  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|Name of the rule.|  
|frontendIPConfiguration|A reference to frontend IP Address.|  
|backendIPConfiguration|Read-only reference to a private ip address defined on a NetworkInterface of a VM. Traffic sent to frontendPort of the frontendIPConfiguration is forwarded to this backend IP.|  
|protocol|The transport protocol for the external endpoint. Possible values are Udp or Tcp.|  
|frontendPort|The port for the external endpoint. You can specify any port number you choose, but the port numbers specified for each role in the service must be unique. Possible values range between 1 and 65534, inclusive.|  
|backendPort|Port on the private IP of the network interface used by VM. Possible values range between 1 and 65535, inclusive.|  
|backendIPConfiguration|Read Only. A reference to the IP Configuration this rule applies to.|  
  
## Remarks  
 For more information about NAT rules, see [Load balancer inbound NAT rules](load-balancer-inbound-nat-rules.md).
