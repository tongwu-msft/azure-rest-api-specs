---
title: "List"
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
# List
Lists all the volume resources.

Gets the information about all volume resources in a given resource group. The information include the description and other properties of the Volume.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Volumes?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |

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
| 200 (OK) | OK<br/> | [PagedVolumeResourceDescriptionList](sfclient-model-pagedvolumeresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### ListMeshVolumes

This example shows how to list all volume resources.

#### Request
```
GET http://localhost:19080/Resources/Volumes?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
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
  ]
}
```

