---
title: "Get Application Resource"
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
# Get Application Resource
Gets the application with the given name.

Gets the application with the given name. This includes the information about the application's services and other runtime information.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}?api-version=6.3-preview` |


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
Service Fabric application resource name.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.3-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.3-preview'.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### GetApplicationResource

This example shows how to get an application resource.

#### Request
```
GET http://localhost:19080/Resources/Applications/helloWorldApp?api-version=6.3-preview
```

#### 200 Response
##### Body
```json
{
  "name": "helloWorldApp",
  "properties": {
    "description": "SeaBreeze HelloWorld Application!",
    "healthState": "Ok",
    "serviceNames": [
      "helloWorldService"
    ],
    "status": "Ready"
  }
}
```

