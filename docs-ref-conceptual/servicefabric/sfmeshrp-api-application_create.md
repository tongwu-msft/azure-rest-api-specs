---
title: "Create"
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
# Create
Creates or updates an application resource.

Creates an application resource with the specified name and description. If an application with the same name already exists, then its description is updated to the one indicated in this request.

Use network resources to provide public connectivity to the services of an application.


## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/applications/{applicationName}?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`applicationName`](#applicationname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`applicationResourceDescription`](#applicationresourcedescription) | [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) | Yes | Body |

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
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

____
### `applicationResourceDescription`
__Type__: [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating an application resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Ok<br/> | [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) |
| 201 (Created) | Created<br/> | [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### ApplicationCreateOrUpdate

This example shows how to create or update an application resource.

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/helloWorldApp?api-version=2018-07-01-preview
```

##### Body
```json
{
  "properties": {
    "description": "SeaBreeze HelloWorld Application!",
    "services": [
      {
        "properties": {
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
          "description": "SeaBreeze Hello World Service.",
          "replicaCount": "1"
        },
        "name": "helloWorldService"
      }
    ]
  },
  "tags": {},
  "location": "EastUS"
}
```

#### 200 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabricMesh/applications",
  "location": "EastUS",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/myHelloWorldApp",
  "name": "myHelloWorldApp",
  "tags": {},
  "properties": {
    "provisioningState": "Succeeded",
    "description": "SeaBreeze HelloWorld Application!",
    "healthState": "Ok",
    "serviceNames": [
      "helloWorldService"
    ],
    "status": "Invalid"
  }
}
```


#### 201 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabricMesh/applications",
  "location": "EastUS",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/myHelloWorldApp",
  "name": "myHelloWorldApp",
  "tags": {},
  "properties": {
    "provisioningState": "Updating",
    "description": "SeaBreeze HelloWorld Application!",
    "healthState": "Ok",
    "serviceNames": [
      "helloWorldService"
    ],
    "status": "Invalid"
  }
}
```

