---
title: "Create Or Update"
ms.date: "11/23/2019"
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
# Create Or Update
Creates or updates a Network resource.

Creates a Network resource with the specified name, description and properties. If Network resource with the same name exists, then it is updated with the specified description and properties. Network resource provides connectivity between application services.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Networks/{networkResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`networkResourceName`](#networkresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`networkResourceDescription`](#networkresourcedescription) | [NetworkResourceDescription](sfclient-model-networkresourcedescription.md) | Yes | Body |

____
### `networkResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the network.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


____
### `networkResourceDescription`
__Type__: [NetworkResourceDescription](sfclient-model-networkresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a Network resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [NetworkResourceDescription](sfclient-model-networkresourcedescription.md) |
| 201 (Created) | Created<br/> | [NetworkResourceDescription](sfclient-model-networkresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateMeshNetwork

This example shows how to create or update a network resource.

#### Request
```
PUT http://localhost:19080/Resources/Networks/sampleNetwork?api-version=6.4-preview
```

##### Body
```json
{
  "name": "sampleNetwork",
  "properties": {
    "kind": "Local",
    "description": "Service Fabric Mesh sample network.",
    "networkAddressPrefix": "2.0.0.0/16"
  }
}
```

#### 200 Response
##### Body
```json
{
  "name": "sampleNetwork",
  "properties": {
    "kind": "Local",
    "description": "Service Fabric Mesh sample network.",
    "networkAddressPrefix": "2.0.0.0/16",
    "status": "Ready"
  }
}
```


#### 201 Response
##### Body
```json
{
  "name": "sampleNetwork",
  "properties": {
    "kind": "Local",
    "description": "Service Fabric Mesh sample network.",
    "networkAddressPrefix": "2.0.0.0/16",
    "status": "Creating"
  }
}
```


#### 202 Response
##### Body
The response body is empty.