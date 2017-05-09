---
title: "Resolve Service"
ms.date: "2017-05-09"
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
# Resolve Service
Resolve a Service Fabric partition.

Resolve a Service Fabric service partition, to get the endpoints of the service replicas.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Services/{serviceId}/$/ResolvePartition?api-version=3.0&PartitionKeyType={PartitionKeyType}&PartitionKeyValue={PartitionKeyValue}&PreviousRspVersion={PreviousRspVersion}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [PartitionKeyType](#partitionkeytype) | integer | No | Query |
| [PartitionKeyValue](#partitionkeyvalue) | string | No | Query |
| [PreviousRspVersion](#previousrspversion) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### serviceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### PartitionKeyType
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Key type for the partition. This parameter is required if the partition scheme for the service is Int64Range or Named. The possible values are following.
- None (1) - Indicates that the the PartitionKeyValue parameter is not specified. This is valid for the partitions with partitioning scheme as Singleton. This is the default value. The value is 1.
- Int64Range (2) - Indicates that the the PartitionKeyValue parameter is an int64 partition key. This is valid for the partitions with partitioning scheme as Int64Range. The value is 2.
- Named (3) - Indicates that the the PartitionKeyValue parameter is a name of the partition. This is valid for the partitions with partitioning scheme as Named. The value is 3.


____
### PartitionKeyValue
__Type__: string <br/>
__Required__: No<br/>
<br/>
Partition key. This is required if the partition scheme for the service is Int64Range or Named.

____
### PreviousRspVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The value in the Version field of the response that was received previously. This is required if the user knows that the result that was got previously is stale.

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
| 200 (OK) | A successful operation will return 200 status code.<br/> | [ResolvedServicePartition](sfclient-model-resolvedservicepartition.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
