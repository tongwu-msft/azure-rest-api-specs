---
ms.assetid: 26d66df1-84d9-4abc-980e-7995d846399d
title: Azure Billing REST API | Microsoft Docs
author: jlian
ms.author: jlian
ms.date: 04/25/2017 
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api 
---

# Azure Billing REST API

Azure Billing API (preview) provides programmatic access to your Azure billing information and invoices. 

> [!IMPORTANT]  
>  To use this API, the account admin must opt in via the Azure portal. See [Manage access to Azure billing using roles](https://docs.microsoft.com/azure/billing/billing-manage-access).

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Invoices](https://docs.microsoft.com/rest/api/billing/invoices)         | Operations for listing names and download URLs for Azure invoices. |

## Common parameters and headers
All of the Billing API REST operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` response header that can be used to obtain information about the request. You must also make sure that requests made to these resources are secure. This includes using an encrypted channel over SSL/HTTPS, and using Azure Active Directory for authentication. Please also make sure that the calling user or the service principal is a member of the Owner, Contributor or Reader role in the Azure AD tenant for the requested subscription.

- Replace `{subscription-Id}` in the request URI with your subscription identifier.
- Replace `{api-version}` with `2017-02-27-preview`. 
- Set the `Content-Type` request header to `application/json`.
- Set the `Authorization` request header to an OAuth bearer token formatted as a JSON Web Token, which you obtain from Azure Active Directory. For more information, see [Azure REST API Reference](/rest/api).

## See also

- [Azure Billing documentation](https://docs.microsoft.com/azure/billing/)
