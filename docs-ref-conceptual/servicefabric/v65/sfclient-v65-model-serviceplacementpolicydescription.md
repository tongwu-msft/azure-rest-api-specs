---
title: "ServicePlacementPolicyDescription"
ms.date: 06/12/2019
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
## Inheritance

'ServicePlacementPolicyDescription' is the base type of the polymorphic type model. The 'Type' property is the discriminator for the derived types. 
The value of the 'Type' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Type | Derived Type |
| --- | --- | 
| InvalidDomain | [ServicePlacementInvalidDomainPolicyDescription](sfclient-v65-model-serviceplacementinvaliddomainpolicydescription.md) |
| NonPartiallyPlaceService | [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v65-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) |
| PreferPrimaryDomain | [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v65-model-serviceplacementpreferprimarydomainpolicydescription.md) |
| RequireDomain | [ServicePlacementRequiredDomainPolicyDescription](sfclient-v65-model-serviceplacementrequireddomainpolicydescription.md) |
| RequireDomainDistribution | [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v65-model-serviceplacementrequiredomaindistributionpolicydescription.md) |

