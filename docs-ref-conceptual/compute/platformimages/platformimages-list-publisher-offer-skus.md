---
title: "List platform image skus"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# List platform image skus    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
  
| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/locations/{location}/publishers/{publisher}/artifacttypes/vmimage/offers/{offer}/skus?api-version={apiVersion}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| location | The location where you want to create a virtual machine. |
| publisher | The publisher of the platform image. To get a list of publishers, see [List platform image publishers](list-platform-image-publishers.md). |
| offer | The offer from the publisher. To get a list of publisher offers, see [List platform image publisher offers](list-platform-image-publisher-offers.md) |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |
    
## Response    
 
Status code: If successful,  200 (OK); otherwise 404 (Not Found).    
    
```    
[
  {
    "location": "westus",
    "name": "SkuA",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuA"
  },
  {
    "location": "westus",
    "name": "SkuB",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuB"
  },
  {
    "location": "westus",
    "name": "SkuC",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuC"
  }
]
```    
    
| Element name | Description |    
|------------------|-----------------|  
| location | The supported Azure location where the resource exists. |   
| name | The name of the sku. |    
| id | The identifying URI of the sku. |    