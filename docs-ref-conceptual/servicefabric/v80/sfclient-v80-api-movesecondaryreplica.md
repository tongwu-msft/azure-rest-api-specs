---
title: "Move Secondary Replica"
description: "Move Secondary Replica"
ms.date: "04/02/2021"
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
# Move Secondary Replica
Moves the secondary replica of a partition of a stateful service.

This command moves the secondary replica of a partition of a stateful service, respecting all constraints.
CurrentNodeName parameter must be specified to identify the replica that is moved.
Source node name must be specified, but new node name can be omitted, and in that case replica is moved to a random node.
If IgnoreConstraints parameter is specified and set to true, then secondary will be moved regardless of the constraints.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Partitions/{partitionId}/$/MoveSecondaryReplica?api-version=6.5&CurrentNodeName={CurrentNodeName}&NewNodeName={NewNodeName}&IgnoreConstraints={IgnoreConstraints}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`CurrentNodeName`](#currentnodename) | string | Yes | Query |
| [`NewNodeName`](#newnodename) | string | No | Query |
| [`IgnoreConstraints`](#ignoreconstraints) | boolean | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

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
__Default__: `6.5` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.5'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `CurrentNodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the source node for secondary replica move.

____
### `NewNodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the target node for secondary replica or instance move. If not specified, replica or instance is moved to a random node.

____
### `IgnoreConstraints`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Ignore constraints when moving a replica or instance. If this parameter is not specified, all constraints are honored.

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
| 200 (OK) | A successful operation request will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v80-model-fabricerror.md) |
