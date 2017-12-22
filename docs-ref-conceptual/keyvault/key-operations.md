---
ms.assetid: 45dc6cfc-8ce9-4728-b2a2-66c9cbda3a3d
title: Azure Key Vault key operations | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 06/14/2017
---
# Azure Key Vault key operations

The Azure Key Vault REST API supports the following operations for key objects.

- [Create a key](../../docs-ref-autogen/keyvault/CreateKey.yml)
- [Update a key](../../docs-ref-autogen/keyvault/UpdateKey.yml)
- [Delete a key](../../docs-ref-autogen/keyvault/DeleteKey.yml)
- [Get information about a key](../../docs-ref-autogen/keyvault/GetKey.yml)
- [Get the keys in a vault](../../docs-ref-autogen/keyvault/GetKeys.yml)
- [Get the versions of a key](../../docs-ref-autogen/keyvault/GetKeyVersions.yml)
- [Import a key into a vault](../../docs-ref-autogen/keyvault/ImportKey.yml)
- [Backup a key](../../docs-ref-autogen/keyvault/BackupKey.yml)
- [Restore a key](../../docs-ref-autogen/keyvault/RestoreKey.yml)

## Cryptographic operations

- [Encrypt with a key](../../docs-ref-autogen/keyvault/encrypt.yml)
- [Decrypt with a key](../../docs-ref-autogen/keyvault/decrypt.yml)
- [Sign with a key](../../docs-ref-autogen/keyvault/sign.yml)
- [Verify with a key](../../docs-ref-autogen/keyvault/verify.yml)
- [Wrap a key](../../docs-ref-autogen/keyvault/wrapKey.yml)
- [Unwrap a key](../../docs-ref-autogen/keyvault/unwrapKey.yml)

## Soft-delete operations

The soft-delete feature suppports these operations for deleted keys

- [Get deleted key](../../docs-ref-autogen/keyvault/GetDeletedKey.yml)
- [Get deleted keys](../../docs-ref-autogen/keyvault/GetDeletedKeys.yml)
- [Purge deleted key](../../docs-ref-autogen/keyvault/PurgeDeletedKey.yml)
- [Recover deleted key](../../docs-ref-autogen/keyvault/RecoverDeletedKey.yml)

For more information on Key Vault's soft-delete feature, see [Azure Key Vault soft-delete feature overview](https://docs.microsoft.com/azure/key-vault/key-vault-ovw-soft-delete).

## See Also

- [Common parameters and headers](common-parameters-and-headers.md)
- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
