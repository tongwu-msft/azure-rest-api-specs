---
title: "Create Volume Resource"
ms.date: "2018-07-20"
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
# Create Volume Resource
Creates or updates a volume resource.

Creates a volume resource with the specified name and description. If a volume with the same name already exists, then its description is updated to the one indicated in this request.


## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Volumes/{volumeResourceName}?api-version=6.3-preview` |


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
Service Fabric volume resource name.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.3-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.3-preview'.


____
### `volumeResourceDescription`
__Type__: [VolumeResourceDescription](sfclient-model-volumeresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a volume resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | Created<br/> |  |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateVolumeResource

This example shows how to create or update an volume resource.

#### Request
```
PUT http://localhost:19080/Resources/Volumes/meshDemoVolume?api-version=6.3-preview
```

##### Body
```json
{
  "volumeResourceName": "meshDemoVolume",
  "properties": {
    "description": "File share backed by Azure Files storage.",
    "provider": "SFAzureFile",
    "azureFileParameters": {
      "accountName": "sbzdemoaccount",
      "accountKey": "provide-account-key-here",
      "shareName": "sharel"
    }
  }
}
```

#### 201 Response
##### Body
The response body is empty.
#### 202 Response
##### Body
The response body is empty.