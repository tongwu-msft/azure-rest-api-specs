---
title: "Get"
ms.date: "04/15/2020"
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
# Get
Gets the Secret resource with the given name.

Gets the information about the Secret resource with the given name. The information include the description and other properties of the Secret.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Secrets/{secretResourceName}?api-version=6.4-preview` |


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
| 200 (OK) | OK<br/> | [SecretResourceDescription](sfclient-model-secretresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### GetSecretResource

This example shows how to get a secret resource. If the secret resource exists, its description is returned along with an OK (200) status code. If the secret resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Secrets/dbConnectionString?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "name": "dbConnectionString",
  "properties": {
    "kind": "inlinedValue",
    "contentType": "text/plain",
    "description": "Mongo DB connection string for backend database!",
    "status": "Ready"
  }
}
```

