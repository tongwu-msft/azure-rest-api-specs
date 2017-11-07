---
ms.assetid: 0009e3b6-2fed-465a-95de-457ffea5b700
ms.title: Azure Container Registry REST API reference
ms.service: container-registry
author: mmacy
ms.author: marsma
ms.date: 11/01/2017
ms.manager: timlt
---

# Azure Container Registry REST API reference

Azure Container Registry is a managed Docker registry service to store and manage your private Docker container images. Push Docker container images to a private registry as part of your development workflows. Pull images from a registry to your container deployments with orchestration tools or other Azure services.

## REST operation groups

| Operation group | Description |
|-----------------|-------------|
| [Operations](~/docs-ref-autogen/containerregistry/operations.json) | Provides information about the available Azure Container Registry REST API operations. |
| [Registries](~/docs-ref-autogen/containerregistry/registries.json) | Operations for creating and managing Azure container registries such as create, update, delete, list, and regenerate credentials. |
| [Replications](~/docs-ref-autogen/containerregistry/replications.json) | Create, read, update, and delete operations for container registry [geo-replication](/azure/container-registry/container-registry-geo-replication). |
| [Webhooks](~/docs-ref-autogen/containerregistry/webhooks.json) | Operations for working with container registry [webhooks](/azure/container-registry/container-registry-webhook). |