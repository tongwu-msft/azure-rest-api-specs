---
title: "Get Partition Restore Progress v82"
description: "Get Partition Restore Progress v82"
ms.date: "10/21/2020"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# Get Partition Restore Progress v82
Gets details for the latest restore operation triggered for this partition.

Returns information about the state of the latest restore operation along with details or failure reason in case of completion.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Partitions/{partitionId}/$/GetRestoreProgress?api-version=6.4&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation returns 200 status code and restore progress details.<br/> | [RestoreProgressInfo](sfclient-v82-model-restoreprogressinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Get restore operation progress

This shows an example of possible output when GetPartitionRestoreProgress has reached a RestoreState of Success.  If the RestoreState has a value of RestoreInProgress, only the RestoreState field will have a value.

#### Request
```
GET http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetRestoreProgress?api-version=6.4
```

#### 200 Response
##### Body
```json
{
  "RestoreState": "Success",
  "TimeStampUtc": "2018-01-01T09:00:55Z",
  "RestoredEpoch": {
    "DataLossVersion": "131462452931584510",
    "ConfigurationVersion": "8589934592"
  },
  "RestoredLsn": "261",
  "FailureError": null
}
```

