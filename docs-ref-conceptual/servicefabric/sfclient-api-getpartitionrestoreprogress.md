---
title: "Get Partition Restore Progress"
ms.date: "2018-04-23"
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
# Get Partition Restore Progress
Gets details for the latest restore operation triggered for this partition.

Returns information about the state of the latest restore operation along with details or failure reason in case of completion.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Partitions/{partitionId}/$/GetRestoreProgress?api-version=6.2-preview&timeout={timeout}` |


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
__Default__: `6.2-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2-preview'.


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
| 200 (OK) | A successful operation returns 200 status code and restore progress details.<br/> | [RestoreProgressInfo](sfclient-model-restoreprogressinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get restore operation progress

This shows an example of possible output when GetPartitionRestoreProgress has reached a RestoreState of Success.  If the RestoreState has a value of RestoreInProgress, only the RestoreState field will have a value.

#### Request
```
GET http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetRestoreProgress?api-version=6.2-preview
```

#### 200 Response
##### Body
```json
{
  "RestoreState": "Success",
  "TimeStampUtc": "2018-01-01T09:00:55Z",
  "RestoredEpoch": {
    "DataLossNumber": "131462452931584510",
    "ConfigurationNumber": "8589934592"
  },
  "RestoredLsn": "261",
  "FailureError": null
}
```

