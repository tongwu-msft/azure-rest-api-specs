---
title: "Enable Application Backup"
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
# Enable Application Backup
Enables periodic backup of stateful partitions under this Service Fabric application.

Enables periodic backup of stateful partitions which are part of this Service Fabric application. Each partition is backed up individually as per the specified backup policy description. 
Note only C# based Reliable Actor and Reliable Stateful services are currently supported for periodic backup.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/EnableBackup?api-version=6.4&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`EnableBackupDescription`](#enablebackupdescription) | [EnableBackupDescription](sfclient-v64-model-enablebackupdescription.md) | Yes | Body |

____
### `applicationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the application name is "fabric:/myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


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
### `EnableBackupDescription`
__Type__: [EnableBackupDescription](sfclient-v64-model-enablebackupdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the parameters for enabling backup.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A 202 status code indicates the request to enable application backup has been accepted.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### Enable application backup

This example shows how to enable periodic backup for a stateful application.

#### Request
```
POST http://localhost:19080/Applications/CalcApp/$/EnableBackup?api-version=6.4
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