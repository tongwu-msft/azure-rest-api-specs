---
title: "Update Service"
ms.date: "2017-05-09"
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
# Update Service
Updates the specified service using the given update description.

Updates the specified service using the given update description.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/{serviceId}/$/Update?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ServiceUpdateDescription](#serviceupdatedescription) | [ServiceUpdateDescription](sfclient-model-serviceupdatedescription.md) | Yes | Body |

____
### serviceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.

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
### ServiceUpdateDescription
__Type__: [ServiceUpdateDescription](sfclient-model-serviceupdatedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The updated configuration for the service.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
