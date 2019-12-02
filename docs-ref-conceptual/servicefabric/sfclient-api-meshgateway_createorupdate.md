---
title: "Create Or Update"
ms.date: "11/23/2019"
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
Creates or updates a Gateway resource.

Creates a Gateway resource with the specified name, description and properties. If Gateway resource with the same name exists, then it is updated with the specified description and properties. Use Gateway resource to provide public connectivity to application services.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Resources/Gateways/{gatewayResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`gatewayResourceName`](#gatewayresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`gatewayResourceDescription`](#gatewayresourcedescription) | [GatewayResourceDescription](sfclient-model-gatewayresourcedescription.md) | Yes | Body |

____
### `gatewayResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the gateway.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


____
### `gatewayResourceDescription`
__Type__: [GatewayResourceDescription](sfclient-model-gatewayresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a Gateway resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [GatewayResourceDescription](sfclient-model-gatewayresourcedescription.md) |
| 201 (Created) | Created<br/> | [GatewayResourceDescription](sfclient-model-gatewayresourcedescription.md) |
| 202 (Accepted) | Accepted<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### CreateOrUpdateMeshGateway

This example shows how to create or update a gateway resource.

#### Request
```
PUT http://localhost:19080/Resources/Gateways/sampleGateway?api-version=6.4-preview
```

##### Body
```json
{
  "name": "sampleGateway",
  "properties": {
    "description": "Service Fabric Mesh sample gateway.",
    "sourceNetwork": {
      "name": "Open"
    },
    "destinationNetwork": {
      "name": "helloWorldNetwork"
    },
    "tcp": [
      {
        "name": "web",
        "port": "80",
        "destination": {
          "applicationName": "helloWorldApp",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      }
    ],
    "http": [
      {
        "name": "contosoWebsite",
        "port": "8081",
        "hosts": [
          {
            "name": "contoso.com",
            "routes": [
              {
                "name": "index",
                "match": {
                  "path": {
                    "value": "/index",
                    "rewrite": "/",
                    "type": "prefix"
                  },
                  "headers": [
                    {
                      "name": "accept",
                      "value": "application/json",
                      "type": "exact"
                    }
                  ]
                },
                "destination": {
                  "applicationName": "httpHelloWorldApp",
                  "serviceName": "indexService",
                  "endpointName": "indexHttpEndpoint"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
```

#### 200 Response
##### Body
```json
{
  "name": "sampleGateway",
  "properties": {
    "description": "Service Fabric Mesh sample gateway.",
    "sourceNetwork": {
      "name": "Open"
    },
    "destinationNetwork": {
      "name": "helloWorldNetwork"
    },
    "tcp": [
      {
        "name": "web",
        "port": "80",
        "destination": {
          "applicationName": "helloWorldApp",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      }
    ],
    "http": [
      {
        "name": "contosoWebsite",
        "port": "8081",
        "hosts": [
          {
            "name": "contoso.com",
            "routes": [
              {
                "name": "index",
                "match": {
                  "path": {
                    "value": "/index",
                    "rewrite": "/",
                    "type": "prefix"
                  },
                  "headers": [
                    {
                      "name": "accept",
                      "value": "application/json",
                      "type": "exact"
                    }
                  ]
                },
                "destination": {
                  "applicationName": "httpHelloWorldApp",
                  "serviceName": "indexService",
                  "endpointName": "indexHttpEndpoint"
                }
              }
            ]
          }
        ]
      }
    ],
    "status": "Ready",
    "ipAddress": "192.168.1.1"
  }
}
```


#### 201 Response
##### Body
```json
{
  "name": "sampleGateway",
  "properties": {
    "description": "Service Fabric Mesh Hello World sample gateway.",
    "sourceNetwork": {
      "name": "Open"
    },
    "destinationNetwork": {
      "name": "helloWorldNetwork"
    },
    "tcp": [
      {
        "name": "web",
        "port": "80",
        "destination": {
          "applicationName": "helloWorldApp",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      }
    ],
    "http": [
      {
        "name": "contosoWebsite",
        "port": "8081",
        "hosts": [
          {
            "name": "contoso.com",
            "routes": [
              {
                "name": "index",
                "match": {
                  "path": {
                    "value": "/index",
                    "rewrite": "/",
                    "type": "prefix"
                  },
                  "headers": [
                    {
                      "name": "accept",
                      "value": "application/json",
                      "type": "exact"
                    }
                  ]
                },
                "destination": {
                  "applicationName": "httpHelloWorldApp",
                  "serviceName": "indexService",
                  "endpointName": "indexHttpEndpoint"
                }
              }
            ]
          }
        ]
      }
    ],
    "status": "Creating",
    "ipAddress": ""
  }
}
```


#### 202 Response
##### Body
The response body is empty.