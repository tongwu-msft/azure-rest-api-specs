---
title: "PartitionQuorumLossProgress"
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
# PartitionQuorumLossProgress

Information about a partition quorum loss user-induced operation.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [State](#state) | string (enum) | No |
| [InvokeQuorumLossResult](#invokequorumlossresult) | [InvokeQuorumLossResult](sfclient-model-invokequorumlossresult.md) | No |

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
### InvokeQuorumLossResult
__Type__: [InvokeQuorumLossResult](sfclient-model-invokequorumlossresult.md) <br/>
__Required__: No<br/>
<br/>
Represents information about an operation in a terminal state (Completed or Faulted).
