---
title: "Delete a virtual machine extension"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Delete a virtual machine extension    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| DELETE | `https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/virtualMachines/{vm-name}/extensions/{extension-name}?api-version={api-version}` |    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual machine is located. |
| resourceGroup | The name of the resource group that contains the virtual machine. |
| vm | The name of the virtual machine. |
| extension | The name of the extension to delete. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |

## Response    
 
Status code: If the validation is complete, the operation returns 202 (OK). If successful, the operation returns HTTP status code of 200 (OK). 200 (OK) is returned only after the virtual machine is de-provisioned including the resource extensions.