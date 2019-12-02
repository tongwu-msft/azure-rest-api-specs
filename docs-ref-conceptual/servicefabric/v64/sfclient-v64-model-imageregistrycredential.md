---
title: "ImageRegistryCredential"
ms.date: 11/26/2018
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
# ImageRegistryCredential

Image registry credential.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`server`](#server) | string | Yes |
| [`username`](#username) | string | Yes |
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
### `password`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The password for the private registry. The password is required for create or update operations, however it is not returned in the get or list operations.
