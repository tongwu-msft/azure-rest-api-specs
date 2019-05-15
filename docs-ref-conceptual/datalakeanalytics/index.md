---
ms.assetid: 768deb64-ecdd-40ec-9a9f-0560144a0d81
ms.title: Azure Data Lake Analytics REST API Reference
ms.service: data-lake-analytics
author: jasonwhowell
ms.author: jasonh
ms.date: 08/09/2018
---

# Azure Data Lake Analytics REST API

Use the Azure Data Lake Analytics REST APIs to create and manage Data Lake Analytics resources through Azure Resource Manager. All task operations conform to the HTTP/1.1 protocol specification and most operations return an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure, using `https`. For more information on making secure requests, see [Acquire an access token](/rest/api/azure/#acquire-an-access-token).

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Accounts](xref:management.azure.com.datalakeanalytics.accounts)| Provides operations to create and manage Data Lake Analytics accounts. |
|[Catalog](xref:datalakeanalytics.catalog) | Provides operations to explore the U-SQL catalog of a Data Lake Analytics account. |
|[Compute Policies](xref:management.azure.com.datalakeanalytics.computepolicies) | Provides operations to create and manage the compute policies of a Data Lake Analytics account. |
|[Data Lake Store Accounts](xref:management.azure.com.datalakeanalytics.datalakestoreaccounts) | Provides operations to manage the list of Data Lake Store accounts associated with a Data Lake Analytics account. |
|[Firewall Rules](xref:management.azure.com.datalakeanalytics.firewallrules) | Provides operations to create and manage firewall rules for a Data Lake Analytics account. |
|[Job](xref:datalakeanalytics.job) | Provides operations to submit and manage jobs in a Data Lake Analytics account. |
|[Locations](xref:management.azure.com.datalakeanalytics.locations) | Provides an operation to explore the Data Lake Analytics capabilities and limits available to your subscription. |
|[Operations](xref:management.azure.com.datalakeanalytics.operations) | Provides an operation to list the available operations of the Data Lake Analytics resource provider. |
|[Pipeline](xref:datalakeanalytics.pipeline) | Provides operations to explore the pipelines associated with the jobs submitted to a Data Lake Analytics account. |
|[Recurrence](xref:datalakeanalytics.recurrence) | Provides operations to explore the recurrences associated with the jobs submitted to a Data Lake Analytics account. |
|[Storage Accounts](xref:management.azure.com.datalakeanalytics.storageaccounts) | Provides operations to manage the list of Azure Storage accounts associated with a Data Lake Analytics account. |

## Common parameters and headers

The following information is common to all tasks that you might do related to Data Lake Analytics:

* Replace `{api-version}` with **2016-11-01**.
* Replace `{subscription-id}` in the URI with your Azure subscription identifier.
* Replace `{resource-group-name}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).
Replace `{account-name}` in the URI with your Data Lake Analytics account name.
* Set the **Content-Type** header to **application/json**.
* Set the **Authorization** header to a JSON Web Token that you obtain from Azure Active Directory. For job, pipeline, recurrence, and catalog operations, be sure to obtain a token for the resource URI / audience claim “https://datalake.azure.net/”, NOT “https://management.core.windows.net/” nor “https://management.azure.com/”. For more information, see [Acquire an access token](/rest/api/azure/#acquire-an-access-token).

## See also

- [Azure Data Lake Analytics](https://azure.microsoft.com/services/data-lake-analytics/)
