---
title: "Delete Backup Policy"
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
# Delete Backup Policy
Deletes the backup policy.

Deletes an existing backup policy. A backup policy must be created before it can be deleted. A currently active backup policy, associated with any Service Fabric application, service or partition, cannot be deleted without first deleting the mapping.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/BackupPolicies/{backupPolicyName}/$/Delete?api-version=6.2-preview&timeout={timeout}` |


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
| 200 (OK) | A successful operation returns 200 status code and deletes the backup policy.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Delete backup policy

This example shows how to delete an existing backup policy which is currently not associated with any backup entity.

#### Request
```
POST http://localhost:19080/BackupRestore/BackupPolicies/SampleBackupPolicy/$/Delete?api-version=6.2-preview
```

#### 200 Response
##### Body
The response body is empty.