---
title: "Recover Service Partitions"
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
# Recover Service Partitions
Indicates to the Service Fabric cluster that it should attempt to recover the specified service which is currently stuck in quorum loss.

Indicates to the Service Fabric cluster that it should attempt to recover the specified service which is currently stuck in quorum loss. This operation should only be performed if it is known that the replicas that are down cannot be recovered. Incorrect use of this API can cause potential data loss.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/$/{service-name}/$/GetPartitions/$/Recover?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [service-name](#service-name) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### service-name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the target service.

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
| 200 (OK) | A successful operation request will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
