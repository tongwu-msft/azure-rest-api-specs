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
Gets the Application resource with the given name.

Gets the information about the Application resource with the given name. The information include the description and other properties of the Application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

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
| 200 (OK) | OK<br/> | [ApplicationResourceDescription](sfclient-v64-model-applicationresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### GetApplicationResource

This example shows how to get a application resource. If the application resource exists, its description is returned along with an OK (200) status code. If the application resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Applications/sampleApplication?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
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
```

