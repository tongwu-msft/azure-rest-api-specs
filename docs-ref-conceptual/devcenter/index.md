---
title: Dev Center REST API reference | Microsoft Docs
description: API reference documentation for the operations available in the Dev Center Management REST API, a RESTful web service for managing Dev Center Management resources in Azure.
ms.service: dev-box
---

# Dev Center Management REST API Reference

Microsoft Dev Box is a service that enables you to provide preconfigured cloud-based workstations to your users throiugh dev centers. Developers, testers, QA professionals, and others who need to get productive quickly on new projects can self-serve multiple dev boxes customized for their workloads. To learn more about Dev Box, see [What is Microsoft Dev Box?](/azure/dev-box/overview-what-is-microsoft-dev-box).


The Dev Center Management REST API provides operations for working with the Microsoft Dev Box service through the Microsoft.DevCenter provider.

## REST operation groups

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Attached Networks](/rest/api/devcenter/attached-networks)          | Provides operations for attaching Network Connections to your Dev Center |
| [DevCenters](/rest/api/devcenter/devcenters)  | Provides operations for IT Admins to manage with Dev Centers. |
| [Dev Box Definitions](/rest/api/devcenter/dev-box-definitions)  | Provides operations for working with Dev Box Definitions accounts. |
| [Galleries](/rest/api/devcenter/galleries)  | Provides operations for attaching Compute Galleries to your Dev Center. |
| [Image Versions](/rest/api/devcenter/image-versions) | Gets information about image versions available for use. |
| [Images](/rest/api/devcenter/images) | Gets information about images available for use |
| [Network Connections](/rest/api/devcenter/network-connections) | Provides operations for working with Network Connections to attach a VNet to a Dev Center |
| [Operations](/rest/api/devcenter/operations) | Lists available operations for the Microsoft.DevCenter provider. |
| [Pools](/rest/api/devcenter/pools) | Provides operations for working with pools in your Project. |
| [Projects](/rest/api/devcenter/projects) | Provides operations for working with Projects. |
| [Skus](/rest/api/devcenter/skus) | Gets information about Skus available to use. |

## See also

- [Microsoft Dev Box documentation](/azure/dev-box/overview-what-is-microsoft-dev-box)
