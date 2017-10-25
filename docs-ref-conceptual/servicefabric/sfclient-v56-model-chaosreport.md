---
title: "ChaosReport"
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
# ChaosReport

Contains detailed Chaos report.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ChaosParameters](#chaosparameters) | [ChaosParameters](sfclient-v56-model-chaosparameters.md) | No |
| [Status](#status) | string (enum) | No |
| [ContinuationToken](#continuationtoken) | string | No |
| [History](#history) | array of [ChaosEventWrapper](sfclient-v56-model-chaoseventwrapper.md) | No |

____
### ChaosParameters
__Type__: [ChaosParameters](sfclient-v56-model-chaosparameters.md) <br/>
__Required__: No<br/>
<br/>
Defines all the parameters to configure a Chaos run.


____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Current status of the Chaos run.

- Invalid - Indicates an invalid Chaos status. All Service Fabric enumerations have the invalid type.
  The valus is zero.
- Running - Indicates that Chaos is not stopped.
- Stopped - Indicates that Chaos is not scheduling futher faults.

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token is not included in the response.

____
### History
__Type__: array of [ChaosEventWrapper](sfclient-v56-model-chaoseventwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of ChaosEvent's that meet the user-supplied criteria.
