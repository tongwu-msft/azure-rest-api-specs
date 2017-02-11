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
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{nicName}",
          "securityRules": [
            {
              "name": "default-allow-rdp",
              "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/{nsgName}/securityRules/default-allow-rdp",
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
            "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/{nsgName}/defaultSecurityRules/",
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
          ...
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
          ...
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
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 