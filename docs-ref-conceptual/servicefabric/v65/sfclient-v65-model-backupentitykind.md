---
title: "BackupEntityKind"
ms.date: 06/12/2019
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# BackupEntityKind enum

type: string

The entity type of a Service Fabric entity such as Application, Service or a Partition where periodic backups can be enabled.


Possible values are: 

  - `Invalid` - Indicates an invalid entity kind. All Service Fabric enumerations have the invalid type.
  - `Partition` - Indicates the entity is a Service Fabric partition.
  - `Service` - Indicates the entity is a Service Fabric service.
  - `Application` - Indicates the entity is a Service Fabric application.

