---
title: "Get current compute usage information"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Get current compute usage information  
    
## Request  
  
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/locations/{location}/usages?api-version={apiVersion}` |    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| location | The location where you want to create a virtual machine. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |

## Response    
 
If successful, the operation returns HTTP status code of 200 (OK). 

```        
{
  "value": [
    {
      "unit": "Count",
      "currentValue": 1,
      "limit": 2000,
      "name": {
        "value": "availabilitySets",
        "localizedValue": "Availability Sets"
      }
    },
    {
      "unit": "Count",
      "currentValue": 5,
      "limit": 20,
      "name": {
        "value": "cores",
        "localizedValue": "Total Regional Cores"
      }
    },
    {
      "unit": "Count",
      "currentValue": 2,
      "limit": 10000,
      "name": {
        "value": "virtualMachines",
        "localizedValue": "Virtual Machines"
      }
    },
    {
      "unit": "Count",
      "currentValue": 0,
      "limit": 200,
      "name": {
        "value": "virtualMachineScaleSets",
        "localizedValue": "Virtual Machine Scale Sets"
      }
    },
    {
      "unit": "Count",
      "currentValue": 0,
      "limit": 20,
      "name": {
        "value": "standardFFamily",
        "localizedValue": "Standard F Family Cores"
      }
    },
    {
      "unit": "Count",
      "currentValue": 5,
      "limit": 20,
      "name": {
        "value": "standardFSFamily",
        "localizedValue": "Standard FS Family Cores"
      }
    }
  ]
}  
```    
    
| Element name | Description |    
|--------------|-------------|    
| name.value | The name of the resource. |    
| name.localizedValue | The localized name of the resource. |    
| currentValue | The current usage of the resource. |    
| limit | The maximum permitted usage of the resource. |    
| unit | Count. |    