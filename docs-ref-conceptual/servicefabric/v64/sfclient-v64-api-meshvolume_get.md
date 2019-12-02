---
title: "Get"
ms.date: 11/26/2018
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
Gets the Volume resource with the given name.

Gets the information about the Volume resource with the given name. The information include the description and other properties of the Volume.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Volumes/{volumeResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`volumeResourceName`](#volumeresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

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


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [VolumeResourceDescription](sfclient-v64-model-volumeresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### GetVolumeResource

This example shows how to get a volume resource. If the volume resource exists, its description is returned along with an OK (200) status code. If the volume resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Volumes/sampleVolume?api-version=6.4-preview
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

