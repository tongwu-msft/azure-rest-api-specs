---
title: "VolumeProviderParametersAzureFile"
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
# VolumeProviderParametersAzureFile

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
