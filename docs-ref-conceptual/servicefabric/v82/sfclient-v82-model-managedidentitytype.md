---
title: "ManagedIdentityType v82"
description: "ManagedIdentityType v82"
ms.date: "04/02/2021"
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
# ManagedIdentityType enum v82

type: string

The type of managed identity to be used to connect to Azure Blob Store via Managed Identity.


Possible values are: 

  - `Invalid` - Indicates an invalid managed identity type. All Service Fabric enumerations have the invalid type.
  - `VMSS` - Indicates VMSS managed identity should be used to connect to Azure blob store.
  - `Cluster` - Indicates cluster managed identity should be used to connect to Azure blob store.

