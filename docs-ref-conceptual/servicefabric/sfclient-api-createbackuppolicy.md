---
title: "Create Backup Policy"
ms.date: "2018-07-20"
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
# Create Backup Policy
Creates a backup policy.

Creates a backup policy which can be associated later with a Service Fabric application, service or a partition for periodic backup.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/BackupPolicies/$/Create?api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`BackupPolicyDescription`](#backuppolicydescription) | [BackupPolicyDescription](sfclient-model-backuppolicydescription.md) | Yes | Body |

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
### `BackupPolicyDescription`
__Type__: [BackupPolicyDescription](sfclient-model-backuppolicydescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the backup policy.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | A sucessful operation returns 201 status code and creates a new backup policy.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Create a time based backup policy with Azure as backup location

This example shows how to create a backup policy which takes backup twice everyday at 9 AM and 5 PM UTC with Azure blob store as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.2-preview
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
  }
}
```

#### 201 Response
##### Body
The response body is empty.
### Create a frequency based backup policy with file share as backup location

This example shows how to create a backup policy which takes backup every 10 minutes with file share as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/$/Create?api-version=6.2-preview
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
  }
}
```

#### 201 Response
##### Body
The response body is empty.