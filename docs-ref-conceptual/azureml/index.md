---
title: Azure Machine Learning REST APIs 
description: The Machine Learning REST APIs allow you to develop clients that use REST calls to work with the service. These APIs are complimentary to Azure ML Python SDK and provide flexibility in automating your machine learning activities such as submitting an experiment and monitoring the test results. 
services: machine-learning
ms.service: machine-learning
ms.subservice: core
ms.topic: reference
author: Blackmist
ms.author: larryfr
ms.date: 09/28/2019
---

# Machine Learning REST API reference

[Azure Machine Learning](https://docs.microsoft.com/azure/machine-learning/) is a cloud service that you use to train, deploy, automate, and manage machine learning models, all at the broad scale that the cloud provides.

The REST APIs allow you to develop clients that use REST calls to work with the service. These APIs are complimentary to [Azure Machine Learning Python SDK](https://docs.microsoft.com/python/api/overview/azure/ml/intro?view=azure-ml-py), and provide flexibility in automating your machine learning activities such as submitting an experiment and monitoring the test results. 

## Rest Operation Groups

Machine Learning REST APIs provide operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Artifacts](https://docs.microsoft.com/rest/api/azureml/artifacts) | Provides operations on Artifacts created during using Azure Machine Learning platform except for artifacts created during runs, which are managed by Run Tracking|
| [Data Stores](https://docs.microsoft.com/rest/api/azureml/datastores) | Provides operations on Data Stores of Azure Machine Learning experiments |
| [Hyperparameter Tuning](https://docs.microsoft.com/rest/api/azureml/hyperparametertuning) | Provides operations on Hyperparamater Tuning Experiments |
| [Runs](https://docs.microsoft.com/rest/api/azureml/runs) | Provides operations on Runs of Azure Machine Learning Experiments |
| [Models and Deployments](https://docs.microsoft.com/rest/api/azureml/modelsanddeployments/assets) | Provides operations on management of machine learning lifecycle, such as Assets, Models, Profiles, Services, Operations |
| [Run Tracking](https://docs.microsoft.com/rest/api/azureml/runtracking/events) | Provides operations during the Run of Azure Machine Learning Experiments, such as managing events, experiments, run artifacts, run metrics and runs |
| [Workspaces and Compute](https://docs.microsoft.com/rest/api/azureml/workspacesandcomputes/machinelearningcompute) | Provides operations on Workspaces and Compute resources of Azure Machine Learning|

## See Also

Learn more about this service:
* [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)
* [Azure Machine Learning REST API examples](https://github.com/microsoft/MLOps/tree/master/examples/AzureML-REST-API)

