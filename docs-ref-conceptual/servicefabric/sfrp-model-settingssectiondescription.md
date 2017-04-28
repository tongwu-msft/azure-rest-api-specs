---
title: "SettingsSectionDescription"
ms.date: "2017-04-28"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# SettingsSectionDescription

ServiceFabric section settings

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [name](#name) | string | Yes |
| [parameters](#parameters) | array of [SettingsParameterDescription](sfrp-model-settingsparameterdescription.md) | Yes |

____
### name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of settings section

____
### parameters
__Type__: array of [SettingsParameterDescription](sfrp-model-settingsparameterdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Collection of settings in the section, each setting is a tuple consisting of setting name and value
