---
title: "HostType"
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
# HostType enum

type: string

Specifies the type of host for main entry point of a code package as specified in service manifest.

Possible values are: 

  - Invalid - Indicates the type of host is not known or invalid. The value is 0.
  - ExeHost - Indicates the host is an executable. The value is 1.
  - ContainerHost - Indicates the host is a container. The value is 2.

