---
title: "Start Data Loss"
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
| POST | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/StartDataLoss?api-version=3.0&OperationId={OperationId}&DataLossMode={DataLossMode}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [DataLossMode](#datalossmode) | string (enum) | Yes | Query |
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
### DataLossMode
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
This enum is passed to the StartDataLoss API to indicate what type of data loss to induce.
- Invalid - Reserved.  Do not pass into API.
- PartialDataLoss - PartialDataLoss option will cause a quorum of replicas to go down, triggering an OnDataLoss event in the system for the given partition. 
- FullDataLoss - FullDataLoss option will drop all the replicas which means that all the data will be lost. 
. Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'

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
| 202 (Accepted) | A 202 status code indicates the operation was accepted.  Call the GetDataLossProgress API to get the progress.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
