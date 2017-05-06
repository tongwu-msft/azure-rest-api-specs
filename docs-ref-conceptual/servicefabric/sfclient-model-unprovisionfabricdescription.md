---
title: "UnprovisionFabricDescription"
ms.date: "2017-05-06"
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
# UnprovisionFabricDescription

Describes the parameters for unprovisioning a cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [CodeVersion](#codeversion) | string | No |
| [ConfigVersion](#configversion) | string | No |

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster code package version.

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster manifest version.
