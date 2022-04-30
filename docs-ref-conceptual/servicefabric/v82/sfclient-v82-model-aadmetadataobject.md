---
title: "AadMetadataObject v82"
description: "AadMetadataObject v82"
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
# AadMetadataObject v82

Azure Active Directory metadata object used for secured connection to cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`type`](#type) | string | No |
| [`metadata`](#metadata) | [AadMetadata](sfclient-v82-model-aadmetadata.md) | No |

____
### `type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The client authentication method.

____
### `metadata`
__Type__: [AadMetadata](sfclient-v82-model-aadmetadata.md) <br/>
__Required__: No<br/>
<br/>
Azure Active Directory metadata used for secured connection to cluster.
