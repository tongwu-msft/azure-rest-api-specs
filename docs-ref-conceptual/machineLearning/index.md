---
ms.assetid: 
ms.title: Machine Learning API Web Service
ms.prod:
ms.service: machine-learning
author: vDonGlover
ms.author: garye
ms.manager: jhubbard
---

# Azure Machine Learning Management REST APIs

<!--
Microsoft Azure Machine Learning enables you to build and test a predictive analytics solution, and then deploy it as an Azure web service. 
For an overview of the process, see [Azure Machine Learning Web Services: Deployment and consumption](/azure/machine-learning/machine-learning-deploy-consume-web-service-guide).

The following Microsoft Azure Machine Learning REST APIs enable you to create and manage Azure Resource Manager based web services, as well as Machine Learning commitment plans and associations.
-->

The following Azure Machine Learning REST APIs enable you to create and manage:

- **Machine Learning commitment plans and associations**

- **Azure Resource Manager based web services** - Azure Machine Learning enables you to build and test a predictive analytics solution, and then deploy it as an Azure web service. 
For an overview of the process, see [Azure Machine Learning Web Services: Deployment and consumption](/azure/machine-learning/machine-learning-deploy-consume-web-service-guide).


<!--
For information common to all these APIs, see [Common parameters and headers](common-parameters-headers.md)
-->

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|  [Commitment Associations](~/docs-ref-autogen/machinelearning/commitmentassociations.json) | Provides operations that allow you to manage commitment associations. |
|  [Commitment Plans](~/docs-ref-autogen/machinelearning/commitmentplans.json) | Provides operations that allow you to create and manage commitment plans. |
|  [Commitment Plans Usage History](~/docs-ref-autogen/machinelearning/usagehistory.json) | Provides an operation that allow you to retrieve commitment plan usage history. |
|  [Web Services](~/docs-ref-autogen/machinelearning/webservices.json) | Provides operations that allow you to create and manage web services. |

## Common parameters and headers

The following information is common to tasks related to these APIs:

- The host URI for Machine Learning REST APIs is **https://management.azure.com/**
- Replace {subscription-id} with your subscription identifier in the URI
- Replace {resource-group-name} with the resource group name
- Set the Content-Type header to **application/json**
- Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory - 
  for more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx)

## Commitment plan tasks
You can do the following tasks with the REST APIs for Azure Machine Learning commitment plans:

### Commitment associations
- [Get a commitment association](~/docs-ref-autogen/machinelearning/commitmentassociations.json#CommitmentAssociations_Get)
- [Change the parent of a commitment association](~/docs-ref-autogen/machinelearning/commitmentassociations.json#CommitmentAssociations_Move)
- [Get all commitment associations for a parent plan](~/docs-ref-autogen/machinelearning/commitmentassociations.json#CommitmentAssociations_List)

### Commitment plans
- [Create or update a commitment plan](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_CreateOrUpdate)
- [Get information about a commitment plan](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_Get)
- [Modify a commitment plan](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_Patch)
- [Delete a commitment plan](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_Remove)
- [Get all commitment plans in a resource group](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_ListInResourceGroup)
- [Get all commitment plans in a subscription](~/docs-ref-autogen/machinelearning/commitmentplans.json#CommitmentPlans_List)

### Commitment plans usage history
- [Get the usage history of a commitment plan](~/docs-ref-autogen/machinelearning/usagehistory.json)

## Web services tasks
You can do the following tasks with the REST APIs for Azure Machine Learning web services:

- [Create or update a web Service](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_CreateOrUpdate)
- [Get information about a web service](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_Get)
- [Get access keys for a web service](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_ListKeys)
- [Modify a web service](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_Patch)
- [Delete a web service](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_Remove)
- [Get all web services in a resource group](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_ListByResourceGroup)
- [Get all web services in a subscription](~/docs-ref-autogen/machinelearning/webservices.json#WebServices_List)


## See Also

- [Manage a web service using PowerShell cmdlets](/powershell/resourcemanager/azurerm.machinelearning/v0.11.0/azurerm.machinelearning)
- [Manage a web service using the Azure Machine Learning Web Services portal](/azure/machine-learning/machine-learning-manage-new-webservice)
- [Overview of deploying and consuming Azure Machine Learning web services](/azure/machine-learning/machine-learning-deploy-consume-web-service-guide)
