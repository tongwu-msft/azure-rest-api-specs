---
title: "Get Backup Policy By Name"
ms.date: 11/26/2018
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
# Get Backup Policy By Name
Gets a particular backup policy by name.

Gets a particular backup policy identified by {backupPolicyName}


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/BackupRestore/BackupPolicies/{backupPolicyName}?api-version=6.4&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`backupPolicyName`](#backuppolicyname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the backup policy description.<br/> | [BackupPolicyDescription](sfclient-v64-model-backuppolicydescription.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### Get backup policy by name

This example shows how to query a backup policy by name.

#### Request
```
GET http://localhost:19080/BackupRestore/BackupPolicies/DailyAzureBackupPolicy?api-version=6.4
```

#### 200 Response
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
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  },
  "RetentionPolicy": {
    "RetentionPolicyType": "Basic",
    "MinimumNumberOfBackups": "20",
    "RetentionDuration": "P20D"
  }
}
```

