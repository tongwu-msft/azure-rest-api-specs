---
title: "List the availability sets in a subscription"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# List the availability sets in a subscription    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).   

| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.Compute/availabilitySets?api-version={api-version}` |    
    
## Response

Status code: If successful,  200 (OK); otherwise 404 (Not Found).    
    
```    
{    
   "value": [ {    
       "id":"/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Compute/availabilitySets/myAVSet1",    
       "name":"myAVSet",    
       "type":"Microsoft.Compute/availabilitySets",    
       "location":"westus",    
       "tags": {},    
       "properties": {    
          "platformUpdateDomainCount":5,    
          "platformFaultDomainCount":3 
       }    
    },
    {
       "id":"/subscriptions/{subscription-id}/resourceGroups/myrg2/providers/Microsoft.Compute/availabilitySets/myAVSet2",    
       "name":"myAVSet2",    
       "type":"Microsoft.Compute/availabilitySets",    
       "location":"westus",    
       "tags": {},    
       "properties": {    
          "platformUpdateDomainCount":4,    
          "platformFaultDomainCount":2
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
| platformUpdateDomain | Specifies the update domain count of the availability set. |    
| platformFaultDomain | Specifies the fault domain count of the availability set. |    