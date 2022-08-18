---
title: "Client Chaos APIs"
description: Provides the names of and describes various Chaos APIs that can be used to affect the status of Chaos.
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
# Client Chaos APIs

| Name | Description |
| --- | --- |
| [Get Chaos](sfclient-api-getchaos.md) | Get the status of Chaos.<br/> |
| [Start Chaos](sfclient-api-startchaos.md) | Starts Chaos in the cluster.<br/> |
| [Stop Chaos](sfclient-api-stopchaos.md) | Stops Chaos if it is running in the cluster and put the Chaos Schedule in a stopped state.<br/> |
| [Get Chaos Events](sfclient-api-getchaosevents.md) | Gets the next segment of the Chaos events based on the continuation token or the time range.<br/> |
| [Get Chaos Schedule](sfclient-api-getchaosschedule.md) | Get the Chaos Schedule defining when and how to run Chaos.<br/> |
| [Post Chaos Schedule](sfclient-api-postchaosschedule.md) | Set the schedule used by Chaos.<br/> |

