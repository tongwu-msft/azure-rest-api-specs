---
title: "Enable Partition Backup"
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
# Enable Partition Backup
Enables periodic backup of the stateful persisted partition.

Enables periodic backup of stateful persisted partition. Each partition is backed up as per the specified backup policy description. In case the application or service, which is partition is part of, is already enabled for backup then this operation would override the policy being used to take the periodic backup of this partition.
Note only C# based Reliable Actor and Reliable Stateful services are currently supported for periodic backup.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Partitions/{partitionId}/$/EnableBackup?api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`EnableBackupDescription`](#enablebackupdescription) | [EnableBackupDescription](sfclient-model-enablebackupdescription.md) | Yes | Body |

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

____
### `EnableBackupDescription`
__Type__: [EnableBackupDescription](sfclient-model-enablebackupdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the parameters for enabling backup.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the request to enable partition backup has been accepted.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Enable partition backup

This example shows how to enable periodic backup for a stateful partition.

#### Request
```
POST http://localhost:19080/Partitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/EnableBackup?api-version=6.2-preview
```

##### Body
```json
{
  "BackupPolicyName": "DailyAzureBackupPolicy"
}
```

#### 202 Response
##### Body
The response body is empty.