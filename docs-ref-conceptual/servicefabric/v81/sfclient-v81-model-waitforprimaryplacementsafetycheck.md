---
title: "WaitForPrimaryPlacementSafetyCheck v81"
description: "WaitForPrimaryPlacementSafetyCheck v81"
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
# WaitForPrimaryPlacementSafetyCheck v81

Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PartitionId`](#partitionid) | string (uuid) | No |

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition which is undergoing the safety check.
