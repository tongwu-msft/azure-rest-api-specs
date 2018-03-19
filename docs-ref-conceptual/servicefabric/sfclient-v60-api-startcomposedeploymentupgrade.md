---
title: "Start Compose Deployment Upgrade"
ms.date: "2017-10-02"
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
# Start Compose Deployment Upgrade
Starts upgrading a compose deployment in the Service Fabric cluster.

Validates the supplied upgrade parameters and starts upgrading the deployment if the parameters are valid.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/ComposeDeployments/{deploymentName}/$/Upgrade?api-version=6.0-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [deploymentName](#deploymentname) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ComposeDeploymentUpgradeDescription](#composedeploymentupgradedescription) | [ComposeDeploymentUpgradeDescription](sfclient-v60-model-composedeploymentupgradedescription.md) | Yes | Body |

____
### deploymentName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the deployment.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0-preview <br/>
<br/>
The version of the API. This is a required parameter and its value must be "6.0-preview".

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
### ComposeDeploymentUpgradeDescription
__Type__: [ComposeDeploymentUpgradeDescription](sfclient-v60-model-composedeploymentupgradedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Parameters for upgrading compose deployment.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful response means that the upgrade has started. Use GetComposeDeploymentUpgrade operation to get the status of the upgrade.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v60-model-fabricerror.md) |
