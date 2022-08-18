---
title: "ApplicationResourceUpgradeProgressInfo v82"
description: "ApplicationResourceUpgradeProgressInfo v82"
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
# ApplicationResourceUpgradeProgressInfo v82

This type describes an application resource upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`TargetApplicationTypeVersion`](#targetapplicationtypeversion) | string | No |
| [`StartTimestampUtc`](#starttimestamputc) | string | No |
| [`UpgradeState`](#upgradestate) | string (enum) | No |
| [`PercentCompleted`](#percentcompleted) | string | No |
| [`ServiceUpgradeProgress`](#serviceupgradeprogress) | array of [ServiceUpgradeProgress](sfclient-v82-model-serviceupgradeprogress.md) | No |
| [`RollingUpgradeMode`](#rollingupgrademode) | string (enum) | No |
| [`UpgradeDuration`](#upgradeduration) | string | No |
| [`ApplicationUpgradeStatusDetails`](#applicationupgradestatusdetails) | string | No |
| [`UpgradeReplicaSetCheckTimeoutInSeconds`](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [`FailureTimestampUtc`](#failuretimestamputc) | string | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the Application resource.

____
### `TargetApplicationTypeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The target application version for the application upgrade.

____
### `StartTimestampUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated UTC datetime when the upgrade started.

____
### `UpgradeState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The state of the application resource upgrade.


Possible values are: 

  - `Invalid` - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is 0.
  - `ProvisioningTarget` - The upgrade is in the progress of provisioning target application type version. The value is 1.
  - `RollingForward` - The upgrade is rolling forward to the target version but is not complete yet. The value is 2.
  - `UnprovisioningCurrent` - The upgrade is in the progress of unprovisioning current application type version and rolling forward to the target version is completed. The value is 3.
  - `CompletedRollforward` - The upgrade has finished rolling forward. The value is 4.
  - `RollingBack` - The upgrade is rolling back to the previous version but is not complete yet. The value is 5.
  - `UnprovisioningTarget` - The upgrade is in the progress of unprovisioning target application type version and rolling back to the current version is completed. The value is 6.
  - `CompletedRollback` - The upgrade has finished rolling back. The value is 7.
  - `Failed` - The upgrade has failed and is unable to execute FailureAction. The value is 8.



____
### `PercentCompleted`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated percent of replicas are completed in the upgrade.

____
### `ServiceUpgradeProgress`
__Type__: array of [ServiceUpgradeProgress](sfclient-v82-model-serviceupgradeprogress.md) <br/>
__Required__: No<br/>
<br/>
List of service upgrade progresses.

____
### `RollingUpgradeMode`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Monitored` <br/>
<br/>


The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.

Possible values are: 

  - `Invalid` - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `UnmonitoredAuto` - The upgrade will proceed automatically without performing any health monitoring. The value is 1
  - `UnmonitoredManual` - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
  - `Monitored` - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3



____
### `UpgradeDuration`
__Type__: string <br/>
__Required__: No<br/>
__Default__: `PT0H2M0S` <br/>
<br/>
The estimated amount of time that the overall upgrade elapsed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### `ApplicationUpgradeStatusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Additional detailed information about the status of the pending upgrade.

____
### `UpgradeReplicaSetCheckTimeoutInSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `42949672925` <br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### `FailureTimestampUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated UTC datetime when the upgrade failed and FailureAction was executed.
