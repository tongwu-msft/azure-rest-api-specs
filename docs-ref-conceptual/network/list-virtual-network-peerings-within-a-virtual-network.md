---
title: "List virtual network peerings within a virtual network"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# List virtual network peerings within a virtual network
## Request  
 See [Common parameters and headers](virtual-networks.md#bk_common) for headers and parameters that are used by all requests related to Virtual Networks.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualNetworks/{virtual-network-name}/virtualNetworkPeerings?api-version={api-version}`|  
  
## Response  
 **Status code:** 200  
  
```json 
 { "value": [
    {
    "name": "LinktoVNet2",
    "id": "/subscriptions/{guid}/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/virtualNetworkPeerings/LinktoVNet2",
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
    "properties": {
      "provisioningState": "Succeeded",
      "peeringState": "Connected",
    "remoteVirtualNetwork": { 
      "id": "/subscriptions/{guid}/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet2" }, 
    "allowVnetAccess": true, 
    "allowForwardedTraffic": false, 
    "allowGatewayTransit": false, 
    "useRemoteGateways": false 
      "remoteAddressSpace": {
        "addressPrefixes": [
          "10.2.0.0/24"
        ]
      }
    }
  },
    {
    "name": "LinktoVNet3",
    "id": "/subscriptions/{guid}/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/virtualNetworkPeerings/LinktoVNet3",
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
    "properties": {
      "provisioningState": "Succeeded",
      "peeringState": "Connected",
    "remoteVirtualNetwork": { 
      "id": "/subscriptions/{guid}/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet3" }, 
    "allowVnetAccess": true, 
    "allowForwardedTraffic": false, 
    "allowGatewayTransit": false, 
    "useRemoteGateways": false 
      "remoteAddressSpace": {
        "addressPrefixes": [
          "10.3.0.0/24"
        ]
      }
    }
  },
]
}
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Virtual Network Peering.|  
|id|The identifying URL of the Virtual Network Peering.|  
|etag|System generated meta-data enabling concurrency control|  
|provisioningState|Provisioning state of the Virtual Network Peering|  
|virtualNetworkPeerings.peeringState|State of the Virtual Network peering. Possible values are: **Initiated**, **Connected**, or **Disconnected** |
|remoteVirtualNetwork.id|The identifying URI of the peer Virtual Network|
|allowVnetAccess| Indicates if communication between the two virtual networks is possible by automatic opening of ACLs. Possible values are: <br /><br />**True:** (default) The peer Virtual Network's address is included as part of the VIRTUAL_NETWORK tag <br /><br /> **False:** The peer Virtual Network's address is not included as part of VIRTUAL_NETWORK tag. The VMs in the peer Virtual Network space would not be able to access the VMs in local Virtual Network space> You would have to set explicit NSG rules to allow communication between the Virtual Networks.|
|allowForwardedTraffic| Possible values are: <br /><br />**True:** Forwarded traffic (traffic not originating from the VMs in the peer Virtual Nework) will be allowed. <br /><br /> **False:** Forwarded traffic (traffic not originating from the VMs in the peer Virtual Nework) will not be allowed. |
|allowGatewayTransit| Indicates if peer Virtual Networks can access the Virtual Network's Gateway. It does not indicate if the Gateway is already being used. Possible values are: <br /><br />**True:** The peer Virtual Nework can use the Virtual network Gateway of this Virtual network for connecting to on-premises networks. <br /><br /> **False:** The peer Virtual Nework can not use the Virtual network Gateway of this Virtual network for connecting to on-premises networks.|
|useRemoteGateways| Possible values are: <br /><br />**True:** If the flag is set to true, and allowGatewayTransit on peer Virtual Network is also true, the Virtual Network  will use the Gateway of the peer Virtual Network for transit. Only 1 peering can have this flag set to true. <br /><br /> **False:** If this flag is set to false, the Virtual Network is not able to use the remote Gateway for transit.|
  
## Remarks  
 For more information about Virtual Network Peering, see [Create or update a virtual network peering](create-or-update-a-virtual-network-peering.md).