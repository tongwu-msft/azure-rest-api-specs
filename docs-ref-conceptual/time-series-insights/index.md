---
ms.assetid: d05239ef-89cd-41f9-8345-bd558e72e891
title: Time Series Insights REST API | Microsoft Docs
ms.service: time-series
author: jeffstokes72
ms.author: jeffstok
ms.manager: jhubbard
service_description: To be added
---

# Azure Time Series Insights

Azure Time Series Insights is a fully managed analytics, storage, and visualization service. You can use it to explore and analyze billions of Internet of Things (IoT) events simultaneously. It gives you a global view of your data, so you can quickly validate your IoT solution and avoid costly downtime to mission-critical devices. It helps you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real time.  

Azure Time Series Insights stores and manages events in containers called environments. A Time Series Insights environment is an Azure resource with ingress and storage capacity.

Customers can provision and manage environments via the Azure portal, Azure Resource Manager, and Azure Management APIs. 

Azure Time Series Insights has two sets of APIs that are specific to the general availability (GA) version and the Update version that's in public preview.

- For the Time Series Insights GA version: 
    - To get started and create an environment, see [Create an environment](/azure/time-series-insights/time-series-insights-get-started). To use Azure Resource Manager, see [Manage resources with Azure Resource Manager](https://docs.microsoft.com/en-us/rest/api/time-series-insights-management/).  If you've already created an environment, see [Azure Time Series Insights GA Query API](ga-query-api.md), to get started building on top of Time Series Insights with our REST API.  
    - For more information about Time Series Insights query syntax, JSON format (shapes) for requests, and reference data configuration, see [Azure Time Series Insights query syntax](ga-query-syntax.md).

- For the Time Series Insights Update version: 
    - To get started and create an environment, see [Create an environment](/azure/time-series-insights/time-series-insights-get-started). To use Azure Resource Manager, see [Manage resources with Azure Resource Manager](https://docs.microsoft.com/en-us/rest/api/time-series-insights-management/).  If you've already created an environment, see [Azure Time Series Insights Update Query API](preview-query.md) to get started building on top of Time Series Insights with our REST API.  
    - For more information about Time Series Insights query syntax, JSON format (shapes) for requests, and reference data configuration, see [Azure Time Series query expression and syntax](preview-tsx.md).
