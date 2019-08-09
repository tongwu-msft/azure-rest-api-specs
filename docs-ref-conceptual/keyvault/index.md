---

title:: Azure Key Vault REST API reference
ms.service: key-vault
author: msmbaldwin
ms.author: mbaldwin
ms.manager: mbaldwin
ms.date: 05/03/2018
---

# Azure Key Vault REST API reference

Use Key Vault to safeguard and manage cryptographic keys and secrets used by cloud applications and services.

## Vault operations

| Operation | Description |
|--|--|
| [Check Name Availability](/rest/api/keyvault/vaults/checknameavailability) | Checks that the vault name is valid and is not already in use.| 
| [Create Or Update](/rest/api/keyvault/vaults/createorupdate) | Create or update a key vault in the specified subscription.| 
| [Delete](/rest/api/keyvault/vaults/delete) | Deletes the specified Azure key vault.| 
| [Get](/rest/api/keyvault/vaults/get) | Gets the specified Azure key vault.| 
| [Get Deleted](/rest/api/keyvault/vaults/getdeleted) | Gets the deleted Azure key vault.| 
| [List](/rest/api/keyvault/vaults/list) | The List operation gets information about the vaults associated with the subscription.| 
| [List By Resource Group](/rest/api/keyvault/vaults/listbyresourcegroup) | The List operation gets information about the vaults associated with the subscription and within the specified resource group.| 
| [List By Subscription](/rest/api/keyvault/vaults/listbysubscription) | The List operation gets information about the vaults associated with the subscription.| 
| [List Deleted](/rest/api/keyvault/vaults/listdeleted) | Gets information about the deleted vaults in a subscription.| 
| [Purge Deleted](/rest/api/keyvault/vaults/purgedeleted) | Permanently deletes the specified vault. | 
| [Update](/rest/api/keyvault/vaults/update) | Update a key vault in the specified subscription.| 
| [Update Access Policy](/rest/api/keyvault/vaults/updateaccesspolicy) | Update access policies in a key vault in the specified subscription.| 

## Key operations

| Operation | Description |
|--|--|
| [Backup Key](/rest/api/keyvault/BackupKey) | Requests that a backup of the specified key be downloaded to the client. |
| [Create Key](/rest/api/keyvault/CreateKey) | Creates a new key, stores it, then returns key parameters and attributes to the client. |
| [Decrypt](/rest/api/keyvault/decrypt) | Decrypts a single block of encrypted data. |
| [Delete Key](/rest/api/keyvault/DeleteKey) | Deletes a key of any type from storage in Azure Key Vault. |
| [Encrypt](/rest/api/keyvault/encrypt) | Encrypts an arbitrary sequence of bytes using an encryption key that is stored in a key vault. |
| [Get Deleted Key](/rest/api/keyvault/GetDeletedKey) | Gets the public part of a deleted key. |
| [Get Deleted Keys](/rest/api/keyvault/GetDeletedKeys) | Lists the deleted keys in the specified vault. |
| [Get Key](/rest/api/keyvault/GetKey) | Gets the public part of a stored key. |
| [Get Key Versions](/rest/api/keyvault/GetKeyVersions) | Retrieves a list of individual key versions with the same key name. |
| [Get Keys](/rest/api/keyvault/GetKeys) | List keys in the specified vault. |
| [Import Key](/rest/api/keyvault/ImportKey) | Imports an externally created key, stores it, and returns key parameters and attributes to the client. |
| [Purge Deleted Key](/rest/api/keyvault/PurgeDeletedKey) | Permanently deletes the specified key. |
| [Recover Deleted Key](/rest/api/keyvault/RecoverDeletedKey) | Recovers the deleted key to its latest version. |
| [Restore Key](/rest/api/keyvault/RestoreKey) | Restores a backed up key to a vault. |
| [Sign](/rest/api/keyvault/sign) | Creates a signature from a digest using the specified key. |
| [Unwrap Key](/rest/api/keyvault/unwrapKey) | Unwraps a symmetric key using the specified key that was initially used for wrapping that key. |
| [Update Key](/rest/api/keyvault/UpdateKey) | The update key operation changes specified attributes of a stored key and can be applied to any key type and key version stored in Azure Key Vault. |
| [Verify](/rest/api/keyvault/verify) | Verifies a signature using a specified key. |
| [Wrap Key](/rest/api/keyvault/wrapKey) | Wraps a symmetric key using a specified key. |

## Secret operations

| Operation | Description |
|--|--|
| [Backup Secret](/rest/api/keyvault/BackupSecret) | Backs up the specified secret. |
| [Delete Secret](/rest/api/keyvault/DeleteSecret) | Deletes a secret from a specified key vault. |
| [Get Deleted Secret](/rest/api/keyvault/GetDeletedSecret) | Gets the specified deleted secret. |
| [Get Deleted Secrets](/rest/api/keyvault/GetDeletedSecrets) | Lists deleted secrets for the specified vault. |
| [Get Secret](/rest/api/keyvault/GetSecret) | Get a specified secret from a given key vault. |
| [Get Secret Versions](/rest/api/keyvault/GetSecretVersions) | List all versions of the specified secret. |
| [Get Secrets](/rest/api/keyvault/GetSecrets) | List secrets in a specified key vault. |
| [Purge Deleted Secret](/rest/api/keyvault/PurgeDeletedSecret) | Permanently deletes the specified secret. |
| [Recover Deleted Secret](/rest/api/keyvault/RecoverDeletedSecret) | Recovers the deleted secret to the latest version. |
| [Restore Secret](/rest/api/keyvault/RestoreSecret) | Restores a backed up secret to a vault. |
| [Set Secret](/rest/api/keyvault/SetSecret) | Sets a secret in a specified key vault. |
| [Update Secret](/rest/api/keyvault/UpdateSecret) | Updates the attributes associated with a specified secret in a given key vault. |



## Certificate operations

| Operation | Description |
|--|--|
| [Backup Certificate](/rest/api/keyvault/BackupCertificate) | Backs up the specified certificate. |
| [Create Certificate](/rest/api/keyvault/CreateCertificate) | Creates a new certificate. |
| [Delete Certificate](/rest/api/keyvault/DeleteCertificate) | Deletes a certificate from a specified key vault. |
| [Delete Certificate Contacts](/rest/api/keyvault/DeleteCertificateContacts) | Deletes the certificate contacts for a specified key vault. |
| [Delete Certificate Issuer](/rest/api/keyvault/DeleteCertificateIssuer) | Deletes the specified certificate issuer. |
| [Delete Certificate Operation](/rest/api/keyvault/DeleteCertificateOperation) | Deletes the creation operation for a specific certificate. |
| [Get Certificate](/rest/api/keyvault/GetCertificate) | Gets information about a certificate. |
| [Get Certificate Contacts](/rest/api/keyvault/GetCertificateContacts) | Lists the certificate contacts for a specified key vault. |
| [Get Certificate Issuer](/rest/api/keyvault/GetCertificateIssuer) | Lists the specified certificate issuer. |
| [Get Certificate Issuers](/rest/api/keyvault/GetCertificateIssuers) | List certificate issuers for a specified key vault. |
| [Get Certificate Operation](/rest/api/keyvault/GetCertificateOperation) | Gets the creation operation of a certificate. |
| [Get Certificate Policy](/rest/api/keyvault/GetCertificatePolicy) | Lists the policy for a certificate. |
| [Get Certificate Versions](/rest/api/keyvault/GetCertificateVersions) | List the versions of a certificate. |
| [Get Certificates](/rest/api/keyvault/GetCertificates) | List certificates in a specified key vault |
| [Get Deleted Certificate](/rest/api/keyvault/GetDeletedCertificate) | Retrieves information about the specified deleted certificate. |
| [Get Deleted Certificates](/rest/api/keyvault/GetDeletedCertificates) | Lists the deleted certificates in the specified vault currently available for recovery. |
| [Import Certificate](/rest/api/keyvault/ImportCertificate) | Imports a certificate into a specified key vault. |
| [Merge Certificate](/rest/api/keyvault/MergeCertificate) | Merges a certificate or a certificate chain with a key pair existing on the server. |
| [Purge Deleted Certificate](/rest/api/keyvault/PurgeDeletedCertificate) | Permanently deletes the specified deleted certificate. |
| [Recover Deleted Certificate](/rest/api/keyvault/RecoverDeletedCertificate) | Recovers the deleted certificate back to its current version under /certificates. |
| [Restore Certificate](/rest/api/keyvault/RestoreCertificate) | Restores a backed up certificate to a vault. |
| [Set Certificate Contacts](/rest/api/keyvault/SetCertificateContacts) | Sets the certificate contacts for the specified key vault. |
| [Set Certificate Issuer](/rest/api/keyvault/SetCertificateIssuer) | Sets the specified certificate issuer. |
| [Update Certificate](/rest/api/keyvault/UpdateCertificate) | Updates the specified attributes associated with the given certificate. |
| [Update Certificate Issuer](/rest/api/keyvault/UpdateCertificateIssuer) | Updates the specified certificate issuer. |
| [Update Certificate Operation](/rest/api/keyvault/UpdateCertificateOperation) | Updates a certificate operation. |
| [Update Certificate Policy](/rest/api/keyvault/UpdateCertificatePolicy) | Updates the policy for a certificate. |

## Storage operations

| Operation | Description |
|--|--|
| [Backup Storage Account](/rest/api/keyvault/BackupStorageAccount) | Backs up the specified storage account. |
| [Delete Sas Definition](/rest/api/keyvault/DeleteSasDefinition) | Deletes a SAS definition from a specified storage account. This operation requires the storage/deletesas permission. |
| [Delete Storage Account](/rest/api/keyvault/DeleteStorageAccount) | Deletes a storage account. This operation requires the storage/delete permission. |
| [Get Deleted Sas Definition](/rest/api/keyvault/GetDeletedSasDefinition) | Gets the specified deleted sas definition. |
| [Get Deleted Sas Definitions](/rest/api/keyvault/GetDeletedSasDefinitions) | Lists deleted SAS definitions for the specified vault and storage account. |
| [Get Deleted Storage Account](/rest/api/keyvault/GetDeletedStorageAccount) | Gets the specified deleted storage account. |
| [Get Deleted Storage Accounts](/rest/api/keyvault/GetDeletedStorageAccounts) | Lists deleted storage accounts for the specified vault. |
| [Get Sas Definition](/rest/api/keyvault/GetSasDefinition) | Gets information about a SAS definition for the specified storage account. This operation requires the storage/getsas permission. |
| [Get Sas Definitions](/rest/api/keyvault/GetSasDefinitions) | List storage SAS definitions for the given storage account. This operation requires the storage/listsas permission. |
| [Get Storage Account](/rest/api/keyvault/GetStorageAccount) | Gets information about a specified storage account. This operation requires the storage/get permission. |
| [Get Storage Accounts](/rest/api/keyvault/GetStorageAccounts) | List storage accounts managed by the specified key vault. This operation requires the storage/list permission. |
| [Purge Deleted Storage Account](/rest/api/keyvault/PurgeDeletedStorageAccount) | Permanently deletes the specified storage account. |
| [Recover Deleted Sas Definition](/rest/api/keyvault/RecoverDeletedSasDefinition) | Recovers the deleted SAS definition. |
| [Recover Deleted Storage Account](/rest/api/keyvault/RecoverDeletedStorageAccount) | Recovers the deleted storage account. |
| [Regenerate Storage Account Key](/rest/api/keyvault/RegenerateStorageAccountKey) | Regenerates the specified key value for the given storage account. This operation requires the storage/regeneratekey permission. |
| [Restore Storage Account](/rest/api/keyvault/RestoreStorageAccount) | Restores a backed up storage account to a vault. |
| [Set Sas Definition](/rest/api/keyvault/SetSasDefinition) | Creates or updates a new SAS definition for the specified storage account. This operation requires the storage/setsas permission. |
| [Set Storage Account](/rest/api/keyvault/SetStorageAccount) | Creates or updates a new storage account. This operation requires the storage/set permission. |
| [Update Sas Definition](/rest/api/keyvault/UpdateSasDefinition) | Updates the specified attributes associated with the given SAS definition. This operation requires the storage/setsas permission. |
| [Update Storage Account](/rest/api/keyvault/UpdateStorageAccount) | Updates the specified attributes associated with the given storage account. This operation requires the storage/set/update permission. |


## See also

- For concepts and detailed information about data plane objects, see [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).
- For general information on constructing Azure REST API requests, see the [Azure REST API reference](/rest/api/azure/)
- For information specific to constructing Key Vault REST API requests, see
   - [Common HTTP request parameters and headers](common-parameters-and-headers.md)
   - [Authentication, requests and responses](authentication--requests-and-responses.md)
- See the following topics for additional Key Vault concepts and details
   - [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
   - [Key Vault Developer's Guide](/azure/key-vault/key-vault-developers-guide)
   - [Key Vault versions](key-vault-versions.md)
