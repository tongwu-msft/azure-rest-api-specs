---
title: "NodeLoadMetricInformation"
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
# NodeLoadMetricInformation

Represents data structure that contains load information for a certain metric on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [NodeCapacity](#nodecapacity) | string (int64) | No |
| [NodeLoad](#nodeload) | string (int64) | No |
| [NodeRemainingCapacity](#noderemainingcapacity) | string (int64) | No |
| [IsCapacityViolation](#iscapacityviolation) | boolean | No |
| [NodeBufferedCapacity](#nodebufferedcapacity) | string (int64) | No |
| [NodeRemainingBufferedCapacity](#noderemainingbufferedcapacity) | string (int64) | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the metric for which this load information is provided.

____
### NodeCapacity
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Total capacity on the node for this metric.

____
### NodeLoad
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Current load on the node for this metric.

____
### NodeRemainingCapacity
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The remaining capacity on the node for this metric.

____
### IsCapacityViolation
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if there is a capacity violation for this metric on the node.

____
### NodeBufferedCapacity
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The value that indicates the reserved capacity for this metric on the node.

____
### NodeRemainingBufferedCapacity
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The remaining reserved capacity for this metric on the node.
