---
title: "Get"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Get
Gets the properties of the service.

The operation returns the properties of the service.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/applications/{applicationName}/services/{serviceName}?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`applicationName`](#applicationname) | string | Yes | Path |
| [`serviceName`](#servicename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `subscriptionId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### `resourceGroupName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Azure resource group name

____
### `applicationName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `serviceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) |


## Examples

### ServiceGet

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/helloWorldApp/services/helloWorldService?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "name": "helloWorldService",
  "type": "Microsoft.ServiceFabricMesh/services",
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
      },
      {
        "name": "helloWorldSideCar",
        "image": "seabreeze/sbz-helloworld-sidecar:1.0-alpine",
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
        "name": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetwork"
      }
    ],
    "description": "SeaBreeze Hello World Service.",
    "replicaCount": "2",
    "healthState": "Ok",
    "status": "Unknown"
  }
}
```

