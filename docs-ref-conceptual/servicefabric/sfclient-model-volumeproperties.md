---
title: "VolumeProperties"
ms.date: 06/12/2019
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# VolumeProperties

Describes properties of a volume resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`provider`](#provider) | string | Yes |
| [`azureFileParameters`](#azurefileparameters) | [VolumeProviderParametersAzureFile](sfclient-model-volumeproviderparametersazurefile.md) | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the volume.

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Status of the volume.

Status of the resource.

Possible values are: 

  - `Unknown` - Indicates the resource status is unknown. The value is zero.
  - `Ready` - Indicates the resource is ready. The value is 1.
  - `Upgrading` - Indicates the resource is upgrading. The value is 2.
  - `Creating` - Indicates the resource is being created. The value is 3.
  - `Deleting` - Indicates the resource is being deleted. The value is 4.
  - `Failed` - Indicates the resource is not functional due to persistent failures. See statusDetails property for more details. The value is 5.



____
### `statusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Gives additional information about the current status of the volume.

____
### `provider`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `SFAzureFile` <br/>
<br/>
Provider of the volume.

____
### `azureFileParameters`
__Type__: [VolumeProviderParametersAzureFile](sfclient-model-volumeproviderparametersazurefile.md) <br/>
__Required__: No<br/>
<br/>
This type describes a volume provided by an Azure Files file share.
