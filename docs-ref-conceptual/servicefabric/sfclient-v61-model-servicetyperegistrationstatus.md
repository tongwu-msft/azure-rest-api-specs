---
title: "ServiceTypeRegistrationStatus"
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
# ServiceTypeRegistrationStatus enum

type: string

The status of the service type registration on the node.

Possible values are: 

  - Invalid - Indicates the registration status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Disabled - Indicates that the service type is disabled on this node. A type gets disabled when there are too many failures of the code package hosting the service type. If the service type is disabled, new replicas of that service type will not be placed on the node until it is enabled again. The service type is enabled again after the process hosting it comes up and re-registers the type or a preconfigured time interval has passed. The value is 1.
  - Enabled - Indicates that the service type is enabled on this node. Replicas of this service type can be placed on this node when the code package registers the service type. The value is 2.
  - Registered - Indicates that the service type is enabled and registered on the node by a code package. Replicas of this service type can now be placed on this node. The value is 3.

