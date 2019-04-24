---
title: "ResumeApplicationUpgradeDescription"
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
# ResumeApplicationUpgradeDescription

Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`UpgradeDomainName`](#upgradedomainname) | string | Yes |

____
### `UpgradeDomainName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the upgrade domain in which to resume the upgrade.
