---
title: "Start Quorum Loss"
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
# Start Quorum Loss
Induces quorum loss for a given stateful service partition.

Induces quorum loss for a given stateful service partition.  This API is useful for a temporary quorum loss situation on your service.

Call the GetQuorumLossProgress API with the same OperationId to return information on the operation started with this API.

This can only be called on stateful persisted (HasPersistedState==true) services.  Do not use this API on stateless services or stateful in-memory only services.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/StartQuorumLoss?api-version=3.0&OperationId={OperationId}&QuorumLossMode={QuorumLossMode}&QuorumLossDuration={QuorumLossDuration}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [QuorumLossMode](#quorumlossmode) | string (enum) | Yes | Query |
| [QuorumLossDuration](#quorumlossduration) | integer | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### serviceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.

____
### partitionId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

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
### QuorumLossMode
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
This enum is passed to the StartQuorumLoss API to indicate what type of quorum loss to induce.
  - Invalid - Reserved.  Do not pass into API.
  - QuorumReplicas - Partial Quorum loss mode : Minimum number of replicas for a partition will be down that will cause a quorum loss.
  - AllReplicas- Full Quorum loss mode : All replicas for a partition will be down that will cause a quorum loss. 
. Possible values include: 'Invalid', 'QuorumReplicas', 'AllReplicas'

____
### QuorumLossDuration
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The amount of time for which the partition will be kept in quorum loss.  This must be specified in seconds.

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
| 202 (Accepted) | A 202 status code indicates the operation was accepted.  Call the GetQuorumLossProgress API to get the progress.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
