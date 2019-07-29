---
title: "Create a user delegation SAS"
description: A user delegation SAS 
ms.date: 07/25/2019
ms.prod: azure
ms.service: storage
ms.topic: reference
ms.author: tamram
author: tamram
---

# Create a user delegation SAS

A SAS token for access to a container or blob may be secured by using either Azure AD credentials or an account key. A SAS secured with Azure AD credentials is called a *user delegation* SAS, because the token used to create the SAS is requested on behalf of the user. Microsoft recommends that you use Azure AD credentials when possible as a security best practice, rather than using the account key, which can be more easily compromised. When your application design requires shared access signatures, use Azure AD credentials to create a user delegation SAS for superior security.

A user delegation SAS is supported only for the Blob service. Stored access policies are not supported for a user delegation SAS.

> [!CAUTION]
> Any client that possesses a valid SAS can access data in your storage account as permitted by that SAS. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. For more information, see ....???. 

For information about using your account key to secure a SAS, see [Create a service SAS](create-a-service-sas.md).

## Authorization

A user delegation SAS is secured using Azure AD credentials. Creating a SAS using Azure AD credentials is a security best practice.

To use an account key to secure a SAS for a container or blob, or to create a SAS for a resource in a different Azure Storage service, construct a service SAS. For more information, see [Create a service SAS](create-a-service-sas.md).

## Specifying the Signed Version Field

The `signedversion` field contains the service version of the shared access signature. This value specifies the version of Shared Key authorization used by this shared access signature (in the `signature` field), and also specifies the service version for requests made with this shared access signature. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) and [Previous Azure Storage service versions](Azure-Storage-Services-Versions-2015-07-08-and-Earlier.md) for information on which version is used when to execute requests via a shared access signature. See [Delegate access with a shared access signature](delegate-access-with-a-shared-access-signature.md) for details about how this parameter affects the authorization of requests made with a shared access signature.
  
|Field name|Query parameter|Description|  
|----------------|---------------------|-----------------|  
|`signedversion`|`sv`|Required. For a user delegation SAS, must be version 2018-11-09 or later. The storage service version to use to authorize requests made with this shared access signature, and the service version to use when handling requests made with this shared access signature.|


## See also

[Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-shared-access-signatures.md).
