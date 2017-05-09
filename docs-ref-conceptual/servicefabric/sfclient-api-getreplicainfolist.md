---
title: "Get Replica Info List"
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
# Get Replica Info List
Gets the information about replicas of a Service Fabric service partition.

The GetReplicas endpoint returns information about the replicas of the specified partition. The respons include the id, role, status, health, node name, uptime, and other details about the replica.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Partitions/{partitionId}/$/GetReplicas?api-version=3.0&ContinuationToken={ContinuationToken}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

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
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

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
| 200 (OK) | Information about the replicas of the specified partition.<br/> | [PagedReplicaInfoList](sfclient-model-pagedreplicainfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
