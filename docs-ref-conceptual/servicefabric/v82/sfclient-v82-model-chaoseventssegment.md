---
title: "ChaosEventsSegment v82"
description: "ChaosEventsSegment v82"
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
# ChaosEventsSegment v82

Contains the list of Chaos events and the continuation token to get the next segment.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ContinuationToken`](#continuationtoken) | string | No |
| [`History`](#history) | array of [ChaosEventWrapper](sfclient-v82-model-chaoseventwrapper.md) | No |

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token is not included in the response.

____
### `History`
__Type__: array of [ChaosEventWrapper](sfclient-v82-model-chaoseventwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of Chaos events that meet the user-supplied criteria.
