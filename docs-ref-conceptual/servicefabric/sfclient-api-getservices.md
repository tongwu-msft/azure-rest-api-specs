---
title: "Get Services"
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
# Get Services
Gets all the services in the application resource.

The operation returns the service descriptions of all the services in the application resource. 

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/Services?api-version=6.3-preview` |


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
| 200 (OK) | OK<br/> | [PagedServiceResourceDescriptionList](sfclient-model-pagedserviceresourcedescriptionlist.md) |


## Examples

### GetServices

This example shows how to list all services of a given application resource.

#### Request
```
GET http://localhost:19080/Resources/Applications/helloWorldApp/Services?api-version=6.3-preview
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
        "networkRefs": [],
        "description": "SeaBreeze Hello World Service.",
        "replicaCount": "1",
        "healthState": "Ok",
        "status": "Unknown"
      }
    }
  ]
}
```

