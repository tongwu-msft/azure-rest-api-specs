---
title: "NodeTransitionResult"
ms.date: "2017-05-06"
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
# NodeTransitionResult

Represents information about an operation in a terminal state (Completed or Faulted).

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ErrorCode](#errorcode) | integer (int32) | No |
| [NodeResult](#noderesult) | [NodeResult](sfclient-model-noderesult.md) | No |

____
### ErrorCode
__Type__: integer (int32) <br/>
__Required__: No<br/>
<br/>
If OperationState is Completed, this is 0.  If OperationState is Faulted, this is an error code indicating the reason.

____
### NodeResult
__Type__: [NodeResult](sfclient-model-noderesult.md) <br/>
__Required__: No<br/>
<br/>
Contains information about a node that was targeted by a user-induced operation.
