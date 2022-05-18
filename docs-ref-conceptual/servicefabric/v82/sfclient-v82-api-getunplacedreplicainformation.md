---
title: "Get Unplaced Replica Information v82"
description: "Get Unplaced Replica Information v82"
ms.date: "10/21/2020"
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
# Get Unplaced Replica Information v82
Gets the information about unplaced replica of the service.

Returns the information about the unplaced replicas of the service.
If PartitionId is specified, then result will contain information only about unplaced replicas for that partition.
If PartitionId is not specified, then result will contain information about unplaced replicas for all partitions of that service.
If OnlyQueryPrimaries is set to true, then result will contain information only about primary replicas, and will ignore unplaced secondary replicas.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Services/{serviceId}/$/GetUnplacedReplicaInformation?api-version=6.4&PartitionId={PartitionId}&OnlyQueryPrimaries={OnlyQueryPrimaries}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`PartitionId`](#partitionid) | string (uuid) | No | Query |
| [`OnlyQueryPrimaries`](#onlyqueryprimaries) | boolean | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This ID is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The identity of the partition.

____
### `OnlyQueryPrimaries`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Indicates that unplaced replica information will be queries only for primary replicas.

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
| 200 (OK) | Information about the specified service.<br/> | [UnplacedReplicaInformation](sfclient-v82-model-unplacedreplicainformation.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
