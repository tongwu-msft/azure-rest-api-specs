---
title: "Get Compose Deployment Upgrade Progress"
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
# Get Compose Deployment Upgrade Progress
Gets details for the latest upgrade performed on this Service Fabric compose deployment.

Returns the information about the state of the compose deployment upgrade along with details to aid debugging application health issues.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ComposeDeployments/{deploymentName}/$/GetUpgradeProgress?api-version=6.0-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`deploymentName`](#deploymentname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `deploymentName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the deployment.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '"6.0-preview'.

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
| 200 (OK) | Details about the compose deployment upgrade.<br/> | [ComposeDeploymentUpgradeProgressInfo](sfclient-model-composedeploymentupgradeprogressinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
