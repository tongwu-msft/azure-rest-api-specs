---
uid: KeyVaultClient/2016-10-01/GetCertificates
authorization: Requires the certificates/list permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

LIST current certificates.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Query option `maxresults={maxresults}` is optional. The value of `maxresults` must be a non-negative integer less than 25. If a value out of the range is specified, the request is failed with Http 400. If this query option is not specified, the service will return up to 25 results.

Request body: An HTTP GET has no request body.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/DeleteCertificate
authorization: Requires the certificates/delete permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Deletes all versions of a certificate object along with its associated policy. Delete certificate cannot be used to remove individual versions of a certificate object.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/SetCertificateContacts
authorization: Requires the certificates/managecontacts permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Set the contacts for a given certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificateContacts
authorization: Requires the certificates/managecontacts permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Gets all of the contacts for a given certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/DeleteCertificateContacts
authorization: Requires the certificates/managecontacts permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Delete all the contacts for a given certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificateIssuers
authorization: Requires the certificates/listissuers permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

List all certificate issuers for a given key vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Query option `maxresults={maxresults}` is optional. The value of `maxresults` must be an non-negative integer less than 25. If a value out of the range is specified, the request will fail with an Http 400 error. If this query option is not specified, the service will return up to 25 results.

You may use the `nextLink` field via an HTTP GET to retrieve the next set of results, which will include another `nextLink` field. The enumeration is completed if and only if `nextLink` is empty.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/SetCertificateIssuer
authorization: Requires the certificates/setissuers permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Create/set a certificate issuer in a given key vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

Alternate Method: An alternative to using PUT is to use PATCH for update only behavior. PATCH will allow you to specify as few as one property in the request such that only that property will be updated. If you specify all properties, then it is equivalent to using PUT.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/UpdateCertificateIssuer
authorization: Requires the certificates/setissuers permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Update a certificate issuer in a given key vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

Alternate Method: An alternative to using PUT is to use PATCH for update only behavior. PATCH will allow you to specify as few as one property in the request such that only that property will be updated. If you specify all properties, then it is equivalent to using PUT.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificateIssuer
authorization: Requires the certificates/getissuers permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Get a certificate issuer from a given key vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{issuer-name}` with the issuer's name you want retrieved.

The *pwd* field is never returned in response message.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/DeleteCertificateIssuer
authorization: Requires the certificates/deleteissuers permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Delete a certificate issuer from the key vault.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{issuer-name}` with the issuer's name you want retrieved.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/CreateCertificate
authorization: Requires the certificates/create permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

If this is the first version, the certificate resource is created.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate you want created.

For more information about creating certificates, see [Get started with Key Vault certificates](~/docs-ref-conceptual/keyvault/certificate-scenarios.md) and [Certificate creation methods](~/docs-ref-conceptual/keyvault/create-a-certificate.md).

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/ImportCertificate
authorization: Requires the certificates/import permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Imports an existing valid certificate, containing a private key, into Azure Key Vault. The certificate to be imported can be in either PFX or PEM format. If the certificate is in PEM format the PEM file must contain the key as well as x509 certificates.

Following is an example of a supported PEM file format. The file must contain the private key and at least one of x509 certificate corresponding to the private key of the x509 certificate chain.

```
   -----BEGIN PRIVATE KEY-----
       ...
   -----END PRIVATE KEY-----

   -----BEGIN CERTIFICATE-----
       ...
   -----END CERTIFICATE-----

   -----BEGIN CERTIFICATE-----
       ...
   -----END CERTIFICATE-----
```

The private key may be encrypted in which case the private key will be inside encrypted private key markers as follows:

```
  -----BEGIN ENCRYPTED PRIVATE KEY-----
       ...
  -----END ENCRYPTED PRIVATE KEY-----
```

The following PBE SHA1 encryption algorithms, outlined in [RFC7292 - PKCS #12](https://tools.ietf.org/html/rfc7292#appendix-C), are supported with an encrypted private key:

- pbeWithSha1And128BitRc2
- pbeWithSha1And128BitRc4
- pbeWithSha1And2KeyTripleDes
- pbeWithSha1And3KeyTripleDes
- pbeWithSha1And40BitRc2
- pbeWithSha1And40BitRc

Policy is optional and assumes import of a PFX file. If importing a PEM file, specify the *contentType* as `application/x-pem-file`.

NOTE - When a certificate is imported without a specified policy or with a policy that does not have issuer or lifetime action fields specified, the issuer field is set to **unknown** and the *lifetime actions* field is set to **EmailContacts**. This policy can be modified to **AutoRenew** with a named issuer by patching the policy.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate you want created.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificateVersions
authorization: Requires the certificates/list permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

List all versions of a given certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate for which you want a list of versions.
- Query option `maxresults={maxresults}` is optional. The value of `maxresults` must be a non-negative integer less than 25. If a value out of the range is specified, the request will fail with an Http 400 error. If this query option is not specified, the service will return up to 25 results.

Request body: None, this is an HTTP GET operation.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificatePolicy
authorization: Requires the certificates/get permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate for which you want the policy.

Request body: None, this is an HTTP GET operation.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/UpdateCertificatePolicy
authorization: Requires the certificates/update permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Set specified members in the certificate policy. Leave others as null.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate for which you want to update the policy.

Alternate Method: An alternative to using PATCH is to use PUT so, you effect a set / replacement behavior. PATCH will allow you to specify as few as one property in the request such that only that property will be updated. PUT will completely replace the policy. In other words, if you specify all properties with a PATCH method, then it is equivalent to using a PUT method effectively setting all properties of the certificate policy.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/UpdateCertificate
authorization: Requires the certificates/update permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

The update operation changes non-read-only properties in the attributes or tags of current or specified version of a key vault certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate for which you want to update the policy.
- You may also specificy the `{certificate-version}` of the certificate to update.

Alternate Method: POST with X-HTTP-METHOD header that specifies 
PATCH.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).

---
uid: KeyVaultClient/2016-10-01/GetCertificate
authorization: Requires the certificates/get permission.
parameters:
    - name: api-version
      description: Use the latest service version, 2016-10-01.
description: *content
---

Get the current or a particular verion of a key vault certificate.

See [Common parameters and headers](~/docs-ref-conceptual/keyvault/common-parameters-and-headers.md) for headers and parameters that are used by all requests.

In your request:

- Replace `{certificate-name}` with the name of the certificate for which you want to update the policy.
- You may also specificy the `{certificate-version}` of the certificate to update.

Request body: An HTTP GET has no request body.

For more information, see [About keys, secrets, and certificates](~/docs-ref-conceptual/keyvault/about-keys--secrets-and-certificates.md) and [Authentication, requests and responses](~/docs-ref-conceptual/keyvault/authentication--requests-and-responses.md).



