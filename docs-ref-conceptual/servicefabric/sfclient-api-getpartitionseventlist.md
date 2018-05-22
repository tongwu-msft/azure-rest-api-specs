---
title: "Get Partitions Event List"
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
# Get Partitions Event List
Gets all Partitions-related events.

The response is list of PartitionEvent objects.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/EventsStore/Partitions/Events?api-version=6.2-preview&timeout={timeout}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}&EventsTypesFilter={EventsTypesFilter}&ExcludeAnalysisEvents={ExcludeAnalysisEvents}&SkipCorrelationLookup={SkipCorrelationLookup}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`StartTimeUtc`](#starttimeutc) | string | Yes | Query |
| [`EndTimeUtc`](#endtimeutc) | string | Yes | Query |
| [`EventsTypesFilter`](#eventstypesfilter) | string | No | Query |
| [`ExcludeAnalysisEvents`](#excludeanalysisevents) | boolean | No | Query |
| [`SkipCorrelationLookup`](#skipcorrelationlookup) | boolean | No | Query |

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

____
### `StartTimeUtc`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The start time of a lookup query in ISO UTC yyyy-MM-ddTHH:mm:ssZ.

____
### `EndTimeUtc`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The end time of a lookup query in ISO UTC yyyy-MM-ddTHH:mm:ssZ.

____
### `EventsTypesFilter`
__Type__: string <br/>
__Required__: No<br/>
<br/>
This is a comma separated string specifying the types of FabricEvents that should only be included in the response.

____
### `ExcludeAnalysisEvents`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
This param disables the retrieval of AnalysisEvents if true is passed.


____
### `SkipCorrelationLookup`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
This param disables the search of CorrelatedEvents information if true is passed. otherwise the CorrelationEvents get processed and HasCorrelatedEvents field in every FabricEvent gets populated.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of events objects with base type PartitionEvent.<br/> | array of [PartitionEvent](sfclient-model-partitionevent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get Partitions-related events

This example shows how to get all partitions-related events during a certain time window.

#### Request
```
GET http://localhost:19080/EventsStore/Partitions/Events?api-version=6.2-preview&StartTimeUtc=2018-04-03T18:00:00Z&EndTimeUtc=2018-04-04T18:00:00Z
```

#### 200 Response
##### Body
```json
[
  {
    "Kind": "PartitionReconfigurationCompleted",
    "NodeName": "node1",
    "NodeInstanceId": "ba001a8bb353543e646be031afb10f1e",
    "ServiceType": "Svc1Type",
    "CcEpochDataLossVersion": "131672604833413100",
    "CcEpochConfigVersion": "8589934595",
    "ReconfigType": "Other",
    "Result": "Completed",
    "Phase0DurationMs": "0",
    "Phase1DurationMs": "0",
    "Phase2DurationMs": "203.1935",
    "Phase3DurationMs": "0.0262",
    "Phase4DurationMs": "628.8527",
    "TotalDurationMs": "832.0724",
    "PartitionId": "f2a6a893-39be-4c7d-b07f-72bc2d36de89",
    "EventInstanceId": "e00fa5b7-f747-40dd-9e09-f5a031e96de4",
    "TimeStamp": "2018-04-03T20:21:47.3778996Z",
    "HasCorrelatedEvents": true
  },
  {
    "Kind": "PartitionReconfigurationCompleted",
    "NodeName": "node2",
    "NodeInstanceId": "ba0459d257b028296deba8bd5add33cb",
    "ServiceType": "Svc1Type",
    "CcEpochDataLossVersion": "131672604833413100",
    "CcEpochConfigVersion": "8589934596",
    "ReconfigType": "Other",
    "Result": "Completed",
    "Phase0DurationMs": "0",
    "Phase1DurationMs": "0",
    "Phase2DurationMs": "205.667",
    "Phase3DurationMs": "407.7781",
    "Phase4DurationMs": "630.0935",
    "TotalDurationMs": "1243.5386",
    "PartitionId": "e12acfb3-2a43-4a1a-a252-aa5388ef1aec",
    "EventInstanceId": "9aeb234a-16ef-4e8a-974e-26c60d6f2b86",
    "TimeStamp": "2018-04-03T20:21:49.5155104Z",
    "HasCorrelatedEvents": false
  }
]
```

