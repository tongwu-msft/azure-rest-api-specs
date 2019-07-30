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
Creates or updates a network resource.

Creates a network resource with the specified name and description. If a network with the same name already exists, then its description is updated to the one indicated in this request.

Use network resources to create private network and configure public connectivity for services within your application. 


## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/networks/{networkName}?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`networkName`](#networkname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`networkResourceDescription`](#networkresourcedescription) | [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) | Yes | Body |

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
### `networkName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the network.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

____
### `networkResourceDescription`
__Type__: [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a network resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Ok<br/> | [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) |
| 201 (Created) | Created<br/> | [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### Network_Create

This example shows how to create a network resource with custom address range and a load balanced public endpoint.

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetworkWindows?api-version=2018-07-01-preview
```

##### Body
```json
{
  "properties": {
    "addressPrefix": "10.0.0.4/22",
    "ingressConfig": {
      "layer4": [
        {
          "publicPort": "80",
          "applicationName": "helloWorldAppWindows",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      ]
    }
  },
  "location": "eastus"
}
```

#### 200 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabricMesh/networks",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetworkWindows",
  "name": "helloWorldNetworkWindows",
  "tags": {},
  "properties": {
    "provisioningState": "Succeeded",
    "addressPrefix": "10.0.0.4/22",
    "ingressConfig": {
      "qosLevel": "Bronze",
      "layer4": [
        {
          "publicPort": "80",
          "applicationName": "helloWorldAppWindows",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      ]
    }
  }
}
```


#### 201 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabricMesh/networks",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetworkWindows",
  "name": "helloWorldNetworkWindows",
  "tags": {},
  "properties": {
    "provisioningState": "Updating",
    "addressPrefix": "10.0.0.4/22",
    "ingressConfig": {
      "qosLevel": "Bronze",
      "layer4": [
        {
          "publicPort": "80",
          "applicationName": "helloWorldAppWindows",
          "serviceName": "helloWorldService",
          "endpointName": "helloWorldListener"
        }
      ]
    }
  }
}
```

