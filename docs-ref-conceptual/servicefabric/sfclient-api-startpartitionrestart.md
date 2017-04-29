---
title: "Start Partition Restart"
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
# Start Partition Restart
This API will restart some or all replicas or instances of the specified partition.

This API is useful for testing failover.
      
If used to target a stateless service partition, RestartPartitionMode must be AllReplicasOrInstances. 

Call the GetPartitionRestartProgress API using the same OperationId to get the progress.     


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/StartRestart?api-version=3.0&OperationId={OperationId}&RestartPartitionMode={RestartPartitionMode}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [RestartPartitionMode](#restartpartitionmode) | string (enum) | Yes | Query |

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
### RestartPartitionMode
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
- Invalid - Reserved.  Do not pass into API.
- AllReplicasOrInstances - All replicas or instances in the partition are restarted at once.
- OnlyActiveSecondaries - Only the secondary replicas are restarted. 
. Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the operation was accepted.  Call the GetPartitionRestartProgress API to get the progress.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
