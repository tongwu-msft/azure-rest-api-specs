---
title: "Restart Replica"
ms.date: "2017-05-08"
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
# Restart Replica
Restarts a service replica of a persisted service running on a node.

Restarts a service replica of a persisted service running on a node. Warning - There are no safety checks performed when this API is used. Incorrect use of this API can lead to availability loss for stateful services.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/GetPartitions/{partitionId}/$/GetReplicas/{replicaId}/$/Restart?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [replicaId](#replicaid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### partitionId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### replicaId
__Type__: string <br/>
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
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code. A successful operation means that the restart command was received by the replica on the node and it is in the process of restarting.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
