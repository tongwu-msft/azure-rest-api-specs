---
ms.assetid: 768deb64-ecdd-40ec-9a9f-0560144a0d81
ms.title: Azure Data Lake Analytics REST API Reference
ms.prod: azure
ms.service: data-lake-analytics
author: nitinme
ms.author: nitinme
ms.manager: jhubbard
service_description: To be added
---

# Azure Data Lake Analytics REST API

Use the Azure Data Lake Analytics REST APIs to create and manage Data Lake Analytics resources through Azure Resource Manager. All task operations conform to the HTTP/1.1 protocol specification and most operations return an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure, using `https`. For more information on making secure requests, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Account](~/docs-ref-autogen/datalakeanalytics/Account.json)| Provides operations to manage Data Lake Analytics account and storage linked to Data Lake Analytics account. |
|[Catalog](catalog-management-apis.md) | Provides operations to manage catalogs for the Data Lake Analytics account. |
|[Job](job-management-apis.md) | Provides operations to manage jobs in the Data Lake Analytics account. |
|[Firewall rules](~/docs-ref-autogen/datalakeanalytics/FirewallRules.json) | Provides operations to manage firewall rules for Data Lake Analytics account. |
|[Storage accounts](~/docs-ref-autogen/datalakeanalytics/StorageAccounts.json) | Provides operations to manage Azure Storage accounts associated with a Data Lake Analytics account. |

##Common parameters and headers

The following information is common to all tasks that you might do related to Data Lake Analytics:

* Replace `{api-version}` with **2016-11-01**.
* Replace `{subscription-id}` in the URI with your Azure subscription identifier.
* Replace `{resource-group-name}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).
Replace `{account-name}` in the URI with your Data Lake Analytics account name.
* Set the **Content-Type** header to **application/json**.
Set the **Authorization** header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).


## See Also

- [Azure Data Lake Analytics](https://azure.microsoft.com/services/data-lake-analytics/)