---
title: "ServiceResource"
description: "Properties table includes Azure resource identifier, Azure resource name, Azure resource type, Azure resource location, and the ServiceResourceProperties." 
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ServiceResource

The service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [id](#id) | string | No |
| [name](#name) | string | No |
| [type](#type) | string | No |
| [location](#location) | string | No |
| [properties](#properties) | [ServiceResourceProperties](sfrp-2017-07-01-preview-model-serviceresourceproperties.md) | No |

____
### id
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource identifier.

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
__Required__: No<br/>
<br/>
Azure resource location.

____
### properties
__Type__: [ServiceResourceProperties](sfrp-2017-07-01-preview-model-serviceresourceproperties.md) <br/>
__Required__: No<br/>
<br/>
The service resource properties.
