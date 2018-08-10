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

Managing your Key Vault and the contents of your Key Vault can be accomplished through a REST interface. Below are lists of common tasks for managing both.

## Key Vaults

Manage your Key Vault using the following set of operations, which are also known as [management plane](\azure\key-vault\key-vault-secure-your-key-vault#management-plane-and-data-plane) operations. The management plane interface is used to manage a Key Vault itself. For instance, creating, deleting, or updating Key Vault attributes, and setting access policies for the data plane. 

- [Manage a Key Vault](/rest/api/keyvault/vaults)
- [Create or update a Key Vault](/rest/api/keyvault/vaults/createorupdate)
- [Delete a Key Vault](/rest/api/keyvault/vaults/delete)
- [Get info about a Key Vault](/rest/api/keyvault/vaults/vaults.get)

## Keys, secrets, certificates, and storage accounts

Managing data within a Key Vault, such as keys, secrets, certificates, and storage keys, is accomplished by [data plane](\azure\key-vault\key-vault-secure-your-key-vault#management-plane-and-data-plane) operations. The data plane interface is used to add, delete, modify, and use the keys, secrets, and certificates stored in a Key Vault.

### Keys

- [Create a key](xref:keyvault.createkey)
- [Get information about a key](xref:keyvault.getkey)
- [Encrypt using a key](xref:keyvault.encrypt)
- [Recover a deleted key](xref:keyvault.recoverdeletedkey)

### Secrets

- [Create a secret](xref:keyvault.setsecret)
- [Get a secret](xref:keyvault.getsecret)
- [Recover a deleted secret](xref:keyvault.recoverdeletedsecret)

### Certificates

For concepts and more detailed information, see [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).

- [Create a certificate](xref:keyvault.createcertificate)
- [Import a certificate](xref:keyvault.importcertificate)
- [Update a certificate](xref:keyvault.updatecertificate)
- [Update a certificate policy](xref:keyvault.updatecertificatepolicy)
- [Recover a deleted certificate](xref:keyvault.recoverdeletedcertificate)

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

