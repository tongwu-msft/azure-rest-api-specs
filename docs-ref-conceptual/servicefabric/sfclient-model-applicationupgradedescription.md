---
title: "ApplicationUpgradeDescription"
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
# ApplicationUpgradeDescription

Describes the parameters for an application upgrade. Please note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would results in application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | Yes |
| [TargetApplicationTypeVersion](#targetapplicationtypeversion) | string | Yes |
| [Parameters](#parameters) | array of [ApplicationParameter](sfclient-model-applicationparameter.md) | Yes |
| [UpgradeKind](#upgradekind) | string (enum) | Yes |
| [RollingUpgradeMode](#rollingupgrademode) | string (enum) | No |
| [UpgradeReplicaSetCheckTimeoutInSeconds](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [ForceRestart](#forcerestart) | boolean | No |
| [MonitoringPolicy](#monitoringpolicy) | [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) | No |
| [ApplicationHealthPolicy](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | No |

____
### Name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the target application, including the 'fabric:' URI scheme.

____
### TargetApplicationTypeVersion
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The target application type version (found in the application manifest) for the application upgrade.

____
### Parameters
__Type__: array of [ApplicationParameter](sfclient-model-applicationparameter.md) <br/>
__Required__: Yes<br/>
<br/>
List of application parameters with overridden values from their default values specified in the application manifest.

____
### UpgradeKind
__Type__: string (enum) <br/>
__Required__: Yes<br/>
__Default__: Rolling <br/>
<br/>
The kind of upgrade out of the following possible values.

    - Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - Rolling - The upgrade progresses one upgrade domain at a time. The value is 1


____
### RollingUpgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: UnmonitoredAuto <br/>
<br/>
The mode used to monitor health during a rolling upgrade.

    - Invalid - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - UnmonitoredAuto - The upgrade will proceed automatically without performing any health monitoring. The value is 1
    - UnmonitoredManual - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
    - Monitored - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3


____
### UpgradeReplicaSetCheckTimeoutInSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### ForceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### MonitoringPolicy
__Type__: [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for monitoring an upgrade in Monitored mode.

____
### ApplicationHealthPolicy
__Type__: [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of an application or one of its children entities.

