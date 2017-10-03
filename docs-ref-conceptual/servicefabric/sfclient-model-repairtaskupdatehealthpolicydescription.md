---
title: "RepairTaskUpdateHealthPolicyDescription"
ms.date: "2017-10-02"
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
# RepairTaskUpdateHealthPolicyDescription

Describes a request to update the health policy of a repair task.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [TaskId](#taskid) | string | Yes |
| [Version](#version) | string (int64) | No |
| [PerformPreparingHealthCheck](#performpreparinghealthcheck) | boolean | No |
| [PerformRestoringHealthCheck](#performrestoringhealthcheck) | boolean | No |

____
### TaskId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The ID of the repair task to be updated.

____
### Version
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The current version number of the repair task. If non-zero, then the request will only succeed if this value matches the actual current value of the repair task. If zero, then no version check is performed.

____
### PerformPreparingHealthCheck
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A boolean indicating if health check is to be performed in the Preparing stage of the repair task. If not specified the existing value should not be altered. Otherwise, specify the desired new value.

____
### PerformRestoringHealthCheck
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A boolean indicating if health check is to be performed in the Restoring stage of the repair task. If not specified the existing value should not be altered. Otherwise, specify the desired new value.
