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

- [Set a secret](../../docs-ref-autogen/keyvault/SetSecret.yml)
- [Get a secret](../../docs-ref-autogen/keyvault/GetSecret.yml)
- [Get secrets in a key vault](../../docs-ref-autogen/keyvault/GetSecrets.yml)
- [Get versions of a secret](../../docs-ref-autogen/keyvault/GetSecretVersions.yml)
- [Delete a secret](../../docs-ref-autogen/keyvault/DeleteSecret.yml)
- [Update a secret](../../docs-ref-autogen/keyvault/UpdateSecret.yml)
- [Backup a secret](../../docs-ref-autogen/keyvault/BackupSecret.yml)
- [Restore a secret](../../docs-ref-autogen/keyvault/RestoreSecret.yml)

## Soft-delete operations

The soft-delete feature suppports these operations for deleted secrets

- [Get deleted secret](../../docs-ref-autogen/keyvault/GetDeletedSecret.yml)
- [Get deleted secrets](../../docs-ref-autogen/keyvault/GetDeletedSecrets.yml)
- [Purge deleted secret](../../docs-ref-autogen/keyvault/PurgeDeletedSecret.yml)
- [Recover deleted secret](../../docs-ref-autogen/keyvault/RecoverDeletedSecret.yml)

For more information on Key Vault's soft-delete feature, see [Azure Key Vault soft-delete feature overview](https://docs.microsoft.com/azure/key-vault/key-vault-ovw-soft-delete).

## See Also
[Common parameters and headers](common-parameters-and-headers.md)
[About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
