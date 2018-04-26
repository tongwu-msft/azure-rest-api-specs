---
title: "FailureReason"
ms.date: "2018-01-22"
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
# FailureReason enum

type: string

The cause of an upgrade failure that resulted in FailureAction being executed.

Possible values are: 

  - None - Indicates the reason is invalid or unknown. All Service Fabric enumerations have the invalid type. The value is zero.
  - Interrupted - There was an external request to rollback the upgrade. The value is 1
  - HealthCheck - The upgrade failed due to health policy violations. The value is 2
  - UpgradeDomainTimeout - An upgrade domain took longer than the allowed upgrade domain timeout to process. The value is 3
  - OverallUpgradeTimeout - The overall upgrade took longer than the allowed upgrade timeout to process. The value is 4

