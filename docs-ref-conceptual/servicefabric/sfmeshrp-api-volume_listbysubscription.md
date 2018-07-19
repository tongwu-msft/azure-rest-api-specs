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
Gets all the volume resources in a given subscription.

Gets the information about all volume resources in a given subscription. The information includes the volume description and other runtime information.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabricMesh/volumes?api-version=2018-07-01-preview` |


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
| 200 (OK) | OK<br/> | [VolumeResourceDescriptionList](sfmeshrp-model-volumeresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### VolumesList

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabricMesh/volumes?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabricMesh/volumes",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbzdemo/providers/Microsoft.ServiceFabricMesh/volumes/mysharel",
      "name": "mysharel",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "File share backed by Azure Files storage.",
        "provider": "SFAzureFile",
        "azureFileParameters": {
          "shareName": "sharel",
          "accountName": "sbzdemoaccount"
        }
      }
    },
    {
      "type": "Microsoft.ServiceFabricMesh/volumes",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbzdemo/providers/Microsoft.ServiceFabricMesh/volumes/mysharew",
      "name": "mysharew",
      "tags": {},
      "properties": {
        "provisioningState": "Succeeded",
        "description": "File share backed by Azure Files storage.",
        "provider": "SFAzureFile",
        "azureFileParameters": {
          "shareName": "sharew",
          "accountName": "sbzdemoaccount"
        }
      }
    }
  ]
}
```

