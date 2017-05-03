---
uid: KeyVaultClient/2016-10-01/CreateKey
authorization: The operation requires the keys/create permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Creates a new key, stores it, then returns key parameters and attributes to the client. The CREATE operation can be used to create any key type in Azure Key Vault. If the named key already exists, Azure Key Vault creates a new version of the key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:
- Replace `{key-name}` with the name you want assigned to the new key.  
- When creating a new key, just specify the top-level name. The system will generate the version name and append that in the response.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/ImportKey
authorization: The operation requires the keys/import permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

Imports an externally created key, stores it, and returns key parameters and attributes to the client. The IMPORT operation may be used to import any key type into an Azure Key Vault. If the named key already exists, Azure Key Vault creates a new version of the key.

Import key currently supports two primary key types; soft key and HSM key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{key-name}` with the name you want to give to the imported key.

Alternate Method: POST with X-HTTP-METHOD header specifying PUT.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/DeleteKey
authorization: The operation requires the keys/delete permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

This operation removes the cryptographic material associated with the key, which means the key is not usable for Sign/Verify, Wrap/Unwrap or Encrypt/Decrypt operations.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{key-name}` with the name of the key you want to delete. 

Request body: An HTTP DELETE has no request body.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/UpdateKey
Authorization: The operation requires the keys/update permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The UPDATE operation changes specified attributes of a stored key and can be applied to any key type and key version stored in Azure Key Vault. The cryptographic material of a key itself cannot be changed.

In order to perform this operation, the key must already exist in the Key Vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{key-name}` with the name and {key-version} with the version of the key you want to update. Key version may be excluded in which case the current version is updated.

Alternate Method: POST with X-HTTP-METHOD header that specifies PATCH

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/GetKey
Authorization: The operation requires the keys/get permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The GET operation is applicable to all key types; however only the public portion of a key stored in Azure Key Vault is returned. If the target key is symmetric, then no key material is released in the response.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to get using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…`, retrieves a specific version of a key.

Request body: An HTTP GET has no request body.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/GetKeyVersions
Authorization: The operation requires the keys/list permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The LIST VERSIONS operation is applicable for all versions having the same key name. The full key identifier, attributes, and tags are provided in the response.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- A query option `maxresults={maxresults}` is optional. The value of `maxresults` must be a non-negative integer less than 25. If a value out of the range is specified, the request is failed with Http 400. If this query option is not specified, the service will return up to 25 results.

You may use the `nextLink` field via an HTTP GET to retrieve the next set of results, which will include another `nextLink` field. The enumeration is completed if and only if `nextLink` is empty.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/GetKeys
Authorization: The operation requires the keys/list permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

The LIST operation is applicable to all key types, however only the base key identifier,attributes, and tags are provided in the response. Individual versions of a key are not listed in the response.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- A query option `maxresults={maxresults}` is optional. The value of `maxresults` must be a non-negative integer less than 25. If a value out of the range is specified, the request is failed with Http 400. If this query option is not specified, the service will return up to 25 results.

Request body: None, this is an HTTP GET operation.

You may use the `nextLink` field via an HTTP GET to retrieve the next set of results, which will include another `nextLink` field. The enumeration is completed if and only if `nextLink` is empty.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/BackupKey
Authorization: The operation requires the keys/backup permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

Backup operation exports a key from Azure Key Vault in a protected form. Note that this operation does NOT return key material in a form that can be used outside the Azure Key Vault system, the returned key material is either protected to a Azure Key Vault HSM or to Azure Key Vault itself. The intent of this operation is to allow a client to GENERATE a key in one Azure Key Vault instance, BACKUP the key, and then RESTORE it into another Azure Key Vault instance.

The BACKUP operation may be used to export, in protected form, any key type from Azure Key Vault. Individual versions of a key cannot be backed up.

BACKUP / RESTORE can be performed within geographical boundaries only; meaning that a BACKUP from one geographical area cannot be restored to another geographical area. For example, a backup from the US geographical area cannot be restored in an EU geographical area.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

Refer to the key to backup with `{key-name}` in the request URL. There is no JSON request body.

In your response, the backup attribute is an opaque value that contains the protected key.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/RestoreKey
Authorization: The operation requires the keys/restore permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The RESTORE operation imports a previously backed up key into Azure Key Vault, restoring the key, its key identifier, attributes and access control policies. Individual versions of a key cannot be restored.

The key is restored in its entirety with the same key name as it had when it was backed up. If the key name is not available in the target Key Vault, the RESTORE operation will be rejected. While the key name is retained during restore, the final key identifier will change if the key is restored to a different vault.

Restore will restore all versions and preserve version identifiers.

The RESTORE operation is subject to security constraints:

- The target Key Vault must be owned by the same Microsoft Azure Subscription as the source Key Vault
- The user must have RESTORE permission in the target Key Vault

BACKUP / RESTORE can be performed within geographical boundaries only; meaning that a BACKUP from one geographical area cannot be restored to another geographical area. For example, a backup from the US geographical area cannot be restored in an EU geographical area.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

Refer to the key to restore with `{key-name}` in the request URL. There is no JSON request body.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/encrypt
Authorization: The operation requires the keys/encrypt permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The ENCRYPT operation encrypts an arbitrary sequence of bytes using an encryption key that is stored in Azure Key Vault. Note that the ENCRYPT operation only supports a single block of data, the size of which is dependent on the target key and the encryption algorithm to be used.

The ENCRYPT operation is only strictly necessary for symmetric keys stored in Azure Key Vault since protection with an asymmetric key can be performed using public portion of the key. This operation is supported for asymmetric keys as a convenience for callers that have a key-reference but do not have access to the public key material.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to encrypt using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…` , encrypts using a specific version of a key.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/decrypt
Authorization: The operation requires the keys/decrypt permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The DECRYPT operation decrypts a well-formed block of ciphertext using the target encryption key and specified algorithm. This operation is the reverse of the ENCRYPT operation; only a single block of data may be decrypted, the size of this block is dependent on the target key and the algorithm to be used.

The DECRYPT operation applies to asymmetric and symmetric keys stored in Azure Key Vault since it uses the private portion of the key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to decrypt using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…` , decrypts using a specific version of a key.

The request body for the DECRYPT operation is the same as the response body for the ENCRYPT operation.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/sign
Authorization: The operation requires the keys/sign permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

SIGN is applicable to asymmetric and symmetric keys stored in Azure Key Vault since this operation uses the private portion of the key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to sign using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…`, signs using a specific version of a key.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/verify
Authorization: The operation requires the keys/verify permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

VERIFY is applicable to symmetric keys stored in Azure Key Vault. VERIFY is not strictly necessary for asymmetric keys stored in Azure Key Vault since signature verification can be performed using the public portion of the key but this operation is supported as a convenience for callers that only have a key-reference and not the public portion of the key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to verify using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…` , verifies using a specific version of a key.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/wrapKey
Authorization: The operation requires the keys/wrap permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The WRAP operation supports encryption of a symmetric key using a key encryption key that has previously been stored in an Azure Key Vault.

The WRAP operation is only strictly necessary for symmetric keys stored in Azure Key Vault since protection with an asymmetric key can be performed using the public portion of the key. This operation is supported for asymmetric keys as a convenience for callers that have a key-reference but do not have access to the public key material.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to wrap using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…` , wraps using a specific version of a key.

Usage recommendation - Each key’s metadata should be saved and wrapped with a key, for example; algorithm, keyURL used to wrap and cipher-text.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---

uid: KeyVaultClient/2016-10-01/unwrapKey
Authorization: The operation requires the keys/backup permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content

---

The UNWRAP operation supports decryption of a symmetric key using the target key encryption key. This operation is the reverse of the WRAP operation. The UNWRAP operation applies to asymmetric and symmetric keys stored in Azure Key Vault since it uses the private portion of the key.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Provide the name of the key to unwrap using `{key-name}` in the request URL.
- Adding the key-version parameter, `…/keys/{key-name}/{key-version}…` , unwraps using a specific version of a key.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).


