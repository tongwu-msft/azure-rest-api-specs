---
title: "Start Node Transition"
ms.date: "2017-05-03"
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
# Start Node Transition
Starts or stops a cluster node.

Starts or stops a cluster node.  A cluster node is a process, not the OS instance itself.  To start a node, pass in "Start" for the NodeTransitionType parameter.      
To stop a node, pass in "Stop" for the NodeTransitionType parameter.  This API starts the operation - when the API returns the node may not have finished transitioning yet.
Call GetNodeTransitionProgress with the same OperationId to get the progress of the operation.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Faults/Nodes/{nodeName}/$/StartTransition/?api-version=3.0&OperationId={OperationId}&NodeTransitionType={NodeTransitionType}&NodeInstanceId={NodeInstanceId}&StopDurationInSeconds={StopDurationInSeconds}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [NodeTransitionType](#nodetransitiontype) | string (enum) | Yes | Query |
| [NodeInstanceId](#nodeinstanceid) | string | Yes | Query |
| [StopDurationInSeconds](#stopdurationinseconds) | integer (int32) | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### OperationId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
A GUID that identifies a call of this API.  This is passed into the corresponding GetProgress API

____
### NodeTransitionType
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
Indicates the type of transition to perform.  NodeTransitionType.Start will start a stopped node.  NodeTransitionType.Stop will stop a node that is up.      
  - Invalid - Reserved.  Do not pass into API.
  - Start - Transition a stopped node to up.
  - Stop - Transition an up node to stopped.
. Possible values include: 'Invalid', 'Start', 'Stop'

____
### NodeInstanceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The node instance ID of the target node.  This can be determined through GetNodeInfo API.

____
### StopDurationInSeconds
__Type__: integer (int32) <br/>
__Required__: Yes<br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The duration, in seconds, to keep the node stopped.  The minimum value is 600, the maximum is 14400.  After this time expires, the node will automatically come back up.

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
| 202 (Accepted) | A 202 status code indicates the operation was accepted.  Call the GetNodeTransitionProgress API to get the progress.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
