---
title: "ApplicationUpgradeUpdateDescription"
ms.date: "2017-05-09"
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
# ApplicationUpgradeUpdateDescription

Describes the parameters for updating an ongoing application upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | Yes |
| [UpgradeKind](#upgradekind) | string (enum) | Yes |
| [ApplicationHealthPolicy](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | No |
| [UpdateDescription](#updatedescription) | [RollingUpgradeUpdateDescription](sfclient-model-rollingupgradeupdatedescription.md) | No |

____
### Name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### UpgradeKind
__Type__: string (enum) <br/>
__Required__: Yes<br/>
__Default__: Rolling <br/>
<br/>
The kind of upgrade out of the following possible values.

    - Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - Rolling - The upgrade progresses one upgrade domain at a time. The value is 1


____
### ApplicationHealthPolicy
__Type__: [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of an application or one of its children entities.


____
### UpdateDescription
__Type__: [RollingUpgradeUpdateDescription](sfclient-model-rollingupgradeupdatedescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for updating a rolling upgrade of application or cluster.
