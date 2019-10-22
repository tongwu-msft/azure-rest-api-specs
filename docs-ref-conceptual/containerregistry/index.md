---
title: Azure Container Registry REST API reference
author: dlepow
ms.author: danlep
ms.date: 10/22/2019
ms.topic: reference
ms.service: container-registry
ms.devlang: rest-api
---

# Azure Container Registry REST API reference

Azure Container Registry is a managed Docker registry service for storing and managing your private Docker container images and other artifacts. Push Docker container images to a private registry as part of your development workflows. Pull images from a registry to your container deployments with orchestration tools or other Azure services.

## Azure Resource Manager REST operation groups

| Operation group | Description |
|-----------------|-------------|
| [Operations](xref:management.azure.com.containerregistry.operations) | Get information about the available operations in the Azure Container Registry REST API. |
| [Registries](xref:management.azure.com.containerregistry.registries) | Create, read, update, and delete container registries. |
| [Registries (Tasks)][tasks-operations] | Operations for scheduling task runs with [ACR Tasks][acr-tasks]. |
| [Replications](xref:management.azure.com.containerregistry.replications) | Create, read, update, and delete container registry [geo-replications][geo-replication]. |
| [Runs](xref:management.azure.com.containerregistry.runs) | Get information about, update, and cancel task runs in [ACR Tasks][acr-tasks]. |
| [Tasks](xref:management.azure.com.containerregistry.tasks) | Create, read, update, and delete tasks in [ACR Tasks][acr-tasks]. |
| [Webhooks](xref:management.azure.com.containerregistry.webhooks) | Create, read, update, and delete container registry [webhooks][webhooks]. |

## Data-plane REST operation groups (Preview)

> [!IMPORTANT]
> These data-plane REST APIs are in preview. They may be changed or removed in a future release.

| Operation group | Description |
|-----------------|-------------|
| [Access Tokens](/rest/api/containerregistry/accesstokens) | Operations with access tokens in a container registry. |
| [Blob](/rest/api/containerregistry/blob) | Operations with blobs in a container registry in a container registry. |
| [Manifests](/rest/api/containerregistry/manifests) | Operations with manifests in a container registry. |
| [Refresh Token](/rest/api/containerregistry/refreshtokens) | Operations with refresh tokens in a container registry. |
| [Tag](/rest/api/containerregistry/tag) | Operations with tags in a container registry. |
| [V2 Support](/rest/api/containerregistry/v2support) | Checks for Docker Registry HTTP API v2 support in a container registry. |

## See also

[Azure Container Instances](/azure/container-instances/) - Quickly run Docker containers in Azure, without having to provision virtual machines or adopt a higher-level service.

[Azure Kubernetes Service (AKS)](/azure/aks/) - Deploy and manage containerized applications in a hosted Kubernetes environment.

<!-- LINKS - Internal -->
[acr-tasks]: /azure/container-registry/container-registry-tasks-overview
[geo-replication]: /azure/container-registry/container-registry-geo-replication
[tasks-operations]: /rest/api/containerregistry/registries%20(tasks)
[webhooks]: /azure/container-registry/container-registry-webhook