---
title: "List platform image versions"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# List platform image versions    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
   
| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/locations/{location}/publishers/{publisher}/artifacttypes/vmimage/offers/{offer}/skus/{sku}/versions?apiVersion={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| location | The location where you want to create a virtual machine. |
| publisher | The publisher of the platform image. To get a list of publishers, see [List platform image publishers](platformimages-list-publishers.md). |
| offer | The offer from the publisher. To get a list of publisher offers, see [List platform image publisher offers](platformimages-list-publisher-offers.md) |
| sku | The sku of the publisher's offer. To get a list of available skus, see [List platform image skus](platformimages-list-publisher-offer-skus.md).
| apiVersion | The version of the API to use. The current version is 2017-03-30. |
    
## Response    

Status code: If successful, 200 (OK); otherwise 404 (Not Found).    
    
```    
[
  {
    "location": "westus",
    "name": "4.0.20160617",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuA/Versions/4.0.20160617"
  },
  {
    "location": "westus",
    "name": "4.0.20160721",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuA/Versions/4.0.20160721"
  },
  {
    "location": "westus",
    "name": "4.0.20160812",
    "id": "/Subscriptions/{subscription-id}/Providers/Microsoft.Compute/Locations/westus/Publishers/PublisherA/ArtifactTypes/VMImage/Offers/OfferA/Skus/SkuA/Versions/4.0.20160812"
  }
]
```    
    
| Element name | Description |    
|--------------|-------------|  
| location | The supported Azure location where the resource exists. |   
| name | The image version. |    
| id | The identifying URI of the image version. |    