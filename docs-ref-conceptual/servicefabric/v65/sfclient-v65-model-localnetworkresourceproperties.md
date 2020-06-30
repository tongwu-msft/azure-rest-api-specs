---
title: "LocalNetworkResourceProperties"
ms.date: 06/12/2019
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
# LocalNetworkResourceProperties

Information about a Service Fabric container network local to a single Service Fabric cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`kind`](#kind) | string | Yes |
| [`description`](#description) | string | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`networkAddressPrefix`](#networkaddressprefix) | string | No |

____
### kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Local' for objects of type 'LocalNetworkResourceProperties'.

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the network.

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Status of the network.

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
Gives additional information about the current status of the network.

____
### `networkAddressPrefix`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Address space for the local container network.
