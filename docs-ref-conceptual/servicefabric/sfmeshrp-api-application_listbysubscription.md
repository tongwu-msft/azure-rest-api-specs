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
Gets all the application resources in a given subscription.

Gets the information about all application resources in a given subscription. The information includes the information about the application's services and other runtime properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabricMesh/applications?api-version=2018-07-01-preview` |


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
| 200 (OK) | OK<br/> | [ApplicationResourceDescriptionList](sfmeshrp-model-applicationresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### ApplicationList

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabricMesh/applications?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/abhisramvol/providers/Microsoft.ServiceFabricMesh/applications/myappl",
      "name": "myappl",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "healthState": "Ok",
        "serviceNames": [
          "myservice"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/abhisramvol/providers/Microsoft.ServiceFabricMesh/applications/myappw",
      "name": "myappw",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "healthState": "Ok",
        "serviceNames": [
          "myservice"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "EastUS",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/mfussellapp2/providers/Microsoft.ServiceFabricMesh/applications/SbzVoting",
      "name": "SbzVoting",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "Voting SeaBreeze!",
        "healthState": "Ok",
        "serviceNames": [
          "VotingWeb",
          "VotingData"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "EastUS",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/mfussellapp3/providers/Microsoft.ServiceFabricMesh/applications/SbzVoting",
      "name": "SbzVoting",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "Voting SeaBreeze!",
        "healthState": "Ok",
        "serviceNames": [
          "VotingWeb",
          "VotingData"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/helloWorldApp",
      "name": "helloWorldApp",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "SeaBreeze HelloWorld Application!",
        "healthState": "Ok",
        "serviceNames": [
          "helloWorldService"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/helloWorldAppWindows",
      "name": "helloWorldAppWindows",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "SeaBreeze HelloWorld Application!",
        "healthState": "Ok",
        "serviceNames": [
          "helloWorldService"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sridhar1ResourceGroup/providers/Microsoft.ServiceFabricMesh/applications/privateRegistryExampleApp",
      "name": "privateRegistryExampleApp",
      "tags": {},
      "properties": {
        "provisioningState": "Updating",
        "description": "SeaBreeze example application with container deployed from private image registry.",
        "healthState": "Ok",
        "serviceNames": [
          "helloWorldService"
        ],
        "status": "Invalid"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sridhar4ResourceGroup/providers/Microsoft.ServiceFabricMesh/applications/SbzVoting",
      "name": "SbzVoting",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "Voting SeaBreeze!",
        "healthState": "Ok",
        "serviceNames": [
          "VotingWeb",
          "VotingData"
        ],
        "status": "Ready"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sridharResourceGroup/providers/Microsoft.ServiceFabricMesh/applications/privateRegistryExampleApp",
      "name": "privateRegistryExampleApp",
      "tags": {},
      "properties": {
        "provisioningState": "Updating",
        "description": "SeaBreeze example application with container deployed from private image registry.",
        "healthState": "Ok",
        "serviceNames": [
          "helloWorldService"
        ],
        "status": "Invalid"
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/applications",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sridharRG/providers/Microsoft.ServiceFabricMesh/applications/privateRegistryExampleApp",
      "name": "privateRegistryExampleApp",
      "tags": {},
      "properties": {
        "provisioningState": "Updating",
        "description": "SeaBreeze example application with container deployed from private image registry.",
        "healthState": "Ok",
        "serviceNames": [
          "helloWorldService"
        ],
        "status": "Invalid"
      }
    }
  ]
}
```

