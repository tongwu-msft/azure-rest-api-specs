---
title: "Get Deployed Service Replica Detail Info"
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
# Get Deployed Service Replica Detail Info
Gets the details of replica deployed on a Service Fabric node.

Gets the details of the replica deployed on a Service Fabric node. The information include service kind, service name, current service operation, current service operation start date time, partition id, replica/instance id, reported load and other information.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetPartitions/{partitionId}/$/GetReplicas/{replicaId}/$/GetDetail?api-version=3.0&timeout={timeout}` |


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
| 200 (OK) | A successful operation will return 200 status code and the list of deployed service replica information.<br/> | [DeployedServiceReplicaDetailInfo](sfclient-model-deployedservicereplicadetailinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
