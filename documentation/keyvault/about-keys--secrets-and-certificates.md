---
title: "About Keys, Secrets and Certificates"
ms.custom: ""
ms.date: "2016-11-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "key-vault"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to:
  - "Azure Key Vault"
ms.assetid: abd1b743-1d58-413f-afc1-d08ebf93828a
caps.latest.revision: 44
author: "bruceperlerMS"
ms.author: "bruceper"
manager: "mbaldwin"
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# About keys, secrets, and certificates
Azure Key Vault enables users to store and use cryptographic keys within the Microsoft Azure environment. Azure Key Vault supports multiple key types and algorithms and enables the use of Hardware Security Modules (HSM) for high value customer keys. In addition, Azure Key Vault allows users to securely store secrets, limited size octet objects. Key Vault applies no specific semantics to secrets.
Key Vault also supports certificates, described in more detail in the following overview.  

 A Key Vault may contain a mix of keys,  secrets and certificates, and access for these types of objects is independently controlled.  

 This topic outlines:  

-   [Supporting standards](about-keys--secrets-and-certificates.md#BKMK_Standards)  

-   [Data types](about-keys--secrets-and-certificates.md#BKMK_DataTypes)  

-   [Objects, Identifiers and Versioning](about-keys--secrets-and-certificates.md#BKMK_ObjId)  

 **Key Vault Keys**  

-   [Keys and key types](about-keys--secrets-and-certificates.md#BKMK_KeyTypes)  

-   [RSA algorithms](about-keys--secrets-and-certificates.md#BKMK_RSAAlgorithms)  

-   [RSA-HSM algorithms](about-keys--secrets-and-certificates.md#BKMK_RSA-HSMAlgorithms)  

-   [Key operations](about-keys--secrets-and-certificates.md#BKMK_KeyOperations)  

-   [Key attributes](about-keys--secrets-and-certificates.md#BKMK_KeyAttributes)  

-   [Key tags](about-keys--secrets-and-certificates.md#BKMK_Keytags)  

 **Key Vault Secrets**  

-   [Working with Secrets](about-keys--secrets-and-certificates.md#BKMK_WorkingWithSecrets)  

-   [Secret attributes](about-keys--secrets-and-certificates.md#BKMK_SecretAttrs)  

-   [Secret tags](about-keys--secrets-and-certificates.md#BKMK_SecretTags)  

-   [Secret Access Control](about-keys--secrets-and-certificates.md#BKMK_SecretAccessControl)  

 **Key Vault Certificates**  

-   [Composition of a Certificate](#BKMK_CompositionOfCertificate)  

-   [Certificate Attributes and Tags](#BKMK_CertificateAttributesAndTags)  

-   [Certificate Policy](#BKMK_CertificatePolicy)  

-   [Certificate Issuer](#BKMK_CertificateIssuer)  

-   [Certificate contacts](#BKMK_CertificateContacts)  

-   [Certificate Access Control](#BKMK_CertificateAccessControl)  

###  <a name="BKMK_Standards"></a> Supporting standards  
 The JavaScript Object Notation (JSON) Object Signing and Encryption (JOSE) specifications at IETF are important background information for this specification:  

-   [JSON Web Key (JWK)](http://tools.ietf.org/html/draft-ietf-jose-json-web-key)  

-   [JSON Web Encryption (JWE)](http://tools.ietf.org/html/draft-ietf-jose-json-web-encryption)  

-   [JSON Web Algorithms (JWA)](http://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms)  

-   [JSON Web Signature (JWS)](http://tools.ietf.org/html/draft-ietf-jose-json-web-signature)  

###  <a name="BKMK_DataTypes"></a> Data types  
 Refer to the JOSE specifications for relevant data types for Keys, Encryption and Signing.  

-   algorithm: A supported algorithm for a key operation,for example, RSA1_5  

-   ciphertext-value: cipher text octets, encoded using Base64URL  

-   digest-value: The output of a hash algorithm, encoded using Base64URL  

-   key-type: One of the supported key types, for example RSA.  

-   plaintext-value: plaintext octets, encoded using Base64URL  

-   signature-value: The output of a signature algorithm, encoded using Base64URL  

-   base64URL: A Base64URL [RFC4648] encoded binary value  

-   boolean: Either true or false  

-   Identity: An identity from Azure Active Directory (AAD).  

-   IntDate: A JSON decimal value representing the number of seconds from 1970-01-01T0:0:0Z UTC until the specified UTC date/time. See [RFC3339] for details regarding date/times in general and UTC in particular.  

###  <a name="BKMK_ObjId"></a> Objects, Identifiers and Versioning  
 Objects stored in Azure Key Vault retain versions whenever a new instance of an object is created, and each version has a unique identifier and URL. When an object is first created it is given a unique version identifier and is marked as the current version of the object. Creation of a new instance with the same object name gives the new object a unique version identifier and causes it to become the current version.  

 Objects in Azure Key Vault can be addressed using the current identifier or a version specific identifier. For example, given a Key with the name “MasterKey”, performing operations with the current identifier causes the system to use the latest available version. Performing operations with the version specific identifier causes the system to use that specific version of the object.  

 Objects are uniquely identified within Azure Key Vault using a URL such that no two objects in the system, regardless of geo-location, have the same URL. The complete URL to an object is called the Object Identifier and consists of a prefix portion that identifies the Key Vault, the object type, a user provided Object Name, and an Object Version. The Object Name is case-insensitive and immutable. Identifiers that do not include the Object Version are referred to as Base Identifiers.  

 For more information see, [Authentication, requests, and responses](authentication--requests-and-responses.md)

 A object identifier has the following general format:  

 `https://{keyvault-name}.vault.azure.net/{object-type}/{object-name}/{object-version}`  

 Where:  

|||  
|-|-|  
|`keyvault-name`|The name for a key vault in the Microsoft Azure Key Vault service.<br /><br /> Key Vault names are selected by the user and are globally unique.<br /><br /> Key Vault name must be a string 3-24 characters in length containing only (0-9, a-z, A-Z, and -).|  
|`object-type`|The type of the object, either “keys” or “secrets”.|  
|`object-name`|An `object-name` is a user provided name for and must be unique within a Key Vault. The name must be a string 1-127 characters in length containing only 0-9, a-z, A-Z, and -.|  
|`object-version`|An `object-version` is a system generated, 32 character string identifier that is optionally used to address a unique version of an object.|  

### **Key Vault Keys**  

###  <a name="BKMK_KeyTypes"></a> Keys and key types  
 Cryptographic keys in Azure Key Vault are represented as JSON Web Key [JWK] objects. The base JWK/JWA specifications are also extended to enable key types unique to the Azure Key Vault implementation, for example the import of keys to Azure Key Vault using the HSM vendor (Thales) specific packaging to enable secure transportation of keys such that they may only be used in the Azure Key Vault HSMs.  

 The initial Azure Key Vault release supports RSA keys only; future releases may support other key types such as symmetric and elliptic curve.  

-   RSA: A 2048bit RSA key. This is a "soft" key, which is processed in software by Key Vault but is stored encrypted at rest using a system key that is in an HSM. Clients may import an existing RSA key or request that Azure Key Vault generate one.  

-   RSA-HSM: An RSA key that is processed in an HSM. RSA-HSM keys are protected in one of the Azure Key Vault HSM Security Worlds (there is a Security World per geography to maintain isolation). Clients may import a RSA key, either in soft form or by exporting from a compatible HSM device, or request that Azure Key Vault generate one. This key type adds the T attribute to the JWK obtain to carry the HSM key material.  

     For more information on geographical boundaries see, [Microsoft Azure Trust Center](http://azure.microsoft.com/en-us/support/trust-center/privacy/)  

###  <a name="BKMK_RSAAlgorithms"></a> RSA algorithms  
 The following algorithm identifiers are supported with RSA keys in Azure Key Vault.  

 WRAPKEY/UNWRAPKEY, ENCRYPT/DECRYPT:  

-   RSA1_5: RSAES-PKCS1-V1_5 [RFC3447] key encryption  

-   RSA-OAEP: RSAES using Optimal Asymmetric Encryption Padding (OAEP) [RFC3447], with the default parameters specified by RFC 3447 in Section A.2.1. Those default parameters are using a hash function of SHA-1 and a mask generation function of MGF1 with SHA-1.  

 SIGN/VERIFY:  

-   RS256: RSASSA-PKCS-v1_5 using SHA-256. The application supplied digest value must be computed using SHA-256 and must be 32 bytes in length.  

-   RS384: RSASSA-PKCS-v1_5 using SHA-384. The application supplied digest value must be computed using SHA-384 and must be 48 bytes in length.  

-   RS512: RSASSA-PKCS-v1_5 using SHA-512. The application supplied digest value must be computed using SHA-512 and must be 64 bytes in length.  

-   RSNULL: See [RFC2437], a specialized use-case to enable certain TLS scenarios.  

###  <a name="BKMK_RSA-HSMAlgorithms"></a> RSA-HSM algorithms  
 The following algorithm identifiers are supported with RSA-HSM keys in Azure Key Vault.  

 WRAP/UNWRAP, ENCRYPT/DECRYPT:  

-   RSA1_5: RSAES-PKCS1-V1_5 [RFC3447] key encryption.  

-   RSA-OAEP: RSAES using Optimal Asymmetric Encryption Padding (OAEP) [RFC3447], with   the default parameters specified by RFC 3447 in Section A.2.1. Those default parameters are using a hash function of SHA-1 and a mask generation function of MGF1 with SHA-1.  

 SIGN/VERIFY:  

-   RS256: RSASSA-PKCS-v1_5 using SHA-256. The application supplied digest value must be computed using SHA-256 and must be 32 bytes in length.  

-   RS384: RSASSA-PKCS-v1_5 using SHA-384. The application supplied digest value must be computed using SHA-384 and must be 48 bytes in length.  

-   RS512: RSASSA-PKCS-v1_5 using SHA-512. The application supplied digest value must be computed using SHA-512 and must be 64 bytes in length.  

-   RSNULL: See [RFC2437], a specialized use-case to enable certain TLS scenarios.  

###  <a name="BKMK_KeyOperations"></a> Key operations  
 Azure Key Vault supports the following operations on key objects:  

-   Create: Allows a client to create a key in Azure Key Vault. The value of the key is generated by Azure Key Vault and stored and is not released to the client. Asymmetric (and in the future, Elliptic Curve and Symmetric) keys may be created in Azure Key Vault.  

-   Import: Allows a client to import an existing key to Azure Key Vault. Asymmetric (and in the future, Elliptic Curve and Symmetric) keys may be imported to Azure Key Vault using a number of different packaging methods within a JWK construct.  

-   Update: Allows a client with sufficient permissions to modify the metadata (key attributes) associated with a key previously stored within Azure Key Vault.  

-   Delete: Allows a client with sufficient permissions to delete a key from Azure Key Vault.  

-   List: Allows a client to list all keys in a given Azure Key Vault.  

-   List versions: Allows a client to list all versions of a given key in a given Azure Key Vault.  

-   Get: Allows a client to retrieve the public parts of a given key in an Azure Key Vault.  

-   Backup: Exports a key in a protected form.  

-   Restore: Imports a previously backed up key.  

 For more information, see [Key operations](key-operations.md)  

 Once a key has been created in Azure Key Vault, the following cryptographic operations may be performed using the key:  

-   Sign and Verify: Strictly, this operation is "sign hash" or “verify hash” as Azure Key Vault does not support hashing of content as part of signature creation. Applications should hash data to be signed locally and then request Azure Key Vault sign the hash. Verification of signed hashes is supported as a convenience operation for applications that may not have access to [public] key material; it is recommended that, for best application performance, verify operations are performed locally.  

-   Key Encryption / Wrapping: A key stored in Azure Key Vault may be used to protect another key, typically a symmetric content encryption key (CEK). When the key in Azure Key Vault is asymmetric, key encryption is used, for example RSA-OAEP and the WRAPKEY/UNWRAPKEY operations are equivalent to ENCRYPT/DECRYPT. When the key in Azure Key Vault is symmetric, key wrapping is used; for example AES-KW. The WRAPKEY operation is supported as a convenience for applications that may not have access to [public] key material; it is recommended that, for best application performance, WRAPKEY operations are performed locally.  

-   Encrypt and Decrypt: A key stored in Azure Key Vault may be used to encrypt or decrypt a single block of data, the size of which is determined by the key type and selected encryption algorithm. The Encrypt operation is provided for convenience for applications that may not have access to [public] key material; it is recommended that, for best application performance, encrypt operations be performed locally.  

 While WRAPKEY/UNWRAPKEY using asymmetric keys may seem superfluous as the operation is equivalent to ENCRYPT/DECRYPT, the use of distinct operations is considered important to provide semantic and authorization separation of these operations and consistency when other key types are supported by the service.  

 Azure Key Vault does not support EXPORT operations: once a key is provisioned in the system it cannot be extracted or its key material modified.  However, users of Azure Key Vault who may require their key for other use cases, or after it has been deleted in Azure Key Vault, may use the BACKUP and RESTORE operations to export/import the key in a protected form. Keys created by the BACKUP operation are not usable outside Azure Key Vault. Alternatively, the IMPORT operation may be used against multiple Azure Key Vault instances.  

 Users may restrict any of the cryptographic operations that Azure Key Vault supports on a per-key basis using the key_ops property of the JWK object.  

 For more information on JWK objects, see [JSON Web Key (JWK)](http://tools.ietf.org/html/draft-ietf-jose-json-web-key).  

###  <a name="BKMK_KeyAttributes"></a> Key attributes  
 In addition to the key material, the following attributes may be specified. In a JSON Request, the attributes keyword and braces, ‘{‘ ‘}’, are required even if there are no attributes specified.  

-   enabled: boolean, optional, default is true. Specifies whether the key is enabled and useable for cryptographic operations. The enabled attribute is used in conjunction with nbf and exp: when an operation occurs between nbf and exp, it will only be permitted if enabled is set to true. Operations outside the nbf and exp window are automatically disallowed.  

-   nbf: IntDate, optional, default is now. The nbf (not before) attribute identifies the time before which the key MUST NOT be used for cryptographic operations. The processing of the nbf attribute requires that the current date/time MUST be after or equal to the not-before date/time listed in the nbf attribute. Azure Key Vault MAY provide for some small leeway, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing an IntDate value.  

     For more information on IntDate and other data types see, [Data types](about-keys--secrets-and-certificates.md#BKMK_DataTypes)  

-   exp: IntDate, optional, default is "forever". The exp (expiration time) attribute identifies the expiration time on or after which the key MUST NOT be used for cryptographic operation. The processing of the exp attribute requires that the current date/time MUST be before the expiration date/time listed in the exp attribute. Azure Key Vault MAY provide for some small leeway, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing an IntDate value.  

 There are additional read only attributes that are included in any response that includes key attributes:  

1.  created: IntDate, optional. The created attribute indicates when this version of the key was created. This value is null for keys created prior to the addition of this attribute. Its value MUST be a number containing an IntDate value.  

2.  updated: IntDate, optional. The updated attribute indicates when this version of the key was updated. This value is null for keys that were last updated prior to the addition of this attribute. Its value MUST be a number containing an IntDate value.  

 For information on data types see, [Data types](about-keys--secrets-and-certificates.md#BKMK_DataTypes).  

 For further information on possible attributes, see the [JSON Web Key (JWK)](http://tools.ietf.org/html/draft-ietf-jose-json-web-key).  

###  <a name="BKMK_Keytags"></a> Key tags  
 You can specify additional application-specific metadata in the form of tags. Azure Key Vault supports up to 15 tags, each of which can have a 256 character name and a 256 character value.  

###  <a name="BKMK_KeyAccessControl"></a> Key access control  
 Access Control for keys managed in Azure Key Vault is provided at the level of a Key Vault that acts as the container of keys. There is an access control policy for keys that is distinct from the access control policy for secrets in the same Key Vault. Users may create one or more vaults to hold keys and are required to maintain scenario appropriate segmentation and managed of keys. Access controls for Keys is independent of Access control for Secrets.  

 The following permissions can be granted, on a per user / service principal basis, in the keys access control entry on a vault. These permissions closely mirror the operations allowed on a key object:  

-   create: Create new keys  

-   get: Read the public part of a key, plus its attributes  

-   list: List the keys or versions of a key stored in a key vault  

-   update: Update the attributes for a key  

-   delete: Delete the key object  

-   sign: Use the key to sign digests  

-   verify: Use the key to verify digests  

-   wrapKey: Use the key to protect a symmetric key  

-   unwrapKey: Use the key to unprotect wrapped symmetric keys  

-   encrypt: Use the key to protect an arbitrary sequence of bytes  

-   decrypt: Use the key to unprotect a sequence of bytes  

-   import: Import a key to a key vault  

-   backup: Backup a key in a key vault  

-   restore: Restore a backed up key to a key vault  

-   all: All permissions  

### **Key Vault Secrets**  

###  <a name="BKMK_WorkingWithSecrets"></a> Working with Secrets  
 Secrets in Azure Key Vault are octet sequences with a maximum size of 25k bytes each. The Azure Key Vault service does not provide any semantics for secrets; it merely accepts the data and stores it securely, returning a secret identifier, “id”, that may be used to retrieve the secret at a later time.  

 For highly sensitive data, clients should consider additional layers of protection for data that is stored in Azure Key Vault; for example by pre-encrypting data using a separate protection key.  

 Azure Key Vault also supports a contentType field for secrets. Clients may specify the content type, “contentType”, of a secret to assist in interpreting the secret data when it is retrieved. The maximum length of this field is 255 characters. There are no pre-defined values. The suggested usage is as a hint for interpreting the secret data. For instance, an implementation may store both passwords and certificates as secrets then use this field to indicate which. There are no predefined values.  

###  <a name="BKMK_SecretAttrs"></a> Secret attributes  
 In addition to the secret data, the following attributes may be specified:  

1.  exp: IntDate, optional, default is "forever". The exp (expiration time) attribute identifies the expiration time on or after which the secret data MUST NOT be retrieved. The processing of the exp attribute requires that the current date/time MUST be before the expiration date/time listed in the exp attribute. Azure Key Vault MAY provide for some small leeway, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing an IntDate value.  

2.  nbf: IntDate, optional, default is "now". The nbf (not before) attribute identifies the time before which the secret data MUST NOT be retrieved. The processing of the nbf attribute requires that the current date/time MUST be after or equal to the not-before date/time listed in the nbf attribute. Azure Key Vault MAY provide for some small leeway, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing an IntDate value.  

3.  enabled: boolean, optional, default is "true". This attribute specifies whether or not the secret data can be retrieved. The enabled attribute is used in conjunction with nbf and exp when an operation occurs between nbf and exp, it will only be permitted if enabled is set to true. Operations outside the nbf and exp window are automatically disallowed.  

 There are additional read only attributes that are included in any response that includes secret attributes:  

1.  created: IntDate, optional. The created attribute indicates when this version of the secret was created. This value is null for secrets created prior to the addition of this attribute. Its value must be a number containing an IntDate value.  

2.  updated: IntDate, optional. The updated attribute indicates when this version of the secret was updated. This value is null for secrets that were last updated prior to the addition of this attribute. Its value must be a number containing an IntDate value.  

 For information on data types see, [Data types](about-keys--secrets-and-certificates.md#BKMK_DataTypes).  

###  <a name="BKMK_SecretTags"></a> Secret tags  
 You can specify additional application-specific metadata in the form of tags. Azure Key Vault supports up to 15 tags, each of which can have a 256 character name and a 256 character value.  

###  <a name="BKMK_SecretAccessControl"></a> Secret Access Control  
 Access Control for secrets managed in Azure Key Vault is provided at the level of a Key Vault that acts as the container of those secrets. There is an access control policy for secrets that is distinct from the access control policy for keys in the same Key Vault. Users may create one or more vaults to hold secrets and are required to maintain scenario appropriate segmentation and management of secrets. Access controls for secrets is independent of access control for Keys.  

 The following permissions can be used, on a per-principal basis, in the secrets access control entry on a vault, and closely mirror the operations allowed on a secret object:  

-   set: Create new secrets  

-   get: Read a secret  

-   list: List the secrets or versions of a secret stored in a Key Vault  

-   delete: Delete the secret  

-   all: All permissions  

 For more information on working with secrets, see [Secret operations](secret-operations.md).  

### Secret tags  
 You can specify additional application-specific metadata in the form of tags. Azure Key Vault supports up to 15 tags, each of which can have a 256 character name and a 256 character value.  

### **Key Vault Certificates**  
Key Vault certificates support provides for management of your x509 certificates and the following behaviors:  

-   Allows a certificate owner to create a certificate through a Key Vault creation process or through the import of an existing certificate. This includes both self-signed and Certificate Authority generated certificates.

- Allows a Key Vault certificate owner to implement secure storage and management of X509 certificates without interaction with private key material.  

-   Allows a certificate owner to create a policy that directs Key Vault to manage the life-cycle of a certificate.  

-   Allows certificate owners to provide contact information for notification about life-cycle events of expiration and renewal of certificate.  

-   Supports automatic renewal with selected issuers - Key Vault partner X509 certificate providers / certificate authorities.
    - NOTE - Non-partnered providers/authorities are also allowed but, will not support the auto renewal feature.

For more information on these features and behaviors, see the following sections of this article.

###  <a name="BKMK_CompositionOfCertificate"></a> Composition of a Certificate  
 When a KV certificate is created, an addressable KV key and KV secret is also created with the same name. KV key allows to do key operations and KV secret allows to retrieve the certificate value as a secret. KV Certificate also contains public x509 certificate metadata which will be explained later with the REST API.  

 The identifier and version of certificates is similar to keys and secrets. A specific version of addressable key and secret created with the KV Certificate version is available in the KV Certificate response.![Cetificates are complex objects](/media/azure-key-vault.jpg)  

###  <a name="BKMK_CertificateExportableOrNonExportableKey"></a> Exportable or  Non Exportable key  
 When a KV  certificate is created, it can be retrieved from the addressable secret with the private key in either pfx or pem format and if the policy used to create the certificate indicated key is exportable. If the policy used to create KV Certificate indicated key to be non-exportable, then the private key is not a part of value when retrieved as a secret.  

 The addressable key becomes more relevant with non-exportable KV certificates. The addressable KV key’s operations are mapped from keyusage field of the KV certificate policy used to create the KV Certificate.  

 Two types of key are supported – RSA or RSA HSM with certificates. Exportable is only allowed with RSA, not supported by RSA HSM.  

###  <a name="BKMK_CertificateAttributesAndTags"></a> Certificate Attributes and Tags  
 In addition to certificate metadata, addressable key, addressable secret, a KV Certificate also contains attributes and tags.  

 **Attributes**  

 The certificate attributes are mirrored to attributes of the addressable key and secret created when KV certificate is created.  

 A KV Certificate has following attributes:  

-   enabled: boolean, optional, default is "true". This attribute can be specified to indicate if the certificate data can be retrieved as secret or operable as a key. This is used in conjunction with nbf and exp when an operation occurs between nbf and exp, it will only be permitted if enabled is set to true. Operations outside the nbf and exp window are automatically disallowed.  

     There are additional read only attributes that are included in response:  

    -   created: IntDate: The created attribute indicates when this version of the KV Certificate was created.  

    -   updated: IntDate. The updated attribute indicates when this version of the KV Certificate was updated.  

    -   exp: IntDate:  this fields get the value of the expiry date of the x509 certificate.  

    -   nbf: IntDate: this fields get the value of the nbf date of the x509 certificate.  

         **Note:** If a KV certificate expires, it’s addressable key and secret become inoperable.  

 **Tags**  

 Client specified dictionary of key value pairs, similar to tags in keys and secrets.  

###  <a name="BKMK_CertificatePolicy"></a> Certificate Policy  
 A certificate policy contains information on how to create and manage lifecycle of a KV certificate. When a certificate with private key is imported into the key vault, a default policy is created by reading the x509 certificate.  

 When a KV certificate is created from scratch, a policy needs to be supplied to Key Vault to inform it on how to create this KV certificate version or the next KV certificate version. Once a policy has been established, it is not required with successive create operations to create next KV certificate versions.  

 There is only one instance of a policy for all the versions of a KV certificate.  

 At a high level, a certificate policy contains following:  

-   X509 certificate properties. Contains subject name, subject alternate names etc. used to create a x509 certificate request.  

-   Key Properties: contains key type, key length, exportable and reuse key fields. These fields instruct key vault on how to generate a key.  

-   Secret properties: contains secret properties such as content type of addressable secret to generate the secret value, for retrieving certificate as a secret.  

-   Lifetime Actions: contains lifetime actions for the KV Certificate. Each lifetime action contains  

     Trigger – specified via days before expiry or lifetime span percentage  

     Action – specifying action type – EmailContacts or AutoRenew  

-   Issuer: Parameters about the certificate issuer to use to issue x509 certificates.  

-   Policy Attributes: contains attributes associated with the policy  

###  <a name="BKMK_CertificateIssuer"></a> Certificate Issuer  
 A KV Certificate object holds a configuration to use to communicate with a selected certificate issuer provider to order x509 certificates.  

-   Key Vault partners with following certificate issuer providers for SSL certificates  

|Provider Name|Locations|  
|-------------------|---------------|  
|DigiCert|Supported in all key vault service locations in public cloud and US gov sovereign cloud|  
|GlobalSign|Supported in all key vault service locations in public cloud and US gov sovereign cloud|  
|WoSign|Supported in all key vault service locations in China sovereign cloud|  

 Before a certificate issuer can be created in a Key Vault, following prerequisite steps 1 and 2 must be successfully accomplished.  

1.  Onboard to Certificate Authority (CA) Providers  

    -   An organization administrator must on board their company (ex. Contoso) with at least one of above mentioned CA providers.  

2.  Admin creates requester credentials for Key Vault to enroll (and renew) SSL certificates  

    -   This will provide the configuration to be used to create an issuer object of the provider in the Key Vault  

 For more information on creating Issuer objects from the Certificates portal, see the [Key Vault Certificates blog](http://aka.ms/kvcertsblog)  

 Key Vault allows for creation of multiple issuer objects with different issuer provider configuration. Once an issuer object is created, its name can be referenced in one or multiple certificate policies. Referencing the issuer object instructs Key Vault to use configuration as specified in the issuer object when requesting the x509 certificate from CA provider during the certificate creation and renewal.  

 Issuer objects are created in the vault and can only be used with KV certificates in the same vault.  

###  <a name="BKMK_CertificateContacts"></a> Certificate contacts  
 Certificate contacts contain contact information to send notifications to on certificate lifetime events. The contacts information is shared by all the certificates in the vault. A notification is sent to all the specified contacts for an event for any certificate in the key vault.  

 If certificate is set to be auto renewed in policy, then a notification is sent on following events.  

-   Prior to certificate renewal

-   After certificate renewal, stating if the certificate was successfully renewed, or if there was an error, and hence the owner needs to manually renew the certificate.  

 If certificate is set to be manually renewed in policy (email only), then a notification is sent when it’s time to renew the certificate manually.  

###  <a name="BKMK_CertificateAccessControl"></a> Certificate Access Control  
 Access control for certificates is managed by Key Vault is provided at the level of a Key Vault that acts as the container of those certificates. There is an access control policy for certificates that is distinct from the access control policy for keys and secrets in the same Key Vault. Users may create one or more vaults to hold certificates and are required to maintain scenario appropriate segmentation and management of certificates.  

 The following permissions can be used, on a per-principal basis, in the secrets access control entry on a vault, and closely mirror the operations allowed on a secret object:  

-   "GET" : allows to get current KV certificate version or any version of a KV certificate  

-   "LIST", allows to list current KV certificates or versions of a KV certificate  

-   "DELETE", allows to delete a KV certificate, its policy and all the versions of it.  

-   "CREATE", allows to create a KV certificate.  

-   "IMPORT", allows to import certificate into a KV Certificate.  

-   "UPDATE", allows to update a KV certificate.  

-   "MANAGECONTACTS", allows to manage KV certificate contacts  

-   "GETISSUERS", allows to get KV certificate issuers  

-   "LISTISSUERS", allows to list KV certificate issuers  

-   "SETISSUERS", allows to create or update KV certificate issuers  

-   DELETEISSUERS", allows to delete KV certificate issuers  

-   all: All permissions  

## Resources
- [Certificates and policies](certificates-and-policies.md)
- [Certificate Issuers](certificate-issuers.md)
- [Certificate Contacts](certificate-contacts.md)

## See Also  
- [Authentication, requests, and responses](authentication--requests-and-responses.md)
- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
- [Key Vault versions](key-vault-versions.md)
