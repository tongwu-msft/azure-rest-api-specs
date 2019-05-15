---
title: "Get Application Health Using Policy"
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
# Get Application Health Using Policy
Gets the health of a Service Fabric application using the specified policy.

Gets the health of a Service Fabric application. Use EventsHealthStateFilter to filter the collection of health events reported on the node based on the health state. Use ClusterHealthPolicies to override the health policies used to evaluate the health.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/GetHealth?api-version=6.0&EventsHealthStateFilter={EventsHealthStateFilter}&DeployedApplicationsHealthStateFilter={DeployedApplicationsHealthStateFilter}&ServicesHealthStateFilter={ServicesHealthStateFilter}&ExcludeHealthStatistics={ExcludeHealthStatistics}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`EventsHealthStateFilter`](#eventshealthstatefilter) | integer | No | Query |
| [`DeployedApplicationsHealthStateFilter`](#deployedapplicationshealthstatefilter) | integer | No | Query |
| [`ServicesHealthStateFilter`](#serviceshealthstatefilter) | integer | No | Query |
| [`ExcludeHealthStatistics`](#excludehealthstatistics) | boolean | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ApplicationHealthPolicy`](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfclient-v62-model-applicationhealthpolicy.md) | No | Body |

____
### `applicationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the application name is "fabric:/myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `EventsHealthStateFilter`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
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
### `DeployedApplicationsHealthStateFilter`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
Allows filtering of the deployed applications health state objects returned in the result of application health query based on their health state.
The possible values for this parameter include integer value of one of the following health states. Only deployed applications that match the filter will be returned.
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
### `ServicesHealthStateFilter`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
Allows filtering of the services health state objects returned in the result of services health query based on their health state.
The possible values for this parameter include integer value of one of the following health states.
Only services that match the filter are returned. All services are used to evaluate the aggregated health state.
If not specified, all entries are returned. The state values are flag based enumeration, so the value could be a combination of these value
obtained using bitwise 'OR' operator. For example, if the provided value is 6 then health state of services with HealthState value of OK (2) and Warning (4) will be returned.

- Default - Default value. Matches any HealthState. The value is zero.
- None - Filter that doesn't match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.


____
### `ExcludeHealthStatistics`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Indicates whether the health statistics should be returned as part of the query result. False by default.
The statistics show the number of children entities in health state Ok, Warning, and Error.


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
### `ApplicationHealthPolicy`
__Type__: [ApplicationHealthPolicy](sfclient-v62-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Describes the health policies used to evaluate the health of an application or one of its children.
If not present, the health evaluation uses the health policy from application manifest or the default health policy.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested node health information.<br/> | [ApplicationHealth](sfclient-v62-model-applicationhealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
