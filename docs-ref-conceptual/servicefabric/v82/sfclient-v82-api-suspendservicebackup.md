---
title: "Suspend Service Backup v82"
description: "Suspend Service Backup v82"
ms.date: "10/21/2020"
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
# Suspend Service Backup v82
Suspends periodic backup for the specified Service Fabric service.

The service which is configured to take periodic backups, is suspended for taking further backups till it is resumed again. This operation applies to the entire service's hierarchy. It means all the partitions under this service are now suspended for backup.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/{serviceId}/$/SuspendBackup?api-version=6.4&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This ID is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


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
| 202 (Accepted) | A 202 status code indicates the operation request was accepted and service backup will be suspended.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Suspend service backup

This example shows how to suspend backup for a stateful service which is configured for periodic backup.

#### Request
```
POST http://localhost:19080/Services/CalcApp/CalcService/$/SuspendBackup?api-version=6.4
```

#### 202 Response
##### Body
The response body is empty.