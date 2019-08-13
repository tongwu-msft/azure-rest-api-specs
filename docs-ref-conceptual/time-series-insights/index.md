---
ms.assetid: d05239ef-89cd-41f9-8345-bd558e72e891
title: Time Series REST API | Microsoft Docs
ms.service: time-series
author: jeffstokes72
ms.author: jeffstok
ms.manager: jhubbard
service_description: To be added
---

# Azure Time Series Insights

Azure Time Series Insights is a fully managed analytics, storage, and visualization service that makes it simple to explore and analyze billions of IoT events simultaneously.  It gives you a global view of your data, letting you quickly validate your IoT solution and avoid costly downtime to mission-critical devices by helping you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real-time.  

Azure Time Series Insights stores and manages events in containers called environments. A Time Series Insights environment is an Azure resource with ingress and storage capacity.

Customers can provision and manage environments via the Azure portal, Azure Resource Manager, and Azure Management APIs. 

Azure Time Series Insights has two set of APIs, that are specific to Time Series Insights GA  version, and Time Series Insights Update version that is in public preview.

- For Time Series Insights GA version: 
    - To get started and create an environment, see [Create an environment](/azure/time-series-insights/time-series-insights-get-started).  To use Azure Resource Manager, see [Manage resources with Azure Resource Manager](https://docs.microsoft.com/en-us/rest/api/time-series-insights-management/).  If you already have created an environment, see [Azure Time Series Insights GA Query API](ga-query-api.md), to get started building on top of Time Series Insights with our REST API.  
    - For more information about Time Series Insights query syntax, JSON format (shapes) for requests, and reference data configuration, see [Azure Time Series Insights Query Syntax](ga-query-syntax.md).

- For Time Series Insights Update version: 
    - To get started and create an environment, see [Create an environment](/azure/time-series-insights/time-series-insights-get-started).  To use Azure Resource Manager, see [Manage resources with Azure Resource Manager](https://docs.microsoft.com/en-us/rest/api/time-series-insights-management/).  If you already have created an environment, see [Azure Time Series Insights Update Query API](preview-query.md) to get started building on top of Time Series Insights with our REST API.  
    - For more information about Time Series Insights query syntax, JSON format (shapes) for requests, and reference data configuration, see [Azure Time Series Query Expression and Syntax](preview-tsx.md).
