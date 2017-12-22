---
title: Azure Key Vault storage account operations | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 06/20/2017
---
# Azure Key Vault storage account operations

The Azure Key Vault REST API supports the following operations for storage accounts.

- [Get a storage account](../../docs-ref-autogen/keyvault/GetStorageAccount.yml)
- [Get a storage accounts](../../docs-ref-autogen/keyvault/GetStorageAccounts.yml)
- [Delete a storage account](../../docs-ref-autogen/keyvault/DeleteStorageAccount.yml)
- [Regenerate a storage account key](../../docs-ref-autogen/keyvault/RegenerateStorageAccountKey.yml)
- [Set a storage account](../../docs-ref-autogen/keyvault/SetStorageAccount.yml)
- [Update a storage account](../../docs-ref-autogen/keyvault/UpdateStorageAccount.yml)

## Shared access signatures management

Azure Key Vault's implementation of storage account keys also removes the need for your direct contact with an Azure Storage Account key by offering shared access signatures (SAS) as a method.

- [Set a SAS definition](../../docs-ref-autogen/keyvault/SetSasDefinition.yml)
- [Update a SAS definition](../../docs-ref-autogen/keyvault/UpdateSasDefinition.yml)
- [Get a SAS definition](../../docs-ref-autogen/keyvault/GetSasDefinition.yml)
- [Set a SAS definition](../../docs-ref-autogen/keyvault/SetSasDefinition.yml)
- [Delete a SAS definition](../../docs-ref-autogen/keyvault/DeleteSasDefinition.yml)

For more information on Key Vault's storage account keys, see [Azure Key Vault storage account keys overview](https://docs.microsoft.com/azure/key-vault/key-vault-ovw-storage-keys).

## See Also
[Common parameters and headers](common-parameters-and-headers.md)
[About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
