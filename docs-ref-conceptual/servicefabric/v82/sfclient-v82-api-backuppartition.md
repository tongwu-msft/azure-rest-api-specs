---
title: "Backup Partition v82"
description: "Backup Partition v82"
ms.date: "04/02/2021"
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
# Backup Partition v82
Triggers backup of the partition's state.

Creates a backup of the stateful persisted partition's state. In case the partition is already being periodically backed up, then by default the new backup is created at the same backup storage. One can also override the same by specifying the backup storage details as part of the request body. Once the backup is initiated, its progress can be tracked using the GetBackupProgress operation. 
In case, the operation times out, specify a greater backup timeout value in the query parameter.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Partitions/{partitionId}/$/Backup?BackupTimeout={BackupTimeout}&api-version=6.4&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`BackupTimeout`](#backuptimeout) | integer | No | Query |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`BackupPartitionDescription`](#backuppartitiondescription) | [BackupPartitionDescription](sfclient-v82-model-backuppartitiondescription.md) | No | Body |

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `BackupTimeout`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `10` <br/>
<br/>
Specifies the maximum amount of time, in minutes, to wait for the backup operation to complete. Post that, the operation completes with timeout error. However, in certain corner cases it could be that though the operation returns back timeout, the backup actually goes through. In case of timeout error, its recommended to invoke this operation again with a greater timeout value. The default value for the same is 10 minutes.

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

____
### `BackupPartitionDescription`
__Type__: [BackupPartitionDescription](sfclient-v82-model-backuppartitiondescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters to backup the partition now. If not present, backup operation uses default parameters from the backup policy current associated with this partition.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the operation request was accepted and backup will be initiated. Use GetPartitionBackupProgress operation to get the status of the backup operation.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Backup partition

This example shows how to trigger backup of a partition now, which is already configured for periodic backups. The newly created backup will be saved at the same location where the periodic backups are being saved.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Backup?api-version=6.4
```

##### Body
```json
{}
```

#### 202 Response
##### Body
The response body is empty.
### Backup partition to a specific Azure storage account

This example shows how to trigger backup of a partition now, and save the backup to a specific Azure blob storage account.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Backup?api-version=6.4
```

##### Body
```json
{
  "BackupStorage": {
    "StorageKind": "AzureBlobStore",
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  }
}
```

#### 202 Response
##### Body
The response body is empty.
### Backup partition to a specific Azure storage location accessed using managed identity

This example shows how to trigger backup of a partition now, and save the backup to a specific Azure blob storage account using managed identity.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Backup?api-version=6.4
```

##### Body
```json
{
  "BackupStorage": {
    "StorageKind": "ManagedIdentityAzureBlobStore",
    "BlobServiceUri": "https://managedidentitytest.blob.core.windows.net/",
    "ContainerName": "BackupContainer",
    "ManagedIdentityType": "Cluster"
  }
}
```

#### 202 Response
##### Body
The response body is empty.
### Backup partition to a specific on-premise file share

This example shows how to trigger backup of a partition now, and save the backup to a specific file share accessible from all cluster nodes.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Backup?api-version=6.4
```

##### Body
```json
{
  "BackupStorage": {
    "StorageKind": "FileShare",
    "Path": "\\\\myshare\\backupshare",
    "PrimaryUserName": "mydomain\\backupaccount",
    "PrimaryPassword": "abcd1234"
  }
}
```

#### 202 Response
##### Body
The response body is empty.
### Backup partition to a specific Dsms Azure storage location

This example shows how to trigger backup of a partition now, and save the backup to a specific Dsms Azure blob storage location.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/Backup?api-version=6.4
```

##### Body
```json
{
  "BackupStorage": {
    "StorageKind": "DsmsAzureBlobStore",
    "StorageCredentialsSourceLocation": "https://sample-dsms.dsms.core.winows.net/dsms/samplecredentiallocation/storageaccounts/samplestorageac/servicefabricbackup/samplebackup",
    "ContainerName": "BackupContainer"
  }
}
```

#### 202 Response
##### Body
The response body is empty.