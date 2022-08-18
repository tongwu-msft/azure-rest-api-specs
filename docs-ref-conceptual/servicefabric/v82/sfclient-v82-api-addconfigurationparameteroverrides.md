---
title: "Add Configuration Parameter Overrides v82"
description: "Add Configuration Parameter Overrides v82"
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
# Add Configuration Parameter Overrides v82
Adds the list of configuration overrides on the specified node.

This api allows adding all existing configuration overrides on the specified node.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/AddConfigurationParameterOverrides?api-version=7.0&Force={Force}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`Force`](#force) | boolean | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ConfigParameterOverrideList`](#configparameteroverridelist) | array of [ConfigParameterOverride](sfclient-v82-model-configparameteroverride.md) | Yes | Body |

____
### `nodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `7.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '7.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `Force`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Force adding configuration overrides on specified nodes.

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
### `ConfigParameterOverrideList`
__Type__: array of [ConfigParameterOverride](sfclient-v82-model-configparameteroverride.md) <br/>
__Required__: Yes<br/>
<br/>
Description for adding list of configuration overrides.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
