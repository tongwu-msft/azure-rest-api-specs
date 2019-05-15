---
title: "VolumeProperties"
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
# VolumeProperties

This type describes properties of a volume resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`provider`](#provider) | string | Yes |
| [`azureFileParameters`](#azurefileparameters) | [VolumeProviderParametersAzureFile](sfmeshrp-model-volumeproviderparametersazurefile.md) | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the volume.

____
### `provider`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `SFAzureFile` <br/>
<br/>
Provider of the volume.

____
### `azureFileParameters`
__Type__: [VolumeProviderParametersAzureFile](sfmeshrp-model-volumeproviderparametersazurefile.md) <br/>
__Required__: No<br/>
<br/>
This type describes a volume provided by an Azure Files file share.
