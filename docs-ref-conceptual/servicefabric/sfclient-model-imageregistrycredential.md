---
title: "Image Registry Credential"
description: "ImageRegistryCredential"
ms.date: "04/25/2022"
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
# Image Registry Credential

Image registry credential.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`server`](#server) | string | Yes |
| [`username`](#username) | string | Yes |
| [`passwordType`](#passwordtype) | string (enum) | No |
| [`password`](#password) | string | No |

____
### `server`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Docker image registry server, without protocol such as `http` and `https`.

____
### `username`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The username for the private registry.

____
### `passwordType`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `ClearText` <br/>
<br/>


The type of the image registry password being given in password

Possible values are: 

  - `ClearText` - The image registry password in clear text, will not be processed in any way and used directly
  - `KeyVaultReference` - The URI to a KeyVault secret version, will be resolved using the application's managed identity (this type is only valid if the app was assigned a managed identity) before getting used
  - `SecretValueReference` - The reference to a SecretValue resource, will be resolved before getting used



____
### `password`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The password for the private registry. The password is required for create or update operations, however it is not returned in the get or list operations. Will be processed based on the type provided.
