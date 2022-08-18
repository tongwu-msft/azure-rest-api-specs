---
title: "GatewayDestination v82"
description: "GatewayDestination v82"
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
# GatewayDestination v82

Describes destination endpoint for routing traffic.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`applicationName`](#applicationname) | string | Yes |
| [`serviceName`](#servicename) | string | Yes |
| [`endpointName`](#endpointname) | string | Yes |

____
### `applicationName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the service fabric Mesh application.

____
### `serviceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
service that contains the endpoint.

____
### `endpointName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
name of the endpoint in the service.
