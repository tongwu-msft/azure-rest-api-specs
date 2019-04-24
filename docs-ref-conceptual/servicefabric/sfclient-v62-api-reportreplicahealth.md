---
title: "Report Replica Health"
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
| POST | `/Partitions/{partitionId}/$/GetReplicas/{replicaId}/$/ReportHealth?api-version=6.0&ReplicaHealthReportServiceKind={ReplicaHealthReportServiceKind}&Immediate={Immediate}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`replicaId`](#replicaid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ReplicaHealthReportServiceKind`](#replicahealthreportservicekind) | string (enum) | Yes | Query |
| [`Immediate`](#immediate) | boolean | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`HealthInformation`](#healthinformation) | [HealthInformation](sfclient-v62-model-healthinformation.md) | Yes | Body |

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `replicaId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identifier of the replica.

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
### `ReplicaHealthReportServiceKind`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
__Default__: `Stateful` <br/>
<br/>
The kind of service replica (Stateless or Stateful) for which the health is being reported. Following are the possible values. Possible values include: 'Stateless', 'Stateful'

____
### `Immediate`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
A flag which indicates whether the report should be sent immediately.
A health report is sent to a Service Fabric gateway Application, which forwards to the health store.
If Immediate is set to true, the report is sent immediately from HTTP Gateway to the health store, regardless of the fabric client settings that the HTTP Gateway Application is using.
This is useful for critical reports that should be sent as soon as possible.
Depending on timing and other conditions, sending the report may still fail, for example if the HTTP Gateway is closed or the message doesn't reach the Gateway.
If Immediate is set to false, the report is sent based on the health client settings from the HTTP Gateway. Therefore, it will be batched according to the HealthReportSendInterval configuration.
This is the recommended setting because it allows the health client to optimize health reporting messages to health store as well as health report processing.
By default, reports are not sent immediately.


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
### `HealthInformation`
__Type__: [HealthInformation](sfclient-v62-model-healthinformation.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the health information for the health report. This information needs to be present in all of the health reports sent to the health manager.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
