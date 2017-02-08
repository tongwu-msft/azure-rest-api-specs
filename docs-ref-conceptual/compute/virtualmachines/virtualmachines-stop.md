---
title: "Stop a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Stop a virtual machine    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md). 

| Method | Request URI |    
|--------|-------------|    
| POST | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/powerOff?api-version={apiVersion}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the virtual machine. |
| vm | The name of the virtual machine to stop. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |   
    
## Response    
 
Status code: If successful, the operation returns HTTP status code of 200 (OK).    
    
## Remarks    
 
This operation only stops the virtual machine. The virtual machine can be restarted with the same provisioned resources. You are still charged for this virtual machine. If you want to stop a machine and not be charged for it, use [Stop and deallocate a VM](stop-and-deallocate-a-vm.md).