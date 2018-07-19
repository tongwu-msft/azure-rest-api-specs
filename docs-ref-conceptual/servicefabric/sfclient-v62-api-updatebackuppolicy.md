---
title: "Update Backup Policy"
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
# Update Backup Policy
Updates the backup policy.

Updates the backup policy identified by {backupPolicyName}


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/BackupPolicies/{backupPolicyName}/$/Update?api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`backupPolicyName`](#backuppolicyname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`BackupPolicyDescription`](#backuppolicydescription) | [BackupPolicyDescription](sfclient-v62-model-backuppolicydescription.md) | Yes | Body |

____
### `backupPolicyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the backup policy.

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
__Type__: [BackupPolicyDescription](sfclient-v62-model-backuppolicydescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the backup policy.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A sucessful operation resturns 200 status code and updates the backup policy description.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Update backup policy

This example shows how to update the schedule of a backup policy to take backup twice everyday at 9 AM and 5 PM UTC with Azure blob store as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/DailyAzureBackupPolicy/$/Update?api-version=6.2-preview
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

#### 200 Response
##### Body
The response body is empty.