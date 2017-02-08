---
title: "List platform image publishers"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# List platform image publishers    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
    
| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/locations/{location}/publishers?api-version={apiVersion}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| location | The location where you want to create a virtual machine. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |
    
## Response    

Status code: If successful, 200 (OK); otherwise 404 (Not Found).    
    
```    
[
  {
    "location": "westus",
    "name": "PublisherA",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA"
  },
  {
    "location": "westus",
    "name": "PublisherB",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherB"
  },
  {
    "location": "westus",
    "name": "PublisherC",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherC"
  }
]
```    
    
| Element name | Description |    
|--------------|-------------|  
| location | The supported Azure location where the resource exists. |   
| name | The name of the publisher. |    
| id | The identifying URI of the publisher. |    