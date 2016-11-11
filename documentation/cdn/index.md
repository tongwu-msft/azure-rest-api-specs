---
ms.assetid: 987a76ca-b62e-4525-ac07-bbde73abce05
ms.title: Azure CDN REST API Reference | Microsoft Docs
ms.service: cdn
author: mmacy
ms.author: marsma
ms.manager: erikre
---

# Azure CDN REST API

The Azure Content Delivery Network (CDN) caches static web content at strategically placed locations to provide maximum throughput for delivering content to users. The CDN offers developers a global solution for delivering high-bandwidth content by caching the content at physical nodes across the world.

## REST operation groups

The CDN REST API provides operations for working with the following resources.

| Operation group               | Description |
|-------------------------------|-------------|
| [Custom Domains](~/api-ref/cdn/customdomains.json) | Provides operations for working with CDN custom domains. |
| [Endpoints](~/api-ref/cdn/endpoints.json) | Create, validate, start, stop, and delete CDN endpoints. Pre-load and purge cached endpoint content. |
| [Name Availability](~/api-ref/cdn/nameavailability.json) | Verify the uniqueness of resource names. |
| [Operations](~/api-ref/cdn/operations.json) | Provides information about CDN REST API operations. |
| [Origins](~/api-ref/cdn/origins.json) | Manage origins within an endpoint. |
| [Profiles](~/api-ref/cdn/profiles.json) | Operations for managing CDN profiles. A CDN profile is a collection of CDN endpoints. |

## See also

- [Azure CDN documentation](https://review.docs.microsoft.com/azure/cdn)