---
title: "List"
description: "Get the list of available Service Fabric resource provider API operations. The api-version is the version of the Service Fabric resource provider API."
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# List
Lists all of the available Service Fabric resource provider API operations.

Get the list of available Service Fabric resource provider API operations.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/providers/Microsoft.ServiceFabric/operations?api-version={api-version}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the Service Fabric resouce provider API

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK. The request has succeeded.<br/> | [OperationListResult](sfrp-model-operationlistresult.md) |
| All other status codes | Error response describing why the operation failed.<br/> | [ErrorModel](sfrp-model-errormodel.md) |
