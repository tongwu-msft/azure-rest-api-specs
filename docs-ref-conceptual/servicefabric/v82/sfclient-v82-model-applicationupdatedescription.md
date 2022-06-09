---
title: "ApplicationUpdateDescription v82"
description: "ApplicationUpdateDescription v82"
ms.date: "07/13/2021"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# ApplicationUpdateDescription v82

Describes the parameters for updating an application instance.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Flags`](#flags) | string | No |
| [`RemoveApplicationCapacity`](#removeapplicationcapacity) | boolean | No |
| [`MinimumNodes`](#minimumnodes) | integer (int64) | No |
| [`MaximumNodes`](#maximumnodes) | integer (int64) | No |
| [`ApplicationMetrics`](#applicationmetrics) | array of [ApplicationMetricDescription](sfclient-v82-model-applicationmetricdescription.md) | No |

____
### `Flags`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Flags indicating whether other properties are set. Each of the associated properties corresponds to a flag, specified below, which, if set, indicate that the property is specified.
If flags are not specified for a certain property, the property will not be updated even if the new value is provided.
This property can be a combination of those flags obtained using bitwise 'OR' operator. Exception is RemoveApplicationCapacity which cannot be specified along with other parameters.
For example, if the provided value is 3 then the flags for MinimumNodes (1) and MaximumNodes (2) are set.

- None - Does not indicate any other properties are set. The value is 0.
- MinimumNodes - Indicates whether the MinimumNodes property is set. The value is 1.
- MaximumNodes - Indicates whether the MinimumNodes property is set. The value is  2.
- ApplicationMetrics - Indicates whether the ApplicationMetrics property is set. The value is 4.


____
### `RemoveApplicationCapacity`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Used to clear all parameters related to Application Capacity for this application. |
It is not possible to specify this parameter together with other Application Capacity parameters.


____
### `MinimumNodes`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The minimum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. If this property is set to zero, no capacity will be reserved. The value of this property cannot be more than the value of the MaximumNodes property.

____
### `MaximumNodes`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. By default, the value of this property is zero and it means that the services can be placed on any node.

____
### `ApplicationMetrics`
__Type__: array of [ApplicationMetricDescription](sfclient-v82-model-applicationmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
List of application capacity metric description.
