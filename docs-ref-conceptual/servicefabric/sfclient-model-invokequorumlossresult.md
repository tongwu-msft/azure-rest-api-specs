---
title: "InvokeQuorumLossResult"
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
# InvokeQuorumLossResult

Represents information about an operation in a terminal state (Completed or Faulted).

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ErrorCode](#errorcode) | integer (int32) | No |
| [SelectedPartition](#selectedpartition) | [SelectedPartition](sfclient-model-selectedpartition.md) | No |

____
### ErrorCode
__Type__: integer (int32) <br/>
__Required__: No<br/>
<br/>
If OperationState is Completed, this is 0.  If OperationState is Faulted, this is an error code indicating the reason.

____
### SelectedPartition
__Type__: [SelectedPartition](sfclient-model-selectedpartition.md) <br/>
__Required__: No<br/>
<br/>
This class returns information about the partition that the user-induced operation acted upon.
