---
title: Azure Container Instances REST API reference
description: Learn how Azure Container Instances offers the fastest and simplest way to run a container in Azure.
author: dlepow
ms.author: danlep
ms.date: 07/01/2020
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
|[Containers](xref:management.azure.com.container-instances.containers)| Operations for working with containers in a container group. For example, execute a command in a running container, or list its logs. |
|[Container Groups](xref:management.azure.com.container-instances.containergroups)| Create, read, update, and delete [container groups](/azure/container-instances/container-instances-container-groups), the top-level resource in Azure Container Instances. |
|[Location](xref:management.azure.com.container-instances.location)| List cached images, resource capabilities, and usage for Azure Container Instances by region.|
|[Operations](xref:management.azure.com.container-instances.operations)| Get information about the available REST API operations in Azure Container Instances. |

## See also

[Azure Container Registry](/azure/container-registry/) - Store and manage container images across all types of Azure deployments.

[Azure Kubernetes Service (AKS)](/azure/aks/) - Easily deploy and manage containerized applications in a hosted Kubernetes environment.
