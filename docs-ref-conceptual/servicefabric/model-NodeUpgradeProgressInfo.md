---
title: "NodeUpgradeProgressInfo"
ms.date: "2017-04-27"
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
# NodeUpgradeProgressInfo

Information about the upgrading node and its status

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeName](#nodename) | string | No |
| [UpgradePhase](#upgradephase) | string (enum) | No |
| [PendingSafetyChecks](#pendingsafetychecks) | array of [SafetyCheckWrapper](model-SafetyCheckWrapper.md) | No |

____
### NodeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The friendly name of the node

____
### UpgradePhase
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state of the upgrading node.

  - Invalid - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - PreUpgradeSafetyCheck - The upgrade has not started yet due to pending safety checks. The value is 1
  - Upgrading - The upgrade is in progress. The value is 2
  - PostUpgradeSafetyCheck - The upgrade has completed and post upgrade safety checks are being performed. The value is 3


____
### PendingSafetyChecks
__Type__: array of [SafetyCheckWrapper](model-SafetyCheckWrapper.md) <br/>
__Required__: No<br/>
<br/>
List of pending safety checks
