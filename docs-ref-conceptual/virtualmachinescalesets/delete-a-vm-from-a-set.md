---
title: "Delete a VM from a set"
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
ms.assetid: ce091925-6a57-4121-b15f-513256909737
caps.latest.revision: 9
ms.author: "davidmu"
manager: "timlt"
---
# Delete a VM from a set
Deletes a virtual machine from a virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|DELETE|https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/virtualMachines/{vm-instance-id}?api-version={api-version}|    
    
 Replace {vm-instance-id} with the identifier of the virtual machine instance that you want to delete.    
    
### Response    
 Status code: 200 (OK).    
    
### Remarks    
 The capacity is reduced by one in the virtual machine scale set when this operation successfully finishes. The persistent disk blob associated with the virtual machine is also deleted.    
    
 If you need to delete multiple virtual machines at the same time, see [Manage all VMs in a set](../VirtualMachineScaleSetsREST/manage-all-vms-in-a-set.md).