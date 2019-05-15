---
title: "ProvisionFabricDescription"
ms.date: "2018-04-23"
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
# ProvisionFabricDescription

Describes the parameters for provisioning a cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`CodeFilePath`](#codefilepath) | string | No |
| [`ClusterManifestFilePath`](#clustermanifestfilepath) | string | No |

____
### `CodeFilePath`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster code package file path.

____
### `ClusterManifestFilePath`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster manifest file path.
