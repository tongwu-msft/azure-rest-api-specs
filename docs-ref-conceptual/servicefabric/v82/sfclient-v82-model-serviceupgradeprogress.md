---
title: "ServiceUpgradeProgress v82"
description: "ServiceUpgradeProgress v82"
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
# ServiceUpgradeProgress v82

Information about how many replicas are completed or pending for a specific service during upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceName`](#servicename) | string | No |
| [`CompletedReplicaCount`](#completedreplicacount) | string | No |
| [`PendingReplicaCount`](#pendingreplicacount) | string | No |

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the Service resource.

____
### `CompletedReplicaCount`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The number of replicas that completes the upgrade in the service.

____
### `PendingReplicaCount`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The number of replicas that are waiting to be upgraded in the service.
