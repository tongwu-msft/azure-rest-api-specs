---
title: "Start Cluster Configuration Upgrade"
ms.date: "2017-05-06"
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
# Start Cluster Configuration Upgrade
Start upgrading the configuration of a Service Fabric standalone cluster.

Validate the supplied configuration upgrade parameters and start upgrading the cluster configuration if the parameters are valid.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/StartClusterConfigurationUpgrade?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ClusterConfigurationUpgradeDescription](#clusterconfigurationupgradedescription) | [ClusterConfigurationUpgradeDescription](sfclient-model-clusterconfigurationupgradedescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### ClusterConfigurationUpgradeDescription
__Type__: [ClusterConfigurationUpgradeDescription](sfclient-model-clusterconfigurationupgradedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the parameters for a standalone cluster configuration upgrade.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful response means that the cluster configuration upgrade has started. Use GetClusterConfigurationUpgradeStatus operation to get the status of the upgrade.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
