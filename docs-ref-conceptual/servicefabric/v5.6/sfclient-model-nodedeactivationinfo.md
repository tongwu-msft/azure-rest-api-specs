---
title: "NodeDeactivationInfo"
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
# NodeDeactivationInfo

Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeDeactivationIntent](#nodedeactivationintent) | string (enum) | No |
| [NodeDeactivationStatus](#nodedeactivationstatus) | string (enum) | No |
| [NodeDeactivationTask](#nodedeactivationtask) | array of [NodeDeactivationTask](sfclient-model-nodedeactivationtask.md) | No |
| [PendingSafetyChecks](#pendingsafetychecks) | array of [SafetyCheckWrapper](sfclient-model-safetycheckwrapper.md) | No |

____
### NodeDeactivationIntent
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The intent or the reason for deactivating the node. Following are the possible values for it.

  - Invalid - Indicates the node deactivation intent is invalid. All Service Fabric enumerations have the invalid type. The value is zero. This value is not used.
  - Pause - Indicates that the node should be paused. The value is 1.
  - Restart - Indicates that the intent is for the node to be restarted after a short period of time. Service Fabric does not restart the node, this action is done outside of Service Fabric. The value is 2.
  - RemoveData - Indicates that the intent is to reimage the node. Service Fabric does not reimage the node, this action is done outside of Service Fabric. The value is 3.
  - RemoveNode - Indicates that the node is being decommissioned and is not expected to return. Service Fabric does not decommission the node, this action is done outside of Service Fabric. The value is 4.


____
### NodeDeactivationStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of node deactivation operation. Following are the possible values.

  - None - No status is associated with the task. The value is zero.
  - SafetyCheckInProgress - When a node is deactivated Service Fabric performs checks to ensure that the operation is safe to proceed to ensure avaiablity of the service and reliability of the state. This value indicates that one or more safety checks are in progress. The value is 1.
  - SafetyCheckComplete - When a node is deactivated Service Fabric performs checks to ensure that the operation is safe to proceed to ensure avaiablity of the service and reliability of the state. This value indicates that all safety checks have been completed. The value is 2.
  - Completed - The task is completed. The value is 3.
  


____
### NodeDeactivationTask
__Type__: array of [NodeDeactivationTask](sfclient-model-nodedeactivationtask.md) <br/>
__Required__: No<br/>
<br/>
List of tasks representing the deactivation operation on the node.

____
### PendingSafetyChecks
__Type__: array of [SafetyCheckWrapper](sfclient-model-safetycheckwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of pending safety checks
