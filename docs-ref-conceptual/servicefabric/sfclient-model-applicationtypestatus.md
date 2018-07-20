---
title: "ApplicationTypeStatus"
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
# ApplicationTypeStatus enum

type: string

The status of the application type.


Possible values are: 

  - `Invalid` - Indicates the application type status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Provisioning` - Indicates that the application type is being provisioned in the cluster. The value is 1.
  - `Available` - Indicates that the application type is fully provisioned and is available for use. An application of this type and version can be created. The value is 2.
  - `Unprovisioning` - Indicates that the application type is in process of being unprovisioned from the cluster. The value is 3.
  - `Failed` - Indicates that the application type provisioning failed and it is unavailable for use. The failure details can be obtained from the application type information query. The failed application type information remains in the cluster until it is unprovisioned or reprovisioned successfully. The value is 4.

