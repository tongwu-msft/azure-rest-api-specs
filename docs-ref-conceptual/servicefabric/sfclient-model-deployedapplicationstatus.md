---
title: "DeployedApplicationStatus"
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
# DeployedApplicationStatus enum

type: string

The status of the application deployed on the node. Following are the possible values.


Possible values are: 

  - `Invalid` - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Downloading` - Indicates that the package is downloading from the ImageStore. The value is 1.
  - `Activating` - Indicates that the package is activating. The value is 2.
  - `Active` - Indicates that the package is active. The value is 3.
  - `Upgrading` - Indicates that the package is upgrading. The value is 4.
  - `Deactivating` - Indicates that the package is deactivating. The value is 5.

