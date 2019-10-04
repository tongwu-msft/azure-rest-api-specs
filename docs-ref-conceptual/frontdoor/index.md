---
ms.assetid: 
title: Azure Front Door Service REST API Reference | Microsoft Docs
ms.service: cdn
author: dlepow
ms.author: danlep
ms.manager: jeconnoc
service_description: Provides a scalable and secure entry point for fast delivery of your global web applications.
---

# Azure Front Door Service REST API

Azure Front Door Service enables you to define, manage, and monitor the global routing for your web traffic by optimizing for best performance and instant global failover for high availability. With Front Door, you can transform your global (multi-region) consumer and enterprise applications into robust, high-performance personalized modern applications, APIs, and content that reach a global audience with Azure.

## REST operation groups

The Front Door Service REST API provides operations for working with the following resources.

### Front Door

| Operation group               | Description |
|-------------------------------|-------------|
| [Check Front Door Name Availability](/rest/api/frontdoorservice/frontdoor/checkfrontdoornameavailability) | Checks the availability of a Front Door resource name. |
| [Check Front Door Name Availability With Subscription](/rest/api/frontdoorservice/frontdoor/checkfrontdoornameavailabilitywithsubscription) | Checks the availability of a Front Door subdomain. |
| [Endpoints](/rest/api/frontdoorservice/frontdoor/endpoints) | Provides operations for managing Front Door endpoints. |
| [Front Doors](/rest/api/frontdoorservice/frontdoor/frontdoors) | Provides operations for managing Front Doors. |
| [Frontend Endpoints](/rest/api/frontdoorservice/frontdoor/frontendendpoints) | Provides operations for managing frontend endpoints in a Front Door. |

### Web Application Firewall

| Operation group               | Description |
|-------------------------------|-------------|
| [Policies](/rest/api/frontdoorservice/webapplicationfirewall/policies) | Provides operations for managing web application firewall policies for a Front Door. |

## See also

- [Azure Front Door Service documentation](https://docs.microsoft.com/azure/frontdoor)
