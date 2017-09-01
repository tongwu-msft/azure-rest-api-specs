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

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).     
    
|Method|Request URI|    
|------------|-----------------|    
|POST|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/virtualMachines/{vmInstanceId}/{action}?api-version={apiVersion}`|    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| vmInstanceId | The instance identifier of the virtual machine. |
| action | The action that you want to perform on the virtual machine. Possible values are: start, restart, reimage, powerOff, or deallocate. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |       
    
## Response    

Status code: 200 (OK).