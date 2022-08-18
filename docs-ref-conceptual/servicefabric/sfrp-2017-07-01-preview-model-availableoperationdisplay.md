---
title: "Azure Resource Provider Operation"
description: API reference documentation for the operations available in the AvailableOperationDisplay REST API.
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
# Azure Resource Provider Operation

Operation supported by the Service Fabric resource provider

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
