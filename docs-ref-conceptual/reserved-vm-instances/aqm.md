---
title: Azure Automated Quota Management REST API Reference
description: API reference documentation for the operations available in the Azure Automated Quota Management REST API, a RESTful web service for managing Azure Automated Quota Management resources in Azure.
author: onkarb
ms.author: v-jutao
ms.date: 05/27/2020
ms.topic: reference
ms.service: api-management
ms.devlang: rest-api
---

# Azure Automated Quota Management REST API (Preview)

Automated Quota Management allows Azure to automatically adjust the [service limits (quota)](/azure/azure-resource-manager/management/azure-subscription-service-limits) for enrolled subscriptions based on customer resource usage.

The Azure Automated Quota Management REST API allows to enroll for automatic management of [service limits (quota)](/azure/azure-resource-manager/management/azure-subscription-service-limits) for the resources programmatically. 

After subscription is enabled, Azure will manage [service limits (quota)](/azure/azure-resource-manager/management/azure-subscription-service-limits) for your resources.

> [!IMPORTANT]
> The APIs currently support Azure Virtual Machines (cores/vCPU) service limits (quota).

Using the API, you can:
* Enable or disable automatic management of service limits (quota) for supported resources.
* Update notification preferences for automatic management of service limits (quota).
* Get the enrollment status and notification preferences for automatic management of service limits (quota).


## Private Preview

Automated Quota Management API is in **private preview**. Review the [reference](xref:management.azure.com.reserved-vm-instances.quota)  documentation for API details.

> [!IMPORTANT]
> Automated quota management is in limited preview with select partners and customers through **invitation** only.


## Support in other languages and interfaces

Apart from support in [REST API](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/reservations/resource-manager/Microsoft.Capacity/preview/2019-07-19), quota management is available in the following interfaces and languages:  

* Azure SDK for .NET: [NuGet package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-net/Azure/azure-sdk-for-net/Microsoft.Azure.Management.Reservations/Microsoft.Azure.Management.Reservations.1.13.0-preview.nupkg)
* Azure SDK for Python: [Py package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-python/Azure/azure-sdk-for-python/azure-mgmt-reservations/azure-mgmt-reservations-0.7.0.zip)
* Azure SDK for js: [js package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-js/Azure/azure-sdk-for-js/@azure/arm-reservations/azure-arm-reservations-5.0.0.tgz)
* Azure SDK for Go: [Go package](https://sdkautomation.blob.core.windows.net/sdkautomation-pipeline/Azure/azure-rest-api-specs/9724/azure-sdk-for-go/Azure/azure-sdk-for-go/preview/reservations/mgmt/2019-07-19-preview/preview.reservations.mgmt.2019-07-19-preview.zip)


## See also

* [How to create a support ticket via Azure portal](/azure/azure-portal/supportability/how-to-create-azure-support-request)
* [Azure severity and levels](https://azure.microsoft.com/support/plans/response/)
* [Azure Support FAQs](https://azure.microsoft.com/support/faq/)