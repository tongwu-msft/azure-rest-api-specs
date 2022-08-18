---
title: "Update Application v82"
description: "Update Application v82"
ms.date: "07/13/2021"
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
# Update Application v82
Updates a Service Fabric application.

Updates a Service Fabric application instance. The set of properties that can be updated are a subset of the properties that were specified at the time of creating the application.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/Update?api-version=8.1&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ApplicationUpdateDescription`](#applicationupdatedescription) | [ApplicationUpdateDescription](sfclient-v82-model-applicationupdatedescription.md) | Yes | Body |

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
__Default__: `8.1` <br/>
<br/>
The version of the API. This parameter is required and its value must be '8.1'.

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
### `ApplicationUpdateDescription`
__Type__: [ApplicationUpdateDescription](sfclient-v82-model-applicationupdatedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Parameters for updating an existing application instance.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the application instance was updated with the specified parameters.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
