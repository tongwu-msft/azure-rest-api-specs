---
title: "Start Data Loss"
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
# Start Data Loss
This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.

This API will induce data loss for the specified partition. It will trigger a call to the OnDataLoss API of the partition.
Actual data loss will depend on the specified DataLossMode
PartialDataLoss - Only a quorum of replicas are removed and OnDataLoss is triggered for the partition but actual data loss depends on the presence of in-flight replication.
FullDataLoss - All replicas are removed hence all data is lost and OnDataLoss is triggered.

This API should only be called with a stateful service as the target.

Calling this API with a system service as the target is not advised.

Note:  Once this API has been called, it cannot be reversed. Calling CancelOperation will only stop execution and clean up internal system state.
It will not restore data if the command has progressed far enough to cause data loss.

Call the GetDataLossProgress API with the same OperationId to return information on the operation started with this API.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/StartDataLoss?api-version=6.0&OperationId={OperationId}&DataLossMode={DataLossMode}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`OperationId`](#operationid) | string (uuid) | Yes | Query |
| [`DataLossMode`](#datalossmode) | string (enum) | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

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
### `OperationId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
A GUID that identifies a call of this API.  This is passed into the corresponding GetProgress API

____
### `DataLossMode`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
This enum is passed to the StartDataLoss API to indicate what type of data loss to induce. Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'

____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the operation was accepted.  Call the GetDataLossProgress API to get the progress.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
