---
title: "GatewayProperties v82"
description: "GatewayProperties v82"
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
# GatewayProperties v82

Describes properties of a gateway resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`sourceNetwork`](#sourcenetwork) | [NetworkRef](sfclient-v82-model-networkref.md) | Yes |
| [`destinationNetwork`](#destinationnetwork) | [NetworkRef](sfclient-v82-model-networkref.md) | Yes |
| [`tcp`](#tcp) | array of [TcpConfig](sfclient-v82-model-tcpconfig.md) | No |
| [`http`](#http) | array of [HttpConfig](sfclient-v82-model-httpconfig.md) | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`ipAddress`](#ipaddress) | string | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the gateway.

____
### `sourceNetwork`
__Type__: [NetworkRef](sfclient-v82-model-networkref.md) <br/>
__Required__: Yes<br/>
<br/>
Network the gateway should listen on for requests.

____
### `destinationNetwork`
__Type__: [NetworkRef](sfclient-v82-model-networkref.md) <br/>
__Required__: Yes<br/>
<br/>
Network that the Application is using.

____
### `tcp`
__Type__: array of [TcpConfig](sfclient-v82-model-tcpconfig.md) <br/>
__Required__: No<br/>
<br/>
Configuration for tcp connectivity for this gateway.

____
### `http`
__Type__: array of [HttpConfig](sfclient-v82-model-httpconfig.md) <br/>
__Required__: No<br/>
<br/>
Configuration for http connectivity for this gateway.

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Status of the resource.

Possible values are: 

  - `Unknown` - Indicates the resource status is unknown. The value is zero.
  - `Ready` - Indicates the resource is ready. The value is 1.
  - `Upgrading` - Indicates the resource is upgrading. The value is 2.
  - `Creating` - Indicates the resource is being created. The value is 3.
  - `Deleting` - Indicates the resource is being deleted. The value is 4.
  - `Failed` - Indicates the resource is not functional due to persistent failures. See statusDetails property for more details. The value is 5.



____
### `statusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Gives additional information about the current status of the gateway.

____
### `ipAddress`
__Type__: string <br/>
__Required__: No<br/>
<br/>
IP address of the gateway. This is populated in the response and is ignored for incoming requests.
