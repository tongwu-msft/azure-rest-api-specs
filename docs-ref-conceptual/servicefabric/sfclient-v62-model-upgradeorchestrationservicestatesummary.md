---
title: "UpgradeOrchestrationServiceStateSummary"
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
# UpgradeOrchestrationServiceStateSummary

Service state summary of Service Fabric Upgrade Orchestration Service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`CurrentCodeVersion`](#currentcodeversion) | string | No |
| [`CurrentManifestVersion`](#currentmanifestversion) | string | No |
| [`TargetCodeVersion`](#targetcodeversion) | string | No |
| [`TargetManifestVersion`](#targetmanifestversion) | string | No |
| [`PendingUpgradeType`](#pendingupgradetype) | string | No |

____
### `CurrentCodeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current code version of the cluster.

____
### `CurrentManifestVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current manifest version of the cluster.

____
### `TargetCodeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The target code version of  the cluster.

____
### `TargetManifestVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The target manifest version of the cluster.

____
### `PendingUpgradeType`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The type of the pending upgrade of the cluster.
