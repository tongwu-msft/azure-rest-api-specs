---
title: "ServicePlacementRequireDomainDistributionPolicyDescription"
ms.date: "2017-04-29"
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
# ServicePlacementRequireDomainDistributionPolicyDescription

Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.

While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.


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
A discriminator property. Its value must be 'RequireDomainDistribution' for objects of type 'ServicePlacementRequireDomainDistributionPolicyDescription'.

____
### DomainName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the domain that should used for placement as per this policy.
