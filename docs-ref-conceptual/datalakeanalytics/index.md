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
|[Accounts](xref:management.azure.com.datalakeanalytics.accounts)| Provides operations to create and manage Data Lake Analytics accounts. |
|[Catalog](xref:management.azure.com.datalakeanalytics.catalog) | Provides operations to explore the U-SQL catalog of a Data Lake Analytics account. |
|[Compute Policies](xref:management.azure.com.datalakeanalytics.computepolicies) | Provides operations to create and manage the compute policies of a Data Lake Analytics account. |
|[Data Lake Store Accounts](xref:management.azure.com.datalakeanalytics.datalakestoreaccounts) | Provides operations to manage the list of Data Lake Store accounts associated with a Data Lake Analytics account. |
|[Firewall Rules](xref:management.azure.com.datalakeanalytics.firewallrules) | Provides operations to create and manage firewall rules for a Data Lake Analytics account. |
|[Job](xref:management.azure.com.datalakeanalytics.job) | Provides operations to submit and manage jobs in a Data Lake Analytics account. |
|[Pipeline](xref:management.azure.com.datalakeanalytics.pipeline) | Provides operations to explore the pipelines associated with the jobs submitted to a Data Lake Analytics account. |
|[Recurrence](xref:management.azure.com.datalakeanalytics.recurrence) | Provides operations to explore the recurrences associated with the jobs submitted to a Data Lake Analytics account. |
|[Storage Accounts](xref:management.azure.com.datalakeanalytics.storageaccounts) | Provides operations to manage the list of Azure Storage accounts associated with a Data Lake Analytics account. |

##Common parameters and headers

The following information is common to all tasks that you might do related to Data Lake Analytics:

* Replace `{api-version}` with **2016-11-01**.
* Replace `{subscription-id}` in the URI with your Azure subscription identifier.
* Replace `{resource-group-name}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).
Replace `{account-name}` in the URI with your Data Lake Analytics account name.
* Set the **Content-Type** header to **application/json**.
* Set the **Authorization** header to a JSON Web Token that you obtain from Azure Active Directory. For job, pipeline, recurrence, and catalog operations, be sure to obtain a token for the resource URI / audience claim “https://datalake.azure.net/”, NOT “https://management.core.windows.net/” nor “https://management.azure.com/”. For more information, see Authenticating Azure Resource Manager requests.

## See Also

- [Azure Data Lake Analytics](https://azure.microsoft.com/services/data-lake-analytics/)
