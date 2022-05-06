---
title: Azure Files REST API
description: The Azure Files FileREST protocol enables software vendors and regular Azure users to efficiently write applications and services that communicate with Azure file shares.
author: wmgries

ms.date: 06/03/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Azure Files REST API
Azure Files provides hosted cloud file shares that you can access (*mount*) by using industry-standard file system protocols such as SMB and NFS. When you mount a file share on your computer by using SMB or NFS, your operating system redirects API requests for the local file system. The redirection includes local API requests that you make by using .NET `System.IO` interfaces or Python open, read, or write methods. This means that users of these applications don't need to do anything special or even know that their data is on a remote file share instead of local storage.

Azure Files also provides a REST API, which is often called the FileREST API. It provides another method of accessing data stored in Azure file shares. SMB and NFS enable transparent access to remote file shares through native file system APIs, but the FileREST protocol provides a different method for accessing file share data. 

To use the FileREST API, you create HTTPS requests against the FileREST HTTPS endpoints. You could write code to create HTTPS requests yourself, but the expected way that you consume the FileREST API is via the Azure SDKs. These SDKs provide idiomatic language APIs for popular languages such as C#, Java, Python, JavaScript, and Go.

Because the FileREST API was designed specifically for Azure Files, it enables you to access features of Azure Files that you can't access over SMB or NFS. It also enables you to perform certain operations, such as copy, more efficiently than you can via SMB or NFS. 

The stateless nature of HTTPS makes the FileREST API useful for cloud services or applications that need to access many Azure file shares. For example, you can attach value-added services or applications to an Azure file share to add a capability. These services or applications might include antivirus, backup, data management, or replication products. Azure File Sync and Azure Backup are notable Microsoft services that extensively use the FileREST API to add value on top of a customer-owned Azure file share.

Consider using the FileREST API if you're building value-added services or applications, especially if you're providing those services to customers. If you're constructing a line-of-business application, particularly one that users will use against a mounted Azure file share, you can use either SMB/NFS or FileREST. However, you might find that using SMB or NFS provides an easier path because those protocols enable you to use native file system APIs. 

If you have an existing application that was written with native file system APIs, you don't need to rewrite it to take advantage of Azure Files. The key value proposition of Azure Files is exposing native file system APIs through the use of SMB or NFS.

To learn more about Azure Files, including deployment, networking, and identity configuration, see:

- [What is Azure Files?](/azure/storage/files/storage-files-introduction)
- [Plan for an Azure Files deployment](/azure/storage/files/storage-files-planning)
- [Create an Azure file share](/azure/storage/files/storage-how-to-create-file-share)

## Control plane
In Azure, the control plane is provided through Azure Resource Manager, which provides a common way to expose Azure resources that the customer will manage. The top-level unit of management is the storage account. The storage account is a *tracked resource* in Azure Files and other storage services, such as Azure Blob Storage.

The storage account is managed by the storage resource provider, which has the namespace `Microsoft.Storage`. The storage resource provider also exposes management of child resources, or *proxy resources*, that enable the management of the storage services bundled in the storage account. For Azure Files, there are two relevant proxy resources:

- The `FileService` resource. It provides settings specific to Azure Files that apply to all of the file shares in the storage account. The `FileService` resource is a child of the storage account. A storage account always has only one `FileService` resource: `default`.

- The `FileShare` resource. It represents a file share or a snapshot of a file share. The `FileShare` resource is a child of the `FileService` resource and can contain an infinite number of file shares. 

  Although a `FileService` resource can contain an infinite number of `FileShare` resources, using a very large number is not a good idea because everything within a storage account shares a defined pool of I/O, bandwidth, and other limits. For more information, see [Azure Files scalability and performance targets](/azure/storage/files/storage-files-scale-targets).

To learn how to call the control plane APIs, see:

- [Storage account](/rest/api/storagerp)
- [FileService](/rest/api/storagerp/file-services)
- [FileShare](/rest/api/storagerp/file-shares)

Operations on the `FileService` and `FileShare` objects can also be done through the data plane. This is an artifact of Azure Files predating Azure Resource Manager. Although these APIs are fully supported, you should prefer using the storage resource provider APIs to manage Azure Files for these reasons:

- Operations exposed through Azure Resource Manager use Azure Active Directory (Azure AD) for authentication and authorization, so you can manage Azure Files by using role-based access control (RBAC). You can authorize your application or service to programmatically call these APIs with an Azure AD service principal.

- You can call Azure Resource Manager APIs imperatively, either through the REST API directly or through an SDK. Or you can call them declaratively, by declaring what resources need to be deployed through Azure templates. For resources that need to be repeatedly created together (for example, in service deployments), using templates can considerably simplify the work that's required.

Although we recommend using the storage resource provider to manage storage resources, using the FileREST data plane management APIs will give you better performance in cases that require high scale. An example of such a case is a workload that creates or modifies thousands of file shares within the same storage account.

## Data plane
Azure Files provides a hierarchical file system for unstructured data. The FileREST API models the two important objects in the file system space: files and directories. To learn how to call the FileREST APIs, see:

- [Operations on Azure Files](Operations-on-the-Account--File-Service-.md) (prefer control plane APIs)
- [Operations on file shares](Operations-on-Shares--File-Service-.md) (prefer control plane APIs)
- [Operations on directories](Operations-on-Directories.md)
- [Operations on files](Operations-on-Files.md)

## See also
- [Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)
- [Features not supported in Azure Files](Features-Not-Supported-By-the-Azure-File-Service.md)
- [Azure Files concepts](File-Service-Concepts.md)
