---
title: "List all Public IPs in a scale set"
ms.custom: ""
ms.date: "2017-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-machines"
ms.suite: ""
ms.technology: 
  - "cloud-infrastructure-solution"
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: 474f2936-0939-46ab-a78e-57a93fd48d2c
caps.latest.revision: 5
ms.author: "anavin"
manager: "narayan"
---
# List all public IPs in a scale set
Retrieves information about all public IPs that are used by each virtual machine in the specified virtual machine scale set.    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).   
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/publicip/publicipaddresses?api-version={api-version}`|   

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 
    
## Response    

Status code: 200 (OK).    
    
```    
    
{    
  "value": [ {    
    "name": "publicip1",    
    "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/publicip/virtualMachines/0/networkInterfaces/publicIPAddresses/publicip1",    
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"",    
    "type": Microsoft.Network/networkInterfaces",    
    "tags": {     
      "key": "value"     
    },    
    "properties": {     
      "provisioningState": "Succeeded",    
      "resourceGuid": "XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXX", 
      "publicIPAddressVersion": "IPv4",
        "publicIPAllocationMethod": "Dynamic",
        "idleTimeoutInMinutes": 15,   
      "ipConfiguration": [ {        
        "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/publicip/virtualmachines/0/networkInterfaces/mynetworkinterface/ipConfigurations/myip1",    
  "etag": "W/\"00000000-0000-0000-0000-000000000000\"", 
      }
    }
  },   
    }    
      ] }   
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the network interface configuration.|    
|id|Specifies the identifier of the network interface configuration.|    
|tags|Specifies the tags that are assigned to the network interface configuration.|    
|provisioningState|Specifies the provisioning state of the network interface configuration.<br /><br /> Possible values are:<br /><br /> **Deleting**<br /><br /> **Failed**<br /><br /> **Succeeded**<br /><br /> **Updating**|    
|resourceGuid|Specifies a unique identifier of the network interface instance.|
|publicIPAddressVersion|Specifies version of IP address.|   
|[ipConfiguration](#ipConfiguration)|Specifies the IP configurations for the network interface configuration.|    
    
###  <a name="ipConfiguration"></a> ipConfigurations    
    
|Element name|Description|    
|------------------|-----------------|       
|id|Specifies the identifier of the IP configuration.|    
