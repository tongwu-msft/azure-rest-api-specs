---
title: "DataLossMode v82"
description: "DataLossMode v82"
ms.date: "10/21/2020"
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
# DataLossMode enum v82

type: string

Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'

Possible values are: 

  - `Invalid` - Reserved.  Do not pass into API.
  - `PartialDataLoss` - PartialDataLoss option will cause a quorum of replicas to go down, triggering an OnDataLoss event in the system for the given partition.
  - `FullDataLoss` - FullDataLoss option will drop all the replicas which means that all the data will be lost.

