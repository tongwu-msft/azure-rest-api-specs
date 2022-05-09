---
title: "ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription v82"
description: "ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription v82"
ms.date: "01/28/2021"
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
# ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription v82

Describes the policy to be used for placement of a Service Fabric service allowing multiple stateless instances of a partition of the service to be placed on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DomainName`](#domainname) | string | No |

____
### `DomainName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Holdover from other policy descriptions, not used for this policy, values are ignored by runtime. Keeping it for any backwards-compatibility with clients.
