---
title: Azure Data Lake Storage Gen2 REST API reference - Azure Storage
description: Learn how to use the Azure Data Lake Storage Gen2 REST APIs to interact with Azure Blob Storage through a file system interface.
author: pemari-msft

ms.date: 09/20/2019
ms.service: storage
ms.author: pemari
ms.topic: reference
service_description: Azure Data Lake Storage Gen2 is a set of capabilities dedicated to big data analytics, built on top of Azure Blob storage.
---

# Azure Data Lake Storage Gen2 REST APIs

Use the Azure Data Lake Storage Gen2 REST APIs to interact with Azure Blob Storage through a file system interface. On that interface, you can create and manage file systems, directories, and files.

## Authorization

Azure Data Lake Storage Gen2 REST APIs support Azure Active Directory (Azure AD), Shared Key, and shared access signature (SAS) authorization. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).

## Operations

- [Filesystem](/rest/api/storageservices/datalakestoragegen2/filesystem)
  - [Create](/rest/api/storageservices/datalakestoragegen2/filesystem/create)
  - [Delete](/rest/api/storageservices/datalakestoragegen2/filesystem/delete)
  - [Get Properties](/rest/api/storageservices/datalakestoragegen2/filesystem/getproperties)
  - [Set Properties](/rest/api/storageservices/datalakestoragegen2/filesystem/setproperties)
  - [List](/rest/api/storageservices/datalakestoragegen2/filesystem/list)
- [Path](/rest/api/storageservices/datalakestoragegen2/path)
  - [Create](/rest/api/storageservices/datalakestoragegen2/path/create)
  - [Delete](/rest/api/storageservices/datalakestoragegen2/path/delete)
  - [Get Properties](/rest/api/storageservices/datalakestoragegen2/path/getproperties)
  - [Lease](/rest/api/storageservices/datalakestoragegen2/path/lease)
  - [List](/rest/api/storageservices/datalakestoragegen2/path/list)
  - [Read](/rest/api/storageservices/datalakestoragegen2/path/read)
  - [Update](/rest/api/storageservices/datalakestoragegen2/path/update)

## See also

- [Azure Data Lake Storage Gen2 documentation](/azure/storage/data-lake-storage/introduction)
- [Azure Blob Storage REST API](/rest/api/storageservices/blob-service-rest-api)
