---
title: "Get Application Health Using Policy"
ms.date: "2017-05-09"
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
# Get Application Health Using Policy
Gets the health of a Service Fabric application using the specified policy.

Gets the health of a Service Fabric application. Use EventsHealthStateFilter to filter the collection of health events reported on the node based on the health state. Use ClusterHealthPolicies to override the health policies used to evaluate the health.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/GetHealth?api-version=3.0&EventsHealthStateFilter={EventsHealthStateFilter}&DeployedApplicationsHealthStateFilter={DeployedApplicationsHealthStateFilter}&ServicesHealthStateFilter={ServicesHealthStateFilter}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [EventsHealthStateFilter](#eventshealthstatefilter) | integer | No | Query |
| [DeployedApplicationsHealthStateFilter](#deployedapplicationshealthstatefilter) | integer | No | Query |
| [ServicesHealthStateFilter](#serviceshealthstatefilter) | integer | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ApplicationHealthPolicy](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | No | Body |

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

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


____
### DeployedApplicationsHealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Allows filtering of the deployed applications health state objects returned in the result of application health query based on their health state.
The possible values for this parameter include integer value of one of the following health states. Only deployed applications that match the filter will be returned.\
All deployed applications are used to evaluate the aggregated health state. If not specified, all entries are returned.
The state values are flag based enumeration, so the value could be a combination of these value obtained using bitwise 'OR' operator.
For example, if the provided value is 6 then health state of deployed applications with HealthState value of OK (2) and Warning (4) are returned. 
  
- Default - Default value. Matches any HealthState. The value is zero. 
- None - Filter that doesn't match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
- Ok - Filter that matches input with HealthState value Ok. The value is 2. 
- Warning - Filter that matches input with HealthState value Warning. The value is 4. 
- Error - Filter that matches input with HealthState value Error. The value is 8. 
- All - Filter that matches input with any HealthState value. The value is 65535. 


____
### ServicesHealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Allows filtering of the services health state objects returned in the result of services health query based on their health state.
The possible values for this parameter include integer value of one of the following health states.
Only services that match the filter are returned. All services are used to evaluate the aggregated health state.
If not specified, all entries are returned. The state values are flag based enumeration, so the value could be a combination of these value
obtained using bitwise 'OR' operator. For example, if the provided value is 6 then health state of services with HealthState value of OK (2) and Warning (4) will be returned. 
  
- Default - Default value. Matches any HealthState. The value is zero. 
- None - Filter that doesn�t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
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
### ApplicationHealthPolicy
__Type__: [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Describes the health policies used to evaluate the health of an application or one of its children.
If not present, the health evaluation uses the health policy from application manifest or the default health policy.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested node health information.<br/> | [ApplicationHealth](sfclient-model-applicationhealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
