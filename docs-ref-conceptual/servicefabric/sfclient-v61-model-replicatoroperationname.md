---
title: "ReplicatorOperationName"
ms.date: "2018-01-22"
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
# ReplicatorOperationName enum

type: string

Specifies the operation currently being executed by the Replicator.

Possible values are: 

  - Invalid - Default value if the replicator is not yet ready.
  - None - Replicator is not running any operation from Service Fabric perspective.
  - Open - Replicator is opening.
  - ChangeRole - Replicator is in the process of changing its role.
  - UpdateEpoch - Due to a change in the replica set, replicator is being updated with its Epoch.
  - Close - Replicator is closing.
  - Abort - Replicator is being aborted.
  - OnDataLoss - Replicator is handling the data loss condition, where the user service may potentially be recovering state from an external source.
  - WaitForCatchup - Replicator is waiting for a quorum of replicas to be caught up to the latest state.
  - Build - Replicator is in the process of building one or more replicas.

