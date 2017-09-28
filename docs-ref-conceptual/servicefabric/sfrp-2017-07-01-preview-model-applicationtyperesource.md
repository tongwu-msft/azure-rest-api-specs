---
title: "ApplicationTypeResource"
ms.date: "2017-09-27"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ApplicationTypeResource

The application type name resource

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [id](#id) | string | No |
| [name](#name) | string | No |
| [type](#type) | string | No |
| [location](#location) | string | Yes |
| [properties](#properties) | [ApplicationTypeProperties](sfrp-2017-07-01-preview-model-applicationtypeproperties.md) | No |

____
### id
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource ID.

____
### name
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource name.

____
### type
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource type.

____
### location
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Resource location.

____
### properties
__Type__: [ApplicationTypeProperties](sfrp-2017-07-01-preview-model-applicationtypeproperties.md) <br/>
__Required__: No<br/>
<br/>
The application type name properties
