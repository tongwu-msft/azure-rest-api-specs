---
title: "ClusterUpgradeStartedEvent v82"
description: "ClusterUpgradeStartedEvent v82"
ms.date: "10/21/2020"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# ClusterUpgradeStartedEvent v82

Cluster Upgrade Started event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`Category`](#category) | string | No |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`CurrentClusterVersion`](#currentclusterversion) | string | Yes |
| [`TargetClusterVersion`](#targetclusterversion) | string | Yes |
| [`UpgradeType`](#upgradetype) | string | Yes |
| [`RollingUpgradeMode`](#rollingupgrademode) | string | Yes |
| [`FailureAction`](#failureaction) | string | Yes |

____
### `EventInstanceId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identifier for the FabricEvent instance.

____
### `Category`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The category of event.

____
### `TimeStamp`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The time event was logged.

____
### `HasCorrelatedEvents`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Shows there is existing related events available.

____
### `CurrentClusterVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Current Cluster version.

____
### `TargetClusterVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Target Cluster version.

____
### `UpgradeType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of upgrade.

____
### `RollingUpgradeMode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Mode of upgrade.

____
### `FailureAction`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Action if failed.
