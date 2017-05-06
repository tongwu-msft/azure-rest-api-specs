---
title: "DeployedServicePackageHealthStateFilter"
ms.date: "2017-05-06"
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
# DeployedServicePackageHealthStateFilter

Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.
The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.
One filter can match zero, one or multiple deployed service packages, depending on its properties.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceManifestNameFilter](#servicemanifestnamefilter) | string | No |
| [ServicePackageActivationIdFilter](#servicepackageactivationidfilter) | string | No |
| [HealthStateFilter](#healthstatefilter) | integer | No |

____
### ServiceManifestNameFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest which identifies the deployed service packages that matches the filter.
If specified, the filter is applied only to the specified deployed service packages, if any.
If no deployed service packages with specified manifest name exist, nothing is returned in the cluster health chunk based on this filter.
If any deployed service package exists, they are included in the cluster health chunk if it respects the other filter properties.
If not specified, all deployed service packages that match the parent filters (if any) are taken into consideration and matched against the other filter members, like health state filter.


____
### ServicePackageActivationIdFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The activation ID of a deployed service package that matches the filter.
If not specified, the filter applies to all deployed service packages that match the other parameters.
If specified, the filter matches only the deployed service package with the specified activation ID.


____
### HealthStateFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The filter for the health state of the deployed service packages. It allows selecting deployed service packages if they match the desired health states.
The possible values are integer value of one of the following health states. Only deployed service packages that match the filter are returned. All deployed service packages are used to evaluate the parent deployed application aggregated health state.
If not specified, default value is None, unless the deployed service package id is specified. If the filter has default value and deployed service package id is specified, the matching deployed service package is returned.
The state values are flag based enumeration, so the value could be a combination of these values obtained using bitwise 'OR' operator.
For example, if the provided value is 6, it matches deployed service packages with HealthState value of OK (2) and Warning (4).

- Default - Default value. Matches any HealthState. The value is zero.
- None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.
- Ok - Filter that matches input with HealthState value Ok. The value is 2.
- Warning - Filter that matches input with HealthState value Warning. The value is 4.
- Error - Filter that matches input with HealthState value Error. The value is 8.
- All - Filter that matches input with any HealthState value. The value is 65535.

