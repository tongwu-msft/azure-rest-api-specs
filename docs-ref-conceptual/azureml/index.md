---
title: Azure Machine Learning REST APIs
description: The Machine Learning REST APIs allow you to develop clients that use REST calls to work with the service.
services: machine-learning
ms.service: machine-learning
ms.subservice: core
ms.topic: reference
author: Blackmist
ms.author: larryfr
ms.date: 05/12/2021
---

# Machine Learning REST API reference
The [Azure Machine Learning](https://docs.microsoft.com/azure/machine-learning/) REST APIs allow you to develop clients that use REST calls to work with the service.
## Rest Operation Groups

Machine Learning REST APIs provide operations for working with the following resources:

### Latest GA API Version

Uses REST API Version 2022-05-01

| Operation group | Description                                                        | Operation subgroups |
| --------------- | ------------------------------------------------------------------ | ------------------- |
| [Workspaces](/rest/api/azureml/2022-05-01/workspaces) | Provides operations for managing workspaces. |
| Compute | Provides operations for managing compute. | [Compute](/rest/api/azureml/2022-05-01/compute) <br /> [Usages](/rest/api/azureml/2022-05-01/usages) <br /> [Virtual Machine Sizes](/rest/api/azureml/2022-05-01/virtual-machine-sizes) |
| [Datastores](/rest/api/azureml/2022-05-01/datastores) | Provides operations for managing datastores. |
| Environments | Provides operations for managing environments. | [Environment Containers](/rest/api/azureml/2022-05-01/environment-containers) <br /> [Environment Versions](/rest/api/azureml/2022-05-01/environment-versions) |
| Data | Provides operations for managing data assets. | [Data Containers](/rest/api/azureml/2022-05-01/data-containers) <br /> [Data Versions](/rest/api/azureml/2022-05-01/data-versions) |
| Code | Provides operations for managing code assets. | [Code Containers](/rest/api/azureml/2022-05-01/code-containers) <br /> [Code Versions](/rest/api/azureml/2022-05-01/code-versions) |
| Models | Provides operations for managing models. | [Model Containers](/rest/api/azureml/2022-05-01/model-containers) <br /> [Model Versions](/rest/api/azureml/2022-05-01/model-versions) |
| Components | Provides operations for managing components. | [Component Containers](/rest/api/azureml/2022-05-01/component-containers) <br /> [Component Versions](/rest/api/azureml/2022-05-01/component-versions) |
| [Jobs](/rest/api/azureml/2022-05-01/jobs) | Provides operations for managing jobs. |
| Online Endpoints | Provides operations for managing online endpoints. | [Online Endpoints](/rest/api/azureml/2022-05-01/online-endpoints) <br /> [Online Deployments](/rest/api/azureml/2022-05-01/online-deployments) |
| Batch Endpoints | Provides operations for managing batch endpoints. | [Batch Endpoints](/rest/api/azureml/2022-05-01/batch-endpoints) <br /> [Batch Deployments](/rest/api/azureml/2022-05-01/batch-deployments) |
| [Workspace Connections](/rest/api/azureml/2022-05-01/workspace-connections) | Provides operations for managing workspace connections. |
| [Quotas](/rest/api/azureml/2022-05-01/quotas) | Provides operations for managing quotas. |
| [Private Endpoint Connections](/rest/api/azureml/2022-05-01/private-endpoint-connections) | Provides operations for managing private endpoint connections to a workspace. |
| [Private Link Resources](/rest/api/azureml/2022-05-01/private-link-resources) | Provides operations for managing private link resources for a workspace. |

### Latest Preview API Version

Uses REST API Version 2022-06-01-preview

| Operation group | Description | Operation subgroups |
| --------------- | ------------| ------------------- |
| [Workspaces](/rest/api/azureml/2022-06-01-preview/workspaces) | Provides operations for managing workspaces. |
| Compute | Provides operations for managing compute. | [Compute](/rest/api/azureml/2022-06-01-preview/compute) <br /> [Usages](/rest/api/azureml/2022-06-01-preview/usages) <br /> [Virtual Machine Sizes](/rest/api/azureml/2022-06-01-preview/virtual-machine-sizes) |
| [Datastores](/rest/api/azureml/2022-06-01-preview/datastores) | Provides operations for managing datastores. |
| Environments | Provides operations for managing environments. | [Environment Containers](/rest/api/azureml/2022-06-01-preview/environment-containers) <br /> [Environment Versions](/rest/api/azureml/2022-06-01-preview/environment-versions) |
| Data | Provides operations for managing data assets. | [Data Containers](/rest/api/azureml/2022-06-01-preview/data-containers) <br /> [Data Versions](/rest/api/azureml/2022-06-01-preview/data-versions) |
| Code | Provides operations for managing code assets. | [Code Containers](/rest/api/azureml/2022-06-01-preview/code-containers) <br /> [Code Versions](/rest/api/azureml/2022-06-01-preview/code-versions) |
| Models | Provides operations for managing models. | [Model Containers](/rest/api/azureml/2022-06-01-preview/model-containers) <br /> [Model Versions](/rest/api/azureml/2022-06-01-preview/model-versions) |
| Components | Provides operations for managing components. | [Component Containers](/rest/api/azureml/2022-06-01-preview/component-containers) <br /> [Component Versions](/rest/api/azureml/2022-06-01-preview/component-versions) |
| [Jobs](/rest/api/azureml/2022-06-01-preview/jobs) | Provides operations for managing jobs. |
| Online Endpoints | Provides operations for managing online endpoints. | [Online Endpoints](/rest/api/azureml/2022-06-01-preview/online-endpoints) <br /> [Online Deployments](/rest/api/azureml/2022-06-01-preview/online-deployments) |
| Batch Endpoints | Provides operations for managing batch endpoints. | [Batch Endpoints](/rest/api/azureml/2022-06-01-preview/batch-endpoints) <br /> [Batch Deployments](/rest/api/azureml/2022-06-01-preview/batch-deployments) |
| [Schedules](/rest/api/azureml/2022-06-01-preview/schedules) | Provides operations for managing schedules. |
| [Workspace Connections](/rest/api/azureml/2022-06-01-preview/workspace-connections) | Provides operations for managing workspace connections. |
| [Quotas](/rest/api/azureml/2022-06-01-preview/quotas) | Provides operations for managing quotas. |
| [Private Endpoint Connections](/rest/api/azureml/2022-06-01-preview/private-endpoint-connections) | Provides operations for managing private endpoint connections to a workspace. |
| [Private Link Resources](/rest/api/azureml/2022-06-01-preview/private-link-resources) | Provides operations for managing private link resources for a workspace. |

## See Also

Learn more about this service:
* [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)

