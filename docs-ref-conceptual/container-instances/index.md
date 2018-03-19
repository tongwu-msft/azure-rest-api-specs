---
title: Azure Container Instances REST API reference
author: mmacy
ms.author: marsma
ms.date: 02/12/2018
ms.topic: reference
ms.service: container-instances
ms.devlang: rest-api
---

# Azure Container Instances REST API reference

Azure Container Instances offers the fastest and simplest way to run a container in Azure, without having to provision any virtual machines and without having to adopt a higher-level service. For more information, see the [Azure Container Instances overview](/azure/container-instances/container-instances-overview).

## REST operation groups

The Container Instances REST API provides operations for working with the following resources.

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
|[Container Group Usage](xref:management.azure.com.containerinstances.containergroupusage)| Get usage information for the container groups in a subscription. |
|[Container Groups](xref:management.azure.com.containerinstances.containergroups)| Create, read, update, and delete [container groups](/azure/container-instances/container-instances-container-groups), the top-level resource in Azure Container Instances. |
|[Container Logs](xref:management.azure.com.containerinstances.containerlogs)| Get container instance logs. |
|[Operations](xref:management.azure.com.containerinstances.operations)| Get information about Azure Container Instances REST API operations. |

## See also

[Azure Container Registry](/azure/container-registry/) - Store and manage container images across all types of Azure deployments.

[Azure Container Service (AKS)](/azure/aks/) - Easily deploy and manage containerized applications in a hosted Kubernetes environment.

[Azure Container Service (ACS)](/azure/container-service/) - Scale and orchestrate containers using Kubernetes, DC/OS, or Docker Swarm.
