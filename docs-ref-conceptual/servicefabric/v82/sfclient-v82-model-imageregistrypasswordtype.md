---
title: "ImageRegistryPasswordType v82"
description: "ImageRegistryPasswordType v82"
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
# ImageRegistryPasswordType enum v82

type: string

The type of the image registry password being given in password

Possible values are: 

  - `ClearText` - The image registry password in clear text, will not be processed in any way and used directly
  - `KeyVaultReference` - The URI to a KeyVault secret version, will be resolved using the application's managed identity (this type is only valid if the app was assigned a managed identity) before getting used
  - `SecretValueReference` - The reference to a SecretValue resource, will be resolved before getting used

