---
title: "Setting"
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
# Setting

Describes a setting for the container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`value`](#value) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the setting.

____
### `value`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The value of the setting.
