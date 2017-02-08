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
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/skus?api-version={api-version}|    
    
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
|name|Specifies the size of virtual machines in the scale set. For more information about sizes, see [Sizes for virtual machines](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-size-specs/).|    
|tier|Specifies the tier of virtual machines in scale set.<br /><br /> Possible Values:<br /><br /> **Standard**<br /><br /> **Basic**|    
    
###  <a name="capacity"></a> capacity    
    
|Element name|Description|    
|------------------|-----------------|    
|minimum|Specifies minimum number of virtual machines in the scale set.|    
|maximum|Specifies the maximum number of virtual machines that can be in the scale set based on the selected tier.|    
|default|Specifies the default number of virtual machines in the scale set.|    
|scaleType|Specifies the allowed scaling action for the scale set. The only supported value is **Automatic**.|