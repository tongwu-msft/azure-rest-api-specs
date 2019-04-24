---
title: "Get Correlated Event List"
ms.date: "2018-04-23"
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
# Get Correlated Event List
Gets all correlated events for a given event.

The response is list of FabricEvents.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/EventsStore/CorrelatedEvents/{eventInstanceId}/$/Events?api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`eventInstanceId`](#eventinstanceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `eventInstanceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The EventInstanceId.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2-preview'.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of events objects with base type FabricEvent.<br/> | array of [FabricEvent](sfclient-v62-model-fabricevent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get Correlated events

This example shows how to get all correlated events for a given eventInstanceId.

#### Request
```
GET http://localhost:19080/EventsStore/CorrelatedEvents/e00fa5b7-f747-40dd-9e09-f5a031e96de4/$/Events?api-version=6.2-preview
```

#### 200 Response
##### Body
```json
[
  {
    "Kind": "PartitionPrimaryMoveAnalysis",
    "WhenMoveCompleted": "2018-04-03T20:06:55.966073Z",
    "PreviousNode": "node3(b9d52c016a15a8f57673d3b8041e2d35)",
    "CurrentNode": "node1(cf68563e16a44f808e86197a9cf83de5)",
    "MoveReason": "ApplicationHostDown",
    "RelevantTraces": "",
    "PartitionId": "f2a6a893-39be-4c7d-b07f-72bc2d36de89",
    "EventInstanceId": "59dde2bc-a833-412e-a56d-8f6ada0c7963",
    "TimeStamp": "2018-04-03T20:07:55.966073Z",
    "HasCorrelatedEvents": true,
    "Metadata": {
      "Delay": "00:00:20",
      "Duration": "00:01:59"
    }
  }
]
```

