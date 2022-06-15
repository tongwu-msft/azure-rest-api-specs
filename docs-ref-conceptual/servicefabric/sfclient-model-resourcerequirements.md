---
title: Container and Service Resource Requirements
description: "ResourceRequirements"
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
# Container and Service Resource Requirements

This type describes the resource requirements for a container or a service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`requests`](#requests) | [ResourceRequests](sfclient-model-resourcerequests.md) | Yes |
| [`limits`](#limits) | [ResourceLimits](sfclient-model-resourcelimits.md) | No |

____
### `requests`
__Type__: [ResourceRequests](sfclient-model-resourcerequests.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the requested resources for a given container.

____
### `limits`
__Type__: [ResourceLimits](sfclient-model-resourcelimits.md) <br/>
__Required__: No<br/>
<br/>
Describes the maximum limits on the resources for a given container.
