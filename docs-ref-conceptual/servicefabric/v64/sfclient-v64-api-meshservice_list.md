---
title: "List"
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
# List
Lists all the service resources.

Gets the information about all services of an application resource. The information include the description and other properties of the Service.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/Services?api-version=6.4-preview` |


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
| 200 (OK) | OK<br/> | [PagedServiceResourceDescriptionList](sfclient-v64-model-pagedserviceresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### ListMeshServices

This example shows how to list all service resources for a given application.

#### Request
```
GET http://localhost:19080/Resources/Applications/sampleApplication/Services?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
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
  ]
}
```

