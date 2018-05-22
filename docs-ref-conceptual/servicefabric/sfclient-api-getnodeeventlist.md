---
title: "Get Node Event List"
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
# Get Node Event List
Gets a Node-related events.

The response is list of NodeEvent objects.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/EventsStore/Nodes/{nodeName}/$/Events?api-version=6.2-preview&timeout={timeout}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}&EventsTypesFilter={EventsTypesFilter}&ExcludeAnalysisEvents={ExcludeAnalysisEvents}&SkipCorrelationLookup={SkipCorrelationLookup}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`StartTimeUtc`](#starttimeutc) | string | Yes | Query |
| [`EndTimeUtc`](#endtimeutc) | string | Yes | Query |
| [`EventsTypesFilter`](#eventstypesfilter) | string | No | Query |
| [`ExcludeAnalysisEvents`](#excludeanalysisevents) | boolean | No | Query |
| [`SkipCorrelationLookup`](#skipcorrelationlookup) | boolean | No | Query |

____
### `nodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

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
| 200 (OK) | List of events objects with base type NodeEvent.<br/> | array of [NodeEvent](sfclient-model-nodeevent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get Node-related events

This example shows how to get all node-related events during a certain time window.

#### Request
```
GET http://localhost:19080/EventsStore/Nodes/node1/$/Events?api-version=6.2-preview&StartTimeUtc=2018-04-03T18:00:00Z&EndTimeUtc=2018-04-04T18:00:00Z
```

#### 200 Response
##### Body
```json
[
  {
    "Kind": "NodeOpening",
    "NodeInstance": "131672596159209220",
    "NodeId": "ba001a8bb353543e646be031afb10f1e",
    "UpgradeDomain": "0",
    "FaultDomain": "fd:/0",
    "IpAddressOrFQDN": "100.78.240.56",
    "Hostname": "RD0003FF5089AA",
    "IsSeedNode": false,
    "NodeVersion": "6.2:1.0",
    "NodeName": "node1",
    "EventInstanceId": "ecbce04a-a42b-4b70-a800-dfc6bc4f9b89",
    "TimeStamp": "2018-04-03T20:06:55.966073Z",
    "HasCorrelatedEvents": false
  }
]
```

