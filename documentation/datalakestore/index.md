---
ms.assetid: 41e2b7a9-d76d-4dae-b997-278afe42600c
ms.title: Azure Data Lake Store REST API Reference
ms.prod: azure
ms.service: data-lake-store
author: nitinme
ms.author: nitinme
ms.manager: jhubbard

---

# Azure Data Lake Store REST API

Use the Azure Data Lake Store REST APIs to create and manage Data Lake Store resources through Azure Resource Manager. All task operations conform to the HTTP/1.1 protocol specification and most operations return an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure, using `https`. For more information on making secure requests, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Account](~/api-ref/datalakestore/Account.json)| Provides operations to manage Data Lake Store account, including key management, and firewall rules for Data Lake Store accounts. |
|[File System](~/api-ref/datalakestore/FileSystem.json) | Provides filesystem operations on your Data Lake Store account. |

##Common parameters and headers

The following information is common to all tasks that you might do related to Data Lake Store:

* Replace `{api-version}` with **2016-11-01**.
* Replace `{subscription-id}` in the URI with your Azure subscription identifier.
* Replace `{resource-group-name}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).
Replace `{account-name}` in the URI with your Data Lake Store account name.
* Set the **Content-Type** header to **application/json**.
Set the **Authorization** header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).


## See Also

- [Azure Data Lake Store](https://azure.microsoft.com/services/data-lake-store/)