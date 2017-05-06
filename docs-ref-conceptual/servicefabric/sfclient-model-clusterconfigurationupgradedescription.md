---
title: "ClusterConfigurationUpgradeDescription"
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
# ClusterConfigurationUpgradeDescription

Describes the parameters for a standalone cluster configuration upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ClusterConfig](#clusterconfig) | string | Yes |
| [HealthCheckRetryTimeout](#healthcheckretrytimeout) | string (duration) | No |
| [HealthCheckWaitDurationInSeconds](#healthcheckwaitdurationinseconds) | string (duration) | No |
| [HealthCheckStableDurationInSeconds](#healthcheckstabledurationinseconds) | string (duration) | No |
| [UpgradeDomainTimeoutInSeconds](#upgradedomaintimeoutinseconds) | string (duration) | No |
| [UpgradeTimeoutInSeconds](#upgradetimeoutinseconds) | string (duration) | No |
| [MaxPercentUnhealthyApplications](#maxpercentunhealthyapplications) | integer | No |
| [MaxPercentUnhealthyNodes](#maxpercentunhealthynodes) | integer | No |
| [MaxPercentDeltaUnhealthyNodes](#maxpercentdeltaunhealthynodes) | integer | No |
| [MaxPercentUpgradeDomainDeltaUnhealthyNodes](#maxpercentupgradedomaindeltaunhealthynodes) | integer | No |

____
### ClusterConfig
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The cluster configuration.

____
### HealthCheckRetryTimeout
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: PT0H0M0S <br/>
<br/>
The length of time between attempts to perform a health checks if the application or cluster is not healthy.

____
### HealthCheckWaitDurationInSeconds
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: PT0H0M0S <br/>
<br/>
The length of time to wait after completing an upgrade domain before starting the health checks process.

____
### HealthCheckStableDurationInSeconds
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: PT0H0M0S <br/>
<br/>
The length of time that the application or cluster must remain healthy.

____
### UpgradeDomainTimeoutInSeconds
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: PT0H0M0S <br/>
<br/>
The timeout for the upgrade domain.

____
### UpgradeTimeoutInSeconds
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: PT0H0M0S <br/>
<br/>
The upgrade timeout.

____
### MaxPercentUnhealthyApplications
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy applications during the upgrade. Allowed values are integer values from zero to 100.

____
### MaxPercentUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy nodes during the upgrade. Allowed values are integer values from zero to 100.

____
### MaxPercentDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of delta health degradation during the upgrade. Allowed values are integer values from zero to 100.

____
### MaxPercentUpgradeDomainDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of upgrade domain delta health degradation during the upgrade. Allowed values are integer values from zero to 100.
