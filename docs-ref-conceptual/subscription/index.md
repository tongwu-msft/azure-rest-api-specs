---
title: Subscription REST API
description: Operation groups for the Subscription REST API
author: bandersmsft
ms.author: banders
ms.manager: amberb
ms.date: 08/15/2019
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
| [Subscription factory (2018-03-01-preview) ](xref:management.azure.com.subscription.2018-03-01-preview.subscriptionfactory) | Operation to create an Azure subscription in an EA account. |
| [Subscription factory (2018-11-01-preview)](xref:management.azure.com.subscription.2018-11-01-preview.subscriptionfactory) | Operation to create a new Azure subscription. |
| [Subscriptions (2019-03-01-preview)](xref:management.azure.com.subscription.2019-03-01-preview.subscriptions) | Operations to cancel, enable, and rename subscriptions. |

## See Also

- [Azure Billing documentation](/azure/billing/)
- [Create Azure Enterprise subscriptions through the API](https://docs.microsoft.com/azure/azure-resource-manager/programmatically-create-subscription)
