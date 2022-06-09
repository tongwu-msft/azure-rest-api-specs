---
title: "ApplicationTypeMetadata"
description: "ApplicationTypeMetadata"
ms.date: "04/25/2022"
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
# ApplicationTypeMetadata

Metadata associated with a specific application type.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ApplicationTypeProvisionTimestamp`](#applicationtypeprovisiontimestamp) | string | No |
| [`ArmMetadata`](#armmetadata) | [ArmMetadata](sfclient-model-armmetadata.md) | No |

____
### `ApplicationTypeProvisionTimestamp`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The timestamp when the application type was provisioned.

____
### `ArmMetadata`
__Type__: [ArmMetadata](sfclient-model-armmetadata.md) <br/>
__Required__: No<br/>
<br/>
Common ArmMetadata assocaited with Service Fabric Entities.
