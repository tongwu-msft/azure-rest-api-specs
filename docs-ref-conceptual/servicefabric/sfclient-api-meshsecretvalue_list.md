---
title: "List"
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
# List
List names of all values of the specified secret resource.

Gets information about all secret value resources of the specified secret resource. The information includes the names of the secret value resources, but not the actual values.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Secrets/{secretResourceName}/values?api-version=6.4-preview` |


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
| 200 (OK) | OK<br/> | [PagedSecretValueResourceDescriptionList](sfclient-model-pagedsecretvalueresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### ListMeshSecretValues

This example shows how to list names of all values of a secret resource, not including their respective values.

#### Request
```
GET http://localhost:19080/Resources/Secrets/dbConnectionString/values?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "name": "v1",
      "properties": {
        "value": null
      }
    },
    {
      "name": "v2",
      "properties": {
        "value": null
      }
    }
  ]
}
```

