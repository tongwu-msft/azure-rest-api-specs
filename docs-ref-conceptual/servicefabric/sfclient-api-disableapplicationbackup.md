---
title: "Disable Application Backup"
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
# Disable Application Backup
Disables periodic backup of Service Fabric application.

Disables periodic backup of Service Fabric application which was previously enabled.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/DisableBackup?api-version=6.2-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

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
| 202 (Accepted) | A 202 status code indicates the request to disable application backup has been accepted.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Disable application backup

This example shows how to disable periodic backup for a stateful application which was previously enabled.

#### Request
```
POST http://localhost:19080/Applications/CalcApp/$/DisableBackup?api-version=6.2-preview
```

#### 202 Response
##### Body
The response body is empty.