---
title: Azure Data Lake Storage Gen2 REST API reference - Azure Storage
description: Use the Azure Data Lake Storage Gen2 REST APIs to interact with Azure Blob storage through a file system interface. This interface allows you to create and manage file systems, as well as to create and manage directories and files.
author: pemari-msft

ms.date: 09/20/2019
ms.service: storage
ms.author: pemari
ms.topic: reference
service_description: Azure Data Lake Storage Gen2 is a set of capabilities dedicated to big data analytics, built on top of Azure Blob storage.
---

# Azure Data Lake Store REST API

Use the Azure Data Lake Storage Gen2 REST APIs to interact with Azure Blob storage through a file system interface. This interface allows you to create and manage file systems, as well as to create and manage directories and files.

## Authorization

Azure Data Lake Storage Gen2 APIs support Azure Active Directory (Azure AD), Shared Key, and shared access signature (SAS) authorization. See [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).

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

- [Azure Data Lake Storage Gen2 Documentation](/azure/storage/data-lake-storage/introduction)
- [Azure Blob Storage REST API](/rest/api/storageservices/blob-service-rest-api)
