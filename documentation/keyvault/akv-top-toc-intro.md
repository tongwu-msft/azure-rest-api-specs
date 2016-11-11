---
title: "Key Vault REST API"
ms.custom: ""
ms.date: "2016-11-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "key-vault"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure Key Vault"
ms.assetid: 27acb17a-22ce-49f6-af33-02126d7ccc73
author: "bruceperlerMS"
ms.author: "bruceper"
manager: "mbaldwin"
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

# Key Vault REST API Reference

Managing Key Vaults as well as keys, secrets, and certificates within Key Vaults can be accomplished through a REST interface.

Manage your Key Vaults using the following guidance:

- [Key Vault management]()

Managing within a Key Vault includes operations for creating, managing and executing cryptographic operations with keys, secrets and certificates within the Azure environment.

- [Key operations](../key-operations.md)


- [Secret operations](../secret-operations.md)


- [Certificate operations](../certificate-operations.md)


For conceptual and detailed information, see - [About keys, secrets, and certificates](../about-keys--secrets-and-certifictes.md).

## Common tasks

Key Vaults


- [Manage key vaults](../Vaults.md)




Keys


- [Create a key](../CreateKey.json)


- [Get information about a key](../GetKey.json)


- [Encrypt with a key](../encrypt.json)



Secrets

- [Create a secret](../SetSecret.json)


- [Get a secret](../GetSecret.json)


Certificates


- [Create a certificate](../CreateCertificate.json)


- [Import a certificate](../ImportCertificate.json)


- [Update a certificate](../UpdateCertificate.json)


- [Update a certificate policy](../UpdateCertificatePolicy.json)

### See Also

- [About keys, secrets, and certificates](../about-keys--secrets-and-certifictes.md)
- [Authentication, requests and responses](../authentication--requests-and-responses.md)
- [Key Vault versions](../key-vault-versions.md)



