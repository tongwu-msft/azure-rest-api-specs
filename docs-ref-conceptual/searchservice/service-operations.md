---
title: Service operations using Azure Cognitive Search REST API
description: Learn which REST APIs are used to obtain information about your Azure Cognitive Search service.
ms.date: 01/18/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Service operations (Azure Cognitive Search REST API)

While most of the Azure Cognitive Search REST APIs apply to a particular object in your search service such as an index, data source, and so on, the **Get Service Statistics** API is global to the search service itself. It returns information about resource consumption and service limits. In the portal, this API is used to populate the **Usage** tab on the overview page of your search service.

## Operations on services

An admin API key is required for viewing system information.

- [Get Service Statistics](get-service-statistics.md)  

## See also

+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)   
+ [Service limits](/azure/search/search-limits-quotas-capacity/)   
+ [Create and manage API keys](/azure/search/search-security-api-keys)  
