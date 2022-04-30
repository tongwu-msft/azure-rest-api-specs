---
title: "NodeDeactivationStatus v82"
description: "NodeDeactivationStatus v82"
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
# NodeDeactivationStatus enum v82

type: string

The status of node deactivation operation. Following are the possible values.

Possible values are: 

  - `None` - No status is associated with the task. The value is zero.
  - `SafetyCheckInProgress` - When a node is deactivated Service Fabric performs checks to ensure that the operation is safe to proceed to ensure availability of the service and reliability of the state. This value indicates that one or more safety checks are in progress. The value is 1.
  - `SafetyCheckComplete` - When a node is deactivated Service Fabric performs checks to ensure that the operation is safe to proceed to ensure availability of the service and reliability of the state. This value indicates that all safety checks have been completed. The value is 2.
  - `Completed` - The task is completed. The value is 3.

