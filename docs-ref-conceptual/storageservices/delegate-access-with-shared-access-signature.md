---
title: Delegate access with a shared access signature - Azure Storage
description: A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key when you want to delegate access to certain storage account resources.
author: tamram

ms.date: 12/18/2019
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Delegate access with a shared access signature

A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key but to whom you wish to delegate access to certain storage account resources. By distributing a shared access signature URI to these clients, you can grant them access to a resource for a specified period of time, with a specified set of permissions.  

The URI query parameters comprising the SAS token incorporate all of the information necessary to grant controlled access to a storage resource. A client who is in possession of the SAS can make a request against Azure Storage with just the SAS URI, and the information contained in the SAS token is used to authorize the request.  

## Types of shared access signatures
  
Azure Storage supports the following types of shared access signatures:  
  
- An account-level SAS, introduced with version 2015-04-05. The account SAS delegates access to resources in one or more of the storage services. All of the operations available via a service SAS are also available via an account SAS. Additionally, with the account SAS, you can delegate access to operations that apply to a given service, such as `Get/Set Service Properties` and `Get Service Stats`. You can also delegate access to read, write, and delete operations on blob containers, tables, queues, and file shares that are not permitted with a service SAS. See [Create an account SAS](create-account-sas.md) for more information about account SAS.  
  
- A service-level SAS. The service SAS delegates access to a resource in just one of the storage services: the Blob, Queue, Table, or File service. See [Create a service SAS](create-service-sas.md) and [Service SAS Examples](Service-SAS-Examples.md) for more information about service SAS.  

- A user delegation SAS, introduced with version 2018-11-09. A user delegation SAS is secured with Azure AD credentials. This type of SAS is supported for the Blob service only and can be used to grant access to containers and blobs. For more information, see [Create a user delegation SAS](create-user-delegation-sas.md).

Additionally, a service SAS can reference a stored access policy that provides an additional level of control over a set of signatures, including the ability to modify or revoke access to the resource if necessary. For more information on stored access policies, see [Define a stored access policy](define-stored-access-policy.md).  

> [!NOTE]
> Stored access policies are currently not supported for an account SAS or a user delegation SAS.

## See also

- [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-sas-overview)
