---
title: "Get current topology"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Get current topology

Gets the current network topology in a region.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/topology?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| targetResourceGroupName |	Speicifies the resource group name to run topology on. |

```json
{
"targetResourceGroupName": "{resourceGroupName}"
}
```

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | Operation successful. | 

```json
{
  "id": "ecd6c860-9cf5-411a-bdba-512f8df7799f",
  "createdDateTime": "2017-01-18T04:13:07.1974591Z",
  "lastModified": "2017-01-17T22:11:52.3527348Z",
  "resources": [
    {
      "name": "virtualNetwork1",
      "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{virtualNetworkName}",
      "location": "westcentralus",
      "associations": [
        {
          "name": "{subnetName}",
          "resourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/(virtualNetworkName)/subnets
/{subnetName}",
          "associationType": "Contains"
        }
      ]
    },
    {
      "name": "webtestnsg-wjplxls65qcto",
      "resourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/{nsgName}
s65qcto",
      "associationType": "Associated"
    },
    ...
  ]
}
```

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | A requisite resource does not exist. |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     

## Currently Supported Resources

- ApplicationGateway
- ApplicationGatewayBackendAddressPool
- ApplicationGatewayFrontendIpConfiguration
- ExpressRouteCircuit
- LoadBalancer 
- LoadBalancerBackendAddressPool 
- LoadBalancerFrontendIpConfiguration
- LoadBalancerInboundNatPool
- LoadBalancerOutboundNatRule 
- LoadBalancerProbe 
- LocalNetworkGateway 
- NetworkInterface
- NetworkSecurityGroup
- PublicIpAddress
- Route
- RouteTable
- SecurityRule
- Subnet
- VirtualNetwork
- VirtualNetworkGateway
- VirtualNetworkGatewayConnection
- VM 
- VMScaleSet

VNet Peering is also supported but will not appear as a resource. For two VNets, VNet1 and VNet2, that have peering enabled, they would be represented by an association between VNet1 and Vnet2 and an association of VNet2 with Vnet1.

## Associations

An association shows that a relationship exists between different resources. For example, a VM can have multiple NICs, but a NIC can only be associated with a single VM at a time. Therefore, an association between a NIC and VM exists. Continuing this example, there are currently two types of associations represented in the Topology API:

AssociationType: **Associated**, and **Contains**

Continuing the example from above, a sample output of the relationship between a VM and a NIC would appear like this:

```json
{ 
"name": "HRAppVM1", 
"id": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/HRAppVM1", 
"associations": [ 
    { 
    "name": "hrAppNic1", 
    "resourceId": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/hrAppNic1", 
    "associationType": "Contains" 
    } 
] 
},
...
```

Where hrAppNic1 is the only NIC attached to HRAppVM1, and since a NIC can only be attached to one VM, the VM contains it. Continuing this example, we see can see several associations for hrAppNic1:

```json
{ 
"name": "hrAppNic1", 
"id": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/hrAppNic1", 
"location": "westcentralus", 
"associations": [ 
    { 
    "name": "HRAppVM1",
    "resourceId": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/HRAppVM1", 
    "associationType": "Associated" 
    }, 
    { 
    "name": "HRNSG", 
    "resourceId": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/HRNSG", 
    "associationType": "Associated" 
    }, 
    { 
        "name": "IPv4-Subnet-1", 
        "resourceId": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/hrAppVNET/subnets/IPv4-Subnet-1", 
        "associationType": "Associated" 
    }, 
    { 
        "name": "BackendPoolIPv4", 
        "resourceId": "/subscriptions/(subscriptionID}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/hrAppLoadBalancer/backendAddressPools/BackendPoolIPv4", 
        "associationType": "Associated" 
    }              
]
}
```

hrAppNic1 is associated with HRAppVM1 as well as an NSG a subnet, and a Backend Address Pool. Since VMs are not restricted to only a single NIC, we see that the associationType is "Associated".

 