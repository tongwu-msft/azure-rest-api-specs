---
title: "ChaosEvent"
ms.date: "2017-04-29"
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
# ChaosEvent

Represents an event generated during a Chaos run.
# Inheritance

The type 'ChaosEvent' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ExecutingFaults | [ExecutingFaultsChaosEvent](sfclient-model-executingfaultschaosevent.md) |
| Started | [StartedChaosEvent](sfclient-model-startedchaosevent.md) |
| Stopped | [StoppedChaosEvent](sfclient-model-stoppedchaosevent.md) |
| TestError | [TestErrorChaosEvent](sfclient-model-testerrorchaosevent.md) |
| ValidationFailed | [ValidationFailedChaosEvent](sfclient-model-validationfailedchaosevent.md) |
| Waiting | [WaitingChaosEvent](sfclient-model-waitingchaosevent.md) |

