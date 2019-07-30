---
title: "Create Compose Deployment"
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
# Create Compose Deployment
Creates a Service Fabric compose deployment.

Compose is a file format that describes multi-container applications. This API allows deploying container based applications defined in compose format in a Service Fabric cluster. Once the deployment is created it's status can be tracked via `GetComposeDeploymentStatus` API.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/ComposeDeployments/$/Create?api-version=6.0-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`CreateComposeDeploymentDescription`](#createcomposedeploymentdescription) | [CreateComposeDeploymentDescription](sfclient-v62-model-createcomposedeploymentdescription.md) | Yes | Body |

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

____
### `CreateComposeDeploymentDescription`
__Type__: [CreateComposeDeploymentDescription](sfclient-v62-model-createcomposedeploymentdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the compose deployment that needs to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
