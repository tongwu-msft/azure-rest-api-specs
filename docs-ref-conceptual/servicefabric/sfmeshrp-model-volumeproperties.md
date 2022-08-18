---
title: "Service Fabric Mesh VolumeProperties"
description: Describes the properties of a volume resource and provides the names, types, and requirement statuses for volume properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Service Fabric Mesh VolumeProperties

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
