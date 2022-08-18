---
title: "Create Backup Policy v82"
description: "Create Backup Policy v82"
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
# Create Backup Policy v82
Creates a backup policy.

Creates a backup policy which can be associated later with a Service Fabric application, service or a partition for periodic backup.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/BackupPolicies/$/Create?api-version=6.4&timeout={timeout}&ValidateConnection={ValidateConnection}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ValidateConnection`](#validateconnection) | boolean | No | Query |
| [`BackupPolicyDescription`](#backuppolicydescription) | [BackupPolicyDescription](sfclient-v82-model-backuppolicydescription.md) | Yes | Body |

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
### `ValidateConnection`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Specifies whether to validate the storage connection and credentials before creating or updating the backup policies.

____
### `BackupPolicyDescription`
__Type__: [BackupPolicyDescription](sfclient-v82-model-backuppolicydescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the backup policy.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | A successful operation returns 201 status code and creates a new backup policy.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Create a time based backup policy with Azure as backup location

This example shows how to create a backup policy which takes backup twice everyday at 9 AM and 5 PM UTC which shall get deleted after 3 months, with Azure blob store as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.4
```

##### Body
```json
{
  "Name": "DailyAzureBackupPolicy",
  "AutoRestoreOnDataLoss": false,
  "MaxIncrementalBackups": "3",
  "Schedule": {
    "ScheduleKind": "TimeBased",
    "ScheduleFrequencyType": "Daily",
    "RunTimes": [
      "0001-01-01T09:00:00Z",
      "0001-01-01T17:00:00Z"
    ]
  },
  "Storage": {
    "StorageKind": "AzureBlobStore",
    "FriendlyName": "Azure_storagesample",
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  },
  "RetentionPolicy": {
    "RetentionPolicyType": "Basic",
    "MinimumNumberOfBackups": "20",
    "RetentionDuration": "P3M"
  }
}
```

#### 201 Response
##### Body
The response body is empty.
### Create a time based backup policy with Azure as backup location accessed using managed identity

This example shows how to create a backup policy which takes backup twice everyday at 9 AM and 5 PM UTC which shall get deleted after 3 months, with Azure blob store as the backup location using managed identity.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.4
```

##### Body
```json
{
  "Name": "DailyAzureMIBackupPolicy",
  "AutoRestoreOnDataLoss": false,
  "MaxIncrementalBackups": "3",
  "Schedule": {
    "ScheduleKind": "TimeBased",
    "ScheduleFrequencyType": "Daily",
    "RunTimes": [
      "0001-01-01T09:00:00Z",
      "0001-01-01T17:00:00Z"
    ]
  },
  "Storage": {
    "StorageKind": "ManagedIdentityAzureBlobStore",
    "FriendlyName": "AzureMI_storagesample",
    "BlobServiceUri": "https://managedidentitytest.blob.core.windows.net/",
    "ContainerName": "BackupContainer",
    "ManagedIdentityType": "Cluster"
  },
  "RetentionPolicy": {
    "RetentionPolicyType": "Basic",
    "MinimumNumberOfBackups": "20",
    "RetentionDuration": "P3M"
  }
}
```

#### 201 Response
##### Body
The response body is empty.
### Create a frequency based backup policy with file share as backup location

This example shows how to create a backup policy which takes backup every 10 minutes which shall get deleted after 20 days, with file share as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.4
```

##### Body
```json
{
  "Name": "FileShare10MinBackupPolicy",
  "AutoRestoreOnDataLoss": false,
  "MaxIncrementalBackups": "3",
  "Schedule": {
    "ScheduleKind": "FrequencyBased",
    "Interval": "PT10M"
  },
  "Storage": {
    "StorageKind": "FileShare",
    "FriendlyName": "FileShare_myshare",
    "Path": "\\\\myshare\\backupshare",
    "PrimaryUserName": "backupaccount",
    "PrimaryPassword": "abcd1234"
  },
  "RetentionPolicy": {
    "RetentionPolicyType": "Basic",
    "MinimumNumberOfBackups": "20",
    "RetentionDuration": "P20D"
  }
}
```

#### 201 Response
##### Body
The response body is empty.
### Create a time based backup policy with Dsms Azure as backup location

This example shows how to create a backup policy which takes backup twice everyday at 9 AM and 5 PM UTC which shall get deleted after 3 months, with Dsms Azure blob store as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.4
```

##### Body
```json
{
  "Name": "SampleDsmsBackupPolicy",
  "AutoRestoreOnDataLoss": false,
  "MaxIncrementalBackups": "3",
  "Schedule": {
    "ScheduleKind": "TimeBased",
    "ScheduleFrequencyType": "Daily",
    "RunTimes": [
      "0001-01-01T09:00:00Z",
      "0001-01-01T17:00:00Z"
    ]
  },
  "Storage": {
    "StorageKind": "DsmsAzureBlobStore",
    "FriendlyName": "DsmsAzure_storagesample",
    "StorageCredentialsSourceLocation": "https://sample-dsms.dsms.core.winows.net/dsms/samplecredentiallocation/storageaccounts/samplestorageac/servicefabricbackup/samplebackup",
    "ContainerName": "BackupContainer"
  },
  "RetentionPolicy": {
    "RetentionPolicyType": "Basic",
    "MinimumNumberOfBackups": "20",
    "RetentionDuration": "P3M"
  }
}
```

#### 201 Response
##### Body
The response body is empty.