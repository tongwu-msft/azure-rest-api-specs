---
title: "UpgradeUnitInfo v82"
description: "UpgradeUnitInfo v82"
ms.date: "10/20/2021"
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
# UpgradeUnitInfo v82

Information about an upgrade unit.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`State`](#state) | string (enum) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the upgrade unit

____
### `State`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The state of the upgrade unit.

Possible values are: 

  - `Invalid` - Indicates the upgrade unit state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Pending` - The upgrade unit has not started upgrading yet. The value is 1
  - `InProgress` - The upgrade unit is being upgraded but not complete yet. The value is 2
  - `Completed` - The upgrade unit has completed upgrade. The value is 3
  - `Failed` - The upgrade unit has failed to upgrade. The value is 4


