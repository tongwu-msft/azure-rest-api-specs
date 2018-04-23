---
title: "DeploymentStatus"
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
# DeploymentStatus enum

type: string

Specifies the status of a deployed application or service package on a Service Fabric node.


Possible values are: 

  - Invalid - Indicates status of the application or service package is not known or invalid. The value is 0.
  - Downloading - Indicates the application or service package is being downloaded to the node from the ImageStore. The value is 1.
  - Activating - Indicates the application or service package is being activated. The value is 2.
  - Active - Indicates the application or service package is active the node. The value is 3.
  - Upgrading - Indicates the application or service package is being upgraded. The value is 4.
  - Deactivating - Indicates the application or service package is being deactivated. The value is 5.

