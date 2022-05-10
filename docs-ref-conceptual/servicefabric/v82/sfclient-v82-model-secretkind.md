---
title: "SecretKind v82"
description: "SecretKind v82"
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
# SecretKind enum v82

type: string

Describes the kind of secret.

Possible values are: 

  - `inlinedValue` - A simple secret resource whose plaintext value is provided by the user.
  - `keyVaultVersionedReference` - A secret resource that references a specific version of a secret stored in Azure Key Vault; the expected value is a versioned KeyVault URI corresponding to the version of the secret being referenced.

