---
title: Azure Billing REST API | Microsoft Docs
author: bandersmsft
ms.author: banders
ms.reviewer: amberb
ms.date: 09/16/2021
ms.topic: reference
ms.service: cost-management-billing
ms.subservice: enterprise
ms.devlang: rest-api
description: Provides operations to programmatically view and manage your billing details.
---

# Azure Billing REST API

The Azure Billing APIs allow you to view and manage your billing details programmatically. Operation groups listed below do not support all billing accounts. Supported billing accounts are specified in the table. To identify your billing account type, see [Billing accounts and scopes](/azure/cost-management-billing/manage/view-all-accounts).

## REST Operation Groups

| **Operation Group** | **Description** | **Microsoft Customer Agreement** | **Enterprise Agreement** | **Microsoft Partner Agreement** | **Microsoft Online Service Program** |
| --- | --- | --- | --- | --- | --- |
| [Address](/rest/api/billing/2019-10-01-preview/address) | Provides an operation to validate a given address. |   ✔  | ✔  | ✔  | ✔  |
| [Agreements](/rest/api/billing/2019-10-01-preview/agreements) | Provides operations to get agreements accepted for a billing account. |   ✔    | ✘  | ✘  | ✘  |
| [Available Balance](/rest/api/billing/2019-10-01-preview/availablebalances) | Provides an operation to get a real-time credit balance for a billing profile. |  ✔  | ✘  | ✘  | ✘  |
| [Billing Accounts](/rest/api/billing/2019-10-01-preview/billingaccounts) | Provides operations to get billing accounts that a user has access to. |   ✔    | ✔  | ✔  | ✔  |
| [Billing Permissions](/rest/api/billing/2019-10-01-preview/billingpermissions) | Provides operations to get permissions for a billing scope. | ✔  | ✘  | ✘  | ✘  |
| [Billing Profiles](/rest/api/billing/2019-10-01-preview/billingprofiles) <sup>1</sup> | Provides operations to get, create, and update billing profiles. | ✔  | ✘  | ✔  | ✘  |
| [Billing Property](/rest/api/billing/2019-10-01-preview/billingproperty) | Provides an operation to get billing properties for a subscription. | ✔  | ✘  | ✘  | ✘  |
| [Billing Role Assignments](/rest/api/billing/2019-10-01-preview/billingroleassignments) | Provides operations to get, add, and update billing role assignments. | ✔  | ✘  | ✘  | ✘  |
| [Billing Role Definitions](/rest/api/billing/2019-10-01-preview/billingroledefinitions) | Provides operations to get billing role definitions. | ✔  | ✘  | ✘  | ✘  |
| [Billing Subscriptions](/rest/api/billing/2019-10-01-preview/billingsubscriptions) | Provides operations to get subscriptions that are billed to a billing scope and move them between invoice sections. | ✔  | ✘  | ✘  | ✘  |
| [Customers](/rest/api/billing/2019-10-01-preview/customers) | Provides operations to get customers with an Azure plan. | ✘  | ✘  | ✔  | ✘  |
| [Departments](/rest/api/billing/2019-10-01-preview/departments) | Provides operations to get departments for an Enterprise Agreement (EA) enrollment. | ✘  | ✔  | ✘  | ✘  |
| [Enrollment Accounts](/rest/api/billing/2019-10-01-preview/enrollmentaccounts) | Provides operations to get accounts for an EA enrollment. | ✘  | ✔  | ✘  | ✘  |
| [Invoice sections](/rest/api/billing/2019-10-01-preview/invoicesections) | Provides operations to get, create, and update invoice sections. | ✔  | ✘  | ✘  | ✘  |
| [Invoices](/rest/api/billing/2019-10-01-preview/invoices) | Provides operations to get invoices. | ✔  | ✘  | ✔  | ✔  |
| [Operations](/rest/api/billing/2019-10-01-preview/operations) | Provides an operation to list all operations supported by Billing APIs. | ✔  | ✔  | ✔  | ✔  |
| [Partner Transfers](/rest/api/billing/2019-10-01-preview/partnertransfers) | Provides operations to get, initiate, and cancel transfer requests. | ✘  | ✘  | ✔  | ✘  |
| [Payment methods](/rest/api/billing/2019-10-01-preview/paymentmethods) | Provides operations to get payment methods. | ✔  | ✘  | ✘  | ✘  |
| [Policies](/rest/api/billing/2019-10-01-preview/policies) | Provides operations to get and update billing policies. | ✔  | ✘  | ✔  | ✘  |
| [Price Sheet](/rest/api/billing/2019-10-01-preview/pricesheet) | Provides operations to download Azure price sheets. | ✔  | ✘  | ✔  | ✘  |
| [Products](/rest/api/billing/2019-10-01-preview/products) <sup>2</sup> | Provides operations to get, update, and transfer products. | ✔  | ✘  | ✔  | ✘  |
| [Recipient Transfers](/rest/api/billing/2019-10-01-preview/recipienttransfers) | Provides operations to get, validate, accept, and decline transfer requests. | ✔  | ✘  | ✔  | ✘  |
| [Transactions](/rest/api/billing/2019-10-01-preview/transactions) | Provides operations to get billing transactions such as purchases and refunds. | ✔  | ✘  | ✔  | ✘  |
| [Transfers](/rest/api/billing/2019-10-01-preview/transfers) | Provides operations to get, initiate, and cancel transfer requests. | ✔  | ✘  | ✘  | ✘ |

<sup>1</sup> New billing profile creation is supported only for billing accounts that are created by working with a Microsoft representative.

<sup>2</sup> You must have a Microsoft Customer Agreement to transfer products between invoice sections.

## See Also

- [Azure Consumption APIs](/rest/api/consumption/)
- [Cost Management and Billing documentation](/azure/cost-management-billing/)
