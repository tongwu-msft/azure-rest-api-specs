---
title: "Container environment variabl v82e"
description: "EnvironmentVariable v82e"
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
# Container environment variable v82

Describes an environment variable for the container.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`type`](#type) | string (enum) | No |
| [`name`](#name) | string | No |
| [`value`](#value) | string | No |

____
### `type`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `ClearText` <br/>
<br/>


The type of the environment variable being given in value

Possible values are: 

  - `ClearText` - The environment variable in clear text, will not be processed in any way and passed in as is
  - `KeyVaultReference` - The URI to a KeyVault secret version, will be resolved using the application's managed identity (this type is only valid if the app was assigned a managed identity) before getting passed in
  - `SecretValueReference` - The reference to a SecretValue resource, will be resolved before getting passed in



____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the environment variable.

____
### `value`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The value of the environment variable, will be processed based on the type provided.
