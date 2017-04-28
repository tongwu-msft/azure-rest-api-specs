---
title: "Get Replica Health"
ms.date: "2017-04-27"
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
# Get Replica Health
Gets the health of a Service Fabric stateful service replica or stateless service instance.

Gets the health of a Service Fabric replica.
Use EventsHealthStateFilter to filter the collection of health events reported on the replica based on the health state.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Partitions/{partitionId}/$/GetReplicas/{replicaId}/$/GetHealth?api-version=3.0&EventsHealthStateFilter={EventsHealthStateFilter}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [replicaId](#replicaid) | string (int64) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [EventsHealthStateFilter](#eventshealthstatefilter) | integer | No | Query |

____
### partitionId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### replicaId
__Type__: string (int64) <br/>
__Required__: Yes<br/>
<br/>
The identifier of the replica.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### EventsHealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Allows filtering the collection of HealthEvent objects returned based on health state.
The possible values for this parameter include integer value of one of the following health states.
Only events that match the filter are returned. All events are used to evaluate the aggregated health state.
If not specified, all entries are returned. The state values are flag based enumeration, so the value could be a combination of these value obtained using bitwise 'OR' operator. For example, If the provided value is 6 then all of the events with HealthState value of OK (2) and Warning (4) are returned.
  
- Default - Default value. Matches any HealthState. The value is zero. 
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
- Ok - Filter that matches input with HealthState value Ok. The value is 2. 
- Warning - Filter that matches input with HealthState value Warning. The value is 4. 
- Error - Filter that matches input with HealthState value Error. The value is 8. 
- All - Filter that matches input with any HealthState value. The value is 65535. 


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested replica health.<br/> | [ReplicaHealth](model-ReplicaHealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
