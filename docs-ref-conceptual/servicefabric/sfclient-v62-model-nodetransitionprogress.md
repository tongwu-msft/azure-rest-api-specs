---
title: "NodeTransitionProgress"
ms.date: "2018-04-23"
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
# NodeTransitionProgress

Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState
is Completed or Faulted.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`State`](#state) | string (enum) | No |
| [`NodeTransitionResult`](#nodetransitionresult) | [NodeTransitionResult](sfclient-v62-model-nodetransitionresult.md) | No |

____
### `State`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The state of the operation.

Possible values are: 

  - `Invalid` - The operation state is invalid.
  - `Running` - The operation is in progress.
  - `RollingBack` - The operation is rolling back internal system state because it encountered a fatal error or was cancelled by the user.  "RollingBack"     does not refer to user state.  For example, if CancelOperation is called on a command of type PartitionDataLoss, state of "RollingBack" does not mean service data is being restored (assuming the command has progressed far enough to cause data loss). It means the system is rolling back/cleaning up internal system state associated with the command.
  - `Completed` - The operation has completed successfully and is no longer running.
  - `Faulted` - The operation has failed and is no longer running.
  - `Cancelled` - The operation was cancelled by the user using CancelOperation, and is no longer running.
  - `ForceCancelled` - The operation was cancelled by the user using CancelOperation, with the force parameter set to true.  It is no longer running.  Refer to CancelOperation for more details.



____
### `NodeTransitionResult`
__Type__: [NodeTransitionResult](sfclient-v62-model-nodetransitionresult.md) <br/>
__Required__: No<br/>
<br/>
Represents information about an operation in a terminal state (Completed or Faulted).
