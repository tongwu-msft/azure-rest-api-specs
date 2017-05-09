---
title: "List"
ms.date: "2017-05-08"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# List
Lists all of the available ServiceFabric Resource Manager REST API operations.



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
The version of the ServiceFabric resouce provider api

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK. The request has succeeded.<br/> | [OperationListResult](sfrp-model-operationlistresult.md) |
| All other status codes | Error response describing why the operation failed.<br/> | [ErrorModel](sfrp-model-errormodel.md) |
