---
title: "Save an image of a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Save an image of a virtual machine    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).  

| Method | Request URI |    
|--------|-------------|    
| POST | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/capture?api-version={apiVersion}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the virtual machine. |
| vm | The name of the virtual machine from which you want to save an image. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |   
    
```    
{    
   "vhdPrefix":"pslib",    
   "destinationContainerName":"dest",    
   "overwriteVhds":true    
}    
```    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| vhdPrefix | Yes | String | Specifies the prefix in the name of the blobs that will constitute the storage profile of the image. |    
| destinationContainerName | Yes | String | Specifies the name of the container inside which the vhds constituting the image will reside. |    
| overwriteVhds | Yes | String | Specifies if an existing vhd with same prefix inside the destination container is overwritten. |    
    
## Response    

Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) will be returned.