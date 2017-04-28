---
title: "Register Application Type"
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
# Register Application Type
Provisions or registers a Service Fabric application type with the cluster.

Provisions or registers a Service Fabric application type with the cluster. This is required before any new applications can be instantiated.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/ApplicationTypes/$/Provision?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationTypeImageStorePath](#applicationtypeimagestorepath) | [ApplicationTypeImageStorePath](model-ApplicationTypeImageStorePath.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ApplicationTypeImageStorePath
__Type__: [ApplicationTypeImageStorePath](model-ApplicationTypeImageStorePath.md) <br/>
__Required__: Yes<br/>
<br/>
The relative path for the application package in the image store specified during the prior copy operation.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful provision will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
