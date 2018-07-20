---
title: "Get Partition Replicas Event List"
ms.date: "2018-07-20"
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
# Get Partition Replicas Event List
Gets all Replicas-related events for a Partition.

The response is list of ReplicaEvent objects.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/EventsStore/Partitions/{partitionId}/$/Replicas/Events?api-version=6.2-preview&timeout={timeout}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}&EventsTypesFilter={EventsTypesFilter}&ExcludeAnalysisEvents={ExcludeAnalysisEvents}&SkipCorrelationLookup={SkipCorrelationLookup}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`StartTimeUtc`](#starttimeutc) | string | Yes | Query |
| [`EndTimeUtc`](#endtimeutc) | string | Yes | Query |
| [`EventsTypesFilter`](#eventstypesfilter) | string | No | Query |
| [`ExcludeAnalysisEvents`](#excludeanalysisevents) | boolean | No | Query |
| [`SkipCorrelationLookup`](#skipcorrelationlookup) | boolean | No | Query |

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

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
| 200 (OK) | List of events objects with base type ReplicaEvent.<br/> | array of [ReplicaEvent](sfclient-model-replicaevent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get Partition Replicas-related events

This example shows how to get all replicas-related events during a certain time window.

#### Request
```
GET http://localhost:19080/EventsStore/Partitions/f2a6a893-39be-4c7d-b07f-72bc2d36de89/$/Replicas/Events?api-version=6.2-preview&StartTimeUtc=2018-04-03T18:00:00Z&EndTimeUtc=2018-04-04T18:00:00Z
```

#### 200 Response
##### Body
```json
[
  {
    "Kind": "StatefulReplicaHealthReportCreated",
    "ReplicaInstanceId": "131672608994209140",
    "SourceId": "TestSource",
    "Property": "",
    "HealthState": "Error",
    "TimeToLiveMs": "922337203685477",
    "SequenceNumber": "131672654189677800",
    "Description": "",
    "RemoveWhenExpired": false,
    "SourceUtcTimestamp": "2018-04-03T21:43:38Z",
    "PartitionId": "f2a6a893-39be-4c7d-b07f-72bc2d36de89",
    "ReplicaId": "131672608994209140",
    "EventInstanceId": "b2684da3-df81-4add-8baa-201f73e9195d",
    "TimeStamp": "2018-04-03T21:43:38.8904013Z",
    "HasCorrelatedEvents": false
  },
  {
    "Kind": "StatefulReplicaHealthReportCreated",
    "ReplicaInstanceId": "177872608994339550",
    "SourceId": "TestSource",
    "Property": "",
    "HealthState": "Error",
    "TimeToLiveMs": "922337203685477",
    "SequenceNumber": "131672654189677800",
    "Description": "",
    "RemoveWhenExpired": false,
    "SourceUtcTimestamp": "2018-04-03T21:44:38Z",
    "PartitionId": "f549f3b3-08c2-4ec4-adb4-415e024cb0ef",
    "ReplicaId": "177872608994339550",
    "EventInstanceId": "4a8851d8-35a3-4618-b4ac-03ffa191c350",
    "TimeStamp": "2018-04-03T21:44:38.8904013Z",
    "HasCorrelatedEvents": false
  }
]
```

