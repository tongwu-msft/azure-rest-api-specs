---
title: "UpgradeDomainInfo"
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
# UpgradeDomainInfo

Information about an upgrade domain.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [State](#state) | string (enum) | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the upgrade domain

____
### State
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state of the upgrade domain.

    - Invalid - Indicates the upgrade domain state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - Pending - The upgrade domain has not started upgrading yet. The value is 1
    - InProgress - The upgrade domain is being upgraded but not complete yet. The value is 2
    - Completed - The upgrade domain has completed upgrade. The value is 3

