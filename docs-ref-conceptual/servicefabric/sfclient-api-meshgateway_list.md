---
title: "List"
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
# List
Lists all the gateway resources.

Gets the information about all gateway resources in a given resource group. The information include the description and other properties of the Gateway.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Gateways?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |

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
| 200 (OK) | OK<br/> | [PagedGatewayResourceDescriptionList](sfclient-model-pagedgatewayresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### ListMeshGateways

This example shows how to list all gateway resources.

#### Request
```
GET http://localhost:19080/Resources/Gateways?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
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
  ]
}
```

