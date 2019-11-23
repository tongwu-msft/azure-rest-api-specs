---
title: "ConfigParameterOverride"
ms.date: "11/23/2019"
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
# ConfigParameterOverride

Information about a configuration parameter override.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`SectionName`](#sectionname) | string | Yes |
| [`ParameterName`](#parametername) | string | Yes |
| [`ParameterValue`](#parametervalue) | string | Yes |
| [`Timeout`](#timeout) | string (duration) | No |
| [`PersistAcrossUpgrade`](#persistacrossupgrade) | boolean | No |

____
### `SectionName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the section for the parameter override.

____
### `ParameterName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the parameter that has been overridden.

____
### `ParameterValue`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Value of the overridden parameter.

____
### `Timeout`
__Type__: string (duration) <br/>
__Required__: No<br/>
<br/>
The duration until config override is considered as valid.

____
### `PersistAcrossUpgrade`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A value that indicates whether config override will be removed on upgrade or will still be considered as valid.
