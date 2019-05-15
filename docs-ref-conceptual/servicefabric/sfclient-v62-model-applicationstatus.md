---
title: "ApplicationStatus"
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
# ApplicationStatus enum

type: string

The status of the application.


Possible values are: 

  - `Invalid` - Indicates the application status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ready` - Indicates the application status is ready. The value is 1.
  - `Upgrading` - Indicates the application status is upgrading. The value is 2.
  - `Creating` - Indicates the application status is creating. The value is 3.
  - `Deleting` - Indicates the application status is deleting. The value is 4.
  - `Failed` - Indicates the creation or deletion of application was terminated due to persistent failures. Another create/delete request can be accepted to resume a failed application. The value is 5.

