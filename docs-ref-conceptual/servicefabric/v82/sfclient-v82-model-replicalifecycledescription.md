---
title: "ReplicaLifecycleDescription v82"
description: "ReplicaLifecycleDescription v82"
ms.date: "04/02/2021"
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
# ReplicaLifecycleDescription v82

Describes how the replica will behave

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`IsSingletonReplicaMoveAllowedDuringUpgrade`](#issingletonreplicamoveallowedduringupgrade) | boolean | No |
| [`RestoreReplicaLocationAfterUpgrade`](#restorereplicalocationafterupgrade) | boolean | No |

____
### `IsSingletonReplicaMoveAllowedDuringUpgrade`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If set to true, replicas with a target replica set size of 1 will be permitted to move during upgrade.

____
### `RestoreReplicaLocationAfterUpgrade`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If set to true, move/swap replica to original location after upgrade.
