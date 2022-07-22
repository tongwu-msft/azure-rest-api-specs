---
title: Azure Internet Analyzer REST API 
description: The Internet Analyzer REST API allows you to develop clients that use REST calls to work with the service. 
services: internet-analyzer
ms.service: internet-analyzer
ms.subservice: core
ms.topic: reference
author: megan-beatty
ms.author: jasonh
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
| [Experiments](/rest/api/internetanalyzer/experiments) | Provides operations for managing Network Experiments |
| [Profiles](/rest/api/internetanalyzer/networkexperimentprofiles) | Provides operations for managing Profiles, which can contain one or more Network Experiments |
| [Preconfigured Endpoints](/rest/api/internetanalyzer/preconfiguredendpoints) | Exposes preconfigured endpoints that can be used for Network Experiments |
| [Reports](/rest/api/internetanalyzer/reports)| Exposes reports (e.g., scorecards and timeseries) for a specific Network Experiment |

## Next steps

Learn more about this service:

* [Azure Internet Analyzer Documentation](https://aka.ms/InternetAnalyzerServiceOverview)
