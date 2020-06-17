---
title: Azure Quota REST API Reference
author: onkarb
ms.author: onkarb
ms.date: 05/27/2020
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api
---

# Azure Quota REST API (Preview)

The Azure Quota REST API allows to query and manage [service limits (quota)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits) for the resources programmatically. 

> [!IMPORTANT]
> The APIs currently support Azure Virtual Machines (cores/vCPU) and Azure Machine Learning.

Using the API, you can:
* Get the current service limits (quota) and usages of a resource.
* Get a list of current service limits (quota) and usages of all the resources.
* Update service limits (quota) of a resource.
* Get the status of quota requests for a resource.
* Get the list of all quota requests of a resource for one year. 

> [!TIP]
> Most service limits (quota) are specific to a [region](https://docs.microsoft.com/rest/api/apimanagement/2019-12-01/region/listbyservice), ensure to submit a request for each region you plan to use.

> [!NOTE]
> You can also request additional quota by opening a support ticket of type "Service and Subscription limits (quota)" in the Azure portal or programmatically using the [Azure Support REST API](https://docs.microsoft.com/en-us/rest/api/support/).


## Public Preview

Azure quota REST API is in **public preview**. 
* Review the [reference](xref:management.azure.com.reserved-vm-instances.quota) documentation for quota API details.
* Review the [reference](xref:management.azure.com.reserved-vm-instances.quotarequeststatus) documentation for quota requests API details.

> [!NOTE]
> Azure Quota REST API has been created with enrollment Type of AutoApprove. Use the following mechanisms to request a feature registration for the subscription: Use **QuotaAPI** as FeatureName, **Microsoft.Capacity** as ProviderNamespace  
> * [Register-AzProviderFeature](https://docs.microsoft.com/en-us/powershell/module/az.resources/register-azproviderfeature) PowerShell command. Use  **Register-AzProviderFeature -FeatureName QuotaAPI -ProviderNamespace Microsoft.Capacity** command to register.
> * [az feature register](https://docs.microsoft.com/en-us/cli/azure/feature?view=azure-cli-latest#az-feature-register) Azure CLI command. Use **az feature register --name QuotaAPI --namespace Microsoft.Capacity** command to register.
> * [ARM feature register API](https://docs.microsoft.com/en-us/rest/api/resources/features/register) using a REST client of the choice.


## Support in other languages and interfaces

Apart from support in [REST API](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/reservations/resource-manager/Microsoft.Capacity/preview/2019-07-19), quota management is available in the following interfaces and languages:  

* Azure SDK for .NET: [NuGet package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-net/Azure/azure-sdk-for-net/Microsoft.Azure.Management.Reservations/Microsoft.Azure.Management.Reservations.1.13.0-preview.nupkg)
* Azure SDK for Python: [Py package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-python/Azure/azure-sdk-for-python/azure-mgmt-reservations/azure-mgmt-reservations-0.7.0.zip)
* Azure SDK for js: [js package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-js/Azure/azure-sdk-for-js/@azure/arm-reservations/azure-arm-reservations-5.0.0.tgz)
* Azure SDK for Go: [Go package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-go/Azure/azure-sdk-for-go/preview/reservations/mgmt/2019-07-19-preview/preview.reservations.mgmt.2019-07-19-preview.zip)


## See also

* [How to create a support ticket via Azure portal](https://docs.microsoft.com/azure/azure-portal/supportability/how-to-create-azure-support-request)
* [Azure severity and levels](https://azure.microsoft.com/support/plans/response/)
* [Azure Support FAQs](https://azure.microsoft.com/support/faq/)