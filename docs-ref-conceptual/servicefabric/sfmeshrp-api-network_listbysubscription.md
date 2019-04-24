---
title: "List By Subscription"
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
# List By Subscription
Gets all the network resources in a given subscription.

Gets the information about all network resources in a given subscription. The information includes the network description and other runtime properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabricMesh/networks?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `subscriptionId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

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
| 200 (OK) | OK<br/> | [NetworkResourceDescriptionList](sfmeshrp-model-networkresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### NetworksList

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabricMesh/networks?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabricMesh/networks",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/{resourceGroup}/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetwork",
      "name": "helloWorldNetwork",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "addressPrefix": "10.0.0.4/22",
        "ingressConfig": {
          "qosLevel": "Bronze",
          "publicIPAddress": "52.191.12.219",
          "layer4": [
            {
              "publicPort": "80",
              "applicationName": "helloWorldApp",
              "serviceName": "helloWorldService",
              "endpointName": "helloWorldListener"
            }
          ]
        }
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/networks",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/{resourceGroup}/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetworkWindows",
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
  ]
}
```

