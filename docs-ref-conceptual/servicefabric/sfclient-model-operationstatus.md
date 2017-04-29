---
title: "OperationStatus"
ms.date: "2017-04-29"
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
# OperationStatus

Contains the OperationId, OperationState, and OperationType for user-induced operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [OperationId](#operationid) | string (uuid) | No |
| [State](#state) | string (enum) | No |
| [Type](#type) | string (enum) | No |

____
### OperationId
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
A GUID that identifies a call to this API.  This is also passed into the corresponding GetProgress API.

____
### State
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
- Invalid - The operation state is invalid.
- Running - The operation is in progress.
- RollingBack -  The operation is rolling back internal system state because it encountered a fatal error or was cancelled by the user.  "RollingBack"
   does not refer to user state.  For example, if CancelOperation is called on a command of type PartitionDataLoss,
   a state of "RollingBack" does not mean service data is being restored (assuming the command has progressed far enough to cause data loss).  
   It means the system is rolling back/cleaning up internal system state associated with the command.
- Completed - The operation has completed successfully and is no longer running.
- Faulted - The operation has failed and is no longer running.
- Cancelled - The operation was cancelled by the user using CancelOperation, and is no longer running.
- ForceCancelled - The operation was cancelled by the user using CancelOperation, with the force parameter set to true.  It is no longer running.  Refer to CancelOperation for more details.


____
### Type
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
- invalid - The operation state is invalid.
- partitionDataLoss - An operation started using the StartDataLoss API.
- partitionQuorumLoss - An operation started using the StartQuorumLoss API.
- partitionRestart - An operation started using the StartPartitionRestart API.
- nodeTransition - An operation started using the StartNodeTransition API.

