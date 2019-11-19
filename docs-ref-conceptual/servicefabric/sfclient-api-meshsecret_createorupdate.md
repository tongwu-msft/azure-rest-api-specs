---
title: "Create Or Update"
ms.date: 06/12/2019
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
# Create Or Update
Creates or updates a Secret resource.

Creates a Secret resource with the specified name, description and properties. If Secret resource with the same name exists, then it is updated with the specified description and properties. Once created, the kind and contentType of a secret resource cannot be updated.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Secrets/{secretResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`secretResourceName`](#secretresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`secretResourceDescription`](#secretresourcedescription) | [SecretResourceDescription](sfclient-model-secretresourcedescription.md) | Yes | Body |

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


____
### `secretResourceDescription`
__Type__: [SecretResourceDescription](sfclient-model-secretresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a secret resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [SecretResourceDescription](sfclient-model-secretresourcedescription.md) |
| 201 (Created) | Created<br/> | [SecretResourceDescription](sfclient-model-secretresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateMeshSecret

This example shows how to create or update a secret resource.

#### Request
```
PUT http://localhost:19080/Resources/Secrets/dbConnectionString?api-version=6.4-preview
```

##### Body
```json
{
  "name": "dbConnectionString",
  "properties": {
    "kind": "inlinedValue",
    "contentType": "text/plain",
    "description": "Mongo DB connection string for backend database!"
  }
}
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


#### 201 Response
##### Body
```json
{
  "name": "dbConnectionString",
  "properties": {
    "kind": "inlinedValue",
    "contentType": "text/plain",
    "description": "Mongo DB connection string for backend database!",
    "status": "Creating"
  }
}
```


#### 202 Response
##### Body
The response body is empty.