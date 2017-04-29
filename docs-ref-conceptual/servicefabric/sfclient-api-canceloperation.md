---
title: "Cancel Operation"
ms.date: "2017-04-29"
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
# Cancel Operation
Cancels a user-induced fault operation.

The following is a list of APIs that start fault operations that may be cancelled using CancelOperation -
- StartDataLoss
- StartQuorumLoss
- StartPartitionRestart
- StartNodeTransition

If force is false, then the specified user-induced operation will be gracefully stopped and cleaned up.  If force is true, the command will be aborted, and some internal state
may be left behind.  Specifying force as true should be used with care.  Calling this API with force set to true is not allowed until this API has already
been called on the same test command with force set to false first, or unless the test command already has an OperationState of OperationState.RollingBack.
Clarification: OperationState.RollingBack means that the system will/is be cleaning up internal system state caused by executing the command.  It will not restore data if the
test command was to cause data loss.  For example, if you call StartDataLoss then call this API, the system will only clean up internal state from running the command.  
It will not restore the target partition's data, if the command progressed far enough to cause data loss.

Important note:  if this API is invoked with force==true, internal state may be left behind. 


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Faults/$/Cancel?api-version=3.0&OperationId={OperationId}&Force={Force}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [Force](#force) | boolean | Yes | Query |

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
### Force
__Type__: boolean <br/>
__Required__: Yes<br/>
__Default__: false <br/>
<br/>
Indicates whether to gracefully rollback and clean up internal system state modified by executing the user-induced operation.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
