---
title: "RepairTask"
ms.date: "2018-01-22"
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
# RepairTask

Represents a repair task, which includes information about what kind of repair was requested, what its progress is, and what its final result was.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [TaskId](#taskid) | string | Yes |
| [Version](#version) | string (int64) | No |
| [Description](#description) | string | No |
| [State](#state) | string (enum) | Yes |
| [Flags](#flags) | integer | No |
| [Action](#action) | string | Yes |
| [Target](#target) | [RepairTargetDescriptionBase](sfclient-model-repairtargetdescriptionbase.md) | No |
| [Executor](#executor) | string | No |
| [ExecutorData](#executordata) | string | No |
| [Impact](#impact) | [RepairImpactDescriptionBase](sfclient-model-repairimpactdescriptionbase.md) | No |
| [ResultStatus](#resultstatus) | string (enum) | No |
| [ResultCode](#resultcode) | integer | No |
| [ResultDetails](#resultdetails) | string | No |
| [History](#history) | [RepairTaskHistory](sfclient-model-repairtaskhistory.md) | No |
| [PreparingHealthCheckState](#preparinghealthcheckstate) | string (enum) | No |
| [RestoringHealthCheckState](#restoringhealthcheckstate) | string (enum) | No |
| [PerformPreparingHealthCheck](#performpreparinghealthcheck) | boolean | No |
| [PerformRestoringHealthCheck](#performrestoringhealthcheck) | boolean | No |

____
### TaskId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The ID of the repair task.

____
### Version
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The version of the repair task.
When creating a new repair task, the version must be set to zero.  When updating a repair task,
the version is used for optimistic concurrency checks.  If the version is
set to zero, the update will not check for write conflicts.  If the version is set to a non-zero value, then the
update will only succeed if the actual current version of the repair task matches this value.


____
### Description
__Type__: string <br/>
__Required__: No<br/>
<br/>
A description of the purpose of the repair task, or other informational details.
May be set when the repair task is created, and is immutable once set.


____
### State
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
The workflow state of the repair task. Valid initial states are Created, Claimed, and Preparing.



Possible values are: 

  - Invalid - Indicates that the repair task state is invalid. All Service Fabric enumerations have the invalid value.
  - Created - Indicates that the repair task has been created.
  - Claimed - Indicates that the repair task has been claimed by a repair executor.
  - Preparing - Indicates that the Repair Manager is preparing the system to handle the impact of the repair task, usually by taking resources offline gracefully.
  - Approved - Indicates that the repair task has been approved by the Repair Manager and is safe to execute.
  - Executing - Indicates that execution of the repair task is in progress.
  - Restoring - Indicates that the Repair Manager is restoring the system to its pre-repair state, usually by bringing resources back online.
  - Completed - Indicates that the repair task has completed, and no further state changes will occur.



____
### Flags
__Type__: integer <br/>
__Required__: No<br/>
<br/>
A bitwise-OR of the following values, which gives additional details about the status of the repair task.
- 1 - Cancellation of the repair has been requested
- 2 - Abort of the repair has been requested
- 4 - Approval of the repair was forced via client request


____
### Action
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The requested repair action. Must be specified when the repair task is created, and is immutable once set.


____
### Target
__Type__: [RepairTargetDescriptionBase](sfclient-model-repairtargetdescriptionbase.md) <br/>
__Required__: No<br/>
<br/>
The target object determines what actions the system will take to prepare for the impact of the repair, prior to approving execution of the repair.
May be set when the repair task is created, and is immutable once set.


____
### Executor
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the repair executor. Must be specified in Claimed and later states, and is immutable once set.

____
### ExecutorData
__Type__: string <br/>
__Required__: No<br/>
<br/>
A data string that the repair executor can use to store its internal state.

____
### Impact
__Type__: [RepairImpactDescriptionBase](sfclient-model-repairimpactdescriptionbase.md) <br/>
__Required__: No<br/>
<br/>
The impact object determines what actions the system will take to prepare for the impact of the repair, prior to approving execution of the repair.
Impact must be specified by the repair executor when transitioning to the Preparing state, and is immutable once set.


____
### ResultStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
A value describing the overall result of the repair task execution. Must be specified in the Restoring and later states, and is immutable once set.



Possible values are: 

  - Invalid - Indicates that the repair task result is invalid. All Service Fabric enumerations have the invalid value.
  - Succeeded - Indicates that the repair task completed execution successfully.
  - Cancelled - Indicates that the repair task was cancelled prior to execution.
  - Interrupted - Indicates that execution of the repair task was interrupted by a cancellation request after some work had already been performed.
  - Failed - Indicates that there was a failure during execution of the repair task. Some work may have been performed.
  - Pending - Indicates that the repair task result is not yet available, because the repair task has not finished executing.



____
### ResultCode
__Type__: integer <br/>
__Required__: No<br/>
<br/>
A numeric value providing additional details about the result of the repair task execution.
May be specified in the Restoring and later states, and is immutable once set.


____
### ResultDetails
__Type__: string <br/>
__Required__: No<br/>
<br/>
A string providing additional details about the result of the repair task execution.
May be specified in the Restoring and later states, and is immutable once set.


____
### History
__Type__: [RepairTaskHistory](sfclient-model-repairtaskhistory.md) <br/>
__Required__: No<br/>
<br/>
An object that contains timestamps of the repair task's state transitions.
These timestamps are updated by the system, and cannot be directly modified.


____
### PreparingHealthCheckState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The workflow state of the health check when the repair task is in the Preparing state.

Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.

Possible values are: 

  - NotStarted - Indicates that the health check has not started.
  - InProgress - Indicates that the health check is in progress.
  - Succeeded - Indicates that the health check succeeded.
  - Skipped - Indicates that the health check was skipped.
  - TimedOut - Indicates that the health check timed out.



____
### RestoringHealthCheckState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The workflow state of the health check when the repair task is in the Restoring state.

Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.

Possible values are: 

  - NotStarted - Indicates that the health check has not started.
  - InProgress - Indicates that the health check is in progress.
  - Succeeded - Indicates that the health check succeeded.
  - Skipped - Indicates that the health check was skipped.
  - TimedOut - Indicates that the health check timed out.



____
### PerformPreparingHealthCheck
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A value to determine if health checks will be performed when the repair task enters the Preparing state.

____
### PerformRestoringHealthCheck
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A value to determine if health checks will be performed when the repair task enters the Restoring state.
