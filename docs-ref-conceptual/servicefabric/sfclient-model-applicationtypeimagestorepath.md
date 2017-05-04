---
title: "ApplicationTypeImageStorePath"
ms.date: "2017-05-04"
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
# ApplicationTypeImageStorePath

Path description for the application package in the image store specified during the prior copy operation.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationTypeBuildPath](#applicationtypebuildpath) | string | Yes |

____
### ApplicationTypeBuildPath
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The relative image store path to the application package.
