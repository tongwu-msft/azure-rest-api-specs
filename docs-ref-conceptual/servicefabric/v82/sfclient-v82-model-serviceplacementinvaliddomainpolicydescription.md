---
title: "ServicePlacementInvalidDomainPolicyDescription v82"
description: "ServicePlacementInvalidDomainPolicyDescription v82"
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
# ServicePlacementInvalidDomainPolicyDescription v82

Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DomainName`](#domainname) | string | No |

____
### `DomainName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the domain that should not be used for placement.
