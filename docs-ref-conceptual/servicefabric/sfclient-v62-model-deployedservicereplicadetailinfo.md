---
title: "DeployedServiceReplicaDetailInfo"
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
# DeployedServiceReplicaDetailInfo

Information about a Service Fabric service replica deployed on a node.
# Inheritance

'DeployedServiceReplicaDetailInfo' is the base type of the polymorphic type model. The 'ServiceKind' property is the discriminator for the derived types. 
The value of the 'ServiceKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| ServiceKind | Derived Type |
| --- | --- | 
| Stateful | [DeployedStatefulServiceReplicaDetailInfo](sfclient-v62-model-deployedstatefulservicereplicadetailinfo.md) |
| Stateless | [DeployedStatelessServiceInstanceDetailInfo](sfclient-v62-model-deployedstatelessserviceinstancedetailinfo.md) |

