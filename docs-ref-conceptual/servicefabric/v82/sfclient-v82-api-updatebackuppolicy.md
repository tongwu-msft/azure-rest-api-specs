---
title: "Update Backup Policy v82"
description: "Update Backup Policy v82"
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
# Update Backup Policy v82
Updates the backup policy.

Updates the backup policy identified by {backupPolicyName}


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/BackupPolicies/{backupPolicyName}/$/Update?api-version=6.4&timeout={timeout}&ValidateConnection={ValidateConnection}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`backupPolicyName`](#backuppolicyname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ValidateConnection`](#validateconnection) | boolean | No | Query |
| [`BackupPolicyDescription`](#backuppolicydescription) | [BackupPolicyDescription](sfclient-v82-model-backuppolicydescription.md) | Yes | Body |

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
| 200 (OK) | A successful operation returns 200 status code and updates the backup policy description.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Update backup policy

This example shows how to update the schedule of a backup policy to take backup twice everyday at 9 AM and 5 PM UTC which shall get deleted after 30 days, with Azure blob store as the backup location.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/DailyAzureBackupPolicy/$/Update?api-version=6.4
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
    "MinimumNumberOfBackups": "60",
    "RetentionDuration": "P30D"
  }
}
```

#### 200 Response
##### Body
The response body is empty.