---
title: "Create Application Resource"
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
# Create Application Resource
Creates or updates an application resource.

Creates an application with the specified name and description. If an application with the same name already exists, then its description are updated to the one indicated in this request.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Applications/{applicationResourceName}?api-version=6.3-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`applicationResourceDescription`](#applicationresourcedescription) | [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) | Yes | Body |

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


____
### `applicationResourceDescription`
__Type__: [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating an application resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | Created<br/> |  |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateApplicationResource

This example shows how to create or update an application resource.

#### Request
```
PUT http://localhost:19080/Resources/Applications/helloWorldApp?api-version=6.3-preview
```

##### Body
```json
{
  "name": "helloWorldApp",
  "properties": {
    "description": "SeaBreeze HelloWorld Application!",
    "services": [
      {
        "name": "helloWorldService",
        "properties": {
          "description": "SeaBreeze Hello World Service.",
          "osType": "linux",
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
          "replicaCount": "1"
        }
      }
    ]
  }
}
```

#### 201 Response
##### Body
The response body is empty.
#### 202 Response
##### Body
The response body is empty.