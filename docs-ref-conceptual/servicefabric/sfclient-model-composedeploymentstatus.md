---
title: "ComposeDeploymentStatus"
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
# ComposeDeploymentStatus enum

type: string

The status of the compose deployment.

Possible values are: 

  - `Invalid` - Indicates that the compose deployment status is invalid. The value is zero.
  - `Provisioning` - Indicates that the compose deployment is being provisioned in background. The value is 1.
  - `Creating` - Indicates that the compose deployment is being created in background. The value is 2.
  - `Ready` - Indicates that the compose deployment has been successfully created or upgraded. The value is 3.
  - `Unprovisioning` - Indicates that the compose deployment is being unprovisioned in background. The value is 4.
  - `Deleting` - Indicates that the compose deployment is being deleted in background. The value is 5.
  - `Failed` - Indicates that the compose deployment was terminated due to persistent failures. The value is 6.
  - `Upgrading` - Indicates that the compose deployment is being upgraded in the background. The value is 7.

