---
title: "Get Cluster Upgrade Progress"
ms.date: "2017-04-27"
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
# Get Cluster Upgrade Progress
Gets the progress of the current cluster upgrade.

Gets the current progress of the ongoing cluster upgrade. If no upgrade is currently in progress, gets the last state of the previous cluster upgrade.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetUpgradeProgress?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested cluster upgrade progress.<br/> | [ClusterUpgradeProgressObject](model-ClusterUpgradeProgressObject.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
