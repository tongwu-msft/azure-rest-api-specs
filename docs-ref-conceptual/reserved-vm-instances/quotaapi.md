---
title: Azure Quota REST API Reference
description: Quota API REST operations reference for viewing and managing quotas
author: pilara-ms
ms.author: dtula
ms.date: 12/16/2020
ms.topic: reference
ms.service: azure
ms.devlang: rest-api
---

# Azure Quota API

The Quota API is a REST API that you can use to view and manage quotas for Azure services. 

> [!IMPORTANT]
> **Quota API general availability**
>
> Quota API is now generally available. It currently supports only Azure virtual machines (cores/vCPU) and Azure Machine Learning services.

Quotas are the maximum values for resources, action, and items in your Azure subscription. Each Azure service defines its quotas and determines its default values. Depending on your business needs, you might need to increase your quota values. 

For more information on the most common Microsoft Azure limits, see [Azure subscription and service limits, quotas, and constraints](/azure/azure-resource-manager/management/azure-subscription-service-limits).

## Using Quota API

With Quota API you can:

- Get the current quotas and usages of a resource.
- Get a list of current quotas and usages of all the resources.
- Create or update quotas of a resource.
- Get the status of quota requests for a resource.
- Get the list of all quota requests of a resource for one year.

### REST operations

Quota API makes it easy to look up your quotas and request increases using these REST operations:

* For the quota management REST operations details, see [Quota API reference](xref:management.azure.com.reserved-vm-instances.quota).
* For the quota request status REST operations details, see [Quota request status API reference](xref:management.azure.com.reserved-vm-instances.quotarequeststatus).


### Prerequisites

> [!IMPORTANT]
> Before you can use Quota API, you must:
> * [Register the Microsoft Capacity (Microsoft.Capacity) resource provider for all your subscriptions using PowerShell](#registering-the-microsoft-capacity-resource-provider).
> * [Assign the Quota Request Operator role](#quota-request-operator-role) to all user accounts and applications that will perform quota operations. 

### Registering the Microsoft Capacity resource provider

To register the Microsoft Capacity resource provider, use this PowerShell command:

```azurepowershell-interactive
Register-AzResourceProvider -ProviderNamespace Microsoft.Capacity
```

It returns results similar to this output:

```output
ProviderNamespace : Microsoft.Capacity
RegistrationState : Registering
ResourceTypes     : {resources, reservationOrders, reservationOrders/reservations, listbenefits...}
Locations         : {West Europe, East US, South Central US...}
```

Once the Microsoft.Capacity resource provider is registered, the `RegistrationState` will be set to `Registered`. For more information on managing Azure resource providers, see [Azure resource providers](/azure/azure-resource-manager/management/resource-providers-and-types).

### Quota Request Operator role

The [Quota Request Operator role](/azure/role-based-access-control/built-in-roles#quota-request-operator-role) is an Azure built-in role customized for quota operations. It grants permissions to read and create quota requests, get quota request status, and create support tickets.	Assign this role to users, groups, service principals, managed identities, and applications that do quota operations. For reference, the Quota Request Operator role ID is 0e5f05e5-9ab9-446b-b98d-1e2157c94125.

### vCPU quotas

You can use Quota API to manage quotas for these two types of vCPU quotas:

- *Standard vCPU quota* for *Pay-as-you-go* VMs and *reserved* VM instances.
- *Spot vCPU quota* for *Spot* VMs.

To learn more about Azure limits and quotas, see [Azure subscription and service limits, quotas, and constraints](/azure/azure-resource-manager/management/azure-subscription-service-limits?toc=/azure/billing/TOC.json).

### Azure Machine Learning quotas

You can use Quota API to manage quotas for Azure Machine Learning workspaces and compute. Read the [Manage and increase quotas for resources with Azure Machine Learning](/azure/machine-learning/how-to-manage-quotas) article to learn about:

- Default limits on Azure resources related to [Azure Machine Learning](/azure/machine-learning/overview-what-is-azure-ml).
- Creating workspace-level quotas.
- Viewing your quotas and limits.
- Requesting quota increases.
- Private endpoint and DNS quotas.

### Regions

Most quotas are specific for a workload in any one region. Request separate quotas for each region where you want to deploy a service.  To list all Azure regions in which the service exists, use the [List By Service](/rest/api/apimanagement/current-ga/region/list-by-service) Regions operation.


### Throttling

Every subscription-level and tenant-level API calls can be throttled if you send too many API requests. If your API call is throttled, you'll get an error message stating that the server rejected the API request. You can retry the API call after some time has elapsed.

For details on API throttling, how to troubleshoot throttling issues, and how to avoid being throttled, see [Troubleshooting throttling errors in Azure](/azure/virtual-machines/troubleshooting/troubleshooting-throttling-errors).

## Troubleshooting Quota API errors

Use the following tables to troubleshoot errors you might get while using Quota API.

| **Error code**                      | How to solve it                                              |
| ----------------------------------- | ------------------------------------------------------------ |
| ContactSupport                 |  Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically using the [Azure Support REST API](/rest/api/support). |
| InternalServerError                 | Internal server error. Retry the API call later.             |
| MissingRegistration                 | Register the Microsoft.Capacity resource provider for each of your subscriptions. For troubleshooting guidance, see [Resolve errors for resource provider registration](/azure/azure-resource-manager/templates/error-register-resource-provider). |
| QuotaNotAvailableForResource        | Quota is currently unavailable in the location for the requested resource. Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](/rest/api/support). |
| QuotaReductionNotSupported          | The current quota limit is higher than the requested quota or the current usage is higher than the requested quota. Reducing quotas is not supported. The quota cannot be reduced. |
| RequestThrottled                    | Every subscription-level and tenant-level API requests may be throttled to help with the overall performance of the service. The number of requests exceeded the maximum allowed API request rate. Try again later. |
| ResourceNotAvailableForOffer        | The resource is currently unavailable in the location for the offer type. For the list of current and retired offers, see the [Microsoft Azure Offer Details](https://azure.microsoft.com/support/legal/offer-details) page. To change your offer type, see the [Change your Azure subscription to a different offer](/azure/cost-management-billing/manage/switch-azure-offer) page. You can also open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](/rest/api/support). |
| ResourceNotAvailableForSubscription | The resource is currently  unavailable in the location for the requested subscription.  Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. You can also open it programmatically  using the [Azure Support REST API](/rest/api/support). |
| UnableToIncreaseQuota               | Unable to increase quotas for the requested subscriptions. Open a [new support request](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) in the Azure portal. Under **Select an issue type**, choose **Service and subscription limits (quotas)**. |


## Support in other languages and interfaces

The Quota REST API is available in the following language-specific Microsoft Azure SDKs:

* Microsoft Azure SDK for .NET: [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Reservations/1.15.0-preview)
* Microsoft Azure SDK for Python: [Py package](https://pypi.org/project/azure-mgmt-reservations/0.9.0/)
* Microsoft Azure SDK for JavaScript (NodeJS & Browser): [js package](https://www.npmjs.com/package/@azure/arm-reservations/v/6.0.0)
* Microsoft Azure SDK for Go: [Go package](https://github.com/Azure/azure-sdk-for-go/releases/tag/v50.2.0)

## Using Azure portal and Support API to manage quotas

Azure enables you to create and manage support requests, also known as support tickets. You can:

* [Create a support ticket using the Azure portal](/azure/azure-portal/supportability/how-to-create-azure-support-request). 
* [Create a support ticket programatically using the Azure support ticket REST API](/rest/api/support).




