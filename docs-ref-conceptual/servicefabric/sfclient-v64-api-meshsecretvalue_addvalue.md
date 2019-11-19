---
title: "Add Value"
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
# Add Value
Adds the specified value as a new version of the specified secret resource.

Creates a new value of the specified secret resource. The name of the value is typically the version identifier. Once created the value cannot be changed.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Secrets/{secretResourceName}/values/{secretValueResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`secretResourceName`](#secretresourcename) | string | Yes | Path |
| [`secretValueResourceName`](#secretvalueresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`secretValueResourceDescription`](#secretvalueresourcedescription) | [SecretValueResourceDescription](sfclient-v64-model-secretvalueresourcedescription.md) | Yes | Body |

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


____
### `secretValueResourceDescription`
__Type__: [SecretValueResourceDescription](sfclient-v64-model-secretvalueresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a value of a secret resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [SecretValueResourceDescription](sfclient-v64-model-secretvalueresourcedescription.md) |
| 201 (Created) | Created<br/> | [SecretValueResourceDescription](sfclient-v64-model-secretvalueresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### CreateMeshSecretValue

This example shows how to add a new value of a secret resource; the secret value is provided as plaintext.

#### Request
```
PUT http://localhost:19080/Resources/Secrets/dbConnectionString/values/v1?api-version=6.4-preview
```

##### Body
```json
{
  "name": "v1",
  "properties": {
    "value": "mongodb://contoso123:0Fc3IolnL12312asdfawejunASDF@asdfYXX2t8a97kghVcUzcDv98hawelufhawefafnoQRGwNj2nMPL1Y9qsIr9Srdw==@contoso123.documents.azure.com:10255/mydatabase?ssl=true"
  }
}
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


#### 201 Response
##### Body
```json
{
  "name": "v1",
  "properties": {
    "value": null
  }
}
```


#### 202 Response
##### Body
The response body is empty.