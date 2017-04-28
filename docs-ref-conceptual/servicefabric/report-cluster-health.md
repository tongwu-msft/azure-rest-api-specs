---
title: "Report Cluster Health"
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
# Report Cluster Health
Sends a health report on the Service Fabric cluster.

Sends a health report on a Service Fabric cluster. The report must contain the information about the source of the health report and property on which it is reported.
The report is sent to a Service Fabric gateway node, which forwards to the health store.
The report may be accepted by the gateway, but rejected by the health store after extra validation.
For example, the health store may reject the report because of an invalid parameter, like a stale sequence number.
To see whether the report was applied in the health store, run GetClusterHealth and check that the report appears in the HealthEvents section.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/ReportClusterHealth?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [HealthInformation](#healthinformation) | [HealthInformation](model-HealthInformation.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### HealthInformation
__Type__: [HealthInformation](model-HealthInformation.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the health information for the health report. This information needs to be present in all of the health reports sent to the health manager.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code when the cluster health report is accepted for processing.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
