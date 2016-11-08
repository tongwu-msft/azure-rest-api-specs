---
ms.assetid: 062e3d6c-f110-418c-978a-0b54df289ddd
ms.title: Machine Learning API Web Service
ms.prod:
ms.service: machine-learning
author: vDonGlover
ms.author: garye
ms.manager: jhubbard
---

# Azure Machine Learning Web Services

Microsoft Azure Machine Learning enables you to build and test a predictive analytics solution, and then deploy it as an Azure web service. For more information, see [Publish an Azure Machine Learning web service](https://review.docs.microsoft.com/azure/machine-learning/machine-learning-deploy-consume-web-service-guide).

The Azure Machine Learning Web Service REST APIs enable you to create and manage Azure Resource Manager based web services and commitment plans.

<!--
For information common to all these APIs, see [Common parameters and headers](common-parameters-headers.md)
-->

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|  [Commitment Associations](./commitmentassociations) | Provides operations that allow you to manage commitment associations. |
|  [Commitment Plans](./commitmentplans) | Provides operations that allow you to create and manage commitment plans. |
|  [Usage History](./usagehistory) | Provides an operation that allow you to retrieve commitment plan usage history. |
|  [Web Services](./webservices) | Provides operations that allow you to create and manage web services. |

## Common parameters and headers

The following information is common to all tasks related to web services:

- Replace {api-version} with **2016-05-01-preview**.
- Replace {subscription-id} with your subscription identifier in the URI.
- Replace {resource-group-name} with the resource group name.
- Set the Content-Type header to **application/json**.
- Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory.
  For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).

## Web services tasks
You can do the following tasks with the REST APIs for Machine Learning web services:

- [Create or update a web Service](./webservices#WebServices_CreateOrUpdate)
- [Get information about a web service](./webservices#WebServices_Get)
- [Get access keys for a web service](./webservices#WebServices_ListKeys)
- [Modify a web service](./webservices#WebServices_Patch)
- [Delete a web service](./webservices#WebServices_Remove)
- [Get all web services in a resource group](./webservices#WebServices_ListInResourceGroup)
- [Get all web services in a subscription](./webservices#WebServices_List)

## Commitment plan tasks
You can do the following tasks with the REST APIs for Azure Machine Learning commitment plans:

Commitment plans
- [Create or update a commitment plan](./commitmentplans#CommitmentPlans_CreateOrUpdate)
- [Get information about a commitment plan](./commitmentplans#CommitmentPlans_Get)
- [Modify a commitment plan](./commitmentplans#CommitmentPlans_Patch)
- [Delete a commitment plan](./commitmentplans#CommitmentPlans_Remove)
- [Get the usage history of a commitment plan](./machinelearning/usagehistory#UsageHistory_List)
- [Get all commitment plans in a resource group](./commitmentplans#CommitmentPlans_ListInResourceGroup)
- [Get all commitment plans in a subscription](./commitmentplans#CommitmentPlans_List)

Commitment associations
- [Get a commitment association](./commitmentassociations#CommitmentAssociations_List)
- [Change the parent of a commitment association](./commitmentassociations#CommitmentAssociations_Move)
- [Get all commitment associations for a parent plan](./commitmentassociations#CommitmentAssociations_Get)


## See Also

- [Manage a web service using PowerShell cmdlets](../../../powershell/resourcemanager/azurerm.machinelearning/v0.11.0/azurerm.machinelearning)
- [Manage a web service using the Azure Machine Learning Web Services portal](https://review.docs.microsoft.com/azure/machine-learning/machine-learning-manage-new-webservice)
- [Overview of deploying and consuming Azure Machine Learning web services](https://review.docs.microsoft.com/azure/machine-learning/machine-learning-deploy-consume-web-service-guide)
