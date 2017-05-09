---
title: "ServicePlacementPolicyDescription"
ms.date: "2017-05-09"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# ServicePlacementPolicyDescription

Describes the policy to be used for placement of a Service Fabric service.
# Inheritance

The type 'ServicePlacementPolicyDescription' is a base type of the polymorphic type model with property 'Type' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Type | Derived Type |
| --- | --- | 
| InvalidDomain | [ServicePlacementInvalidDomainPolicyDescription](sfclient-model-serviceplacementinvaliddomainpolicydescription.md) |
| NonPartiallyPlaceService | [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) |
| PreferPrimaryDomain | [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-model-serviceplacementpreferprimarydomainpolicydescription.md) |
| RequireDomain | [ServicePlacementRequiredDomainPolicyDescription](sfclient-model-serviceplacementrequireddomainpolicydescription.md) |
| RequireDomainDistribution | [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-model-serviceplacementrequiredomaindistributionpolicydescription.md) |

