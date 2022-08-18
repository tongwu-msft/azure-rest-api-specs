---
title: "ResumeClusterUpgradeDescription v82"
description: "ResumeClusterUpgradeDescription v82"
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
# ResumeClusterUpgradeDescription v82

Describes the parameters for resuming a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`UpgradeDomain`](#upgradedomain) | string | Yes |

____
### `UpgradeDomain`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The next upgrade domain for this cluster upgrade.
