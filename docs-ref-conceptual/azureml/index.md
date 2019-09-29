---
ms.assetid:
ms.title: Machine Learning REST API | Microsoft Docs
ms.service: Machine Learning
author: Blackmist
ms.author: larryfr
---

# Machine Learning REST API reference

[Azure Machine Learning](https://docs.microsoft.com/azure/machine-learning/) is a cloud service that you use to train, deploy, automate, and manage machine learning models, all at the broad scale that the cloud provides.

The REST API allows you to develop clients that use REST calls to work with the serevice. This API is complimentary to [Azure Machine Learning Python SDK](https://docs.microsoft.com/python/api/overview/azure/ml/intro?view=azure-ml-py), and provides flexibility in automating your machine learning activities such as submitting an experiment and monitoring the test results. 

## Rest Operation Groups

Machine Learning REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Artifacts](../machinelearningservices/artifacts?branch=mltest) | Provides operations on Artifacts created during using Azure Machine Learning platform except for artifacts created during runs, which are managed by Run Tracking|
| [Execution](../machinelearningservices/execution?branch=mltest) | Provides operations on Runs of Azure Machine Learning Experiments |
| [Hypder Drive](../machinelearningservices/hyperdrive?branch=mltest) | Provides operations on HyperDrive Experiments |
| DataStores | Provides operations on Data Stores of Azure Machine Learning Experiments |
| Models and Deployments | Provides operations on management of machine learning lifecycle, such as Assets, Models, Profiles, Services, Operations |
| Run Tracking| Provides operations during the Run of Azure Machine Learning Experiments, such as managing events, experiments, run artifacts, run metrics and runs |
| Workspaces and Compute | Provides operations on Workspaces and Compute resources of Azure Machine Learning|

## Next steps

Learn more about this service:
* [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)
