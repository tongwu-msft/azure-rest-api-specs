---
title: "Get Service Event List"
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
# Get Service Event List
Gets a Service-related events.

The response is list of ServiceEvent objects.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/EventsStore/Services/{serviceId}/$/Events?api-version=6.2-preview&timeout={timeout}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}&EventsTypesFilter={EventsTypesFilter}&ExcludeAnalysisEvents={ExcludeAnalysisEvents}&SkipCorrelationLookup={SkipCorrelationLookup}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`StartTimeUtc`](#starttimeutc) | string | Yes | Query |
| [`EndTimeUtc`](#endtimeutc) | string | Yes | Query |
| [`EventsTypesFilter`](#eventstypesfilter) | string | No | Query |
| [`ExcludeAnalysisEvents`](#excludeanalysisevents) | boolean | No | Query |
| [`SkipCorrelationLookup`](#skipcorrelationlookup) | boolean | No | Query |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


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
| 200 (OK) | List of events objects with base type ServiceEvent.<br/> | array of [ServiceEvent](sfclient-v62-model-serviceevent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get Service-related events

This example shows how to get all service-related events during a certain time window.

#### Request
```
GET http://localhost:19080/EventsStore/Services/app1~svc1/$/Events?api-version=6.2-preview&StartTimeUtc=2018-04-03T18:00:00Z&EndTimeUtc=2018-04-04T18:00:00Z
```

#### 200 Response
##### Body
```json
[
  {
    "Kind": "ServiceCreated",
    "ServiceTypeName": "Svc1Type",
    "ApplicationName": "fabric:/app1",
    "ApplicationTypeName": "App1Type",
    "ServiceInstance": "131672605579916060",
    "IsStateful": true,
    "PartitionCount": "2",
    "TargetReplicaSetSize": "3",
    "MinReplicaSetSize": "2",
    "ServicePackageVersion": "1.0:1.0",
    "PartitionId": "bd936249-183d-4e29-94ab-2e198e4e2e87",
    "ServiceId": "app1/svc1",
    "EventInstanceId": "8ba26506-4a93-4b8c-ae14-29a2841b3003",
    "TimeStamp": "2018-04-03T20:22:38.0560496Z",
    "HasCorrelatedEvents": false
  }
]
```

