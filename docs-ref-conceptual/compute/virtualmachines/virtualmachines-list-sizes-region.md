---
title: "Lists available virtual machine sizes for a subscription"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Lists available virtual machine sizes for a subscription    
    
## Request    
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/locations/{location}/vmSizes?api-version={apiVersion}` |   

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| location | The location of the virtual machine. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 
    
## Response    
 
Status code: If successful, the operation returns 200 (OK); otherwise 502 (Bad Gateway) is returned.    
    
```    
{    
  "value": [    
    {    
      "name": "Standard_A0",    
      "numberOfCores": 1,    
      "osDiskSizeInMB": 130048,    
      "resourceDiskSizeInMB": 20480,    
      "memoryInMB": 768,    
      "maxDataDiskCount": 1    
    },    
    {    
      "name": "Standard_A1",    
      "numberOfCores": 1,    
      "osDiskSizeInMB": 130048,    
      "resourceDiskSizeInMB": 71680,    
      "memoryInMB": 1792,    
      "maxDataDiskCount": 2    
    },    
    {    
      "name": "Standard_A2",    
      "numberOfCores": 2,    
      "osDiskSizeInMB": 130048,    
      "resourceDiskSizeInMB": 138240,    
      "memoryInMB": 3584,    
      "maxDataDiskCount": 4    
    },    
    {    
      "name": "Standard_A3",    
      "numberOfCores": 4,    
      "osDiskSizeInMB": 130048,    
      "resourceDiskSizeInMB": 291840,    
      "memoryInMB": 7168,    
      "maxDataDiskCount": 8    
    },    
    {    
      "name": "Standard_DS13",    
      "numberOfCores": 8,    
      "osDiskSizeInMB": 1047552,    
      "resourceDiskSizeInMB": 114688,    
      "memoryInMB": 57344,    
      "maxDataDiskCount": 16    
    },    
    {    
      "name": "Standard_DS14",    
      "numberOfCores": 16,    
      "osDiskSizeInMB": 1047552,    
      "resourceDiskSizeInMB": 229376,    
      "memoryInMB": 114688,    
      "maxDataDiskCount": 32    
    }    
  ]    
}    
```    
    
| Element name | Description |    
|--------------|-------------|    
| name | Specifies the name of the virtual machine size. |    
| numberOfCores | Specifies the number of available CPU cores. |    
| osDiskSizeInMB | Specifies the size in MB of the operating system disk. |    
| resourceDiskSizeInMB | Specifies the size in MB of the temporary or resource disk. |    
| memoryInMB | Specifies the available RAM in MB. |    
| maxDataDiskCount | Specifies the maximum number of data disks that can be attached to the VM size. |