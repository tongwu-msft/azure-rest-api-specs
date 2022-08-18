---

title: Azure Key Vault REST API reference
description: Learn how to use Key Vault to safeguard and manage cryptographic keys, certificates and secrets used by cloud applications and services.
ms.service: key-vault
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/15/2022
---

# Azure Key Vault REST API reference

Use Key Vault to safeguard and manage cryptographic keys, certificates and secrets used by cloud applications and services.

## Key Vault operations

| Operation | Description |
|--|--|
| [Check Name Availability](/rest/api/keyvault/keyvault/vaults/check-name-availability) | Checks that the vault name is valid and is not already in use.| 
| [Create Or Update](/rest/api/keyvault/keyvault/vaults/create-or-update) | Create or update a key vault in the specified subscription.| 
| [Update Access Policy](/rest/api/keyvault/keyvault/vaults/update-access-policy) | Update access policies in a key vault in the specified subscription.| 
| [Get](/rest/api/keyvault/keyvault/vaults/get) | Gets the specified Azure key vault.| 
| [List](/rest/api/keyvault/keyvault/vaults/list) | The List operation gets information about the vaults associated with the subscription.| 
| [List By Resource Group](/rest/api/keyvault/keyvault/vaults/list-by-resource-group) | The List operation gets information about the vaults associated with the subscription and within the specified resource group.| 
| [List By Subscription](/rest/api/keyvault/keyvault/vaults/list-by-subscription) | The List operation gets information about the vaults associated with the subscription.| 
| [Update](/rest/api/keyvault/keyvault/vaults/update) | Update a key vault in the specified subscription.| 
| [Delete](/rest/api/keyvault/keyvault/vaults/delete) | Deletes the specified Azure key vault.| 
| [Get Deleted](/rest/api/keyvault/keyvault/vaults/get-deleted) | Gets the deleted Azure key vault.| 
| [List Deleted](/rest/api/keyvault/keyvault/vaults/list-deleted) | Gets information about the deleted vaults in a subscription.| 
| [Purge](/rest/api/keyvault/keyvault/vaults/purge-deleted) | Permanently deletes the specified vault. | 

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
| [List By MHSM Resource](/rest/api/keyvault/managedhsm/mhsm-private-link-resources/list-by-mhsm-resource) | Gets the private link resources supported for the managed HSM pool.| 

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
| [Get Key](/rest/api/keyvault/keys/Get-Key) | Gets the public part of a stored key. |
| [Get Keys](/rest/api/keyvault/keys/Get-Keys) | List keys in the specified vault. |
| [Get Key Versions](/rest/api/keyvault/keys/Get-Key-Versions) | Retrieves a list of individual key versions with the same key name. |
| [Create Key](/rest/api/keyvault/keys/Create-Key) | Creates a new key, stores it, then returns key parameters and attributes to the client. |
| [Import Key](/rest/api/keyvault/keys/Import-Key) | Imports an externally created key, stores it, and returns key parameters and attributes to the client. |
| [Update Key](/rest/api/keyvault/keys/Update-Key) | The update key operation changes specified attributes of a stored key and can be applied to any key type and key version stored in Azure Key Vault. |
| [Delete Key](/rest/api/keyvault/keys/Delete-Key) | Deletes a key of any type from storage in Azure Key Vault. |
| [Get Deleted Key](/rest/api/keyvault/keys/Get-Deleted-Key) | Gets the public part of a deleted key. |
| [Get Deleted Keys](/rest/api/keyvault/keys/Get-Deleted-Keys) | Lists the deleted keys in the specified vault. |
| [Purge Deleted Key](/rest/api/keyvault/keys/Purge-Deleted-Key) | Permanently deletes the specified key. |
| [Recover Deleted Key](/rest/api/keyvault/keys/Recover-Deleted-Key) | Recovers the deleted key to its latest version. |
| [Backup Key](/rest/api/keyvault/keys/Backup-Key) | Requests that a backup of the specified key be downloaded to the client. |
| [Restore Key](/rest/api/keyvault/keys/Restore-Key) | Restores a backed up key to a vault. |
| [Release Key](/rest/api/keyvault/keys/release) | Releases a key. The release key operation is applicable to all key types. The target key must be marked exportable. This operation requires the keys/release permission. |

### Key operations (Key Vault only)

| Operation | Description |
|--|--|
| [Rotate Key](/rest/api/keyvault/keys/Rotate-Key) | Creates a new key version, stores it, then returns key parameters, attributes and policy to the client.  The operation will rotate the key based on the key policy. It requires the keys/rotate permission. |
| [Get Key Rotation Policy](/rest/api/keyvault/keys/get-key-rotation-policy) | Lists the policy for a key. The GetKeyRotationPolicy operation returns the specified key policy resources in the specified key vault. This operation requires the keys/get permission. |
| [Update  Key Rotation Policy](/rest/api/keyvault/keys/update-key-rotation-policy) | Updates the rotation policy for a key. Set specified members in the key policy. Leave others as undefined. This operation requires the keys/update permission. |

### Key operations (Managed HSM only)

| Operation | Description |
|--|--|
| [Get Random Bytes](/rest/api/keyvault/keys/get-random-bytes) | Get the requested number of bytes containing random values from a managed HSM. |
| [Rotate Key (Preview)](/rest/api/keyvault/keys/Rotate-Key) | Creates a new key version, stores it, then returns key parameters, attributes and policy to the client. The operation will rotate the key based on the key policy. It requires the keys/rotate permission. |
| [Get Key Rotation Policy (Preview)](/rest/api/keyvault/keys/get-key-rotation-policy) | Lists the policy for a key.The GetKeyRotationPolicy operation returns the specified key policy resources in the specified key vault. This operation requires the keys/get permission. (Managed HSM in Preview) |
| [Update  Key Rotation Policy (Preview)](/rest/api/keyvault/keys/update-key-rotation-policy) | Updates the rotation policy for a key. Set specified members in the key policy. Leave others as undefined. This operation requires the keys/update permission. |

### Cryptographic operations (Key Vault/Managed HSM)

| Operation | Description |
|--|--|
| [Decrypt](/rest/api/keyvault/keys/decrypt) | Decrypts a single block of encrypted data. |
| [Encrypt](/rest/api/keyvault/keys/encrypt) | Encrypts an arbitrary sequence of bytes using an encryption key that is stored in a key vault. |
| [Wrap Key](/rest/api/keyvault/keys/wrap-Key) | Wraps a symmetric key using a specified key. |
| [Unwrap Key](/rest/api/keyvault/keys/unwrap-Key) | Unwraps a symmetric key using the specified key that was initially used for wrapping that key. |
| [Sign](/rest/api/keyvault/keys/sign) | Creates a signature from a digest using the specified key. |
| [Verify](/rest/api/keyvault/keys/verify) | Verifies a signature using a specified key. |

## Secret operations (Key Vault only)

| Operation | Description |
|--|--|
| [Get Secret](/rest/api/keyvault/secrets/Get-Secret) | Get a specified secret from a given key vault. |
| [Get Secrets](/rest/api/keyvault/secrets/Get-Secrets) | List secrets in a specified key vault. |
| [Get Secret Versions](/rest/api/keyvault/secrets/Get-Secret-Versions) | List all versions of the specified secret. |
| [Set Secret](/rest/api/keyvault/secrets/Set-Secret) | Sets a secret in a specified key vault. |
| [Update Secret](/rest/api/keyvault/secrets/Update-Secret) | Updates the attributes associated with a specified secret in a given key vault. |
| [Delete Secret](/rest/api/keyvault/secrets/Delete-Secret) | Deletes a secret from a specified key vault. |
| [Get Deleted Secret](/rest/api/keyvault/secrets/Get-Deleted-Secret) | Gets the specified deleted secret. |
| [Get Deleted Secrets](/rest/api/keyvault/secrets/Get-Deleted-Secrets) | Lists deleted secrets for the specified vault. |
| [Purge Deleted Secret](/rest/api/keyvault/secrets/Purge-Deleted-Secret) | Permanently deletes the specified secret. |
| [Recover Deleted Secret](/rest/api/keyvault/secrets/Recover-Deleted-Secret) | Recovers the deleted secret to the latest version. |
| [Backup Secret](/rest/api/keyvault/secrets/Backup-Secret) | Backs up the specified secret. |
| [Restore Secret](/rest/api/keyvault/secrets/Restore-Secret) | Restores a backed up secret to a vault. |

### Storage account key management operations (Key Vault only)

#### Storage Account configuration operations

| Operation | Description |
|--|--|
| [Get Storage Account](/rest/api/keyvault/secrets-storageaccounts/Get-Storage-Account) | Gets information about a specified storage account. This operation requires the storage/get permission. |
| [Get Storage Accounts](/rest/api/keyvault/secrets-storageaccounts/Get-Storage-Accounts) | List storage accounts managed by the specified key vault. This operation requires the storage/list permission. |
| [Update Storage Account](/rest/api/keyvault/secrets-storageaccounts/Update-Storage-Account) | Updates the specified attributes associated with the given storage account. This operation requires the storage/set/update permission. |
| [Set Storage Account](/rest/api/keyvault/secrets-storageaccounts/Set-Storage-Account) | Creates or updates a new storage account. This operation requires the storage/set permission. |
| [Delete Storage Account](/rest/api/keyvault/secrets-storageaccounts/Delete-Storage-Account) | Deletes a storage account. This operation requires the storage/delete permission. |
| [Get Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/Get-Deleted-Storage-Account) | Gets the specified deleted storage account. |
| [Get Deleted Storage Accounts](/rest/api/keyvault/secrets-storageaccounts/Get-Deleted-Storage-Accounts) | Lists deleted storage accounts for the specified vault. |
| [Purge Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/Purge-Deleted-Storage-Account) | Permanently deletes the specified storage account. |
| [Recover Deleted Storage Account](/rest/api/keyvault/secrets-storageaccounts/Recover-Deleted-Storage-Account) | Recovers the deleted storage account. |
| [Backup Storage Account](/rest/api/keyvault/secrets-storageaccounts/Backup-Storage-Account) | Backs up the specified storage account. |
| [Restore Storage Account](/rest/api/keyvault/secrets-storageaccounts/Restore-Storage-Account) | Restores a backed-up storage account to a vault. |

#### Storage Account key operations

| Operation | Description |
|--|--|
| [Regenerate Storage Account Key](/rest/api/keyvault/secrets-storageaccounts/Regenerate-Storage-Account-Key) | Regenerates the specified key value for the given storage account. This operation requires the storage/regeneratekey permission. |

#### Storage Account SAS operations

| Operation | Description |
|--|--|
| [Get Sas Definition](/rest/api/keyvault/secrets-storageaccounts/Get-Sas-Definition) | Gets information about a SAS definition for the specified storage account. This operation requires the storage/getsas permission. |
| [Get Sas Definitions](/rest/api/keyvault/secrets-storageaccounts/Get-Sas-Definitions) | List storage SAS definitions for the given storage account. This operation requires the storage/listsas permission. |
| [Set Sas Definition](/rest/api/keyvault/secrets-storageaccounts/Set-Sas-Definition) | Creates or updates a new SAS definition for the specified storage account. This operation requires the storage/setsas permission. |
| [Update Sas Definition](/rest/api/keyvaultsecrets-storageaccounts/Update-Sas-Definition) | Updates the specified attributes associated with the given SAS definition. This operation requires the storage/setsas permission. |
| [Delete Sas Definition](/rest/api/keyvault/secrets-storageaccounts/Delete-Sas-Definition) | Deletes a SAS definition from a specified storage account. This operation requires the storage/deletesas permission. |
| [Get Deleted Sas Definition](/rest/api/keyvault/secrets-storageaccounts/Get-Deleted-SasDefinition) | Gets the specified deleted sas definition. |
| [Get Deleted Sas Definitions](/rest/api/keyvault/secrets-storageaccounts/Get-Deleted-Sas-Definitions) | Lists deleted SAS definitions for the specified vault and storage account. |
| [Recover Deleted Sas Definition](/rest/api/keyvault/secrets-storageaccounts/Recover-Deleted-Sas-Definition) | Recovers the deleted SAS definition. |

## Certificate operations (Key Vault only)

| Operation | Description |
|--|--|
| [Get Certificate](/rest/api/keyvault/certificates/Get-Certificate) | Gets information about a certificate. |
| [Get Certificates](/rest/api/keyvault/certificates/Get-Certificates) | List certificates in a specified key vault |
| [Get Certificate Versions](/rest/api/keyvault/certificates/Get-Certificate-Versions) | List the versions of a certificate. |
| [Create Certificate](/rest/api/keyvault/certificates/Create-Certificate) | Creates a new certificate. |
| [Import Certificate](/rest/api/keyvault/certificates/Import-Certificate) | Imports a certificate into a specified key vault. |
| [Merge Certificate](/rest/api/keyvault/certificates/Merge-Certificate) | Merges a certificate or a certificate chain with a key pair existing on the server. |
| [Get Certificate Operation](/rest/api/keyvault/certificates/Get-Certificate-Operation) | Gets the creation operation of a certificate. |
| [Update Certificate Operation](/rest/api/keyvault/certificates/Update-Certificate-Operation) | Updates a certificate operation. |
| [Delete Certificate Operation](/rest/api/keyvault/certificates/Delete-Certificate-Operation) | Deletes the creation operation for a specific certificate. |
| [Update Certificate](/rest/api/keyvault/certificates/Update-Certificate) | Updates the specified attributes associated with the given certificate. |
| [Delete Certificate](/rest/api/keyvault/certificates/Delete-Certificate) | Deletes a certificate from a specified key vault. |
| [Get Deleted Certificate](/rest/api/keyvault/certificates/Get-Deleted-Certificate) | Retrieves information about the specified deleted certificate. |
| [Get Deleted Certificates](/rest/api/keyvault/certificates/Get-Deleted-Certificates) | Lists the deleted certificates in the specified vault currently available for recovery. |
| [Purge Deleted Certificate](/rest/api/keyvault/certificates/Purge-Deleted-Certificate) | Permanently deletes the specified deleted certificate. |
| [Recover Deleted Certificate](/rest/api/keyvault/certificates/Recover-Deleted-Certificate) | Recovers the deleted certificate back to its current version under /certificates. |
| [Backup Certificate](/rest/api/keyvault/certificates/Backup-Certificate) | Backs up the specified certificate. |
| [Restore Certificate](/rest/api/keyvault/certificates/Restore-Certificate) | Restores a backed-up certificate to a vault. |

### Certificate policy operations

| Operation | Description |
|--|--|
| [Get Certificate Policy](/rest/api/keyvault/certificates/Get-Certificate-Policy) | Lists the policy for a certificate. |
| [Update Certificate Policy](/rest/api/keyvault/certificates/Update-Certificate-Policy) | Updates the policy for a certificate. |

### Certificate contacts operations

| Operation | Description |
|--|--|
| [Get Certificate Contacts](/rest/api/keyvault/certificates/Get-Certificate-Contacts) | Lists the certificate contacts for a specified key vault. |
| [Set Certificate Contacts](/rest/api/keyvault/certificates/Set-Certificate-Contacts) | Sets the certificate contacts for the specified key vault. |
| [Delete Certificate Contacts](/rest/api/keyvault/certificates/Delete-Certificate-Contacts) | Deletes the certificate contacts for a specified key vault. |

### Certificate issuer operations

| Operation | Description |
|--|--|
| [Get Certificate Issuer](/rest/api/keyvault/certificates/Get-Certificate-Issuer) | Lists the specified certificate issuer. |
| [Get Certificate Issuers](/rest/api/keyvault/certificates/Get-Certificate-Issuers) | List certificate issuers for a specified key vault. |
| [Set Certificate Issuer](/rest/api/keyvault/certificates/Set-Certificate-Issuer) | Sets the specified certificate issuer. |
| [Update Certificate Issuer](/rest/api/keyvault/certificates/Update-Certificate-Issuer) | Updates the specified certificate issuer. |
| [Delete Certificate Issuer](/rest/api/keyvault/certificates/Delete-Certificate-Issuer) | Deletes the specified certificate issuer. |


## See also

- For concepts and detailed information about Key Vault, see [About Azure Key Vault](/azure/key-vault/general/overview).
- For concepts and detailed information about Managed HSM, see [What is Azure Key Vault Managed HSM?](/azure/key-vault/managed-hsm/overview)
- For concepts and detailed information about data plane objects, see [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md).
- For general information on constructing Azure REST API requests, see the [Azure REST API reference](/rest/api/azure/)
- For information specific to constructing Key Vault REST API requests, see
   - [Common HTTP request parameters and headers](common-parameters-and-headers.md)
   - [Authentication, requests and responses](authentication--requests-and-responses.md)
- See the following topics for additional Key Vault concepts and details
   - [Key Vault Developer's Guide](/azure/key-vault/key-vault-developers-guide)
   - [Key Vault versions](/azure/key-vault/general/versions)
