---
title: "Azure Purview Resource Provider Rest API"
description: Learn how to run Azure Purview Resource Provider Rest APIs.
ms.date: "03/30/2021"
ms.service: purview
author: nayenama
ms.author: nayenama
---

# Azure Purview Resource Provider Rest API

[Azure Purview](https://azure.microsoft.com/services/purview/) Azure Purview is a unified data governance service that helps you manage and govern your on-premises, multi-cloud, and software-as-a-service (SaaS) data. Easily create a holistic, up-to-date map of your data landscape with automated data discovery, sensitive data classification, and end-to-end data lineage. Empower data consumers to find valuable, trustworthy data. The latest version is 2020-12-01-preview.

## Authorization Token

All Azure Resource Manager REST calls require a valid authorization token in the request header to succeed. See  [Create the request: Acquire an access token](~/index.md#create-the-request) for details on how to obtain this authorization token.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Accounts](/rest/api/purview/accounts)| Provides operations to manage purview accounts including account name avaialblity, creating or updating account resources and listing accounts by resource group or subscription. |
|[Default Accounts](/rest/api/purview/defaultaccounts)| Provides operations to manage default account for a scope (tenant). |
|[Operations](/rest/api/purview/operations)| Provides operations to manage Azure Purview resource. |
|[Private Endpoint connections](/rest/api/purview/privateendpointconnections)| Provides operations to manage Private end point connections for Azure Purivew accounts including approving or rejcting private end point connection request. |
|[Private Link Resources](/rest/api/purview/privatelinkresources)| Provides operations to manage private link resources for Azure Purview. |

## See Also

- [Azure Purview](https://azure.microsoft.com/services/purview/)

