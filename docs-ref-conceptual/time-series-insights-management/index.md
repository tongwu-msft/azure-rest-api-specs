---
ms.title: Time Series Insights Management REST API | Microsoft Docs
ms.service: time-series-insights
author: sandshadow
ms.author: edett
ms.manager: almineev
---

# Time Series Insights Management

Time Series Insights provides a REST API used with [Azure Resource Manager](http://msdn.microsoft.com/library/azure/dn790568.aspx) to provision and administer a Time Series Insights environment in your Azure subscription. To manage your Time Series Insights environment programmatically, specify the ARM endpoint `https://management.azure.com` with an environment management operation:

~~~~
GET  https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.TimeSeriesInsights/environments/[environmentName]?api-version=2015-08-19
~~~~

## See Also

- [Time Series Insights documentation](https://docs.microsoft.com/azure/time-series-insights/)
- [Time Series Insights Data Access REST API](~/docs-ref-conceptual/time-series-insights/index.md)
