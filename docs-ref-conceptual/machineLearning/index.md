---
ms.assetid: 
title: ML Studio (classic) API Web Service
ms.prod: 
ms.service: machine-learning
ms.subservice: studio
author: ericlicoding
ms.author: amlstudiodocs
service_description: To be added
---

# ML Studio (classic) Management REST APIs

The following Azure ML Studio (classic) REST APIs enable you to create and manage:

- **ML Studio commitment plans and associations**

- **Azure Resource Manager based web services** - Azure ML Studio enables you to build and test a predictive analytics solution, and then deploy it as an Azure web service. 
For an overview of the process, see [ML Studio (classic) Web Services: Deployment and consumption](/azure/machine-learning/studio/deploy-consume-web-service-guide).


## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|  [Commitment Associations](/rest/api/machinelearning/commitmentassociations) | Provides operations that allow you to manage commitment associations. |
|  [Commitment Plans](/rest/api/machinelearning/commitmentplans) | Provides operations that allow you to create and manage commitment plans. |
|  [Commitment Plans Usage History](/rest/api/machinelearning/usagehistory) | Provides an operation that allow you to retrieve commitment plan usage history. |
|  [Web Services](/rest/api/machinelearning/webservices) | Provides operations that allow you to create and manage web services. |

## Common parameters and headers

The following information is common to tasks related to these APIs:

- The host URI for ML Studio REST APIs is **https://management.azure.com/**
- Replace `{subscription-id}` with your subscription identifier in the URI
- Replace `{resource-group-name}` with the resource group name
- Set the Content-Type header to **application/json**
- Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory <!-- This topic doesn't exist anymore: (for more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx))-->

## Commitment plan tasks
You can do the following tasks with the REST APIs for Azure ML Studio commitment plans:

### [Commitment associations](/rest/api/machinelearning/commitmentassociations)
- [Get](/rest/api/machinelearning/CommitmentAssociations/Get) - Get a commitment association
- [Move](/rest/api/machinelearning/CommitmentAssociations/Move) - Change the parent of a commitment association
- [List](/rest/api/machinelearning/CommitmentAssociations/List) - Get all commitment associations for a parent plan

### [Commitment plans](/rest/api/machinelearning/commitmentplans)
- [Create Or Update](/rest/api/machinelearning/CommitmentPlans/CreateOrUpdate) - Create or update a commitment plan
- [Get](/rest/api/machinelearning/CommitmentPlans/Get) - Get information about a commitment plan
- [Patch](/rest/api/machinelearning/CommitmentPlans/Patch) - Modify a commitment plan
- [Remove](/rest/api/machinelearning/CommitmentPlans/Remove) - Delete a commitment plan
- [List In Resource Group](/rest/api/machinelearning/CommitmentPlans/ListInResourceGroup) - Get all commitment plans in a resource group
- [List](/rest/api/machinelearning/CommitmentPlans/List) - Get all commitment plans in a subscription

### [Commitment plans usage history](/rest/api/machinelearning/usagehistory)
- [List](/rest/api/machinelearning/UsageHistory/List) - Get the usage history of a commitment plan

## [Web service tasks](/rest/api/machinelearning/webservices)
You can do the following tasks with the REST APIs for Azure ML Studio web services:

- [Create Or Update](/rest/api/machinelearning/WebServices/CreateOrUpdate) - Create or update a web service
- [Get](/rest/api/machinelearning/WebServices/Get) - Get information about a web service
- [List Keys](/rest/api/machinelearning/WebServices/ListKeys) - Get access keys for a web service
- [Patch](/rest/api/machinelearning/WebServices/Patch) - Modify a web service
- [Remove](/rest/api/machinelearning/WebServices/Remove) - Delete a web service
- [List By Resource Group](/rest/api/machinelearning/WebServices/ListByResourceGroup) - Get all web services in a resource group
- [List](/rest/api/machinelearning/WebServices/List) - Get all web services in a subscription


## See Also

- [Machine Learning Web Services cmdlets for Azure Resource Manager](/powershell/module/az.machinelearning/)
- [Manage a web service using the ML Studio Classic Web Services portal](/azure/machine-learning/studio/manage-new-webservice)
- [Overview of deploying and consuming ML Studio Classic web services](/azure/machine-learning/studio/deploy-consume-web-service-guide)
