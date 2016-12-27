---
title: Azure Billing REST API reference | Microsoft Docs
description: Azure REST API reference for the Usage and RateCard billing APIs.
author: bryanla
manager: mbaldwin
ms.date: 11/15/2016
ms.service: billing
ms.author: bryanla
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: rest-api
ms.assetid: bcafe4b9-0910-497d-bbb8-18c51416f665
---

# Azure Billing REST API reference

The Azure Billing APIs provide access to resource consumption and metadata information for Azure subscriptions, providing the ability to better predict and manage Azure costs. For a conceptual overview of these APIs, including feature highlights and possible usage scenarios, see the [Gain insights into your Microsoft Azure resource consumption](/azure/billing-usage-rate-card-overview) overview. 

All operations conform to the HTTP/1.1 protocol specification and each operation returns an x-ms-request-id header that can be used to obtain information about the request. You must also make sure that requests made to these resources are secure. This includes using an encrypted channel over SSL/HTTPS, and using Azure Active Directory for authentication. Please also make sure that the calling user or the service principal is a member of the Owner, Contributor or Reader role in the Azure AD tenant for the requested subscription. 

For more information on authentication and authorization, see [Azure REST API Reference](/rest).

## REST operation groups

| Operation group                                    | Description                                                                                                       |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| [Rate Card](~/docs-ref-autogen/commerce/ratecard.json)               | Provides operations for querying for the resource/meter metadata and related prices used in a given subscription. |
| [Usage](~/docs-ref-autogen/commerce/usageaggregates.json) | Provides operations for querying aggregated Azure subscription consumption data for a date range.                 |



