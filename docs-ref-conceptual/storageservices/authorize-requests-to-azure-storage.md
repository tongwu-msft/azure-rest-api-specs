﻿---
title: Authorize requests to Azure Storage (REST API)
description: Every request made against a secured resource in the Blob, File, Queue, or Table service must be authorized. Authorization ensures that resources in your storage account are accessible only when you want them to be, and only to those users or applications to whom you grant access.
author: tamram

ms.date: 04/01/2021
ms.service: storage
ms.topic: reference
ms.author: tamram
---

# Authorize requests to Azure Storage

Every request made against a secured resource in the Blob, File, Queue, or Table service must be authorized. Authorization ensures that resources in your storage account are accessible only when you want them to be, and only to those users or applications to whom you grant access.

The following table describes the options that Azure Storage offers for authorizing access to resources:

| Azure artifact | Shared Key (storage account key) | Shared access signature (SAS) | Azure Active Directory (Azure AD) | On-premises Active Directory Domain Services | Anonymous public read access |
|--|--|--|--|--|--|
| Azure Blobs | [Supported](authorize-with-shared-key.md) | [Supported](/azure/storage/common/storage-sas-overview?toc=%2fazure%2fstorage%2fblobs%2ftoc.json) | [Supported](/azure/storage/common/storage-auth-aad) | Not supported | [Supported](/azure/storage/blobs/anonymous-read-access-configure) |
| Azure Files (SMB) | [Supported](authorize-with-shared-key.md) | Not supported | [Supported, only with AAD Domain Services](/azure/storage/files/storage-files-active-directory-overview) | [Supported, credentials must be synced to Azure AD](/azure/storage/files/storage-files-active-directory-overview) | Not supported |
| Azure Files (REST) | [Supported](authorize-with-shared-key.md) | [Supported](/azure/storage/common/storage-sas-overview?toc=%2fazure%2fstorage%2ffiles%2ftoc.json) | Not supported | Not supported | Not supported |
| Azure Queues | [Supported](authorize-with-shared-key.md) | [Supported](/azure/storage/common/storage-sas-overview?toc=%2fazure%2fstorage%2fqueues%2ftoc.json) | [Supported](/azure/storage/common/storage-auth-aad) | Not Supported | Not supported |
| Azure Tables | [Supported](authorize-with-shared-key.md) | [Supported](/azure/storage/common/storage-sas-overview) | Not supported | Not supported | Not supported |

Each authorization option is briefly described below:

- **Azure Active Directory (Azure AD):** [Azure AD](/azure/active-directory/fundamentals/active-directory-whatis) is Microsoft's cloud-based identity and access management service. Azure AD integration is available for the Blob and Queue services. With Azure AD, you can assign fine-grained access to users, groups, or applications via role-based access control (RBAC). For information about Azure AD integration with Azure Storage, see [Authorize with Azure Active Directory](authorize-with-azure-active-directory.md).

- **Azure Active Directory Domain Services (Azure AD DS) authorization** for Azure Files. Azure Files supports identity-based authorization over Server Message Block (SMB) through Azure AD DS. You can use RBAC for fine-grained control over a client's access to Azure Files resources in a storage account. For more information regarding Azure Files authentication using domain services, see [Azure Files identity-based authorization](/azure/storage/files/storage-files-active-directory-overview).

- **Active Directory (AD) authorization (preview)** for Azure Files. Azure Files supports identity-based authorization over SMB through AD. Your AD domain service can be hosted on on-premises machines or in Azure VMs. SMB access to Files is supported using AD credentials from domain joined machines, either on-premises or in Azure. You can use RBAC for share level access control and NTFS DACLs for directory and file level permission enforcement. For more information regarding Azure Files authentication using domain services, see [Azure Files identity-based authorization](/azure/storage/files/storage-files-active-directory-overview).

- **Shared Key:** Shared Key authorization relies on your account access keys and other parameters to produce an encrypted signature string that is passed on the request in the *Authorization* header. For more information about Shared Key authorization, see [Authorize with Shared Key](Authorize-with-Shared-Key.md).

- **Shared access signatures:** Shared access signatures (SAS) delegate access to a particular resource in your account with specified permissions and over a specified time interval. For more information about SAS, see [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md).

- **Anonymous access to containers and blobs:** You can optionally make blob resources public at the container or blob level. A public container or blob is accessible to any user for anonymous read access. Read requests to public containers and blobs do not require authorization. For more information, see [Enable public read access for containers and blobs in Azure Blob storage](/azure/storage/blobs/storage-manage-access-to-resources).

> [!TIP]
> Authenticating and authorizing access to blob and queue data with Azure AD provides superior security and ease of use over other authorization options. For example, by using Azure AD, you avoid having to store your account access key with your code, as you do with Shared Key authorization. While you can continue to use Shared Key authorization with your blob and queue applications, Microsoft recommends moving to Azure AD where possible.
>
> Similarly, you can continue to use shared access signatures (SAS) to grant fine-grained access to resources in your storage account, but Azure AD offers similar capabilities without the need to manage SAS tokens or worry about revoking a compromised SAS.
>
> For more information about Azure AD integration in Azure Storage, see [Authorize access to Azure blobs and queues using Azure Active Directory](/azure/storage/common/storage-auth-aad).
