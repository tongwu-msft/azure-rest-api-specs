---
title: "ServiceEndpointRole"
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
# ServiceEndpointRole enum

type: string

The role of the replica where the endpoint is reported.

Possible values are: 

  - `Invalid` - Indicates the service endpoint role is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Stateless` - Indicates that the service endpoint is of a stateless service. The value is 1.
  - `StatefulPrimary` - Indicates that the service endpoint is of a primary replica of a stateful service. The value is 2.
  - `StatefulSecondary` - Indicates that the service endpoint is of a secondary replica of a stateful service. The value is 3.

