---
ms.assetid: bcafe4b9-0910-497d-bbb8-18c51416f665
ms.title: Azure Billing REST API reference | Microsoft Docs
ms.prod: azure
ms.service: billing
author: bryanla
ms.author: bryanla
ms.manager: mbaldwin
---

# Azure Billing REST API reference

The Azure Billing APIs provide access to resource consumption and metadata information for Azure subscriptions, providing the ability to better predict and manage Azure costs. 

> [!IMPORTANT]  
>  The metadata associated with the billing meters, including but not limited to service names, types, resources, units of measure, and regions, is subject to change at any time and without notice. If you intend to use this billing data in an automated fashion, please use the billing meter GUID to uniquely identify each billable item. If the billing meter GUID is scheduled to change due to a new billing model, you will be notified in advance of the change. 


## Common parameters and headers
All of the Billing API REST operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` response header that can be used to obtain information about the request. You must also make sure that requests made to these resources are secure. This includes using an encrypted channel over SSL/HTTPS, and using Azure Active Directory for authentication. Please also make sure that the calling user or the service principal is a member of the Owner, Contributor or Reader role in the Azure AD tenant for the requested subscription.

The following information is common to all Billing APIs:

- Replace `{subscription-Id}` in the request URI with your subscription identifier.
- Replace `{api-version}` in the request URI with the appropriate API version (see the Usage and Rate Card operations for details)
- Set the `Content-Type` request header to application/json.
- Set the `Authorization` request header to an OAuth bearer token formatted as a JSON Web Token, which you obtain from Azure Active Directory. For more information, see [Azure REST API Reference](/rest).

## REST operation groups

| Operation group                                    | Description                                                                                                       |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| [Rate Card](~/docs-ref-autogen/commerce/ratecard.json)               | Provides operations for querying the resource/meter metadata and related prices used in a given subscription. |
| [Usage](~/docs-ref-autogen/commerce/usageaggregates.json) | Provides operations for querying aggregated Azure subscription consumption data for a date range, including both the usage data that was considered for billing, and any usage at the end of the billing cycle that was discarded due to lateness.                 |

## See also
- For a conceptual overview of these APIs, including feature highlights and possible usage scenarios, see the [Gain insights into your Microsoft Azure resource consumption](/azure/billing-usage-rate-card-overview) overview. 
