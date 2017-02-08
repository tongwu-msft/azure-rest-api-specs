---
title: "List available skus for VMs"
ms.custom: ""
ms.date: "2017-02-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-machines"
ms.suite: ""
ms.technology: 
  - "cloud-infrastructure-solution"
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: e4230275-3a47-4917-a6c3-5f38257c6796
caps.latest.revision: 8
ms.author: "davidmu"
manager: "timlt"
---
# List available skus for VMs
Lists the skus that are available for virtual machines in a virtual machine scale set.    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/skus?api-version={apiVersion}`|    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |   

## Response    

Status code: 200 (OK).    
    
```    
{    
  "value": [ {    
    "resourceType": "Microsoft.Compute/virtualMachineScaleSets"    
    "sku": {    
      "name": "Standard_A1",    
      "tier": "Standard"    
    },    
    "capacity": {    
      "minimum": 1,    
      "maximum": 100,    
      "default": 1,    
      "scaleType": "Automatic"    
    }    
  } ]    
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|resourceType|Specifies the type of resource.|    
|[sku](#sku)|Specifies the configuration settings of virtual machines in the scale set.|    
|[capacity](#capacity)|Specifies the number of virtual machines that can be in a scale set.|    
    
###  <a name="sku"></a> sku    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the size of virtual machines in the scale set.|    
|tier|Specifies the tier of virtual machines in scale set.<br /><br /> Possible Values:<br /><br /> **Standard**<br /><br /> **Basic**|    
    
###  <a name="capacity"></a> capacity    
    
|Element name|Description|    
|------------------|-----------------|    
|minimum|Specifies minimum number of virtual machines in the scale set.|    
|maximum|Specifies the maximum number of virtual machines that can be in the scale set based on the selected tier.|    
|default|Specifies the default number of virtual machines in the scale set.|    
|scaleType|Specifies the allowed scaling action for the scale set. The only supported value is **Automatic**.|