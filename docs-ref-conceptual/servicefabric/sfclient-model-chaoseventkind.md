---
title: "ChaosEventKind"
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
# ChaosEventKind enum

type: string

The kind of Chaos event.


Possible values are: 

  - Invalid - Indicates an invalid Chaos event kind. All Service Fabric enumerations have the invalid type.
  - Started - Indicates a Chaos event that gets generated when Chaos is started.
  - ExecutingFaults - Indicates a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.
  - Waiting - Indicates a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.
  - ValidationFailed - Indicates a Chaos event that gets generated when the cluster entities do not become stable and healthy within ChaosParameters.MaxClusterStabilizationTimeoutInSeconds.
  - TestError - Indicates a Chaos event that gets generated when an unexpected event has occurred in the Chaos engine, for example, due to the cluster snapshot being inconsistent, while faulting a faultable entity Chaos found that the entity was already faulted.
  - Stopped - Indicates a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.

