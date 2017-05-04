---
title: "StartNodeDescription"
ms.date: "2017-05-04"
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
# StartNodeDescription

Describes the parameter for starting a stopped Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeInstanceId](#nodeinstanceid) | string | Yes |

____
### NodeInstanceId
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 0 <br/>
<br/>
The instance id of the node that is stopped. If instance id is specified the node is started only if it matches with the current instance of the stopped node. A default value of "0" would match any instance id. The instance id can be obtained using get node query.
