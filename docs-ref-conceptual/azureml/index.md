https://docs.microsoft.com/en-us/azure/active-directory/develop/v1-protocols-oauth-code

---
ms.assetid:
ms.title: Machine Learning REST API | Microsoft Docs
ms.service: Machine Learning
author: 
ms.author: 
ms.manager: 
---

# Machine Learning REST API reference

[Azure Machine Learning](https://docs.microsoft.com/azure/machine-learning/) is a cloud service that you use to train, deploy, automate, and manage machine learning models, all at the broad scale that the cloud provides.

The REST API allows you to develop clients that use REST calls to work with the serevice. This API is complimentary to [Azure Machine Learning Python SDK](https://docs.microsoft.com/python/api/overview/azure/ml/intro?view=azure-ml-py), and provides flexibility in automating your machine learning activities such as submitting an experiment and monitoring the test results. 

## Rest Operation Groups

Machine Learning REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Artifacts](https://review.docs.microsoft.com/en-us/rest/api/machinelearningservices/artifacts?branch=mltest) | Provides operations on Artifacts created during using Azure Machine Learning platform except for artifacts created during runs, which are managed by Run Tracking|
| [Execution](https://review.docs.microsoft.com/en-us/rest/api/machinelearningservices/execution?branch=mltest) | Provides operations on Runs of Azure Machine Learning Experiments |
| [Hypder Drive](https://review.docs.microsoft.com/en-us/rest/api/machinelearningservices/hyperdrive?branch=mltest) | Provides operations on HyperDrive Experiments |
| [DataStores](TBD) | Provides operations on Data Stores of Azure Machine Learning Experiments |
| [Models and Deployments](TBD) | Provides operations on management of machine learning lifecycle, such as Assets, Models, Profiles, Services, Operations |
| [Run Tracking](TBD) | Provides operations during the Run of Azure Machine Learning Experiments, such as managing events, experiments, run artifacts, run metrics and runs |
| [Workspaces and Compute](TBD) | Provides operations on Workspaces and Compute resources of Azure Machine Learning|

## See also

* [Azure Machine Learning Documentation TBD](TBD)
