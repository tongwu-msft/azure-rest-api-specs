---
title: "Validate Cluster Upgrade v82"
description: "Validate Cluster Upgrade v82"
ms.date: "10/20/2021"
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
# Validate Cluster Upgrade v82
Validate and assess the impact of a code or configuration version update of a Service Fabric cluster.

Validate the supplied upgrade parameters and assess the expected impact of a code or configuration version upgrade of a Service Fabric cluster. The upgrade will not be initiated.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/ValidateUpgrade?api-version=8.2&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`StartClusterUpgradeDescription`](#startclusterupgradedescription) | [StartClusterUpgradeDescription](sfclient-v82-model-startclusterupgradedescription.md) | Yes | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `8.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '8.2'.

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
### `StartClusterUpgradeDescription`
__Type__: [StartClusterUpgradeDescription](sfclient-v82-model-startclusterupgradedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the parameters for starting a cluster upgrade.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the cluster code or configuration upgrade has valid parameters. The response body describes the assessed expected impact of the upgrade.<br/> | [ValidateClusterUpgradeResult](sfclient-v82-model-validateclusterupgraderesult.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
