---
title: "Delete a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Delete a virtual machine    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| DELETE | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}?api-version={apiVersion}` |    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the virtual machine. |
| vm | The name of the virtual machine to delete. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |
    
## Response

Status code: If the validation is complete, the operation returns 202 (OK). If successful, the operation returns HTTP status code of 200 (OK). If the resource's ETag doesn’t match one specified in If-Match header, 412 (Precondition Failed) is returned. If resource does not exist, 404 (NotFound) is returned. 200 (OK) is returned only after the virtual machine is de-provisioned including the resource extensions.