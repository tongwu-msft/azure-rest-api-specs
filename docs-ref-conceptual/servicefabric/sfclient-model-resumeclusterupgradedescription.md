---
title: "ResumeClusterUpgradeDescription"
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
# ResumeClusterUpgradeDescription

Describes the parameters for resuming a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [UpgradeDomain](#upgradedomain) | string | Yes |

____
### UpgradeDomain
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The upgrade domain to move on the cluster upgrade to.
