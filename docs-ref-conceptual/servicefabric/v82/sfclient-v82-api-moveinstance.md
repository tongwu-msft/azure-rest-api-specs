---
title: "Move Instance v82"
description: "Move Instance v82"
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
# Move Instance v82
Moves the instance of a partition of a stateless service.

This command moves the instance of a partition of a stateless service, respecting all constraints.
Partition id and service name must be specified to be able to move the instance.
CurrentNodeName when specified identifies the instance that is moved. If not specified, random instance will be moved 
New node name can be omitted, and in that case instance is moved to a random node.
If IgnoreConstraints parameter is specified and set to true, then instance will be moved regardless of the constraints.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/{serviceId}/$/GetPartitions/{partitionId}/$/MoveInstance?api-version=8.0&CurrentNodeName={CurrentNodeName}&NewNodeName={NewNodeName}&IgnoreConstraints={IgnoreConstraints}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`CurrentNodeName`](#currentnodename) | string | No | Query |
| [`NewNodeName`](#newnodename) | string | No | Query |
| [`IgnoreConstraints`](#ignoreconstraints) | boolean | No | Query |
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
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `8.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '8.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `CurrentNodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the source node for instance move. If not specified, instance is moved from a random node.

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
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
