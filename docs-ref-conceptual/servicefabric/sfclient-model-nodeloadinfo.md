---
title: "NodeLoadInfo"
ms.date: "2017-05-08"
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
# NodeLoadInfo

Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeName](#nodename) | string | No |
| [NodeLoadMetricInformation](#nodeloadmetricinformation) | array of [NodeLoadMetricInformation](sfclient-model-nodeloadmetricinformation.md) | No |

____
### NodeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the node for which the load information is provided by this object.

____
### NodeLoadMetricInformation
__Type__: array of [NodeLoadMetricInformation](sfclient-model-nodeloadmetricinformation.md) <br/>
__Required__: No<br/>
<br/>
List that contains metrics and their load information on this node.
