---
title: "OperationType v82"
description: "OperationType v82"
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
# OperationType enum v82

type: string

The type of the operation.

Possible values are: 

  - `Invalid` - The operation state is invalid.
  - `PartitionDataLoss` - An operation started using the StartDataLoss API.
  - `PartitionQuorumLoss` - An operation started using the StartQuorumLoss API.
  - `PartitionRestart` - An operation started using the StartPartitionRestart API.
  - `NodeTransition` - An operation started using the StartNodeTransition API.

