---
ms.assetid: 16d4764e-3c9d-42b4-b749-bed20ca6b741
ms.title: Azure Key Vault REST API reference | Microsoft Docs
ms.service: key-vault
author: BryanLa
ms.author: bryanla
ms.manager: mbaldwin
ms.date: 08/08/2018
---

# Azure Key Vault REST API reference

Managing your Key Vault as well as the contents of your Key Vault can be accomplished through a REST interface. Below are lists of common tasks for managing both.

## Key Vaults

Manage your Key Vault using the following set of operations. These are also known as management-plane operations.

- [Manage a Key Vault](/rest/api/keyvault/vaults)
- [Create or update a Key Vault](xref:management.azure.com.keyvault.vaults.createorupdate)
- [Deletes a Key Vault](xref:management.azure.com.keyvault.vaults.delete)
- [Gets info about a Key Vault](xref:management.azure.com.keyvault.vaults.get)

## Keys, secrets, certificates, and storage accounts

Managing within a Key Vault includes operations for creating, managing and executing cryptographic operations using keys, secrets, certificates, and storage keys, within the Azure environment. These are also known as data-plane operations.

### Keys

- [Create a key](xref:keyvault.createkey)
- [Get information about a key](xref:keyvault.getkey)
- [Encrypt with a key](xref:keyvault.encrypt)
- [Recover deleted key](xref:keyvault.recoverdeletedkey)

### Secrets

- [Create a secret](xref:keyvault.setsecret)
- [Get a secret](xref:keyvault.getsecret)
- [Recover deleted secret](xref:keyvault.recoverdeletedsecret)

### Certificates

- [Create a certificate](xref:keyvault.createcertificate)
- [Import a certificate](xref:keyvault.importcertificate)
- [Update a certificate](xref:keyvault.updatecertificate)
- [Update a certificate policy](xref:keyvault.updatecertificatepolicy)
- [Recover deleted certificate](xref:keyvault.recoverdeletedcertificate)

For conceptual and detailed information, see [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).

### Storage accounts

- [Set a storage account](xref:keyvault.setstorageaccount)
- [Get a storage account](xref:keyvault.getstorageaccount)
- [Delete a storage account](xref:keyvault.deletestorageaccount)

## See also

- For general information on constructing Azure REST API requests, see the [Azure REST API reference](/rest/api/azure/)
- For information specific to constructing Key Vault REST API requests, see
   - [Common HTTP request parameters and headers](common-parameters-and-headers.md)
   - [Authentication, requests and responses](authentication--requests-and-responses.md)
- See the following topics for additional Key Vault concepts and details
   - [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
   - [Key Vault Developer's Guide](/azure/key-vault/key-vault-developers-guide)
   - [Key Vault versions](key-vault-versions.md)

