---
title: "Get information about an availability set"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Get information about an availability set    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|------------|-----------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/availabilitySets/{availabilitySet}?api-version={apiVersion}` |    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the availability set is located. |
| resourceGroup | The name of the resource group that contains the availability set. |
| availabilitySet | The name of the availability set to get information about. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |     
    
## Response    
    
Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) will be returned.    
    
```    
{  
  "id": "/subscriptions/{subscription-id}/resourceGroups/contosorg/providers/Microsoft.Compute/availabilitySets/myAVSet",
  "name": "myAVSet",
  "type": "Microsoft.Compute/availabilitySets",
  "location": "centralus",
  "tags": {
    "group": "finance"
  },
  "properties": {
    "platformUpdateDomainCount": 5,
    "platformFaultDomainCount": 3
  }
    
```    
    
| Element name | Description |    
|--------------|-------------|    
| id | Specifies the identifying URL of the availability set. |    
| name | Specifies the name of the availability set. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. For more information, see [List all of the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |    
| platformUpdateDomainCount | Specifies the update domain count of availability set. |    
| platformFaultDomainCount | Specifies the fault domain count of availability set. |    
| virtualmachines | Lists virtual machines in the availability set. |