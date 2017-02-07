---
title: "View security group view of a VM"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# View security group view of a VM

Queries the status of a packet capture session.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/securityGroupView?api-version={api-version}` |

```json
{ 
"targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/{virtualMachineName}" 
}
```

|Element name| Type |Description|
|--|--|--|
|targetResourceId| String |The resource identifier of the target resource against which the action is to be performed. For securityGroupView action the supported target resource types are Microsoft.Compute/virtualMachines.|

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | Operation completed immediately. | 
| **202 (Accepted)** | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header. | 

```json
{
  "networkInterfaces": [
    {
      "securityRuleAssociations": {
        "networkInterfaceAssocation": {
          "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ContosoExampleRG/providers/Microsoft.Network/networkInterfaces/contosovm842",
          "securityRules": [
            {
              "name": "default-allow-rdp",
              "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ContosoExampleRG/providers/Microsoft.Network/networkSecurityGroups/ContosoVM-nsg/securityRules/default-allow-rdp",
              "etag": "W/\"4fafe4bc-416d-4dc6-8a8f-60ba7cca4ed3\"",
              "properties": {
                "provisioningState": "Succeeded",
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "3389",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 1000,
                "direction": "Inbound"
              }
            }
          ]
        },
        "defaultSecurityRules": [
          {
            "name": "AllowVnetInBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Allow inbound traffic from all VMs in VNET",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "VirtualNetwork",
              "destinationAddressPrefix": "VirtualNetwork",
              "access": "Allow",
              "priority": 65000,
              "direction": "Inbound"
            }
          },
          {
            "name": "AllowAzureLoadBalancerInBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Allow inbound traffic from azure load balancer",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "AzureLoadBalancer",
              "destinationAddressPrefix": "*",
              "access": "Allow",
              "priority": 65001,
              "direction": "Inbound"
            }
          },
          {
            "name": "DenyAllInBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Deny all inbound traffic",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "*",
              "destinationAddressPrefix": "*",
              "access": "Deny",
              "priority": 65500,
              "direction": "Inbound"
            }
          },
          {
            "name": "AllowVnetOutBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Allow outbound traffic from all VMs to all VMs in VNET",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "VirtualNetwork",
              "destinationAddressPrefix": "VirtualNetwork",
              "access": "Allow",
              "priority": 65000,
              "direction": "Outbound"
            }
          },
          {
            "name": "AllowInternetOutBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Allow outbound traffic from all VMs to Internet",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "*",
              "destinationAddressPrefix": "Internet",
              "access": "Allow",
              "priority": 65001,
              "direction": "Outbound"
            }
          },
          {
            "name": "DenyAllOutBound",
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups//providers/Microsoft.Network/networkSecurityGroups//defaultSecurityRules/",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Deny all outbound traffic",
              "protocol": "*",
              "sourcePortRange": "*",
              "destinationPortRange": "*",
              "sourceAddressPrefix": "*",
              "destinationAddressPrefix": "*",
              "access": "Deny",
              "priority": 65500,
              "direction": "Outbound"
            }
          }
        ],
        "effectiveSecurityRules": [
          {
            "name": "DefaultOutboundDenyAll",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Deny",
            "priority": 65500,
            "direction": "Outbound"
          },
          {
            "name": "DefaultRule_AllowVnetOutBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "VirtualNetwork",
            "expandedSourceAddressPrefix": [
              "10.1.1.0/24",
              "168.63.129.16/32"
            ],
            "destinationAddressPrefix": "VirtualNetwork",
            "expandedDestinationAddressPrefix": [
              "10.1.1.0/24",
              "168.63.129.16/32"
            ],
            "access": "Allow",
            "priority": 65000,
            "direction": "Outbound"
          },
          {
            "name": "DefaultRule_AllowInternetOutBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "0.0.0.0/0",
            "destinationAddressPrefix": "Internet",
            "expandedDestinationAddressPrefix": [
              "32.0.0.0/3",
              "4.0.0.0/6",
              "2.0.0.0/7",
              "1.0.0.0/8",
              "12.0.0.0/6",
              "8.0.0.0/7",
              "11.0.0.0/8",
              "64.0.0.0/3",
              "112.0.0.0/5",
              "120.0.0.0/6",
              "124.0.0.0/7",
              "126.0.0.0/8",
              "128.0.0.0/3",
              "176.0.0.0/4",
              "160.0.0.0/5",
              "170.0.0.0/7",
              "168.0.0.0/8",
              "169.0.0.0/9",
              "169.128.0.0/10",
              "169.192.0.0/11",
              "169.224.0.0/12",
              "169.240.0.0/13",
              "169.248.0.0/14",
              "169.252.0.0/15",
              "169.255.0.0/16",
              "174.0.0.0/7",
              "173.0.0.0/8",
              "172.128.0.0/9",
              "172.64.0.0/10",
              "172.32.0.0/11",
              "172.0.0.0/12",
              "208.0.0.0/4",
              "200.0.0.0/5",
              "194.0.0.0/7",
              "193.0.0.0/8",
              "192.64.0.0/10",
              "192.32.0.0/11",
              "192.16.0.0/12",
              "192.8.0.0/13",
              "192.4.0.0/14",
              "192.2.0.0/15",
              "192.1.0.0/16",
              "192.0.128.0/17",
              "192.0.64.0/18",
              "192.0.32.0/19",
              "192.0.16.0/20",
              "192.0.8.0/21",
              "192.0.4.0/22",
              "192.0.0.0/23",
              "192.0.3.0/24",
              "192.192.0.0/10",
              "192.128.0.0/11",
              "192.176.0.0/12",
              "192.160.0.0/13",
              "192.172.0.0/14",
              "192.170.0.0/15",
              "192.169.0.0/16",
              "196.0.0.0/7",
              "199.0.0.0/8",
              "198.128.0.0/9",
              "198.64.0.0/10",
              "198.32.0.0/11",
              "198.0.0.0/12",
              "198.24.0.0/13",
              "198.20.0.0/14",
              "198.16.0.0/15",
              "104.0.0.0/5",
              "96.0.0.0/6",
              "102.0.0.0/7",
              "101.0.0.0/8",
              "100.128.0.0/9",
              "100.0.0.0/10",
              "16.0.0.0/5",
              "28.0.0.0/6",
              "26.0.0.0/7",
              "24.0.0.0/8"
            ],
            "access": "Allow",
            "priority": 65001,
            "direction": "Outbound"
          },
          {
            "name": "DefaultRule_DenyAllOutBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "0.0.0.0/0",
            "destinationAddressPrefix": "0.0.0.0/0",
            "access": "Deny",
            "priority": 65500,
            "direction": "Outbound"
          },
          {
            "name": "DefaultInboundDenyAll",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Deny",
            "priority": 65500,
            "direction": "Inbound"
          },
          {
            "name": "DefaultRule_AllowVnetInBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "VirtualNetwork",
            "expandedSourceAddressPrefix": [
              "10.1.1.0/24",
              "168.63.129.16/32"
            ],
            "destinationAddressPrefix": "VirtualNetwork",
            "expandedDestinationAddressPrefix": [
              "10.1.1.0/24",
              "168.63.129.16/32"
            ],
            "access": "Allow",
            "priority": 65000,
            "direction": "Inbound"
          },
          {
            "name": "DefaultRule_AllowAzureLoadBalancerInBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "AzureLoadBalancer",
            "expandedSourceAddressPrefix": [
              "168.63.129.16/32"
            ],
            "destinationAddressPrefix": "0.0.0.0/0",
            "access": "Allow",
            "priority": 65001,
            "direction": "Inbound"
          },
          {
            "name": "DefaultRule_DenyAllInBound",
            "protocol": "All",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "0-65535",
            "sourceAddressPrefix": "0.0.0.0/0",
            "destinationAddressPrefix": "0.0.0.0/0",
            "access": "Deny",
            "priority": 65500,
            "direction": "Inbound"
          },
          {
            "name": "UserRule_default-allow-rdp",
            "protocol": "Tcp",
            "sourcePortRange": "0-65535",
            "destinationPortRange": "3389-3389",
            "sourceAddressPrefix": "0.0.0.0/0",
            "destinationAddressPrefix": "0.0.0.0/0",
            "access": "Allow",
            "priority": 1000,
            "direction": "Inbound"
          }
        ]
      }
    }
  ]
}
```

|Element name |Type| Description|
|---|---|---|
|networkInterfaces| String |A list of network security group associations for each network interface in a VM|
|securityRuleAssociations| String |The network security group applied on the network interface resource represented by NetworkInterfaceId.|
|networkInterfaceAssocation| String| The network security group applied on the network interface resource represented by NetworkInterfaceId.|
|subnetAssociation |String |The network security group applied on the subnet resource associated to the network interface represented by NetworkInterfaceId.|
|defaultSecurityRules |String |The default security rules which are part of each Network Security Group.|
|effectiveSecurityRules| String| The effective security rules which get applied on the network interface resource represented by NetworkInterfaceId.|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Resource does not exist. |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 