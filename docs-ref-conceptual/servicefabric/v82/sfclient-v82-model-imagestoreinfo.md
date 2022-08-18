---
title: "ImageStoreInfo v82"
description: "ImageStoreInfo v82"
ms.date: "10/21/2020"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# ImageStoreInfo v82

Information about the ImageStore's resource usage

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DiskInfo`](#diskinfo) | [DiskInfo](sfclient-v82-model-diskinfo.md) | No |
| [`UsedByMetadata`](#usedbymetadata) | [UsageInfo](sfclient-v82-model-usageinfo.md) | No |
| [`UsedByStaging`](#usedbystaging) | [UsageInfo](sfclient-v82-model-usageinfo.md) | No |
| [`UsedByCopy`](#usedbycopy) | [UsageInfo](sfclient-v82-model-usageinfo.md) | No |
| [`UsedByRegister`](#usedbyregister) | [UsageInfo](sfclient-v82-model-usageinfo.md) | No |

____
### `DiskInfo`
__Type__: [DiskInfo](sfclient-v82-model-diskinfo.md) <br/>
__Required__: No<br/>
<br/>
disk capacity and available disk space on the node where the ImageStore primary is placed.

____
### `UsedByMetadata`
__Type__: [UsageInfo](sfclient-v82-model-usageinfo.md) <br/>
__Required__: No<br/>
<br/>
the ImageStore's file system usage for metadata.

____
### `UsedByStaging`
__Type__: [UsageInfo](sfclient-v82-model-usageinfo.md) <br/>
__Required__: No<br/>
<br/>
The ImageStore's file system usage for staging files that are being uploaded.

____
### `UsedByCopy`
__Type__: [UsageInfo](sfclient-v82-model-usageinfo.md) <br/>
__Required__: No<br/>
<br/>
the ImageStore's file system usage for copied application and cluster packages. [Removing application and cluster packages](https://docs.microsoft.com/rest/api/servicefabric/sfclient-v82-api-deleteimagestorecontent) will free up this space.

____
### `UsedByRegister`
__Type__: [UsageInfo](sfclient-v82-model-usageinfo.md) <br/>
__Required__: No<br/>
<br/>
the ImageStore's file system usage for registered and cluster packages. [Unregistering application](https://docs.microsoft.com/rest/api/servicefabric/sfclient-v82-api-unprovisionapplicationtype) and [cluster packages](https://docs.microsoft.com/rest/api/servicefabric/sfclient-v82-api-unprovisionapplicationtype) will free up this space.
