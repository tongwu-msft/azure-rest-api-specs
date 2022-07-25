---
title: "Understand the Service Fabric Mesh resource manager API's List By Resource Group request"
description: Learn how to use the List By Resource Group request in Service Fabric Mesh API to get all of the volume resources.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore the List By Resource Group request in the Service Fabric Mesh API
Gets all the volume resources in a given resource group.

Gets the information about all volume resources in a given resource group. The information includes the volume description and other runtime information.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/volumes?api-version=2018-07-01-preview` |


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
| 200 (OK) | OK<br/> | [VolumeResourceDescriptionList](sfmeshrp-model-volumeresourcedescriptionlist.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### VolumesList

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/volumes?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabricMesh/volumes",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/volumes/sbzDemoVolume2",
      "name": "sbzDemoShare",
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
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/volumes/sbzDemoVolume",
      "name": "sbzDemoVolume",
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
    }
  ]
}
```

