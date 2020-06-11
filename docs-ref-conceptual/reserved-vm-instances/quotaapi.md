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

Azure quota REST API is in public preview. 
* Review the [reference](xref:management.azure.com.reserved-vm-instances.quota) documentation for quota API details.
* Review the [reference](xref:management.azure.com.reserved-vm-instances.quotarequeststatus) documentation for quota requests API details.


## Support in other languages and interfaces

Apart from support in [REST API](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/support/resource-manager/Microsoft.Support/stable/2020-04-01), support ticket creation and management is available in the following interfaces and languages:  

* PowerShell: [Support](https://github.com/Azure/azure-powershell/blob/master/src/Support/Support/help/Az.Support.md) | [Documentation](https://docs.microsoft.com/powershell/module/az.support/)
* Azure CLI:  [Support](https://github.com/Azure/azure-cli-extensions/tree/master/src/support) | [Documentation](https://docs.microsoft.com/cli/azure/ext/support/?view=azure-cli-latest) 
* Azure SDK for Java: [Support](https://search.maven.org/artifact/com.microsoft.azure.support.v2020_04_01/azure-mgmt-support/1.0.0/jar) | [Documentation](https://docs.microsoft.com/java/api/overview/azure/supportability/management?view=azure-java-stable)
* Azure SDK for .NET: [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Support/1.0.1) | [Documentation](https://docs.microsoft.com/dotnet/api/overview/azure/supportability?view=azure-dotnet)
* Azure SDK for Python: [Support](https://pypi.org/project/azure-mgmt-support/) | [Documentation](https://docs.microsoft.com/python/api/overview/azure/support)
* Azure SDK for JavaScript: [Support](https://www.npmjs.com/package/@azure/arm-support/v/1.0.0) | [Documentation](https://review.docs.microsoft.com/javascript/api/@azure/arm-support/?view=azure-node-latest&branch=updateMapping0330)
* Azure SDK for Go: [Support](https://github.com/Azure/azure-sdk-for-go/tree/master/services/support/mgmt/2020-04-01/support)
* Ruby: [Support](https://rubygems.org/gems/azure_mgmt_support/versions/0.17.0)


## See also

* [How to create a support ticket via Azure portal](https://docs.microsoft.com/azure/azure-portal/supportability/how-to-create-azure-support-request)
* [Azure severity and levels](https://azure.microsoft.com/support/plans/response/)
* [Azure Support FAQs](https://azure.microsoft.com/support/faq/)