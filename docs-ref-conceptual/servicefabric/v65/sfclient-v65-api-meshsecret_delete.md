---
title: "Delete"
ms.date: 06/12/2019
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
# Delete
Deletes the Secret resource.

Deletes the specified Secret resource and all of its named values.

## Request
| Method | Request URI |
| ------ | ----------- |
| DELETE | `/Resources/Secrets/{secretResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`secretResourceName`](#secretresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `secretResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the secret resource.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> |  |
| 202 (Accepted) | Accepted<br/> |  |
| 204 (NoContent) | No Content - the specified secret was not found.<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-v65-model-fabricerror.md) |

## Examples

### DeleteSecretResource

This example shows how to delete an existing secret resource. If the secret resource exists and is deleted successfully, an empty response with 200 status code is returned. If the secret resource does not exist, an empty response with 204 status code is returned.

#### Request
```
DELETE http://localhost:19080/Resources/Secrets/dbConnectionString?api-version=6.4-preview
```

#### 200 Response
##### Body
The response body is empty.
#### 202 Response
##### Body
The response body is empty.
#### 204 Response
##### Body
The response body is empty.