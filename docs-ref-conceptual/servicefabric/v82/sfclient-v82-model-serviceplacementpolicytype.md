---
title: "ServicePlacementPolicyType v82"
description: "ServicePlacementPolicyType v82"
ms.date: "10/21/2020"
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
# ServicePlacementPolicyType enum v82

type: string

The type of placement policy for a service fabric service. Following are the possible values.

Possible values are: 

  - `Invalid` - Indicates the type of the placement policy is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `InvalidDomain` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementInvalidDomainPolicyDescription, which indicates that a particular fault or upgrade domain cannot be used for placement of this service. The value is 1.
  - `RequireDomain` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementRequireDomainDistributionPolicyDescription indicating that the replicas of the service must be placed in a specific domain. The value is 2.
  - `PreferPrimaryDomain` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementPreferPrimaryDomainPolicyDescription, which indicates that if possible the Primary replica for the partitions of the service should be located in a particular domain as an optimization. The value is 3.
  - `RequireDomainDistribution` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementRequireDomainDistributionPolicyDescription, indicating that the system will disallow placement of any two replicas from the same partition in the same domain at any time. The value is 4.
  - `NonPartiallyPlaceService` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementNonPartiallyPlaceServicePolicyDescription, which indicates that if possible all replicas of a particular partition of the service should be placed atomically. The value is 5.
  - `AllowMultipleStatelessInstancesOnNode` - Indicates that the ServicePlacementPolicyDescription is of type ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription, which indicates that multiple stateless instances of a particular partition of the service can be placed on a node. The value is 6.

