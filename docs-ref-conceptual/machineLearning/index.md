---
ms.assetid: 
ms.title: Machine Learning Studio API Web Service
ms.prod: 
ms.service: machine-learning
author: garyericson
ms.author: garye
ms.manager: jhubbard
service_description: To be added
---

# Azure Machine Learning Studio Management REST APIs

The following Azure Machine Learning Studio REST APIs enable you to create and manage:

- **Machine Learning Studio commitment plans and associations**

- **Azure Resource Manager based web services** - Azure Machine Learning Studio enables you to build and test a predictive analytics solution, and then deploy it as an Azure web service. 
For an overview of the process, see [Azure Machine Learning Studio Web Services: Deployment and consumption](/azure/machine-learning/studio/deploy-consume-web-service-guide).


## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|  [Commitment Associations](~/docs-ref-autogen/machinelearning/commitmentassociations.json) | Provides operations that allow you to manage commitment associations. |
|  [Commitment Plans](~/docs-ref-autogen/machinelearning/commitmentplans.json) | Provides operations that allow you to create and manage commitment plans. |
|  [Commitment Plans Usage History](~/docs-ref-autogen/machinelearning/usagehistory.json) | Provides an operation that allow you to retrieve commitment plan usage history. |
|  [Web Services](~/docs-ref-autogen/machinelearning/webservices.json) | Provides operations that allow you to create and manage web services. |

## Common parameters and headers

The following information is common to tasks related to these APIs:

- The host URI for Machine Learning Studio REST APIs is **https://management.azure.com/**
- Replace {subscription-id} with your subscription identifier in the URI
- Replace {resource-group-name} with the resource group name
- Set the Content-Type header to **application/json**
- Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory - 
  for more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx)

## Commitment plan tasks
You can do the following tasks with the REST APIs for Azure Machine Learning Studio commitment plans:

### Commitment associations
- [Get a commitment association](/rest/api/machinelearning/CommitmentAssociations/Get)
- [Change the parent of a commitment association](/rest/api/machinelearning/CommitmentAssociations/Move)
- [Get all commitment associations for a parent plan](/rest/api/machinelearning/CommitmentAssociations/List)

### Commitment plans
- [Create or update a commitment plan](/rest/api/machinelearning/CommitmentPlans/CreateOrUpdate)
- [Get information about a commitment plan](/rest/api/machinelearning/CommitmentPlans/Get)
- [Modify a commitment plan](/rest/api/machinelearning/CommitmentPlans/Patch)
- [Delete a commitment plan](/rest/api/machinelearning/CommitmentPlans/Remove)
- [Get all commitment plans in a resource group](/rest/api/machinelearning/CommitmentPlans/ListInResourceGroup)
- [Get all commitment plans in a subscription](/rest/api/machinelearning/CommitmentPlans/List)

### Commitment plans usage history
- [Get the usage history of a commitment plan](/rest/api/machinelearning/usagehistory.json)

## Web services tasks
You can do the following tasks with the REST APIs for Azure Machine Learning Studio web services:

- [Create or update a web Service](/rest/api/machinelearning/WebServices/CreateOrUpdate)
- [Get information about a web service](/rest/api/machinelearning/WebServices/Get)
- [Get access keys for a web service](/rest/api/machinelearning/WebServices/ListKeys)
- [Modify a web service](/rest/api/machinelearning/WebServices/Patch)
- [Delete a web service](/rest/api/machinelearning/WebServices/Remove)
- [Get all web services in a resource group](/rest/api/machinelearning/WebServices/ListByResourceGroup)
- [Get all web services in a subscription](/rest/api/machinelearning/WebServices/List)


## See Also

- [Manage a web service using PowerShell cmdlets](/powershell/resourcemanager/azurerm.machinelearning/v0.11.0/azurerm.machinelearning)
- [Manage a web service using the Azure Machine Learning Studio Web Services portal](/azure/machine-learning/studio/manage-new-webservice)
- [Overview of deploying and consuming Azure Machine Learning Studio web services](/azure/machine-learning/studio/deploy-consume-web-service-guide)
