---
title: "ResolvedServiceEndpoint"
ms.date: "2017-05-03"
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
# ResolvedServiceEndpoint

Endpoint of a resolved service partition.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string (enum) | No |
| [Address](#address) | string | No |

____
### Kind
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The role of the replica where the endpoint is reported. Possible values are following.

  - Invalid - Indicates the service endpoint role is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Stateless - Indicates that the service endpoint is of a stateless service. The value is 1.
  - StatefulPrimary - Indicates that the service endpoint is of a primary replica of a stateful service. The value is 2.
  - StatefulSecondary -  Indicates that the service endpoint is of a secondary replica of a stateful service. The value is 3. 


____
### Address
__Type__: string <br/>
__Required__: No<br/>
<br/>
The address of the endpoint. If the endpoint has multiple listeners the address is a JSON object with one property per listener with the value as the address of that listener.
