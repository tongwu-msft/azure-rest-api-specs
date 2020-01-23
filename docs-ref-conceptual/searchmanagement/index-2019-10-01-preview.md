---
title: 2019-10-01-Preview
titleSuffix: Azure Cognitive Search
description: Generally available and preview versions of the management REST API used to provision search services on Azure.
ms.prod: azure
ms.service: search
ms.topic: "language-reference"

ms.date: 01/15/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# 2019-10-01-Preview

> [!Important]
> Only those operations that differ from the generally available version are documented. Preview APIs are provided without a service level agreement, and are not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). 

This preview version of the search management REST API includes functionality for isolating the service's API endpoint from internet in two ways:

+ By setting up IP address based firewall rules
+ By provisioning search service in private mode which can be accessed only from private endpoints

For more information about mechanisms for securing access to an endpoint, see [Create a Private Endpoint for a secure connection to Azure Cognitive Search (Preview)](https://docs.microsoft.com/azure/search/service-create-private-endpoint).

This preview is available in specific data regions. For more information about regional availability, see [API versions](management-api-versions.md#preview-versions).
