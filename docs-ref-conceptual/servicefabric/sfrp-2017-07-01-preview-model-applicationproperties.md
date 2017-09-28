---
title: "ApplicationProperties"
ms.date: "2017-09-28"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ApplicationProperties

The application resource properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [typeVersion](#typeversion) | string | No |
| [parameters](#parameters) | array of [ApplicationParameter](sfrp-2017-07-01-preview-model-applicationparameter.md) | No |
| [upgradePolicy](#upgradepolicy) | [ApplicationUpgradePolicy](sfrp-2017-07-01-preview-model-applicationupgradepolicy.md) | No |
| [minimumNodes](#minimumnodes) | integer (int64) | No |
| [maximumNodes](#maximumnodes) | integer (int64) | No |
| [removeApplicationCapacity](#removeapplicationcapacity) | boolean | No |
| [metrics](#metrics) | array of [ApplicationMetricDescription](sfrp-2017-07-01-preview-model-applicationmetricdescription.md) | No |
| [provisioningState](#provisioningstate) | string | No |
| [typeName](#typename) | string | No |

____
### typeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### parameters
__Type__: array of [ApplicationParameter](sfrp-2017-07-01-preview-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application parameters with overridden values from their default values specified in the application manifest.

____
### upgradePolicy
__Type__: [ApplicationUpgradePolicy](sfrp-2017-07-01-preview-model-applicationupgradepolicy.md) <br/>
__Required__: No<br/>
<br/>
The application upgrade policy.

____
### minimumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The minimum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. If this property is set to zero, no capacity will be reserved. The value of this property cannot be more than the value of the MaximumNodes property.

____
### maximumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 0 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. By default, the value of this property is zero and it means that the services can be placed on any node.

____
### removeApplicationCapacity
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
The version of the application type

____
### metrics
__Type__: array of [ApplicationMetricDescription](sfrp-2017-07-01-preview-model-applicationmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
List of application capacity metric description.

____
### provisioningState
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current deployment or provisioning state, which only appears in the response

____
### typeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application type name as defined in the application manifest.
