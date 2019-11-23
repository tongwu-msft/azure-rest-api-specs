---
title: "ClusterUpgradeStartedEvent"
ms.date: 11/26/2018
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
# ClusterUpgradeStartedEvent

Cluster Upgrade Started event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
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
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ClusterUpgradeStarted' for objects of type 'ClusterUpgradeStartedEvent'.

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
