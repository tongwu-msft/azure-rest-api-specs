---
ms.assetid: 42b764a3-97dd-4a44-9205-4fe1be8bcc92
ms.title: Azure API Management
ms.service: api-management
author: steved0x
ms.author: sdanie
ms.manager: douge
---


# Azure API Management

Azure API Management provides a REST API for performing operations on selected entities, such as users, groups, products, and subscriptions. This reference provides a guide for working with the API Management REST API, as well as specific reference information for each available operation, grouped by entity.

## REST Operation Groups

| Operation Group                                                   | Description                                                                                                               |
|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| [API Management Services](./apimanagementservices)                | Provides operations for managing Azure API Management service instances.                                                  |
| [API Operations](./apioperations)                                 | Lists the operations for for an API.                                                                                      |
| [API Products](./apiproducts)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs](./apis)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](./authorizationservers)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Certificates](./certificates)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Group Users](./groupusers)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Groups](./groups)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Loggers](./loggers)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Open ID Connect Providers](./openidconnectproviders)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy Snippets](./policysnippets)                               | Provides operations for policy management.                                                                                |
| [Product APIs](./productapis)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](./productgroups)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](./productsubscriptions)                   | Lists the subscriptions to a product.                                                                                     |
| [Products](./products)                                            | Provides operations for managing products.                                                                                |
| [Property](./property)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](./regions)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](./reports)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](./subscriptions)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tenant Access](./tenantaccess)                                   | Provides operations at the root level tenant, such as access key generation.                                              |
| [Tenant Access Git](./tenantaccessgit)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](./tenantconfiguration)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [Tenant Configuration Sync State](./tenantconfigurationsyncstate) | Gets the status of the sync state between the Git configuration and the tenant.                                           |
| [User Groups](./usergroups)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](./useridentities)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](./usersubscriptions)                         | Lists subscriptions by a user.                                                                                            |
| [Users](./users)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)

