---
title: "List availability sets in a resource group"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# List availability sets in a resource group
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/availabilitySets?api-version={apiVersion}` |    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the availability set is located. |
| resourceGroup | The name of the resource group that contains the availability set. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 

## Response    
 
Status code: If successful,  200 (OK); otherwise 404 (Not Found).    
    
```    
{    
   "value": [ {    
       "id":"/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Compute/availabilitySets/myAVSet",    
       "name":"myAVSet",    
       "type":"Microsoft.Compute/availabilitySets",    
       "location":"westus",    
       "tags": {},    
       "properties": {    
          "platformUpdateDomainCount":5,    
          "platformFaultDomainCount":3,    
          "virtualMachines":[]    
       }    
    } ]    
}    
```    
    
| Element name | Description |    
|--------------|-------------|    
| id | Specifies the identifying URI of the availability set. |    
| name | Specifies the name of the availability set. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. |    
| tags | Specifies tags associated with the availability set. |    
| platformUpdateDomain | Specifies the update domain count of availability set. |    
| platformFaultDomain | Specifies the fault domain count of availability set. |    
| virtualmachines | Lists virtual machines in the availability set. |