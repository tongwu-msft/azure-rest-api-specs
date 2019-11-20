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
Creates or updates a Volume resource.

Creates a Volume resource with the specified name, description and properties. If Volume resource with the same name exists, then it is updated with the specified description and properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Volumes/{volumeResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`volumeResourceName`](#volumeresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`volumeResourceDescription`](#volumeresourcedescription) | [VolumeResourceDescription](sfclient-model-volumeresourcedescription.md) | Yes | Body |

____
### `volumeResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the volume.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


____
### `volumeResourceDescription`
__Type__: [VolumeResourceDescription](sfclient-model-volumeresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a Volume resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [VolumeResourceDescription](sfclient-model-volumeresourcedescription.md) |
| 201 (Created) | Created<br/> | [VolumeResourceDescription](sfclient-model-volumeresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateMeshVolume

This example shows how to create or update a volume resource.

#### Request
```
PUT http://localhost:19080/Resources/Volumes/sampleVolume?api-version=6.4-preview
```

##### Body
```json
{
  "properties": {
    "description": "Service Fabric Mesh sample volume.",
    "provider": "SFAzureFile",
    "azureFileParameters": {
      "accountName": "sbzdemoaccount",
      "accountKey": "provide-account-key-here",
      "shareName": "sharel"
    }
  }
}
```

#### 200 Response
##### Body
```json
{
  "name": "sampleVolume",
  "properties": {
    "description": "Service Fabric Mesh sample volume.",
    "provider": "SFAzureFile",
    "azureFileParameters": {
      "accountName": "sbzdemoaccount",
      "accountKey": null,
      "shareName": "sharel"
    },
    "status": "Ready"
  }
}
```


#### 201 Response
##### Body
```json
{
  "name": "sampleVolume",
  "properties": {
    "description": "Service Fabric Mesh Hello World sample volume.",
    "provider": "SFAzureFile",
    "azureFileParameters": {
      "accountName": "sbzdemoaccount",
      "accountKey": null,
      "shareName": "sharel"
    },
    "status": "Creating"
  }
}
```


#### 202 Response
##### Body
The response body is empty.