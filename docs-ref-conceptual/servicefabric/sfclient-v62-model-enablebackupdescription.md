---
title: "EnableBackupDescription"
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
# EnableBackupDescription

Specifies the parameters needed to enable periodic backup.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`BackupPolicyName`](#backuppolicyname) | string | Yes |

____
### `BackupPolicyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the backup policy to be used for enabling periodic backups.
