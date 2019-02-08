---
title: Azure Container Instances REST API reference
author: dlepow
ms.author: danlep
ms.date: 02/08/2019
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
|[Container](xref:management.azure.com.container-instances.container)| Operations for working with containers in a container group. For example, execute a command in a running container, or list its logs. |
|[Container Group Usage](xref:management.azure.com.container-instances.containergroupusage)| Get usage information for the container groups in a subscription. |
|[Container Groups](xref:management.azure.com.container-instances.containergroups)| Create, read, update, and delete [container groups](/azure/container-instances/container-instances-container-groups), the top-level resource in Azure Container Instances. |
|[List Cached Images](xref:management.azure.com.container-instances.listcachedimages) | List the cached images of a specific OS type for a subscription in a region.|
|[List Capabilities](xref:management.azure.com.container-instances.listcapabilities)| List the CPU, memory, GPU capabilities of a region.|
|[Operations](xref:management.azure.com.container-instances.operations)| Get information about the available REST API operations in Azure Container Instances. |
|[Service Association Link](xref:management.azure.com.container-instances.serviceassociationlink)| Manage the service association link for a linked subnet. |

## See also

[Azure Container Registry](/azure/container-registry/) - Store and manage container images across all types of Azure deployments.

[Azure Kubernetes Service (AKS)](/azure/aks/) - Easily deploy and manage containerized applications in a hosted Kubernetes environment.
