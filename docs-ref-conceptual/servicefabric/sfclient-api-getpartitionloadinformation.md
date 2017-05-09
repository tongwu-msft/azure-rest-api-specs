---
title: "Get Partition Load Information"
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
# Get Partition Load Information
Gets the load of the specified Service Fabric partition.

Returns information about the specified partition. 
The response includes a list of load information. 
Each information includes load metric name, value and last reported time in UTC.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Partitions/{partitionId}/$/GetLoadInformation?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
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
| 200 (OK) | Information about the specified partition's last reported load metrics.<br/> | [PartitionLoadInformation](sfclient-model-partitionloadinformation.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
