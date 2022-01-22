---

title: Azure Key Vault REST API reference
ms.service: key-vault
author: msmbaldwin
ms.author: mbaldwin
ms.date: 02/12/2021
---

# Azure Key Vault REST API reference

Use Key Vault to safeguard and manage cryptographic keys, certificates and secrets used by cloud applications and services.

## Key Vault operations

| Operation | Description |
|--|--|
| [Check Name Availability](/rest/api/keyvault/keyvault/vaults/checknameavailability) | Checks that the vault name is valid and is not already in use.| 
| [Create Or Update](/rest/api/keyvault/keyvault/vaults/createorupdate) | Create or update a key vault in the specified subscription.| 
| [Update Access Policy](/rest/api/keyvault/keyvault/vaults/updateaccesspolicy) | Update access policies in a key vault in the specified subscription.| 
| [Get](/rest/api/keyvault/keyvault/vaults/get) | Gets the specified Azure key vault.| 
| [List](/rest/api/keyvault/keyvault/vaults/list) | The List operation gets information about the vaults associated with the subscription.| 
| [List By Resource Group](/rest/api/keyvault/keyvault/vaults/listbyresourcegroup) | The List operation gets information about the vaults associated with the subscription and within the specified resource group.| 
| [List By Subscription](/rest/api/keyvault/keyvault/vaults/listbysubscription) | The List operation gets information about the vaults associated with the subscription.| 
| [Update](/rest/api/keyvault/keyvault/vaults/update) | Update a key vault in the specified subscription.| 
| [Delete](/rest/api/keyvault/keyvault/vaults/delete) | Deletes the specified Azure key vault.| 
| [Get Deleted](/rest/api/keyvault/keyvault/vaults/getdeleted) | Gets the deleted Azure key vault.| 
| [List Deleted](/rest/api/keyvault/keyvault/vaults/listdeleted) | Gets information about the deleted vaults in a subscription.| 
| [Purge](/rest/api/keyvault/keyvault/vaults/purgedeleted) | Permanently deletes the specified vault. | 

### Private link operations

| Operation | Description |
|--|--|
| [List By Vault](/rest/api/keyvault/keyvault/private-link-resources/list-by-vault) | Gets the private link resources supported for the key vault.| 

#### Private endpoint connections operations

| Operation | Description |
|--|--|
| [Get](/rest/api/keyvault/keyvault/private-endpoint-connections/get) | Gets the specified private endpoint connection associated with the key vault.| 
| [List By Resource](/rest/api/keyvault/keyvault/private-endpoint-connections/list-by-resource) | The List operation gets information about the private endpoint connections associated with the vault.| 
| [Put](/rest/api/keyvault/keyvault/private-endpoint-connections/put) | Updates the specified private endpoint connection associated with the key vault.| 
| [Delete](/rest/api/keyvault/keyvault/private-endpoint-connections/delete) | Deletes the specified private endpoint connection associated with the key vault.| 

## Managed HSM operations

| Operation | Description |
|--|--|
| [Create Or Update](/rest/api/keyvault/managedhsm/managed-hsms/create-or-update) | Create or update a managed HSM Pool in the specified subscription.| 
| [Get](/rest/api/keyvault/managedhsm/managed-hsms/get) | Gets the specified managed HSM Pool.| 
| [List By Resource Group](/rest/api/keyvault/managedhsm/managed-hsms/list-by-resource-group) | The List operation gets information about the managed HSM Pools associated with the subscription and within the specified resource group.| 
| [List By Subscription](/rest/api/keyvault/managedhsm/managed-hsms/list-by-subscription) | The List operation gets information about the managed HSM Pools associated with the subscription.| 
| [Update](/rest/api/keyvault/managedhsm/managed-hsms/update) | Update a managed HSM Pool in the specified subscription.| 
| [Get Deleted](/rest/api/keyvault/managedhsm/managed-hsms/get-deleted) | Gets the specified deleted managed HSM.| 
| [List Deleted](/rest/api/keyvault/managedhsm/managed-hsms/list-deleted) | The List operation gets information about the deleted managed HSMs associated with the subscription.| 
| [Delete](/rest/api/keyvault/managedhsm/managed-hsms/delete) | Deletes the specified managed HSM Pool.| 
| [Purge Deleted](/rest/api/keyvault/managedhsm/managed-hsms/purge-deleted) | Permanently deletes the specified managed HSM. | 

### Private link operations

| Operation | Description |
|--|--|
| [List By MHSM Resource](/rest/api/keyvault/managedhsm/mhsm-private-link-resources/list-by-mhsm-resource) | Gets the private link resources supported for the managed hsm pool.| 

#### Private endpoint connections operations

| Operation | Description |
|--|--|
| [Get](/rest/api/keyvault/managedhsm/mhsm-private-endpoint-connections/get) | Gets the specified private endpoint connection associated with the managed HSM Pool.| 
| [List By Resource](/rest/api/keyvault/managedhsm/mhsm-private-endpoint-connections/list-by-resource) | The List operation gets information about the private endpoint connections associated with the managed HSM Pool.| 
| [Put](/rest/api/keyvault/managedhsm/mhsm-private-endpoint-connections/put) | Updates the specified private endpoint connection associated with the managed HSM Pool.| 
| [Delete](/rest/api/keyvault/managedhsm/mhsm-private-endpoint-connections/delete) | Deletes the specified private endpoint connection associated with the managed HSM Pool.| 

### HSM Security Domain operations

| Operation | Description |
|--|--|
| [Download](/rest/api/keyvault/managedhsm-hsmsecuritydomain/hsm-security-domain/download) | Retrieves the Security Domain from the managed HSM. Calling this endpoint can be used to activate a provisioned managed HSM resource.| 
| [Download Pending](/rest/api/keyvault/managedhsm-hsmsecuritydomain/hsm-security-domain/download-pending) | Retrieves the Security Domain download operation status. | 
| [Upload](/rest/api/keyvault/managedhsm-hsmsecuritydomain/hsm-security-domain/upload) | Restore the provided Security Domain. | 
| [Upload Pending](/rest/api/keyvault/managedhsm-hsmsecuritydomain/hsm-security-domain/upload-pending) | Get Security Domain upload operation status. | 

### Role-based access control operations

#### Role assignment operations

| Operation | Description |
|--|--|
| [Get](/rest/api/keyvault/managedhsm-rbac/role-assignments/get) | Get the specified role assignment.| 
| [List](/rest/api/keyvault/managedhsm-rbac/role-assignments/list-for-scope) | Gets role assignments for a scope. | 
| [Create](/rest/api/keyvault/managedhsm-rbac/role-assignments/create) | Creates a role assignment.| 
| [Delete](/rest/api/keyvault/managedhsm-rbac/role-definitions/create-or-update) | Deletes a role assignment. | 

#### Role definition operations

| Operation | Description |
|--|--|
| [Get](/rest/api/keyvault/managedhsm-rbac/role-definitions/get) | Get the specified role definition.| 
| [List](/rest/api/keyvault/managedhsm-rbac/role-definitions/list) | Get all role definitions that are applicable at scope and above. | 
| [Create Or Update](/rest/api/keyvault/managedhsm-rbac/role-definitions/create-or-update) | Creates or updates a custom role definition. | 
| [Delete](/rest/api/keyvault/managedhsm-rbac/role-definitions/delete) | Deletes a custom role definition.| 

### Backup/restore operations

| Operation | Description |
|--|--|
| [Full Backup](/rest/api/keyvault/managedhsm-backup/restore/full-backup) | Creates a full backup using a user-provided SAS token to an Azure blob storage container. This operation is supported only by the Managed HSM service.| 
| [Backup Status](/rest/api/keyvault/managedhsm-backup/restore/full-backup-status) | Returns the status of full backup operation. | 
| [Full Restore](/rest/api/keyvault/managedhsm-backup/restore/full-restore-operation) | Restores all key materials using the SAS token pointing to a previously stored Azure Blob storage backup folder. | 
| [Selective Restore](/rest/api/keyvault/managedhsm-backup/restore/selective-key-restore-operation) | Restores all key versions of a given key using user supplied SAS token pointing to a previously stored Azure Blob storage backup folder. | 
| [Restore Status](/rest/api/keyvault/managedhsm-backup/restore/restore-status) | Returns the status of restore operation. | 

### HSM Security Domain

| Operation | Description |
|--|--|
| [Full Backup](/rest/api/keyvault/managedhsm-backup/restore/full-backup) | Creates a full backup using a user-provided SAS token to an Azure blob storage container. This operation is supported only by the Managed HSM service.| 
| [Backup Status](/rest/api/keyvault/managedhsm-backup/restore/full-backup-status) | Returns the status of full backup operation. | 
| [Full Restore](/rest/api/keyvault/managedhsm-backup/restore/full-restore-operation) | Restores all key materials using the SAS token pointing to a previously stored Azure Blob storage backup folder. | 
| [Selective Restore](/rest/api/keyvault/managedhsm-backup/restore/selective-key-restore-operation) | Restores all key versions of a given key using user supplied SAS token pointing to a previously stored Azure Blob storage backup folder. | 
| [Restore Status](/rest/api/keyvault/managedhsm-backup/restore/restore-status) | Returns the status of restore operation. | 

## Key operations (Key Vault/Managed HSM)

| Operation | Description |
|--|--|
| [Get Key](/rest/api/keyvault/keys/GetKey) | Gets the public part of a stored key. |
| [Get Keys](/rest/api/keyvault/keys/GetKeys) | List keys in the specified vault. |
| [Get Key Versions](/rest/api/keyvault/keys/GetKeyVersions) | Retrieves a list of individual key versions with the same key name. |
| [Create Key](/rest/api/keyvault/keys/CreateKey) | Creates a new key, stores it, then returns key parameters and attributes to the client. |
| [Import Key](/rest/api/keyvault/keys/ImportKey) | Imports an externally created key, stores it, and returns key parameters and attributes to the client. |
| [Update Key](/rest/api/keyvault/keys/UpdateKey) | The update key operation changes specified attributes of a stored key and can be applied to any key type and key version stored in Azure Key Vault. |
| [Delete Key](/rest/api/keyvault/keys/DeleteKey) | Deletes a key of any type from storage in Azure Key Vault. |
| [Get Deleted Key](/rest/api/keyvault/keys/GetDeletedKey) | Gets the public part of a deleted key. |
| [Get Deleted Keys](/rest/api/keyvault/keys/GetDeletedKeys) | Lists the deleted keys in the specified vault. |
| [Purge Deleted Key](/rest/api/keyvault/keys/PurgeDeletedKey) | Permanently deletes the specified key. |
| [Recover Deleted Key](/rest/api/keyvault/keys/RecoverDeletedKey) | Recovers the deleted key to its latest version. |
| [Backup Key](/rest/api/keyvault/keys/BackupKey) | Requests that a backup of the specified key be downloaded to the client. |
| [Restore Key](/rest/api/keyvault/keys/RestoreKey) | Restores a backed up key to a vault. |

### Cryptographic operations

| Operation | Description |
|--|--|
| [Decrypt](/rest/api/keyvault/keys/decrypt) | Decrypts a single block of encrypted data. |
| [Encrypt](/rest/api/keyvault/keys/encrypt) | Encrypts an arbitrary sequence of bytes using an encryption key that is stored in a key vault. |
| [Wrap Key](/rest/api/keyvault/keys/wrapKey) | Wraps a symmetric key using a specified key. |
| [Unwrap Key](/rest/api/keyvault/keys/unwrapKey) | Unwraps a symmetric key using the specified key that was initially used for wrapping that key. |
| [Sign](/rest/api/keyvault/keys/sign) | Creates a signature from a digest using the specified key. |
| [Verify](/rest/api/keyvault/keys/verify) | Verifies a signature using a specified key. |

## Secret operations (Key Vault only)

| Operation | Description |
|--|--|
| [Get Secret](/rest/api/keyvault/secrets/GetSecret) | Get a specified secret from a given key vault. |
| [Get Secrets](/rest/api/keyvault/secrets/GetSecrets) | List secrets in a specified key vault. |
| [Get Secret Versions](/rest/api/keyvault/secrets/GetSecretVersions) | List all versions of the specified secret. |
| [Set Secret](/rest/api/keyvault/secrets/SetSecret) | Sets a secret in a specified key vault. |
| [Update Secret](/rest/api/keyvault/secrets/UpdateSecret) | Updates the attributes associated with a specified secret in a given key vault. |
| [Delete Secret](/rest/api/keyvault/secrets/DeleteSecret) | Deletes a secret from a specified key vault. |
| [Get Deleted Secret](/rest/api/keyvault/secrets/GetDeletedSecret) | Gets the specified deleted secret. |
| [Get Deleted Secrets](/rest/api/keyvault/secrets/GetDeletedSecrets) | Lists deleted secrets for the specified vault. |
| [Purge Deleted Secret](/rest/api/keyvault/secrets/PurgeDeletedSecret) | Permanently deletes the specified secret. |
| [Recover Deleted Secret](/rest/api/keyvault/secrets/RecoverDeletedSecret) | Recovers the deleted secret to the latest version. |
| [Backup Secret](/rest/api/keyvault/secrets/BackupSecret) | Backs up the specified secret. |
| [Restore Secret](/rest/api/keyvault/secrets/RestoreSecret) | Restores a backed up secret to a vault. |

### Storage account key management operations (Key Vault only)

#### Storage Account configuration operations

| Operation | Description |
|--|--|
| [Get Storage Account](/rest/api/keyvault/secrets-storageaccounts/GetStorageAccount) | Gets information about a specified storage account. This operation requires the storage/get permission. |
| [Get Storage Accounts](/rest/api/keyvault/secrets-storageaccounts/GetStorageAccounts) | List storage accounts managed by the specified key vault. This operation requires the storage/list permission. |
| [Update Storage Account](/rest/api/keyvault/secrets-storageaccounts/UpdateStorageAccount) | Updates the specified attributes associated with the given storage account. This operation requires the storage/set/update permission. |
| [Set Storage Account](/rest/api/keyvault/secrets-storageaccounts/SetStorageAccount) | Creates or updates a new storage account. This operation requires the storage/set permission. |
| [Delete Storage Account](/rest/api/keyvault/secrets-storageaccounts/DeleteStorageAccount) | Deletes a storage account. This operation requires the storage/delete permission. |
| [Get Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/GetDeletedStorageAccount) | Gets the specified deleted storage account. |
| [Get Deleted Storage Accounts](/rest/api/keyvault/secrets-storageaccounts/GetDeletedStorageAccounts) | Lists deleted storage accounts for the specified vault. |
| [Purge Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/PurgeDeletedStorageAccount) | Permanently deletes the specified storage account. |
| [Recover Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/RecoverDeletedStorageAccount) | Recovers the deleted storage account. |
| [Backup Storage Account](/rest/api/keyvault/secrets-storageaccounts/BackupStorageAccount) | Backs up the specified storage account. |
| [Restore Storage Account](/rest/api/keyvault/secrets-storageaccounts/RestoreStorageAccount) | Restores a backed up storage account to a vault. |

#### Storage Account key operations

| Operation | Description |
|--|--|
| [Regenerate Storage Account Key](/rest/api/keyvault/secrets-storageaccounts/RegenerateStorageAccountKey) | Regenerates the specified key value for the given storage account. This operation requires the storage/regeneratekey permission. |

#### Storage Account SAS operations

| Operation | Description |
|--|--|
| [Get Sas Definition](/rest/api/keyvault/secrets-storageaccounts/GetSasDefinition) | Gets information about a SAS definition for the specified storage account. This operation requires the storage/getsas permission. |
| [Get Sas Definitions](/rest/api/keyvault/secrets-storageaccounts/GetSasDefinitions) | List storage SAS definitions for the given storage account. This operation requires the storage/listsas permission. |
| [Set Sas Definition](/rest/api/keyvault/secrets-storageaccounts/SetSasDefinition) | Creates or updates a new SAS definition for the specified storage account. This operation requires the storage/setsas permission. |
| [Update Sas Definition](/rest/api/keyvaultsecrets-storageaccounts/UpdateSasDefinition) | Updates the specified attributes associated with the given SAS definition. This operation requires the storage/setsas permission. |
| [Delete Sas Definition](/rest/api/keyvault/secrets-storageaccounts/DeleteSasDefinition) | Deletes a SAS definition from a specified storage account. This operation requires the storage/deletesas permission. |
| [Get Deleted Sas Definition](/rest/api/keyvault/secrets-storageaccounts/GetDeletedSasDefinition) | Gets the specified deleted sas definition. |
| [Get Deleted Sas Definitions](/rest/api/keyvault/secrets-storageaccounts/GetDeletedSasDefinitions) | Lists deleted SAS definitions for the specified vault and storage account. |
| [Recover Deleted Sas Definition](/rest/api/keyvault/secrets-storageaccounts/RecoverDeletedSasDefinition) | Recovers the deleted SAS definition. |

## Certificate operations (Key Vault only)

| Operation | Description |
|--|--|
| [Get Certificate](/rest/api/keyvault/certificates/GetCertificate) | Gets information about a certificate. |
| [Get Certificates](/rest/api/keyvault/certificates/GetCertificates) | List certificates in a specified key vault |
| [Get Certificate Versions](/rest/api/keyvault/certificates/GetCertificateVersions) | List the versions of a certificate. |
| [Create Certificate](/rest/api/keyvault/certificates/CreateCertificate) | Creates a new certificate. |
| [Import Certificate](/rest/api/keyvault/certificates/ImportCertificate) | Imports a certificate into a specified key vault. |
| [Merge Certificate](/rest/api/keyvault/certificates/MergeCertificate) | Merges a certificate or a certificate chain with a key pair existing on the server. |
| [Get Certificate Operation](/rest/api/keyvault/certificates/GetCertificateOperation) | Gets the creation operation of a certificate. |
| [Update Certificate Operation](/rest/api/keyvault/certificates/UpdateCertificateOperation) | Updates a certificate operation. |
| [Delete Certificate Operation](/rest/api/keyvault/certificates/DeleteCertificateOperation) | Deletes the creation operation for a specific certificate. |
| [Update Certificate](/rest/api/keyvault/certificates/UpdateCertificate) | Updates the specified attributes associated with the given certificate. |
| [Delete Certificate](/rest/api/keyvault/certificates/DeleteCertificate) | Deletes a certificate from a specified key vault. |
| [Get Deleted Certificate](/rest/api/keyvault/certificates/GetDeletedCertificate) | Retrieves information about the specified deleted certificate. |
| [Get Deleted Certificates](/rest/api/keyvault/certificates/GetDeletedCertificates) | Lists the deleted certificates in the specified vault currently available for recovery. |
| [Purge Deleted Certificate](/rest/api/keyvault/certificates/PurgeDeletedCertificate) | Permanently deletes the specified deleted certificate. |
| [Recover Deleted Certificate](/rest/api/keyvault/certificates/RecoverDeletedCertificate) | Recovers the deleted certificate back to its current version under /certificates. |
| [Backup Certificate](/rest/api/keyvault/certificates/BackupCertificate) | Backs up the specified certificate. |
| [Restore Certificate](/rest/api/keyvault/certificates/RestoreCertificate) | Restores a backed up certificate to a vault. |

### Certificate policy operations

| [Get Certificate Policy](/rest/api/keyvault/certificates/GetCertificatePolicy) | Lists the policy for a certificate. |
| [Update Certificate Policy](/rest/api/keyvault/certificates/UpdateCertificatePolicy) | Updates the policy for a certificate. |

### Certificate contacts operations

| [Get Certificate Contacts](/rest/api/keyvault/certificates/GetCertificateContacts) | Lists the certificate contacts for a specified key vault. |
| [Set Certificate Contacts](/rest/api/keyvault/certificates/SetCertificateContacts) | Sets the certificate contacts for the specified key vault. |
| [Delete Certificate Contacts](/rest/api/keyvault/certificates/DeleteCertificateContacts) | Deletes the certificate contacts for a specified key vault. |

### Certificate issuer operations

| [Get Certificate Issuer](/rest/api/keyvault/certificates/GetCertificateIssuer) | Lists the specified certificate issuer. |
| [Get Certificate Issuers](/rest/api/keyvault/certificates/GetCertificateIssuers) | List certificate issuers for a specified key vault. |
| [Set Certificate Issuer](/rest/api/keyvault/certificates/SetCertificateIssuer) | Sets the specified certificate issuer. |
| [Update Certificate Issuer](/rest/api/keyvault/certificates/UpdateCertificateIssuer) | Updates the specified certificate issuer. |
| [Delete Certificate Issuer](/rest/api/keyvault/certificates/DeleteCertificateIssuer) | Deletes the specified certificate issuer. |


## See also

- For concepts and detailed information about Key Vault, see [About Azure Key Vault](https://docs.microsoft.com/.azure/key-vault/general/overview).
- For concepts and detailed information about Managed HSM, see [What is Azure Key Vault Managed HSM?](https://docs.microsoft.com/azure/key-vault/managed-hsm/overview)
- For concepts and detailed information about data plane objects, see [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).
- For general information on constructing Azure REST API requests, see the [Azure REST API reference](/rest/api/azure/)
- For information specific to constructing Key Vault REST API requests, see
   - [Common HTTP request parameters and headers](common-parameters-and-headers.md)
   - [Authentication, requests and responses](authentication--requests-and-responses.md)
- See the following topics for additional Key Vault concepts and details
   - [Key Vault Developer's Guide](/azure/key-vault/key-vault-developers-guide)
   - [Key Vault versions](/azure/key-vault/general/versions)
