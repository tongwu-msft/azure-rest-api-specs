---
title: "Service Fabric Mesh Type VolumeProviderParametersAzureFile"
description: Describes the volume from an Azure file share and provides the property names, types, and requirement statuses for Volume Provider Parameters.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Service Fabric Mesh Type VolumeProviderParametersAzureFile

This type describes a volume provided by an Azure Files file share.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`accountName`](#accountname) | string | Yes |
| [`accountKey`](#accountkey) | string | No |
| [`shareName`](#sharename) | string | Yes |

____
### `accountName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Azure storage account for the File Share.

____
### `accountKey`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Access key of the Azure storage account for the File Share.

____
### `shareName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Azure Files file share that provides storage for the volume.
