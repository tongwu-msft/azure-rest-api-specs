---
title: "ServicePlacementRequiredDomainPolicyDescription"
ms.date: "2017-05-06"
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
# ServicePlacementRequiredDomainPolicyDescription

Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain

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
A discriminator property. Its value must be 'RequireDomain' for objects of type 'ServicePlacementRequiredDomainPolicyDescription'.

____
### DomainName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the domain that should used for placement as per this policy.
