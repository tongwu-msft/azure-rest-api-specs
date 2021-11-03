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

| Operation group | Description                                                        | Operation subgroups |
| --------------- | ------------------------------------------------------------------ | ------------------- |
| [Workspaces](https://docs.microsoft.com/rest/api/azureml/workspaces) | Provides operations for managing workspaces. |
| Compute | Provides operations for managing compute. | [Compute](https://docs.microsoft.com/rest/api/azureml/compute) <br /> [Usages](https://docs.microsoft.com/rest/api/azureml/usages) <br /> [Virtual Machine Sizes](https://docs.microsoft.com/rest/api/azureml/virtualmachinesizes) |
| [Datastores](https://docs.microsoft.com/rest/api/azureml/datastores) | Provides operations for managing datastores. |
| Environments | Provides operations for managing environments. | [Environment Containers](https://docs.microsoft.com/rest/api/azureml/environmentcontainers) <br /> [Environment Versions](https://docs.microsoft.com/rest/api/azureml/environmentspecificationversions) |
| Data | Provides operations for managing data assets. | [Data Containers](https://docs.microsoft.com/rest/api/azureml/datacontainers) <br /> [Data Versions](https://docs.microsoft.com/rest/api/azureml/dataversions) |
| Code | Provides operations for managing code assets. | [Code Containers](https://docs.microsoft.com/rest/api/azureml/codecontainers) <br /> [Code Versions](https://docs.microsoft.com/rest/api/azureml/codeversions) |
| Models | Provides operations for managing models. | [Model Containers](https://docs.microsoft.com/rest/api/azureml/modelcontainers) <br /> [Model Versions](https://docs.microsoft.com/rest/api/azureml/modelversions) |
| [Jobs](https://docs.microsoft.com/rest/api/azureml/jobs) | Provides operations for managing jobs. |
| [Labeling Jobs](https://docs.microsoft.com/rest/api/azureml/labelingjobs) | Provides operations for managing labeling jobs. |
| Online Endpoints | Provides operations for managing online endpoints. | [Online Endpoints](https://docs.microsoft.com/rest/api/azureml/onlineendpoints) <br /> [Online Deployments](https://docs.microsoft.com/rest/api/azureml/onlinedeployments) |
| Batch Endpoints | Provides operations for managing batch endpoints. | [Batch Endpoints](https://docs.microsoft.com/rest/api/azureml/batchendpoints) <br /> [Batch Deployments](https://docs.microsoft.com/rest/api/azureml/batchdeployments) |
| [Workspace Connections](https://docs.microsoft.com/rest/api/azureml/workspaceconnections) | Provides operations for managing workspace connections. |
| [Quotas](https://docs.microsoft.com/rest/api/azureml/quotas) | Provides operations for managing quotas. |
| [Private Endpoint Connections](https://docs.microsoft.com/rest/api/azureml/privateendpointconnections) | Provides operations for managing private endpoint connections to a workspace. |
| [Private Link Resources](https://docs.microsoft.com/rest/api/azureml/privatelinkresources) | Provides operations for managing private link resources for a workspace. |

## See Also

Learn more about this service:
* [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)

