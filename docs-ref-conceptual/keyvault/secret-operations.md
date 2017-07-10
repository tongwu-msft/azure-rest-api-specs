---
ms.assetid: cef1870f-eaea-418e-a730-22ba444825ba
title: Azure Key Vault secret operations | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 06/14/2017
---
# Azure Key Vault secret operations

The Azure Key Vault REST API supports the following operations for secrets.

- [Set a secret](../../docs-ref-autogen/keyvault/SetSecret.json)
- [Get a secret](../../docs-ref-autogen/keyvault/GetSecret.json)
- [Get secrets in a key vault](../../docs-ref-autogen/keyvault/GetSecrets.json)
- [Get versions of a secret](../../docs-ref-autogen/keyvault/GetSecretVersions.json)
- [Delete a secret](../../docs-ref-autogen/keyvault/DeleteSecret.json)
- [Update a secret](../../docs-ref-autogen/keyvault/UpdateSecret.json)
- [Backup a secret](../../docs-ref-autogen/keyvault/BackupSecret.json)
- [Restore a secret](../../docs-ref-autogen/keyvault/RestoreSecret.json)

## Soft-delete operations

The soft-delete feature suppports these operations for deleted secrets

- [Get deleted secret](../../docs-ref-autogen/keyvault/GetDeletedSecret.json)
- [Get deleted secrets](../../docs-ref-autogen/keyvault/GetDeletedSecrets.json)
- [Purge deleted secret](../../docs-ref-autogen/keyvault/PurgeDeletedSecret.json)
- [Recover deleted secret](../../docs-ref-autogen/keyvault/RecoverDeletedSecret.json)

For more information on Key Vault's soft-delete feature, see [Azure Key Vault soft-delete feature overview](https://docs.microsoft.com/azure/key-vault/key-vault-ovw-soft-delete).

## See Also
[Common parameters and headers](common-parameters-and-headers.md)
[About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
