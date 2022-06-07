---
ms.assetid: 
title: Azure Front Door Service REST API Reference | Microsoft Docs
description: Learn how Azure Front Door Service enables you to define, manage, and monitor the global routing for your web traffic.
ms.date: "10/04/2019"
ms.service: frontdoor
author: dlepow
ms.author: danlep
ms.manager: gwallace
service_description: Provides a scalable and secure entry point for fast delivery of your global web applications.
---

# Azure Front Door Service REST API

Azure Front Door Service enables you to define, manage, and monitor the global routing for your web traffic by optimizing for best performance and instant global failover for high availability. With Front Door, you can transform your global (multi-region) consumer and enterprise applications into robust, high-performance personalized modern applications, APIs, and content that reach a global audience with Azure.

## REST operation groups

The Front Door Service REST API provides operations for working with the following resources.

### Azure Front Door Standard and Premium

| Operation group               | Description |
|-------------------------------|-------------|
| [AFD Custom Domains](/rest/api/frontdoor/azurefrontdoorstandardpremium/afd-custom-domains) | Provides operations for working with AFD custom domains. |
| [AFD Endpoints](/rest/api/frontdoorservice/frontdoor/azurefrontdoorstandardpremium/afd-endpoints) | Create, validate, enable, disable and delete AFD endpoints.  |
| [AFD Origin Groups](/rest/api/frontdoor/azurefrontdoorstandardpremium/afd-origin-groups) | Operations for managing AFD origin groups, health probe and load balancing across origins. |
| [AFD Origins](/rest/api/frontdoor/azurefrontdoorstandardpremium/afd-origins) | Operations for managing AFD origins, private link and certificate name check. |
| [AFD Profiles](/rest/api/frontdoor/azurefrontdoorstandardpremium/afd-profiles) | Operations for managing AFD profiles. An AFD profile is a collection of AFD endpoints. Purge cached content or configure origin response timeout. |
| [Check Endpoint Name Availability](/rest/api/frontdoor/azurefrontdoorstandardpremium/Check-Endpoint-Name-Availability) | Check the availability of a resource name. This is needed for resources where name is globally unique, such as an AFD endpoint. |
| [Log Analytics](/rest/api/frontdoor/azurefrontdoorstandardpremium/log-analytics) | Get AFD traffic and WAF reports. |
| [Routes](/rest/api/frontdoor/azurefrontdoorstandardpremium/routes) | Provides operations for managing routing rules between domains and origin groups, along with rules set.|
| [Rules Sets](/rest/api/frontdoor/azurefrontdoorstandardpremium/rule-sets) | Operation for managing AFD rules engine set to customize how requirests get process at the edge. Rules set is a collection of rules. |
| [Rules](/rest/api/frontdoor/azurefrontdoorstandardpremium/rules) | Operation for managing AFD rules engine rules to customize how requirests get process at the edge. |
| [Secrets](/rest/api/frontdoor/azurefrontdoorstandardpremium/secrets) | Operation for managing AFD secrets for bring your TLS certificate. |
| [Security Policies](/rest/api/frontdoor/azurefrontdoorstandardpremium/security-policies) | Operations for managing WAF policies and its association with domains.|
| [Validate](/rest/api/frontdoor/azurefrontdoorstandardpremium/validate) | Validate a Secret in the profile.|

### Front Door (classic)

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
