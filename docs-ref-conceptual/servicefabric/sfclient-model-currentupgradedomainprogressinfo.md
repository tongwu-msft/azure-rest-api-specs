---
title: "CurrentUpgradeDomainProgressInfo"
ms.date: "2017-04-28"
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
# CurrentUpgradeDomainProgressInfo

Information about the current in-progress upgrade domain.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [DomainName](#domainname) | string | No |
| [NodeUpgradeProgressList](#nodeupgradeprogresslist) | array of [NodeUpgradeProgressInfo](sfclient-model-nodeupgradeprogressinfo.md) | No |

____
### DomainName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the upgrade domain

____
### NodeUpgradeProgressList
__Type__: array of [NodeUpgradeProgressInfo](sfclient-model-nodeupgradeprogressinfo.md) <br/>
__Required__: No<br/>
<br/>
List of upgrading nodes and their statuses
