---
ms.assetid: 987a76ca-b62e-4525-ac07-bbde73abce05
ms.title: Azure CDN REST API Reference | Microsoft Docs
ms.service: cdn
author: mmacy
ms.author: marsma
ms.manager: erikre
service_description: To be added
---

# Azure CDN REST API

The Azure Content Delivery Network (CDN) caches static web content at strategically placed locations to provide maximum throughput for delivering content to users. The CDN offers developers a global solution for delivering high-bandwidth content by caching the content at physical nodes across the world.

## REST operation groups

The CDN REST API provides operations for working with the following resources.

| Operation group               | Description |
|-------------------------------|-------------|
| [Check Name Availability](xref:management.azure.com.cdn.checknameavailability) | Verify the uniqueness of resource names. |
| [Check Resource Usage](xref:management.azure.com.cdn.resourceusage) | Discover quotas and usage of CDN profiles. |
| [Custom Domains](xref:management.azure.com.cdn.customdomains) | Provides operations for working with CDN custom domains. |
| [Edge Nodes](xref:management.azure.com.cdn.edgenodes) | Obtain information about CDN edge nodes. |
| [Endpoints](xref:management.azure.com.cdn.endpoints) | Create, validate, start, stop, and delete CDN endpoints. Pre-load and purge cached endpoint content. |
| [List Operations](xref:management.azure.com.cdn.operations) | Provides information about CDN REST API operations. |
| [Origins](xref:management.azure.com.cdn.origins) | Manage origins within an endpoint. |
| [Profiles](xref:management.azure.com.cdn.profiles) | Operations for managing CDN profiles. A CDN profile is a collection of CDN endpoints. |

## See also

- [Azure CDN documentation](https://docs.microsoft.com/azure/cdn)
