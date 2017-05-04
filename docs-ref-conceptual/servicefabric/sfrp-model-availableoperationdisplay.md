---
title: "AvailableOperationDisplay"
ms.date: "2017-05-04"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# AvailableOperationDisplay

Operation supported by Service Fabric resource provider

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [provider](#provider) | string | No |
| [resource](#resource) | string | No |
| [operation](#operation) | string | No |
| [description](#description) | string | No |

____
### provider
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the provider.

____
### resource
__Type__: string <br/>
__Required__: No<br/>
<br/>
The resource on which the operation is performed

____
### operation
__Type__: string <br/>
__Required__: No<br/>
<br/>
The operation that can be performed.

____
### description
__Type__: string <br/>
__Required__: No<br/>
<br/>
Operation description
