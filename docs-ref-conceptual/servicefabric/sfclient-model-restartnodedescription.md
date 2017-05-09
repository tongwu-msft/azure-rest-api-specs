---
title: "RestartNodeDescription"
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
# RestartNodeDescription

Describes the parameters to restart a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeInstanceId](#nodeinstanceid) | string | Yes |
| [CreateFabricDump](#createfabricdump) | string (enum) | No |

____
### NodeInstanceId
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 0 <br/>
<br/>
The instance id of the target node. If instance id is specified the node is restarted only if it matches with the current instance of the node. A default value of "0" would match any instance id. The instance id can be obtained using get node query.

____
### CreateFabricDump
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: False <br/>
<br/>
Specify True to create a dump of the fabric node process. This is case sensitive.
