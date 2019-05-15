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
Gets the network resource.

Gets the information about the network resource with a given name. This information includes the network description and other runtime information.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/networks/{networkName}?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`networkName`](#networkname) | string | Yes | Path |
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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### NetworkGet

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetworkWindows?api-version=2018-07-01-preview
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
      "publicIPAddress": "52.191.255.103",
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

