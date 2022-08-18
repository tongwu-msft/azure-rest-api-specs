---
title: "ResourceRequirements v82"
description: "ResourceRequirements v82"
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
# ResourceRequirements v82

This type describes the resource requirements for a container or a service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`requests`](#requests) | [ResourceRequests](sfclient-v82-model-resourcerequests.md) | Yes |
| [`limits`](#limits) | [ResourceLimits](sfclient-v82-model-resourcelimits.md) | No |

____
### `requests`
__Type__: [ResourceRequests](sfclient-v82-model-resourcerequests.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the requested resources for a given container.

____
### `limits`
__Type__: [ResourceLimits](sfclient-v82-model-resourcelimits.md) <br/>
__Required__: No<br/>
<br/>
Describes the maximum limits on the resources for a given container.
