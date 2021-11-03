---
title: Azure Files REST API
description: Azure Files provides access to your cloud file shares via the SMB, NFS, and FileREST file system protocols. The Azure Files FileREST protocol enables software vendors and regular Azure users to easily and efficiently write applications and services that talk to Azure file shares.
author: wmgries

ms.date: 06/03/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Azure Files REST API
Azure Files provides hosted cloud file shares that you can access ("mount") using industry standard file system protocols such as SMB and NFS. When you mount a file share on your computer using SMB or NFS, your operating system redirects local file system API requests, such as those that you might make using .NET's System.IO interfaces or Python's open/read/write methods. This means that applications, and importantly users of these applications, don't need to do anything special (or even know) their data is on a remote file share instead of local storage.

Azure Files also provides a REST API, often called the FileREST API, which provides another method of accessing data stored in Azure file shares. Unlike SMB and NFS, which enable transparent access to remote file shares using native file system APIs, the FileREST protocol provides a different method of accessing file share data. To use the FileREST API, you create HTTPS requests against the FileREST HTTPS endpoints. You could write code to create HTTPS requests yourself, but the expected way that you consume the FileREST API is via the Azure SDKs, which provide idiomatic language APIs for popular languages such as C#, Java, Python, JavaScript, Go, and others.

Because the FileREST API was designed specifically for Azure Files, it enables you to access features of Azure Files that are not accessible over SMB or NFS, and perform certain operations, such as copy, more efficiently than via SMB/NFS. The stateless nature of HTTPS makes the FileREST API is useful for use in cloud services or applications that need to access many Azure file shares, such as value-added services or applications that can be attached to the Azure file share to add some capability. These might include antivirus, backup, data management, or replication products. As an example, Azure File Sync and Azure Backup are notable first party value-added services that extensively use the FileREST API to add value on-top of a customer-owned Azure file share.

As a general rule, you should consider using the FileREST API if you are building value-added services or applications, especially if you are providing such value-added services to your customers. If you are constructing a line-of-business application, particularly one that end users will use against a mounted Azure file share, you can use either SMB/NFS or FileREST, however, you may find that using SMB/NFS provide an easier path since they enable you to use native file system APIs. If you have an existing application that was written native file system APIs, you absolutely do not need to rewrite it to take advantage of Azure Files; the key value proposition of Azure Files is exposing native file system APIs through use of SMB or NFS.

To learn more about Azure Files, including deployment, networking, and identity configuration, see:

- [What is Azure Files?](/azure/storage/files/storage-files-introduction)
- [Planning for an Azure Files deployment](/azure/storage/files/storage-files-planning)
- [Create an Azure file share](/azure/storage/files/storage-how-to-create-file-share)

## Control plane
In Azure, the control plane is provided through the Azure Resource Manager, sometimes abbreviated as ARM, which provides a common way of exposing Azure resources to be managed by the customer. The top-level unit of management, or *tracked resource* in Azure Files, and other storage services such as Blob storage, is the storage account. The storage account is managed by the storage resource provider, which has the namespace Microsoft.Storage. The storage resource provider also exposes management of child resources, or *proxy resources*, that enable the management of the storage services bundled in the storage account. For Azure Files, there are two relevant *proxy resources*:

- The `FileService` resource, which provides Azure Files specific settings that apply to all of the file shares in the storage account. The `FileService` resource is a child of the storage account tracked resource, and a storage account only ever has one `FileService` resource, called `default`.

- The `FileShare` resource, which represents a file share (or a snapshot of a file share). The `FileShare` resource is a child of the `FileService` resource, and may contain an infinite number of file shares. Although a `FileService` can contain an infinite number of `FileShare` resources, using a very large number is not a good idea as everything within a storage account shares a defined pool of IO, bandwidth, and other limits. For more information, see [Azure Files scalability and performance targets](/azure/storage/files/storage-files-scale-targets).

To learn how to call the control plane APIs, see:

- [Storage account](/rest/api/storagerp)
- [FileService](/rest/api/storagerp/file-services)
- [FileShare](/rest/api/storagerp/file-shares)

For legacy reasons, operations on the `FileService` and `FileShare` objects may also be done through the data plane. This is an artifact of Azure Files predating Azure Resource Manager, and while these APIs are fully supported, you should prefer using the storage resource provider APIs to manage Azure Files for several reasons:

- Operations exposed through Azure Resource Manager use Azure AD for authentication and authorization, enabling you to manage Azure Files with role-based access control (RBAC). You can authorize your application or service to programmatically call these APIs with an Azure AD service principal.

- Azure Resource Manager APIs can be called imperatively, using the REST API directly or through an SDK, or declaratively, by declaring what resources need to be deployed using Azure templates. For resources that need to be repeatedly created together, service deployments, etc., using templates can considerably simplify the work required.

Although using the storage resource provider to manage storage resources is preferred, in cases requiring high scale, such as a workload that creates or modifies thousands of file shares within the same storage account, using the FileREST data plane management APIs will be most performant.

## Data plane
Azure Files provides a hierarchical file system for unstructured data ("files"). The FileREST API models the two important objects in the file system space: Files and Directories. To learn how to call the FileREST APIs, see:

- [Operations on the File Service](Operations-on-the-Account--File-Service-.md) (prefer control plane APIs)
- [Operations on File Shares](Operations-on-Shares--File-Service-.md) (prefer control plane APIs)
- [Operations on Directories](Operations-on-Directories.md)
- [Operations on Files](Operations-on-Files.md)

## See also
- [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
- [Features Not Supported By the Azure File Service](Features-Not-Supported-By-the-Azure-File-Service.md)
- [File Service Concepts](File-Service-Concepts.md)
