---
title: "ApplicationHealthStateFilter"
ms.date: "2017-05-03"
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
# ApplicationHealthStateFilter

Defines matching criteria to determine whether a application should be included in the cluster health chunk.
One filter can match zero, one or multiple applications, depending on its properties.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationNameFilter](#applicationnamefilter) | string | No |
| [ApplicationTypeNameFilter](#applicationtypenamefilter) | string | No |
| [HealthStateFilter](#healthstatefilter) | integer | No |
| [ServiceFilters](#servicefilters) | array of [ServiceHealthStateFilter](sfclient-model-servicehealthstatefilter.md) | No |
| [DeployedApplicationFilters](#deployedapplicationfilters) | array of [DeployedApplicationHealthStateFilter](sfclient-model-deployedapplicationhealthstatefilter.md) | No |

____
### ApplicationNameFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application that matches the filter, as a fabric uri. The filter is applied only to the specified application, if it exists.
If the application doesn't exist, no application is returned in the cluster health chunk based on this filter.
If the application exists, it is included in the cluster health chunk if it respects the other filter properties.
If not specified, all applications are matched against the other filter members, like health state filter.


____
### ApplicationTypeNameFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application type that matches the filter.
If specified, the filter is applied only to applications of the selected application type, if any exists.
If no applications of the specified application type exists, no application is returned in the cluster health chunk based on this filter.
Each application of the specified application type is included in the cluster health chunk if it respects the other filter properties.
If not specified, all applications are matched against the other filter members, like health state filter.


____
### HealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The filter for the health state of the applications. It allows selecting applications if they match the desired health states.
The possible values are integer value of one of the following health states. Only applications that match the filter are returned. All applications are used to evaluate the cluster aggregated health state.
If not specified, default value is None, unless the application name or the application type name are specified. If the filter has default value and application name is specified, the matching application is returned.
The state values are flag based enumeration, so the value could be a combination of these values obtained using bitwise 'OR' operator.
For example, if the provided value is 6, it matches applications with HealthState value of OK (2) and Warning (4).

- Default - Default value. Matches any HealthState. The value is zero.
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.


____
### ServiceFilters
__Type__: array of [ServiceHealthStateFilter](sfclient-model-servicehealthstatefilter.md) <br/>
__Required__: No<br/>
<br/>
Defines a list of filters that specify which services to be included in the returned cluster health chunk as children of the application. The services are returned only if the parent application matches a filter.
If the list is empty, no services are returned. All the services are used to evaluate the parent application aggregated health state, regardless of the input filters.
The application filter may specify multiple service filters.
For example, it can specify a filter to return all services with health state Error and another filter to always include a service identified by its service name.


____
### DeployedApplicationFilters
__Type__: array of [DeployedApplicationHealthStateFilter](sfclient-model-deployedapplicationhealthstatefilter.md) <br/>
__Required__: No<br/>
<br/>
Defines a list of filters that specify which deployed applications to be included in the returned cluster health chunk as children of the application. The deployed applications are returned only if the parent application matches a filter.
If the list is empty, no deployed applications are returned. All the deployed applications are used to evaluate the parent application aggregated health state, regardless of the input filters.
The application filter may specify multiple deployed application filters.
For example, it can specify a filter to return all deployed applications with health state Error and another filter to always include a deployed application on a specified node.

