---
ms.title: Azure Data Lake Storage Gen2 REST API Reference
ms.prod: azure
ms.service: storage
author: seguler
ms.author: seguler
ms.manager: jahogg
ms.topic: reference
service_description: Azure Data Lake Storage Gen2 is a set of capabilities dedicated to big data analytics, built on top of Azure Blob storage.
---

# Azure Data Lake Store REST API

Use the Azure Data Lake Storage Gen2 REST APIs to interact with Azure Blob storage through a file system interface. This interface allows you to create and manage file systems, as well as to create and manage directories and files.

## Authorization/Authentication

Azure Data Lake Storage Gen2 APIs support authorization with the Azure Storage Shared Key mechanism described in the [Authorize with Shared Key](https://docs.microsoft.com/rest/api/storageservices/authorize-with-shared-key) article.

## Operations

- [Filesystem](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem) 
  - [Create](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem/filesystem_create) 
  - [Delete](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem/filesystem_delete) 
  - [Get Properties](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem/filesystem_getproperties) 
  - [Set Properties](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem/filesystem_setproperties) 
  - [List](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/filesystem/filesystem_list) 
- [Path](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path)
  - [Create](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_create) 
  - [Delete](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_delete) 
  - [Get Properties](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_getproperties) 
  - [Lease](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_lease) 
  - [List](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_list) 
  - [Read](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_read)
  - [Update](https://docs.microsoft.com/rest/api/storageservices/datalakestoragegen2/path/path_update) 






## See Also

- [Azure Data Lake Storage Gen2 Documentation](https://docs.microsoft.com/azure/storage/data-lake-storage/introduction)
- [Azure Blob Storage REST API](https://docs.microsoft.com/rest/api/storageservices/blob-service-rest-api)
