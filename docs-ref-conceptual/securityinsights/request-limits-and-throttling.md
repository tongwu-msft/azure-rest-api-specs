---
title: Azure Sentinel request limits and throttling
description: Describes how to use throttling with Azure Sentinel requests when subscription limits have been reached.
ms.topic: conceptual
ms.date: 07/22/2021
ms.custom: seodec18, devx-track-azurepowershell
---
# Throttling Azure Sentinel requests

This article describes how Azure Sentinel throttles requests for specific API calls, including specific throttling limits per API.

## Azure Sentinel minimum throttling limits

Throttling limits can differ between APIs. The following table lists the API operations where throttling applies, as well as the minimum supported limits.

Minimum limits are supported per 5 minutes, and per subscription and endpoint.

|Operation  |Limit  |
|---------|---------|
|**GET automation rules**     |    100     |
|**GET bookmarks**     |     100    |
|**GET comments**     |    100     |
|**GET incident alerts**     |   100      |
|**GET incident entities**     |  100       |
|**GET relations**     |   100      |
|**PUT action**     |    75     |
|**PUT automation rules**     |  100       |
|**PUT bookmarks**     |   75      |
|**PUT comments**     |    75     |
|**PUT incident**     | 75        |
|**PUT incident alerts**     |     75    |
|**PUT incident entities**     |  75       |
|**PUT relations**     |    75     |
|     |         |


These limits apply to each Azure Resource Manager instance. There are multiple instances in every Azure region, and Azure Sentinel is deployed to most Azure regions. So, in practice, the limits may be higher than these limits. The requests from a user are usually handled by different instances of Azure Resource Manager.


## Error code

When you reach the limit, you receive the HTTP status code **429 Too many requests**. The response includes a **Retry-After** value, which specifies the number of seconds your application should wait (or sleep) before sending the next request. If you send a request before the retry value has elapsed, your request isn't processed and a new retry value is returned.

After waiting for specified time, you can also close and reopen your connection to Azure. By resetting the connection, you may connect to a different instance of Azure Resource Manager.

If you're using an Azure SDK, the SDK may have an auto retry configuration. For more information, see [Retry guidance for Azure services](/azure/architecture/best-practices/retry-service-specific).

Some resource providers return 429 to report a temporary problem. The problem could be an overload condition that isn't directly caused by your request. Or, it could represent a temporary error about the state of the target resource or dependent resource. For example, the network resource provider returns 429 with the **RetryableErrorDueToAnotherOperation** error code when the target resource is locked by another operation. To determine if the error comes from throttling or a temporary condition, view the error details in the response.



## Next steps

For more information, see [Azure Sentinel REST API](/rest/api/securityinsights/).