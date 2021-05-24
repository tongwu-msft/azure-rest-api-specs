---
title: "Create Or Update"
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
# Create Or Update
Creates or updates a Application resource.

Creates a Application resource with the specified name, description and properties. If Application resource with the same name exists, then it is updated with the specified description and properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Applications/{applicationResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`applicationResourceDescription`](#applicationresourcedescription) | [ApplicationResourceDescription](sfclient-v64-model-applicationresourcedescription.md) | Yes | Body |

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


____
### `applicationResourceDescription`
__Type__: [ApplicationResourceDescription](sfclient-v64-model-applicationresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a Application resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ApplicationResourceDescription](sfclient-v64-model-applicationresourcedescription.md) |
| 201 (Created) | Created<br/> | [ApplicationResourceDescription](sfclient-v64-model-applicationresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-v64-model-fabricerror.md) |

## Examples

### CreateOrUpdateMeshApplication

This example shows how to create or update a application resource.

#### Request
```
PUT http://localhost:19080/Resources/Applications/sampleApplication?api-version=6.4-preview
```

##### Body
```json
{
  "name": "sampleApplication",
  "properties": {
    "description": "Service Fabric Mesh sample application.",
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
          "replicaCount": "1",
          "networkRefs": [
            {
              "name": "sampleNetwork",
              "endpointRefs": [
                {
                  "name": "helloWorldListener"
                }
              ]
            }
          ]
        }
      }
    ]
  }
}
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


#### 201 Response
##### Body
```json
{
  "name": "sampleApplication",
  "properties": {
    "description": "Service Fabric Mesh sample application.",
    "serviceNames": [
      "helloWorldService"
    ],
    "healthState": "Unknown",
    "status": "Creating"
  }
}
```


#### 202 Response
##### Body
The response body is empty.
### CreateOrUpdateMeshApplicationWithAutoScale

This example shows how to create or update a application resource with services that autoscale based on the policies.

#### Request
```
PUT http://localhost:19080/Resources/Applications/sampleApplication?api-version=6.4-preview
```

##### Body
```json
{
  "name": "sampleApplication",
  "properties": {
    "description": "Service Fabric Mesh sample application.",
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
          "replicaCount": "1",
          "autoScalingPolicies": [
            {
              "name": "MyAutoScaleRule",
              "trigger": {
                "kind": "AverageLoad",
                "metric": {
                  "kind": "Resource",
                  "name": "cpu"
                },
                "lowerLoadThreshold": "0.3",
                "upperLoadThreshold": "0.8",
                "scaleIntervalInSeconds": "3600"
              },
              "mechanism": {
                "kind": "AddRemoveReplica",
                "minCount": "1",
                "maxCount": "4",
                "scaleIncrement": "1"
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
          ]
        }
      }
    ]
  }
}
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


#### 201 Response
##### Body
```json
{
  "name": "sampleApplication",
  "properties": {
    "description": "Service Fabric Mesh sample application.",
    "serviceNames": [
      "helloWorldService"
    ],
    "healthState": "Unknown",
    "status": "Creating"
  }
}
```


#### 202 Response
##### Body
The response body is empty.