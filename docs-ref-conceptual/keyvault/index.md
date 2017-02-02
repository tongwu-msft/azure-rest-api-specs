
---
ms.assetid: 16d4764e-3c9d-42b4-b749-bed20ca6b741
ms.title: Azure Key Vault REST API reference | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
ms.manager: mbaldwin
---

# Key Vault REST API Reference

Managing your key vaults as well as the keys, secrets, and certificates within your key vaults can be accomplished through a REST interface.

Manage your key vaults using the following set of operations.

- [Manage key vaults](../../docs-ref-autogen/keyvault/Vaults.json)

Managing within a Key Vault includes operations for creating, managing and executing cryptographic operations with keys, secrets and certificates within the Azure environment.

- [Key operations](key-operations.md)
- [Secret operations](secret-operations.md)
- [Certificate operations](certificate-operations.md)


For conceptual and detailed information, see - [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).

## Common tasks

Key Vaults

- [Create or update a key vault](../../docs-ref-autogen/keyvault/Vaults.json#Vaults_CreateOrUpdate)
- [Deletes a key vault](../../docs-ref-autogen/keyvault/Vaults.json#Vaults_Delete)
- [Gets info about a key vault](../../docs-ref-autogen/keyvault/Vaults.json#Vaults_Get)


Keys


- [Create a key](../../docs-ref-autogen/keyvault/CreateKey.json)
- [Get information about a key](../../docs-ref-autogen/keyvault/GetKey.json)
- [Encrypt with a key](../../docs-ref-autogen/keyvault/encrypt.json)

Secrets

- [Create a secret](../../docs-ref-autogen/keyvault/SetSecret.json)
- [Get a secret](../../docs-ref-autogen/keyvault/GetSecret.json)

Certificates


- [Create a certificate](../../docs-ref-autogen/keyvault/CreateCertificate.json)
- [Import a certificate](../../docs-ref-autogen/keyvault/ImportCertificate.json)
- [Update a certificate](../../docs-ref-autogen/keyvault/UpdateCertificate.json)
- [Update a certificate policy](../../docs-ref-autogen/keyvault/UpdateCertificatePolicy.json)

### See Also

- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
- [Authentication, requests and responses](authentication--requests-and-responses.md)
- [Key Vault versions](key-vault-versions.md)
