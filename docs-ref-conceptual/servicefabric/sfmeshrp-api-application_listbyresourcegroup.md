---
title: "List By Resource Group"
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
# List By Resource Group
Gets all the application resources in a given resource group.

Gets the information about all application resources in a given resource group. The information includes the information about the application's services and other runtime properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/applications?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
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
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
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
    }
  ]
}
```

