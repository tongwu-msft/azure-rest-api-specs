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

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
|Method|Request URI|    
|------------|-----------------|    
|DELETE|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/virtualMachines/{vmInstanceId}?api-version={apiVersion}|    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| vmInstanceId | The instance identifier of the virtual machine to delete. | 
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |    
    
### Response    
 
Status code: 200 (OK).    
    
### Remarks    

The capacity is reduced by one in the virtual machine scale set when this operation successfully finishes. The persistent disk blob associated with the virtual machine is also deleted.    
    
If you need to delete multiple virtual machines at the same time, see [Manage all VMs in a set](manage-all-vms-in-a-set.md).