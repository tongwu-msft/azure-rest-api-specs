---
title: List inbound NAT rules of a load balancer
ms.date: 03/15/2017
ms.service: load-balancer
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---
# List inbound NAT rules of a load balancer

This operation lists all inbound NAT rules of a load balancer.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/loadBalancers/{loadBalancerName}/inboundNatRules?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Load balancer exists. |
| resourceGroup | The name of the resource group that contains the Load balancer. |
| loadBalancerName | The name of the Load balancer. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** Returns status code 200 - OK, or 201 - Created.  
  
```json  
{  
    "name": "{rule-name}",  
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/{rule-name}",  
    “etag”: “W/\”00000000-0000-0000-0000-000000000000\”“,  
    "properties": {   
        "provisioningState": “Updating|Deleting|Failed|Succeeded”,  
        "frontendIPConfiguration": { "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"},  
        "backendIPConfiguration": { "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"},  
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
