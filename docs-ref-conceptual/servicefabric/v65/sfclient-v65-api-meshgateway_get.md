---
title: "Get"
ms.date: 06/12/2019
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
# Get
Gets the Gateway resource with the given name.

Gets the information about the Gateway resource with the given name. The information include the description and other properties of the Gateway.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Gateways/{gatewayResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`gatewayResourceName`](#gatewayresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

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


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [GatewayResourceDescription](sfclient-v65-model-gatewayresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v65-model-fabricerror.md) |

## Examples

### GetGatewayResource

This example shows how to get a gateway resource. If the gateway resource exists, its description is returned along with an OK (200) status code. If the gateway resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Gateways/sampleGateway?api-version=6.4-preview
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

