---
title: Partition scheme for singleton and non-partitioned services
description: "Describe the partition scheme of a singleton-partitioned, or non-partitioned service. PartitionScheme is a discriminator property."
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# Partition scheme for singleton and non-partitioned services

Describes the partition scheme of a singleton-partitioned, or non-partitioned service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [PartitionScheme](#partitionscheme) | string | Yes |

____
### PartitionScheme
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Singleton' for objects of type 'SingletonPartitionSchemeDescription'.
