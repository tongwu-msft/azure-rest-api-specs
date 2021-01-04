---
title: Azure Quota REST API Reference
author: v-piacke
ms.author: dtula
ms.date: 12/16/2020
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api
---

# Azure Quota API

The Quota API is a REST API that you can use to programmatically view and manage your quotas for Azure services. 

> [!IMPORTANT]
> **Quota API general availability**
>
> Quota API is now generally available. It currently supports only Azure virtual machines (cores/vCPU) and Azure Machine Learning services.

Quotas are the maximum values for resources, action, and items in your Azure subscription. Each Azure service defines its quotas and determines its default values. Depending on your business needs, you might need to increase your quota values. 

For more information on the most common Microsoft Azure limits, see [Azure subscription and service limits, quotas, and constraints](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits).

## Using Quota API

With Quota API you can:

- Get the current quotas and usages of a resource.
- Get a list of current quotas and usages of all the resources.
- Create or update quotas of a resource.
- Get the status of quota requests for a resource.
- Get the list of all quota requests of a resource for one year.

### REST operations

Quota API makes it easy to look up your quotas and request increases using these REST operations:

* For the quota management REST operations details, see  [Quota API reference](xref:management.azure.com.reserved-vm-instances.quota).

* For the quota request status REST operations details, see [Quota request status API reference](xref:management.azure.com.reserved-vm-instances.quotarequeststatus).


### Prerequisite

> [!IMPORTANT]
> In order to use Quota API, the Microsoft.Capacity resource provider needs to be registered for your subscriptions.

Most providers are registered automatically by the Azure portal or the command-line interface you are using, but not all. If you have not used the Microsoft.Capacity provider before, you need to register it. Follow the guidance in the [Resolve errors for resource provider registration](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/error-register-resource-provider) article to register the Microsoft.Capacity resource provider with PowerShell, Azure CLI, or the [Azure portal](https://portal.azure.com/). 

### vCPU quotas

You can use Quota API to programmatically manage quotas for the two types of vCPU quotas for virtual machines (VMs) that Azure Resource Manager supports:

- *Standard vCPU quota* which are used for *Pay-as-you-go* VMs and *reserved* VM instances.
- *Spot vCPU quota* for *Spot* VMs.

To learn more about Azure limits and quotas, see [Azure subscription and service limits, quotas, and constraints](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits?toc=/azure/billing/TOC.json).

### Azure Machine Learning quotas

You can use Quota API to manage quotas for Azure Machine Learning workspaces and compute. Read the [Manage and increase quotas for resources with Azure Machine Learning](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-manage-quotas) article to learn about:

- Default limits on Azure resources related to [Azure Machine Learning](https://docs.microsoft.com/en-us/azure/machine-learning/overview-what-is-azure-ml).
- Creating workspace-level quotas.
- Viewing your quotas and limits.
- Requesting quota increases.
- Private endpoint and DNS quotas.

### Regions

Most quotas are specific for a workload in any one region. You need to request quotas in each region where you want to deploy.  To list all Azure regions in which the service exists, use the [List By Service](https://docs.microsoft.com/rest/api/apimanagement/2019-12-01/region/listbyservice) Regions operation.


### Throttling

Every subscription-level and tenant-level API calls are subject to throttling protection. If you send too many API requests, you will get an error message stating that the server rejected the API request. You will have the ability to retry after some time has elapsed.

For details on API throttling, how to troubleshoot throttling issues, and best practices to avoid being throttled, see [Troubleshooting throttling errors in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/troubleshooting/troubleshooting-throttling-errors).

## Troubleshooting Quota API errors

Use the following tables to troubleshoot errors you might encounter while using Quota API.

| **Error code**                      | How to solve it                                              |
| ----------------------------------- | ------------------------------------------------------------ |
| MissingRegistration                 | You need to register the Microsoft.Capacity resource provider for each of your subscriptions. For troubleshooting guidance, see [Resolve errors for resource provider registration](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/error-register-resource-provider). |
| ResourceNotAvailableForSubscription | The resource is currently  unavailable in the location for the requested subscription.  Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](https://docs.microsoft.com/en-us/rest/api/support). |
| ResourceNotAvailableForOffer        | The resource is currently unavailable in the location for the offer type. For The the list all of current and retired offers, see the [Microsoft Azure Offer Details](https://azure.microsoft.com/en-us/support/legal/offer-details) page. To change your offer type, see the [Change your Azure subscription to a different offer](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/switch-azure-offer) page. You can also open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](https://docs.microsoft.com/en-us/rest/api/support). |
| QuotaReductionNotSupported          | The current quota limit is higher than the requested quota or the current usage is higher than the requested quota. Reduction in quota is not supported. Unable to reduce the quota. |
| QuotaNotAvailableForResource        | Quota is currently unavailable in the location for the requested resource. Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](https://docs.microsoft.com/en-us/rest/api/support). |
| UnableToIncreaseQuota               | Unable to increase quotas for the requested subscriptions. Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. |
| RequestThrottled                    | Every subscription-level and tenant-level API requests may be throttled to help with the overall performance of the service. The number of requests exceeded the maximum allowed API request rate. Please try again later. |
| InternalServerError                 | Internal server error. Retry the API call later.             |


## Support in other languages and interfaces

For more information about using the Quota REST API in one of the language-specific Microsoft Azure SDKs, see the following:

* Microsoft Azure SDK for .NET: [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Reservations/1.14.0-preview)
* Microsoft Azure SDK for Python: [Py package](https://pypi.org/project/azure-mgmt-reservations/0.8.0/)
* Microsoft Azure SDK for JavaScript (NodeJS & Browser): [js package](https://www.npmjs.com/package/@azure/arm-reservations/v/5.1.0)
* Microsoft Azure SDK for Go: [Go package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-go/Azure/azure-sdk-for-go/preview/reservations/mgmt/2019-07-19-preview/preview.reservations.mgmt.2019-07-19-preview.zip)

## Using Azure portal and Support API to manage quotas

Azure enables you to create and manage support requests, also known as support tickets. Follow the guidance on the [How to create a support ticket via Azure portal](https://docs.microsoft.com/azure/azure-portal/supportability/how-to-create-azure-support-request) article to create and manage requests in the [Azure portal](https://portal.azure.com/) or programmatically using the [Azure support ticket REST API](https://docs.microsoft.com/en-us/rest/api/support).





