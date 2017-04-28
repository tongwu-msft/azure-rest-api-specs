---
title: "ServicePlacementPreferPrimaryDomainPolicyDescription"
ms.date: "2017-04-27"
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
# ServicePlacementPreferPrimaryDomainPolicyDescription

Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.

This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service�s primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Type](#type) | string | Yes |
| [DomainName](#domainname) | string | No |

____
### Type
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'PreferPrimaryDomain' for objects of type 'ServicePlacementPreferPrimaryDomainPolicyDescription'.

____
### DomainName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the domain that should used for placement as per this policy.
