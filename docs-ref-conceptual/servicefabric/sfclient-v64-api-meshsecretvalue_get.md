---
title: "Get"
ms.date: 11/26/2018
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
# Get
Gets the specified secret value resource.

Get the information about the specified named secret value resources. The information does not include the actual value of the secret.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Secrets/{secretResourceName}/values/{secretValueResourceName}?api-version=6.4-preview` |


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
| 200 (OK) | OK<br/> | [SecretValueResourceDescription](sfclient-v64-model-secretvalueresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### GetMeshSecretValue

This example shows how to get the specified secret value resource. If the specified named value exists, its information is returned along with status code 200. The information does not include the value. To get the unecnrypted value use ListMeshSecretValue operation. If the specified named value does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Secrets/dbConnectionString/values/v1?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "name": "v1",
  "properties": {
    "value": null
  }
}
```

