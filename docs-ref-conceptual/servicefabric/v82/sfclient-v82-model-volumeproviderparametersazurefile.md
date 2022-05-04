---
title: "VolumeProviderParametersAzureFile v82"
description: "VolumeProviderParametersAzureFile v82"
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
# VolumeProviderParametersAzureFile v82

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
