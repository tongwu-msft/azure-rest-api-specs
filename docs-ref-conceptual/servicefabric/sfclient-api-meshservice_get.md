---
title: "Get"
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
Gets the Service resource with the given name.

Gets the information about the Service resource with the given name. The information include the description and other properties of the Service.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/Services/{serviceResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`serviceResourceName`](#serviceresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `serviceResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service.

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
| 200 (OK) | OK<br/> | [ServiceResourceDescription](sfclient-model-serviceresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### GetServiceResource

This example shows how to get a service resource for a given application. If the service resource exists, its description is returned along with an OK (200) status code. If the service resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Applications/sampleApplication/Services/helloWorldService?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "name": "helloWorldService",
  "properties": {
    "osType": "Linux",
    "codePackages": [
      {
        "name": "helloWorldCode",
        "image": "seabreeze/sbz-helloworld:1.0-alpine",
        "endpoints": [
          {
            "name": "helloWorldListener",
            "port": "80"
          }
        ],
        "resources": {
          "requests": {
            "memoryInGB": "1",
            "cpu": "1"
          }
        }
      }
    ],
    "networkRefs": [
      {
        "name": "sampleNetwork",
        "endpointRefs": [
          {
            "name": "helloWorldListener"
          }
        ]
      }
    ],
    "description": "SeaBreeze Hello World Service.",
    "replicaCount": "1",
    "healthState": "Ok",
    "status": "Ready"
  }
}
```

