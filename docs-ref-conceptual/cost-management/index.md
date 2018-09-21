---
ms.assetid:
ms.title: Azure Cost Management REST APIs
ms.service: cost management
author: ms-premp
ms.author: prprak
ms.manager: aedwin
service_description: To be added..
---


# Azure Cost Management

The Azure Cost Management APIs give you data analysis capabilties to cost and usage data for your Azure resources. These APIs currently only support Enterprise Enrollments.


## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Dimensions](xref:management.azure.com.cost-management.dimensions) | Provides operations to get supported dimensions for your usage under different scopes. Using the dimensions api, you get a list of supported dimensions for filtering, sorting and grouping, which can be used for Query API.
  [Query](xref:management.azure.com.cost-management.query) | Provides operations to get aggregated data based on the query you supply. Using Query API you can specify your desired filtering, sorting and grouping on a list of supported dimensions, which you get from Dimensions API.

