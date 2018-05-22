---
title: "ClusterUpgradeDomainCompleteEvent"
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
# ClusterUpgradeDomainCompleteEvent

Cluster Upgrade Domain Complete event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`TargetClusterVersion`](#targetclusterversion) | string | Yes |
| [`UpgradeState`](#upgradestate) | string | Yes |
| [`UpgradeDomains`](#upgradedomains) | string | Yes |
| [`UpgradeDomainElapsedTimeInMs`](#upgradedomainelapsedtimeinms) | number (double) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ClusterUpgradeDomainComplete' for objects of type 'ClusterUpgradeDomainCompleteEvent'.

____
### `EventInstanceId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identifier for the FabricEvent instance.

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
### `TargetClusterVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Target Cluster version.

____
### `UpgradeState`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
State of upgrade.

____
### `UpgradeDomains`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Upgrade domains.

____
### `UpgradeDomainElapsedTimeInMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of domain upgrade in milli-seconds.
