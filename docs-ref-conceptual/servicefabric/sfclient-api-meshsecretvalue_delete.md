---
title: "Delete"
ms.date: "11/23/2019"
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
Deletes the specified  value of the named secret resource.

Deletes the secret value resource identified by the name. The name of the resource is typically the version associated with that value. Deletion will fail if the specified value is in use.


## Request
| Method | Request URI |
| ------ | ----------- |
| DELETE | `/Resources/Secrets/{secretResourceName}/values/{secretValueResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`secretResourceName`](#secretresourcename) | string | Yes | Path |
| [`secretValueResourceName`](#secretvalueresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `secretResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the secret resource.

____
### `secretValueResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the secret resource value which is typically the version identifier for the value.

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
| 204 (NoContent) | No Content - the specified secret value was not found.<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### DeleteSecretValue

This example shows how to delete a secret value. If the specified named value exists and is deleted successfully, an empty response with 200 status code is returned. If the specified named value does not exist, an empty response with 204 status code is returned.

#### Request
```
DELETE http://localhost:19080/Resources/Secrets/dbConnectionString/values/v1?api-version=6.4-preview
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