---
ms.assetid:
ms.title: Azure Cost Management REST APIs
ms.service: cost management
author: ms-premp
ms.author: prprak
ms.manager: aedwin
ms.date: 09/20/2018
service_description: To be added..
---


# Azure Cost Management

The Azure Cost Management APIs provide the ability to explore cost and usage data via multidimensional analysis, where creating customized filters and expressions allow you to answer consumption related questions for your Azure resources. These APIs are currently available for Azure Enterprise customers.


## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Dimensions](xref:management.azure.com.cost-management.dimensions) | Provides operations to get supported dimensions for your usage under a variety of scopes. Using the Dimensions API, you can retrieve a list of dimensions that can be used as inputs for generating queries with the Query API.
  [Query](xref:management.azure.com.cost-management.query) | Provides operations to get aggregated cost and usage data based on the query you supply. Using the Query API, you can specify your desired filtering, sorting and grouping on all available dimensions (which are accessed from the Dimensions API).


## See also

[Azure Consumption REST API documentation](/rest/api/consumption/)
