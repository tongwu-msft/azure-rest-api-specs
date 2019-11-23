---
title: "List"
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
# List
Lists all the application resources.

Gets the information about all application resources in a given resource group. The information include the description and other properties of the Application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications?api-version=6.4-preview` |


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
| 200 (OK) | OK<br/> | [PagedApplicationResourceDescriptionList](sfclient-v64-model-pagedapplicationresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### ListMeshApplications

This example shows how to list all application resources.

#### Request
```
GET http://localhost:19080/Resources/Applications?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "name": "sampleApplication",
      "properties": {
        "description": "Service Fabric Mesh sample application.",
        "serviceNames": [
          "helloWorldService"
        ],
        "healthState": "Ok",
        "status": "Ready"
      }
    }
  ]
}
```

