---
title: "SecretResourceProperties v82"
description: "SecretResourceProperties v82"
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
# SecretResourceProperties v82

Describes the properties of a secret resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`contentType`](#contenttype) | string | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the secret.

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
Gives additional information about the current status of the secret.

____
### `contentType`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The type of the content stored in the secret value. The value of this property is opaque to Service Fabric. Once set, the value of this property cannot be changed.
