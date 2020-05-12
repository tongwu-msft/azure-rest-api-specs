---
ms.assetid: c4cf3464-48b4-43ec-96d9-b5d9b6e068b6
title: Azure Support ticket REST API Reference
ms.service: Support
author: gangan
ms.author: gangan
ms.date: 02/10/2020
ms.manager: ddove
service_description: Create and manage Azure support tickets programmatically
---

# Azure Support REST API Reference

The Azure Support REST API enables you to create and manage Azure support tickets programmatically. 

Using the API, you can: 
* Open a technical, billing, subscription management, or subscription and service limits (quota) support ticket. 
* Get a list of support tickets and detailed information about each ticket. Narrow your search for support tickets by status or created date. 
* Update severity, ticket status, and contact information for a support ticket.
* Add a new communication to a support ticket or get a list of all communications for a support ticket. Narrow your search of communication lists by created date or communication type. 

## Prerequisites

Prerequisites depend on the API operations you want to call:

* To create and update support tickets, and add communication operations, you need: 
	* An Azure subscription ID.
	* A Professional Direct, Premier, or Unified technical support plan. For more information, see [Compare support plans](https://azure.microsoft.com/support/plans/).
	* Member of the [Support Request Contributor role](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#support-request-contributor) at the subscription scope.

*	To list support tickets, and to list communication operations, you need:  
	* An Azure subscription ID 
	* Member of the [Reader role](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#reader) at the subscription scope.

## REST Operation Groups

Operation Group | Description
--------------- | -----------
[Operations](../../docs-ref-autogen/support/Operations.yml) | List all the available Azure Support REST API operations.
[Services](../../docs-ref-autogen/support/Services.yml) | List the Azure products for which you can open a support ticket. Service ID is required for creating a support ticket. 
[Problem Classifications](../../docs-ref-autogen/support/ProblemClassifications.yml) | List the problem classifications for the specified Azure service. Both service and problem classification Ids are required for support ticket creation. 
[Support Tickets](../../docs-ref-autogen/support/SupportTickets.yml) | Create, update, or list the support tickets for the selected subscription. Supported ticket types include `Technical`, `Billing`, `Subscription management`, and `Service and subscription limits (quotas)`. [Learn more](quota-payload.md) about how to request quota for certain quota types, like the Compute payload, using the Support APIs.
[Communications](../../docs-ref-autogen/support/Communications.yml) | Add or list the communications associated with a support ticket. 

## Support in other languages and interfaces

Apart from support in [REST API](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/support/resource-manager/Microsoft.Support/stable/2020-04-01), support ticket creation and management is available in the following interfaces and languages:  

* Powershell [Support](https://github.com/Azure/azure-powershell/blob/master/src/Support/Support/help/Az.Support.md) and [documentation](https://docs.microsoft.com/en-us/powershell/module/az.support/)
* Azure CLI  [Support](https://github.com/Azure/azure-cli-extensions/tree/master/src/support) and [documentation](https://docs.microsoft.com/cli/azure/ext/support/?view=azure-cli-latest) 
* Azure SDK for Java [Support](https://search.maven.org/artifact/com.microsoft.azure.support.v2020_04_01/azure-mgmt-support/1.0.0/jar) and [documentation](https://docs.microsoft.com/en-us/java/api/overview/azure/supportability/management?view=azure-java-stable)
* Azure SDK for .NET [Nuget package](https://www.nuget.org/packages/Microsoft.Azure.Management.Support/1.0.1) and [documentation](https://docs.microsoft.com/dotnet/api/overview/azure/supportability?view=azure-dotnet)
* Azure SDK for Python [Support](https://pypi.org/project/azure-mgmt-support/) and [documentation](https://docs.microsoft.com/python/api/overview/azure/support)
* Azure SDK for JavaScript [Support](https://www.npmjs.com/package/@azure/arm-support/v/1.0.0) and [documentation](https://review.docs.microsoft.com/en-us/javascript/api/@azure/arm-support/?view=azure-node-latest&branch=updateMapping0330)
* Azure SDK for Go [Support](https://github.com/Azure/azure-sdk-for-go/tree/master/services/support/mgmt/2020-04-01/support)
* Ruby [Support](https://rubygems.org/gems/azure_mgmt_support/versions/0.17.0)


## See also

* [How to create a support ticket via Azure portal](https://docs.microsoft.com/azure/azure-portal/supportability/how-to-create-azure-support-request)
* [Azure severity and levels](https://azure.microsoft.com/support/plans/response/)
* [Azure Support FAQs](https://azure.microsoft.com/support/faq/)
