---
ms.assetid:
title: Microsoft Cost Management REST APIs
description: Learn how the Microsoft Cost Management APIs provide the ability to explore cost and usage data via multidimensional analysis.
ms.service: cost-management-billing
author: bandersmsft
ms.author: banders
ms.reviewer: adwise
ms.date: 06/07/2022
---


# Microsoft Cost Management

The Cost Management APIs provide the ability to explore cost and usage data via multidimensional analysis, where creating customized filters and expressions allow you to answer consumption-related questions for your Azure resources. These APIs are currently available for Azure Enterprise customers.



## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Dimensions](xref:management.azure.com.cost-management.dimensions) | Provides operations to get supported dimensions for your usage under a variety of scopes. You can retrieve a list of dimensions that can be used as inputs for generating queries with the Query or Exports API.
  [Query](xref:management.azure.com.cost-management.query) | Provides operations to get aggregated cost and usage data based on the query you supply. Data can be filtered, sorted, and grouped by all available Dimensions (accessible through the Dimensions API).
  [Exports](xref:management.azure.com.cost-management.exports) | Provides operations to schedule recurring exports of cost and usage data to blob storage. Data can be filtered, sorted, and grouped by all available Dimensions (accessible through the Dimensions API).



## See also

[Azure consumption REST API documentation](/rest/api/consumption/)
