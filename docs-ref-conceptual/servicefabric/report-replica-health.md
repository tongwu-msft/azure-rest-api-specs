---
title: "Report Replica Health"
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
# Report Replica Health
Sends a health report on the Service Fabric replica.

Reports health state of the specified Service Fabric replica. The report must contain the information about the source of the health report and property on which it is reported.
The report is sent to a Service Fabric gateway Replica, which forwards to the health store.
The report may be accepted by the gateway, but rejected by the health store after extra validation.
For example, the health store may reject the report because of an invalid parameter, like a stale sequence number.
To see whether the report was applied in the health store, run GetReplicaHealth and check that the report appears in the HealthEvents section.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Partitions/{partitionId}/$/GetReplicas/{replicaId}/$/ReportHealth?api-version=3.0&ServiceKind={ServiceKind}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [replicaId](#replicaid) | string (int64) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ServiceKind](#servicekind) | string (enum) | Yes | Query |
| [HealthInformation](#healthinformation) | [HealthInformation](model-HealthInformation.md) | Yes | Body |

____
### partitionId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### replicaId
__Type__: string (int64) <br/>
__Required__: Yes<br/>
<br/>
The identifier of the replica.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ServiceKind
__Type__: string (enum) <br/>
__Required__: Yes<br/>
__Default__: Stateful <br/>
<br/>
The kind of service replica (Stateless or Stateful) for which the health is being reported. Following are the possible values.
- Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1
- Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.
. Possible values include: 'Stateless', 'Stateful'

____
### HealthInformation
__Type__: [HealthInformation](model-HealthInformation.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the health information for the health report. This information needs to be present in all of the health reports sent to the health manager.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
