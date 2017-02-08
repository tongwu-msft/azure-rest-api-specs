---
title: "Manage all VMs in a set"
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
ms.assetid: ac0df24f-4021-4105-94ee-f9e27f6cc659
caps.latest.revision: 17
ms.author: "davidmu"
manager: "timlt"
---
# Manage all VMs in a set
Manage the virtual machines in a Virtual Machine Scale Set. You can use this task to start, restart, stop, delete, or upgrade a virtual machine in the scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|POST|`https://management.azure.com/subscriptions/{subscription}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/{action}?api-version={api-version}`|    
    
 Replace {action} with one of the following actions that you want to happen on the specified virtual machines:    
    
-   start    
    
-   restart    
    
-   powerOff    
    
-   deallocate    
    
-   delete    
    
-   manualUpgrade    
    
-   reimage    
    
```    
{    
  "instanceIds" : [ "0","1","2","3"... ]     
}    
    
```    
    
 You can also use an asterisk (*) to apply the action to all virtual machines in the scale set.    
    
```    
{    
  "instanceIds" : [ "*" ]     
}    
```    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|instanceIds|No|Collection|Specifies a list of instance identifiers for the virtual machines on which the action should be performed. You must provide at least one identifier. To find the identifier of a virtual machine, see [List all VMs in a set](../VirtualMachineScaleSetsREST/list-all-vms-in-a-set.md).|    
    
## Response    
 Status code: 200 (OK).    
    
## Remarks    
 If you are deleting a virtual machine, the persistent disk blobs associated with the machine are also deleted.    
    
 If you use the asterisk (*) with the delete action and change the capacity to 0, autoscale will not function.