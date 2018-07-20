---
title: "ApplicationPackageCleanupPolicy"
ms.date: "2018-07-20"
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
# ApplicationPackageCleanupPolicy enum

type: string

The kind of action that needs to be taken for cleaning up the application package after successful provision.

Possible values are: 

  - `Invalid` - Indicates that the application package cleanup policy is invalid. This value is default. The value is zero.
  - `Default` - Indicates that the cleanup policy of application packages is based on the cluster setting "CleanupApplicationPackageOnProvisionSuccess." The value is 1.
  - `Automatic` - Indicates that the service fabric runtime determines when to do the application package cleanup. By default, cleanup is done on successful provision. The value is 2.
  - `Manual` - Indicates that the user has to explicitly clean up the application package. The value is 3.

