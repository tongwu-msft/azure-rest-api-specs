---
title: Azure Deployment Manager REST API reference | Microsoft Docs
description: Learn how Deployment Manager enables you to use safe deployment practices when deploying your service across many regions.
ms.service: azure-resource-manager
author: tfitzmac
ms.author: tomfitz
ms.date: 09/25/2018
---

# Azure Deployment Manager REST API Reference

Deployment Manager enables you to use safe deployment practices when deploying your service across many regions.

Azure Deployment Manager is in public preview. To learn how to sign up for the preview and use Azure Deployment Manager, see [Enable safe deployment practices with Azure Deployment Manager](/azure/azure-resource-manager/deployment-manager-overview/). For a tutorial, see [Use Azure Deployment Manager with Resource Manager templates](/azure/azure-resource-manager/deployment-manager-tutorial/).

## REST operation groups



| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Artifact Sources](xref:management.azure.com.deploymentmanager.artifactsources) | Provides operations for working with the artifact sources that store assets for deployment. |
| [Operations](xref:management.azure.com.deploymentmanager.operations)  | Lists available operations for the Microsoft.DeploymentManager provider. |
| [Rollouts](xref:management.azure.com.deploymentmanager.rollouts)  | Provides operations for working with staged deployments. |
| [Service Topologies](xref:management.azure.com.deploymentmanager.servicetopologies)  | Provides operations for defining the services to deploy and the artifact source to use. |
| [Service Units](xref:management.azure.com.deploymentmanager.serviceunits) | Provides operations for defining the path to the templates to deploy, and the resource group. |
| [Services](xref:management.azure.com.deploymentmanager.services) | Provides operations for defining the location and subscription ID for the service to deploy. |
| [Steps](xref:management.azure.com.deploymentmanager.steps) | Provides operations for specifying the order of deployment operations. |

## See also

- [Azure Deployment Manager documentation](/azure/azure-resource-manager/deployment-manager-overview/)
