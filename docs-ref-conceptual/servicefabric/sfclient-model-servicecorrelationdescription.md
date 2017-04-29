---
title: "ServiceCorrelationDescription"
ms.date: "2017-04-29"
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
# ServiceCorrelationDescription

Creates a particular correlation between services.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Scheme](#scheme) | string (enum) | Yes |
| [ServiceName](#servicename) | string | Yes |

____
### Scheme
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
The ServiceCorrelationScheme which describes the relationship between this service and the service specified via ServiceName.

The service correlation scheme. Possible values are following.

  - Invalid - An invalid correlation scheme. Cannot be used. The value is zero.
  - Affinity - Indicates that this service has an affinity relationship with another service. Provided for backwards compatibility, consider preferring the Aligned or NonAlignedAffinity options. The value is 1.
  - AlignedAffinity - Aligned affinity ensures that the primaries of the partitions of the affinitized services are collocated on the same nodes. This is the default and is the same as selecting the Affinity scheme. The value is 2.
  - NonAlignedAffinity - Non-Aligned affinity guarantees that all replicas of each service will be placed on the same nodes. Unlike Aligned Affinity, this does not guarantee that replicas of particular role will be collocated. The value is 3.



____
### ServiceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the service that the correlation relationship is established with.
