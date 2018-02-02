---
title: "ReconfigurationPhase"
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
# ReconfigurationPhase enum

type: string

The reconfiguration phase of a replica of a stateful service.

Possible values are: 

  - Unknown - Indicates the invalid reconfiguration phase.
  - None - Specifies that there is no reconfiguration in progress.
  - Phase0 - Refers to the phase where the reconfiguration is transferring data from the previous primary to the new primary.
  - Phase1 - Refers to the phase where the reconfiguration is querying the replica set for the progress.
  - Phase2 - Refers to the phase where the reconfiguration is ensuring that data from the current primary is present in a majority of the replica set.
  - Phase3 - This phase is for internal use only.
  - Phase4 - This phase is for internal use only.
  - AbortPhaseZero - This phase is for internal use only.

