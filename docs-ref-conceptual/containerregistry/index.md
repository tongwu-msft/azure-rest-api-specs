---
title: Azure Container Registry REST API reference
author: mmacy
ms.author: marsma
ms.date: 07/08/2019
ms.topic: reference
ms.service: container-registry
ms.devlang: rest-api
---

# Azure Container Registry REST API reference

Azure Container Registry is a managed Docker registry service for storing and managing your private Docker container images. Push Docker container images to a private registry as part of your development workflows. Pull images from a registry to your container deployments with orchestration tools or other Azure services.

## REST operation groups

| Operation group | Description |
|-----------------|-------------|
| [Operations](xref:management.azure.com.containerregistry.operations) | Get information about the available operations in the Azure Container Registry REST API. |
| [Registries](xref:management.azure.com.containerregistry.registries) | Create, read, update, and delete container registries. |
| [Registries (Tasks)][tasks-operations] | Operations for scheduling task runs with [ACR Tasks][acr-tasks]. |
| [Replications](xref:management.azure.com.containerregistry.replications) | Create, read, update, and delete container registry [geo-replications][geo-replication]. |
| [Runs](xref:management.azure.com.containerregistry.runs) | Get information about, update, and cancel task runs in [ACR Tasks][acr-tasks]. |
| [Tasks](xref:management.azure.com.containerregistry.tasks) | Create, read, update, and delete tasks in [ACR Tasks][acr-tasks]. |
| [Webhooks](xref:management.azure.com.containerregistry.webhooks) | Create, read, update, and delete container registry [webhooks][webhooks]. |

## See also

[Azure Container Instances](/azure/container-instances/) - Quickly run Docker containers in Azure, without having to provision virtual machines or adopt a higher-level service.

[Azure Kubernetes Service (AKS)](/azure/aks/) - Deploy and manage containerized applications in a hosted Kubernetes environment.

<!-- LINKS - Internal -->
[acr-tasks]: /azure/container-registry/container-registry-tasks-overview
[geo-replication]: /azure/container-registry/container-registry-geo-replication
[tasks-operations]: /rest/api/containerregistry/registries%20(tasks)
[webhooks]: /azure/container-registry/container-registry-webhook