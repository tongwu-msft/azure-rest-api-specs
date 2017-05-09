---
title: "Get Cluster Health Using Policy"
ms.date: "2017-05-08"
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
# Get Cluster Health Using Policy
Gets the health of a Service Fabric cluster using the specified policy.

Gets the health of a Service Fabric cluster.
Use EventsHealthStateFilter to filter the collection of health events reported on the cluster based on the health state.
Similarly, use NodesHealthStateFilter and ApplicationsHealthStateFilter to filter the collection of nodes and applications returned based on their aggregated health state.
Use ClusterHealthPolicies to override the health policies used to evaluate the health. 


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/GetClusterHealth?api-version=3.0&NodesHealthStateFilter={NodesHealthStateFilter}&ApplicationsHealthStateFilter={ApplicationsHealthStateFilter}&EventsHealthStateFilter={EventsHealthStateFilter}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [NodesHealthStateFilter](#nodeshealthstatefilter) | integer | No | Query |
| [ApplicationsHealthStateFilter](#applicationshealthstatefilter) | integer | No | Query |
| [EventsHealthStateFilter](#eventshealthstatefilter) | integer | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ClusterHealthPolicies](#clusterhealthpolicies) | [ClusterHealthPolicies](sfclient-model-clusterhealthpolicies.md) | No | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

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
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
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
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
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
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
- Ok - Filter that matches input with HealthState value Ok. The value is 2. 
- Warning - Filter that matches input with HealthState value Warning. The value is 4. 
- Error - Filter that matches input with HealthState value Error. The value is 8. 
- All - Filter that matches input with any HealthState value. The value is 65535. 


____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### ClusterHealthPolicies
__Type__: [ClusterHealthPolicies](sfclient-model-clusterhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Describes the health policies used to evaluate the cluster health.
If not present, the health evaluation uses the cluster health policy defined in the cluster manifest or the default cluster health policy.
By default, each application is evaluated using its specific application health policy, defined in the application manifest, or the default health policy, if no policy is defined in manifest.
If the application health policy map is specified, and it has an entry for an application, the specified application health policy
is used to evaluate the application health.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested cluster health information.<br/> | [ClusterHealth](sfclient-model-clusterhealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
