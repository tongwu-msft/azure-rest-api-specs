---
title: "Get Application Health"
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
# Get Application Health
Gets the health of the service fabric application.

Returns the heath state of the service fabric application. The response reports either Ok, Error or Warning health state. If the entity is not found in the helath store, it will return Error.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Applications/{applicationId}/$/GetHealth?api-version=3.0&EventsHealthStateFilter={EventsHealthStateFilter}&DeployedApplicationsHealthStateFilter={DeployedApplicationsHealthStateFilter}&ServicesHealthStateFilter={ServicesHealthStateFilter}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [EventsHealthStateFilter](#eventshealthstatefilter) | integer | No | Query |
| [DeployedApplicationsHealthStateFilter](#deployedapplicationshealthstatefilter) | integer | No | Query |
| [ServicesHealthStateFilter](#serviceshealthstatefilter) | integer | No | Query |

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
Allows filtering of the deployed applications health state objects returned in the result of deployed application health query based on their health state. The possible values for this parameter include integer value of one of the following health states. Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. The state values are flag based enumeration, so the value could be a combination of these value obtained using bitwise 'OR' operator. For example, if the provided value is 6 then health state of applications with HealthState value of OK (2) and Warning (4) will be returned. 
  
- Default - Default value. Matches any HealthState. The value is zero. 
- None - Filter that doesn�t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
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
Allows filtering of the services health state objects returned in the result of services health query based on their health state. The possible values for this parameter include integer value of one of the following health states. Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. The state values are flag based enumeration, so the value could be a combination of these value obtained using bitwise 'OR' operator. For example, if the provided value is 6 then health state of services with HealthState value of OK (2) and Warning (4) will be returned. 
  
- Default - Default value. Matches any HealthState. The value is zero. 
- None - Filter that doesn�t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1. 
- Ok - Filter that matches input with HealthState value Ok. The value is 2. 
- Warning - Filter that matches input with HealthState value Warning. The value is 4. 
- Error - Filter that matches input with HealthState value Error. The value is 8. 
- All - Filter that matches input with any HealthState value. The value is 65535. 


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested application health information.<br/> | [ApplicationHealth](model-ApplicationHealth.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
