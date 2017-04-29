---
title: "FileVersion"
ms.date: "2017-04-29"
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
# FileVersion

Information about the version of image store file.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [VersionNumber](#versionnumber) | string (int64) | No |
| [EpochDataLossNumber](#epochdatalossnumber) | string (int64) | No |

____
### VersionNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The current iamge store version number for the file is used in image store for checking whether it need to be updated.

____
### EpochDataLossNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The epoch data loss number of image store file is used to indicate the status of data loss.
