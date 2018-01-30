---
title: "Get Cluster Health"
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
# Get Cluster Health
Gets the health of a Service Fabric cluster.

Gets the health of a Service Fabric cluster.
Use EventsHealthStateFilter to filter the collection of health events reported on the cluster based on the health state.
Similarly, use NodesHealthStateFilter and ApplicationsHealthStateFilter to filter the collection of nodes and applications returned based on their aggregated health state.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetClusterHealth?api-version=6.0&NodesHealthStateFilter={NodesHealthStateFilter}&ApplicationsHealthStateFilter={ApplicationsHealthStateFilter}&EventsHealthStateFilter={EventsHealthStateFilter}&ExcludeHealthStatistics={ExcludeHealthStatistics}&IncludeSystemApplicationHealthStatistics={IncludeSystemApplicationHealthStatistics}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [NodesHealthStateFilter](#nodeshealthstatefilter) | integer | No | Query |
| [ApplicationsHealthStateFilter](#applicationshealthstatefilter) | integer | No | Query |
| [EventsHealthStateFilter](#eventshealthstatefilter) | integer | No | Query |
| [ExcludeHealthStatistics](#excludehealthstatistics) | boolean | No | Query |
| [IncludeSystemApplicationHealthStatistics](#includesystemapplicationhealthstatistics) | boolean | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of this API. This is a required parameter and its value must be "6.0".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### NodesHealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Allows filtering of the node health state objects returned in the result of cluster health query
based on their health state. The possible values for this parameter include integer value of one of the
following health states. Only nodes that match the filter are returned. All nodes are used to evaluate the aggregated health state.
If not specified, all entries are returned.
The state values are flag based enumeration, so the value could be a combination of these values obtained using bitwise 'OR' operator.
For example, if the provided value is 6 then health state of nodes with HealthState value of OK (2) and Warning (4) are returned.

- Default - Default value. Matches any HealthState. The value is zero.
- None - Filter that doesn't match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.


____
### ApplicationsHealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Allows filtering of the application health state objects returned in the result of cluster health
query based on their health state.
The possible values for this parameter include integer value obtained from members or bitwise operations
on members of HealthStateFilter enumeration. Only applications that match the filter are returned.
All applications are used to evaluate the aggregated health state. If not specified, all entries are returned.
The state values are flag based enumeration, so the value could be a combination of these values obtained using bitwise 'OR' operator.
For example, if the provided value is 6 then health state of applications with HealthState value of OK (2) and Warning (4) are returned.

- Default - Default value. Matches any HealthState. The value is zero.
- None - Filter that doesn't match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.


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
- None - Filter that doesn't match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.


____
### ExcludeHealthStatistics
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
Indicates whether the health statistics should be returned as part of the query result. False by default.
The statistics show the number of children entities in health state Ok, Warning, and Error.


____
### IncludeSystemApplicationHealthStatistics
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
Indicates whether the health statistics should include the fabric:/System application health statistics. False by default.
If IncludeSystemApplicationHealthStatistics is set to true, the health statistics include the entities that belong to the fabric:/System application.
Otherwise, the query result includes health statistics only for user applications.
The health statistics must be included in the query result for this parameter to be applied.


____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested cluster health information.<br/> | [ClusterHealth](sfclient-model-clusterhealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
