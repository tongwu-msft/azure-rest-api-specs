---
title: "RegistryCredential"
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
# RegistryCredential

Credential information to connect to container registry.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`RegistryUserName`](#registryusername) | string | No |
| [`RegistryPassword`](#registrypassword) | string | No |
| [`PasswordEncrypted`](#passwordencrypted) | boolean | No |

____
### `RegistryUserName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The user name to connect to container registry.

____
### `RegistryPassword`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The password for supplied username to connect to container registry.

____
### `PasswordEncrypted`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates that supplied container registry password is encrypted.
