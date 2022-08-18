---
title: "PartitionAccessStatus v82"
description: "PartitionAccessStatus v82"
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
# PartitionAccessStatus enum v82

type: string

Specifies the access status of the partition.

Possible values are: 

  - `Invalid` - Indicates that the read or write operation access status is not valid. This value is not returned to the caller.
  - `Granted` - Indicates that the read or write operation access is granted and the operation is allowed.
  - `ReconfigurationPending` - Indicates that the client should try again later, because a reconfiguration is in progress.
  - `NotPrimary` - Indicates that this client request was received by a replica that is not a Primary replica.
  - `NoWriteQuorum` - Indicates that no write quorum is available and, therefore, no write operation can be accepted.

