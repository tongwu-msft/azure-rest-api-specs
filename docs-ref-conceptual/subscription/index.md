---
title: Subscription REST API
description: Operation groups for the Subscription REST API
author: bandersmsft
ms.author: banders
ms.manager: amberb
ms.date: 07/24/2019
ms.topic: reference
ms.service: billing
ms.devlang: rest-api
---

# Subscription

The Azure Subscription APIs allow you to create and manage your subscriptions programmatically. The APIs currently support subscriptions that are billed to an Enterprise Agreement or a Microsoft Customer Agreement billing account. For more information about billing accounts, see [View your billing accounts in the Azure portal](https://docs.microsoft.com/azure/billing/billing-view-all-accounts).

## Supported subscription types

- [Enterprise Agreement (EA)](https://azure.microsoft.com/pricing/enterprise-agreement/)
- [Microsoft Azure Plan](https://azure.microsoft.com/offers/ms-azr-0017g/)
- [Microsoft Azure Plan for DevTest](https://azure.microsoft.com/offers/ms-azr-0148g/)

## REST Operation Groups

| Operation Group | Description |
| --- | --- |
| [Operations (2018-03-01-preview)](xref:management.azure.com.subscription.operations) | Operation to create EA and EA Dev/Test subscriptions. |
| [Subscription factory (2018-11-01-preview)](xref:management.azure.com.subscription.subscriptionfactory) | Operations to create Microsoft Azure Plan and Microsoft Azure plan for DevTest subscriptions. |
| [Subscriptions (2019-03-01-preview)](xref:management.azure.com.subscription.subscriptions) | Operations to cancel and rename subscriptions. |

## See Also

- [Azure Billing documentation](https://docs.microsoft.com/en-us/azure/billing/)
- [Create Azure Enterprise subscriptions through the API](https://docs.microsoft.com/azure/azure-resource-manager/programmatically-create-subscription)
