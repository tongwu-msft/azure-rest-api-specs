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

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md). 

|Method|Request URI|    
|------------|-----------------|    
|DELETE|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-ScaleSet}?api-version={apiVersion}`|    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |

## Response    

Status code: 200 (OK).    
    
## Remarks    

The persistent disk blobs associated with the virtual machines are deleted when the scale set is deleted.