---
title: "ClusterConfigurationUpgradeStatusInfo"
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
# ClusterConfigurationUpgradeStatusInfo

Information about a standalone cluster configuration upgrade status.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [UpgradeState](#upgradestate) | string (enum) | No |
| [ProgressStatus](#progressstatus) | integer | No |
| [ConfigVersion](#configversion) | string | No |

____
### UpgradeState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state of the upgrade domain.

    - Invalid - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - RollingBackInProgress - The upgrade is rolling back to the previous version but is not complete yet. The value is 1
    - RollingBackCompleted - The upgrade has finished rolling back. The value is 2
    - RollingForwardPending - The current upgrade domain has finished upgrading. The overall upgrade is waiting for an explicit move next request in UnmonitoredManual mode or performing health checks in Monitored mode. The value is 3
    - RollingForwardInProgress - The upgrade is rolling forward to the target version but is not complete yet. The value is 4
    - RollingForwardCompleted - The upgrade has finished rolling forward. The value is 5
    - Failed - The upgrade has failed and is unable to execute FailureAction. The value is 6


____
### ProgressStatus
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The cluster manifest version.

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster configuration version.
