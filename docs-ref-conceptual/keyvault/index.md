---
ms.assetid: 16d4764e-3c9d-42b4-b749-bed20ca6b741
ms.title: Azure Key Vault REST API reference | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
ms.manager: mbaldwin
ms.date: 06/21/2017
---

# Azure Key Vault REST API reference

Managing your key vaults as well as the keys, secrets, and certificates within your key vaults can be accomplished through a REST interface.

Manage your key vaults using the following set of operations.

- [Manage key vaults](../../docs-ref-autogen/keyvault/Vaults.yml)

Managing within a Key Vault includes operations for creating, managing and executing cryptographic operations with keys, secrets and certificates within the Azure environment.

- [Key operations](key-operations.md)
- [Secret operations](secret-operations.md)
- [Certificate operations](certificate-operations.md)

For conceptual and detailed information, see - [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).

## Common tasks

### Key vaults

- [Create or update a key vault](../../docs-ref-autogen/keyvault/Vaults.yml#Vaults_CreateOrUpdate)
- [Deletes a key vault](../../docs-ref-autogen/keyvault/Vaults.yml#Vaults_Delete)
- [Gets info about a key vault](../../docs-ref-autogen/keyvault/Vaults.yml#Vaults_Get)

### Keys

- [Create a key](../../docs-ref-autogen/keyvault/CreateKey.yml)
- [Get information about a key](../../docs-ref-autogen/keyvault/GetKey.yml)
- [Encrypt with a key](../../docs-ref-autogen/keyvault/encrypt.yml)
- [Recover deleted key](../../docs-ref-autogen/keyvault/RecoverDeletedKey.yml)

### Secrets

- [Create a secret](../../docs-ref-autogen/keyvault/SetSecret.yml)
- [Get a secret](../../docs-ref-autogen/keyvault/GetSecret.yml)
- [Recover deleted secret](../../docs-ref-autogen/keyvault/RecoverDeletedSecret.yml)

### Certificates

- [Create a certificate](../../docs-ref-autogen/keyvault/CreateCertificate.yml)
- [Import a certificate](../../docs-ref-autogen/keyvault/ImportCertificate.yml)
- [Update a certificate](../../docs-ref-autogen/keyvault/UpdateCertificate.yml)
- [Update a certificate policy](../../docs-ref-autogen/keyvault/UpdateCertificatePolicy.yml)
- [Recover deleted certificate](../../docs-ref-autogen/keyvault/RecoverDeletedCertificate.yml)

### Storage accounts

- [Set a storage account](../../docs-ref-autogen/keyvault/SetStorageAccount.yml)
- [Get a storage account](../../docs-ref-autogen/keyvault/GetStorageAccount.yml)
- [Delete a storage account](../../docs-ref-autogen/keyvault/DeleteStorageAccount.yml)

### See also

- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
- [Authentication, requests and responses](authentication--requests-and-responses.md)
- [Key Vault Developer's Guide](/azure/key-vault/key-vault-developers-guide)
- [Key Vault versions](key-vault-versions.md)

