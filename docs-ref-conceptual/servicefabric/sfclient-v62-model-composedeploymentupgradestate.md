---
title: "ComposeDeploymentUpgradeState"
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
# ComposeDeploymentUpgradeState enum

type: string

The state of the compose deployment upgrade.


Possible values are: 

  - `Invalid` - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `ProvisioningTarget` - The upgrade is in the progress of provisioning target application type version. The value is 1.
  - `RollingForwardInProgress` - The upgrade is rolling forward to the target version but is not complete yet. The value is 2.
  - `RollingForwardPending` - The current upgrade domain has finished upgrading. The overall upgrade is waiting for an explicit move next request in UnmonitoredManual mode or performing health checks in Monitored mode. The value is 3
  - `UnprovisioningCurrent` - The upgrade is in the progress of unprovisioning current application type version and rolling forward to the target version is completed. The value is 4.
  - `RollingForwardCompleted` - The upgrade has finished rolling forward. The value is 5.
  - `RollingBackInProgress` - The upgrade is rolling back to the previous version but is not complete yet. The value is 6.
  - `UnprovisioningTarget` - The upgrade is in the progress of unprovisioning target application type version and rolling back to the current version is completed. The value is 7.
  - `RollingBackCompleted` - The upgrade has finished rolling back. The value is 8.
  - `Failed` - The upgrade has failed and is unable to execute FailureAction. The value is 9.

