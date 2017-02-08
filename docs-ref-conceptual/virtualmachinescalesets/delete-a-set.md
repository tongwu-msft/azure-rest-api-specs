---
title: "Delete a set"
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
ms.assetid: 2dd42a67-d2eb-47a7-9840-5cde61a51cb5
caps.latest.revision: 8
ms.author: "davidmu"
manager: "timlt"
---
# Delete a set
Deletes a virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}?api-version={api-version}`|    
    
## Response    
 Status code: 200 (OK).    
    
## Remarks    
 The persistent disk blobs associated with the virtual machines are deleted when the scale set is deleted.