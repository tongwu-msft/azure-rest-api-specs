---
title: "Delete an availability set"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Delete an availability set    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| DELETE | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/availabilitySets/{availabilitySet}?api-version={apiVersion}` |    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the availability set is located. |
| resourceGroup | The name of the resource group that contains the availability set. |
| availabilitySet | The name of the availability set to delete. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |    
    
## Response    
    
Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) will be returned.