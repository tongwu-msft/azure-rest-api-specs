---
title: "OperationType"
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
# OperationType enum

type: string

The type of the operation.

Possible values are: 

  - Invalid - The operation state is invalid.
  - PartitionDataLoss - An operation started using the StartDataLoss API.
  - PartitionQuorumLoss - An operation started using the StartQuorumLoss API.
  - PartitionRestart - An operation started using the StartPartitionRestart API.
  - NodeTransition - An operation started using the StartNodeTransition API.

