---
title: "Generalize a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Generalize a virtual machine

This API is used to mark a Virtual Machine as generalized in Azure. You need to still run sysprep on the machine before calling this API. This is a required operation before calling the [Save an image from a VM](../virtual-machines/save-an-image-from-a-vm.md). 
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).       
    
| Method | Request URI |    
|--------|-------------|    
| POST | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/generalize?api-version={apiVersion}` |   

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the virtual machine. |
| vm | The name of the virtual machine to mark as generalized. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 
    
## Response    
 
Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) will be returned.