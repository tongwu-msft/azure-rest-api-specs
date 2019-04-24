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
Creates or updates a volume resource.

Creates a volume resource with the specified name and description. If a volume with the same name already exists, then its description is updated to the one indicated in this request.


## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/volumes/{volumeName}?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`volumeName`](#volumename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`volumeResourceDescription`](#volumeresourcedescription) | [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) | Yes | Body |

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
### `volumeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the volume.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

____
### `volumeResourceDescription`
__Type__: [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description for creating a volume resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Ok<br/> | [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) |
| 201 (Created) | Created<br/> | [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### VolumeCreate

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/volumes/sbzDemoVolume?api-version=2018-07-01-preview
```

##### Body
```json
{
  "properties": {
    "description": "File share backed by Azure Files storage.",
    "azureFileParameters": {
      "accountName": "sbzdemoaccount",
      "accountKey": "provide-account-key-here",
      "shareName": "sharel"
    },
    "provider": "SFAzureFile"
  },
  "location": "eastus"
}
```

#### 200 Response
##### Body
```json
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
```


#### 201 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabricMesh/volumes",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/volumes/sbzDemoVolume",
  "name": "sbzDemoVolume",
  "tags": {},
  "properties": {
    "provisioningState": "Updating",
    "description": "File share backed by Azure Files storage.",
    "provider": "SFAzureFile",
    "azureFileParameters": {
      "shareName": "sharel",
      "accountName": "sbzdemoaccount"
    }
  }
}
```

