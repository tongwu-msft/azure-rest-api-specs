---
title: "Restore Partition"
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
# Restore Partition
Triggers restore of the state of the partition using the specified restore partition description.

Restores the state of a of the stateful persisted partition using the specified backup point. In case the partition is already being periodically backed up, then by default the backup point is looked for in the storage specified in backup policy. One can also override the same by specifying the backup storage details as part of the restore partition description in body. Once the restore is initiated, its progress can be tracked using the GetRestoreProgress operation. 
In case, the operation times out, specify a greater restore timeout value in the query parameter.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Partitions/{partitionId}/$/Restore?RestoreTimeout={RestoreTimeout}&api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`RestoreTimeout`](#restoretimeout) | integer | No | Query |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`RestorePartitionDescription`](#restorepartitiondescription) | [RestorePartitionDescription](sfclient-v62-model-restorepartitiondescription.md) | Yes | Body |

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `RestoreTimeout`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `10` <br/>
<br/>
Specifies the maximum amount of time to wait, in minutes, for the restore operation to complete. Post that, the operation returns back with timeout error. However, in certain corner cases it could be that the restore operation goes through even though it completes with timeout. In case of timeout error, its recommended to invoke this operation again with a greater timeout value. the default value for the same is 10 minutes.

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

____
### `RestorePartitionDescription`
__Type__: [RestorePartitionDescription](sfclient-v62-model-restorepartitiondescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the parameters to restore the partition.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the operation request was accepted and restore will be initiated. Use GetPartitionRestoreProgress operation to get the status of the restore operation.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Trigger partition restore

This example shows how to trigger restore of a partition now by specifying the backup to be used to restore.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Restore?api-version=6.2-preview
```

##### Body
```json
{
  "BackupId": "3a056ac9-7206-43c3-8424-6f6103003eba",
  "BackupStorage": {
    "StorageKind": "AzureBlobStore",
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  },
  "BackupLocation": "CalcApp\\CalcService\\1daae3f5-7fd6-42e9-b1ba-8c05f873994d\\2018-01-01 09.00.55.zip"
}
```

#### 202 Response
##### Body
The response body is empty.