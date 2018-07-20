---
title: "HostIsolationMode"
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
# HostIsolationMode enum

type: string

Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest.

Possible values are: 

  - `None` - Indicates the isolation mode is not applicable for given HostType. The value is 0.
  - `Process` - This is the default isolation mode for a ContainerHost. The value is 1.
  - `HyperV` - Indicates the ContainerHost is a Hyper-V container. This applies to only Windows containers. The value is 2.

