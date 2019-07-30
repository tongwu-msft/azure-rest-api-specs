---
title: Delegate access with a shared access signature - Azure Storage
description: A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key but to whom you wish to delegate access to certain storage account resources. By distributing a shared access signature URI to these clients, you can grant them access to a resource for a specified period of time, with a specified set of permissions.
ms.date: 07/29/2019
ms.prod: azure
ms.service: storage
ms.topic: reference
ms.author: tamram
author: tamram
---

# Delegate access with a shared access signature

A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key but to whom you wish to delegate access to certain storage account resources. By distributing a shared access signature URI to these clients, you can grant them access to a resource for a specified period of time, with a specified set of permissions.  

The URI query parameters comprising the SAS token incorporate all of the information necessary to grant controlled access to a storage resource. A client who is in possession of the SAS can make a request against Azure Storage with just the SAS URI, and the information contained in the SAS token is used to authorize the request.  
  
Azure Storage supports the following types of shared access signatures:  
  
- An account-level SAS, introduced with version 2015-04-05. The account SAS delegates access to resources in one or more of the storage services. All of the operations available via a service SAS are also available via an account SAS. Additionally, with the account SAS, you can delegate access to operations that apply to a given service, such as `Get/Set Service Properties` and `Get Service Stats`. You can also delegate access to read, write, and delete operations on blob containers, tables, queues, and file shares that are not permitted with a service SAS. See [Create an account SAS](create-an-account-sas.md) for more information about account SAS.  
  
- A service-level SAS. The service SAS delegates access to a resource in just one of the storage services: the Blob, Queue, Table, or File service. See [Create a service SAS](create-a-service-sas.md) and [Service SAS Examples](Service-SAS-Examples.md) for more information about service SAS.  

- A user delegation SAS, introduced with version 2018-11-09. A user delegation SAS grants access to resources in the Blob service to a user with Azure Active Directory credentials. To get a key to return a user delegation SAS, call the [Get User Delegation Key](Get-User-Delegation-Key.md) operation.

> [!NOTE]
> Stored access policies are currently not supported for an account SAS.
  
Additionally, a service SAS can reference a stored access policy that provides an additional level of control over a set of signatures, including the ability to modify or revoke access to the resource if necessary. For more information on stored access policies, see [Define a stored access policy](define-a-stored-access-policy.md).  

> [!TIP]
> Authorizing access to blob and queue data with Azure AD credentials provides superior security and ease of use over other authorization options. For example, by using Azure AD, you avoid having to store your account access key with your code, as you do with Shared Key authorization. While you can continue to use Shared Key authorization with your blob and queue applications, Microsoft recommends moving to Azure AD where possible.
>
> Similarly, you can continue to use shared access signatures (SAS) to grant fine-grained access to resources in your storage account, but Azure AD offers similar capabilities without the need to manage SAS tokens or worry about revoking a compromised SAS.
>
> For more information about Azure AD integration in Azure Storage, see [Authorizing requests to Azure Storage using Azure Active Directory](https://docs.microsoft.com/azure/storage/common/storage-auth-aad).

## See also

- [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-shared-access-signatures)
