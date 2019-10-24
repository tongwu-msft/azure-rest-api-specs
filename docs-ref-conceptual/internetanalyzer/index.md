---
title: Azure Internet Analyzer REST API 
description: The Internet Analyzer REST API allows you to develop clients that use REST calls to work with the service. 
services: internet-analyzer
ms.service: internet-analyzer
ms.subservice: core
ms.topic: reference
author: megan-beatty; mattcalder; diego-perez-botero
ms.author: mebeatty
ms.date: 10/24/2019
---

# Internet Analyzer REST API reference

[Azure Internet Analyzer](https://aka.ms/InternetAnalyzerServiceOverview)  is a client-side measurement platform to test how networking infrastructure changes impact your customers’ performance. Whether you’re migrating from on-premises to Azure or evaluating a new Azure service, Internet Analyzer allows you to learn from your users’ data and Microsoft’s rich analytics to better understand and optimize your network architecture with Azure—before you migrate.

Internet Analyzer uses a small JavaScript client embedded in your Web application to measure the latency from your end users to your selected set of network destinations, we call _endpoints_. Internet Analyzer allows you to set up multiple side-by-side tests, allowing you to evaluate a variety of scenarios as your infrastructure and customer needs evolves. Internet Analyzer provides custom and preconfigured endpoints, providing you both the convenience and flexibility to make trusted performance decisions for your end users.

The REST API allows you to develop clients that use REST calls to work with the Internet Analyzer service.

## Rest Operation Groups

Internet Analyzer REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Create or Update](https://review.docs.microsoft.com/rest/api/internetanalyzer/experiments/createorupdate?branch=ne) | Creates of updates an experiment|
| [Delete](https://review.docs.microsoft.com/rest/api/internetanalyzer/experiments/delete?branch=ne) | Provides operations on Runs of Azure Machine Learning Experiments |
| [Get](https://review.docs.microsoft.com/rest/api/internetanalyzer/experiments/get?branch=ne) | Gets an Experiment by ExperimentName |
| [List By Profile](https://review.docs.microsoft.com/rest/api/internetanalyzer/experiments/listbyprofile?branch=ne)| Gets a list of Experiments |
| [Update](https://review.docs.microsoft.com/rest/api/internetanalyzer/experiments/update?branch=ne)| Updates an Experiment by Experiment id; Updates an Experiment |

## Next steps

Learn more about this service:

* [Azure Internet Analyzer Documentation](https://aka.ms/InternetAnalyzerServiceOverview)
