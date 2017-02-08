---
title: "Manage a VM"
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
ms.assetid: 5eedb082-76d7-4f01-a468-24085e959f41
caps.latest.revision: 9
ms.author: "davidmu"
manager: "timlt"
---
# Manage a VM
Perform management tasks on virtual machine instances in the specified virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|POST|`https://management.azure.com/subscriptions/{subscription}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/virtualMachines/{vm-instance-id}/{action}?api-version={api-version}`|    
    
 Replace {vm-instance-id} with the identifier of the virtual machine instance. Replace {action} with one of the following actions that you want to happen on the specified virtual machines:    
    
-   start    
    
-   restart    
    
-   powerOff    
    
-   deallocate    
    
## Response    
 Status code: 200 (OK).