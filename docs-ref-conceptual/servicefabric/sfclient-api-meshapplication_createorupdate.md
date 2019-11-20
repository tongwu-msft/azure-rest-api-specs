---
title: "Create Or Update"
ms.date: 06/12/2019
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
| [`applicationResourceDescription`](#applicationresourcedescription) | [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) | Yes | Body |

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
__Type__: [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a Application resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) |
| 201 (Created) | Created<br/> | [ApplicationResourceDescription](sfclient-model-applicationresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

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
        "identityRefs": [
          {
            "name": "ServiceIdentity1",
            "identityRef": "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity1"
          },
          {
            "name": "ServiceIdentity2",
            "identityRef": "SystemAssigned"
          }
        ],
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
  },
  "identity": {
    "type": "SystemAssigned,UserAssigned",
    "tokenServiceEndpoint": "http://tokenservice",
    "tenantId": "D47A6CD5-E870-4ADF-8C00-1C0B758BC567",
    "principalId": "84DFA616-1F44-4D63-BC08-43B5F758D16C",
    "userAssignedIdentities": {
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity1": {
        "clientId": "5287A675-78D2-4E49-BF09-D3BFE02493D4",
        "principalId": "7D6F0B1C-AF9F-4E21-9B3C-AE22F4D926F8"
      },
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity2": {
        "clientId": "AF1509EC-9B5F-43CC-8A6F-FA7CC84AEBE1",
        "principalId": "31144ACF-46F4-4639-A711-A257229EE0C0"
      }
    }
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
  },
  "identity": {
    "type": "SystemAssigned,UserAssigned",
    "tokenServiceEndpoint": "http://tokenservice",
    "tenantId": "D47A6CD5-E870-4ADF-8C00-1C0B758BC567",
    "principalId": "84DFA616-1F44-4D63-BC08-43B5F758D16C",
    "userAssignedIdentities": {
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity1": {
        "clientId": "5287A675-78D2-4E49-BF09-D3BFE02493D4",
        "principalId": "7D6F0B1C-AF9F-4E21-9B3C-AE22F4D926F8"
      },
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity2": {
        "clientId": "AF1509EC-9B5F-43CC-8A6F-FA7CC84AEBE1",
        "principalId": "31144ACF-46F4-4639-A711-A257229EE0C0"
      }
    }
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