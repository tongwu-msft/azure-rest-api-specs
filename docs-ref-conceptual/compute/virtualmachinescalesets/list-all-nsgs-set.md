---
title: "List all VMs in a set"
ms.date: "2017-07-07"
ms.prod: "azure"
ms.assetid:
ms.author: "davidmu"
manager: "timlt"
---
# List all NSGs in a set
Retrieves information about the instance view of all network security groups in the specified virtual machine scale set.    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).  
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/VirtualMachineScaleSets/{vmScaleSet}/networkSecurityGroups?api-version={apiVersion}`| 

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2017-03-30|   
    
## Response    
Status code: 200 (OK).    
    
```    
{
  "value": [
    {
      "name": "nsg1",
      "id": "/subscriptions/366db6b2-be71-49ce-84b3-84a26f93b59f/resourceGroups/VMSSnsgTest/providers/Microsoft.Network/networkSecurityGroups/nsg1",
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
      "type": "Microsoft.Network/networkSecurityGroups",
      "location": "southeastasia",
      "properties": {
        "provisioningState": "Succeeded",
        "resourceGuid": "8edbd186-101f-448a-914f-9605f9e0bb04",
        "securityRules": [
          {
            "name": "ssh",
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/securityRules/ssh",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
            "properties": {
              "provisioningState": "Succeeded",
              "description": "Allow SSH",
              "protocol": "Tcp",
              "sourcePortRange": "*",
              "destinationPortRange": "22",
              "sourceAddressPrefix": "*",
              "destinationAddressPrefix": "*",
              "access": "Allow",
              "priority": 201,
              "direction": "Inbound"
            }
          },
        ],
        "defaultSecurityRules": [
          {
            "name": "AllowVnetInBound",
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/AllowVnetInBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\",
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
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/AllowAzureLoadBalancerInBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\",
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
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/DenyAllInBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
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
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/AllowVnetOutBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
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
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/AllowInternetOutBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
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
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/networkSecurityGroups/nsg1/defaultSecurityRules/DenyAllOutBound",
            "etag": "W/\"00000000-0000-0000-0000-000000000000\\"",
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
        "networkInterfaces": [
          {
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/vmss1/virtualMachines/1/networkInterfaces/mynic1"
          }
        ]
      }
    }
  ]
}
    
```    
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Network Security Group.|  
|id|The identifying URL of the Network Security Group.|  
|location|Specifies the supported Azure location of the Network Security Group. For more information, see List all of the available geo-locations.|  
|tags|The tags and their values that are used by the Network Security Group.|  
|etag|System generated meta-data enabling concurrency control.|  
|provisioningState|Provisioning state of the Network Security Group.|  
|[securityRules](#securityRules)|A collection of Network Security Rules within this Network Security Group.|  
|networkInterfaces|A collection of references to Network Interface Cards that reference this Network Security Group.|      
###  <a name="ecurityRules"></a> ecurityRules  
    
|Element name|Description|    
|------------------|-----------------|
|name| Specifies the name of the Network Security Rule|    
|defaultSecurityRules|A collection of Default Network Security Rules within this Network Security Group.|  