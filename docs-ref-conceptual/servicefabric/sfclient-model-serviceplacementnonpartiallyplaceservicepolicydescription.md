---
title: "ServicePlacementNonPartiallyPlaceServicePolicyDescription"
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
# ServicePlacementNonPartiallyPlaceServicePolicyDescription

Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Type](#type) | string | Yes |

____
### Type
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'NonPartiallyPlaceService' for objects of type 'ServicePlacementNonPartiallyPlaceServicePolicyDescription'.
