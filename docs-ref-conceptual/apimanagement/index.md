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
| [API Management Services](~/docs-ref-autogen/apimanagement/ApiManagementServices.json)                | Provides operations for managing Azure API Management service instances.                                                  |
| [API Operations](~/docs-ref-autogen/apimanagement/ApiOperations.json)                                 | Lists the operations for for an API.                                                                                      |
| [API Products](~/docs-ref-autogen/apimanagement/ApiProducts.json)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs](~/docs-ref-autogen/apimanagement/Apis.json)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](~/docs-ref-autogen/apimanagement/AuthorizationServers.json)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Certificates](~/docs-ref-autogen/apimanagement/Certificates.json)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Group Users](~/docs-ref-autogen/apimanagement/GroupUsers.json)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Groups](~/docs-ref-autogen/apimanagement/Groups.json)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Loggers](~/docs-ref-autogen/apimanagement/Loggers.json)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Open ID Connect Providers](~/docs-ref-autogen/apimanagement/OpenIdConnectProviders.json)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy Snippets](~/docs-ref-autogen/apimanagement/PolicySnippets.json)                               | Provides operations for policy management.                                                                                |
| [Product APIs](~/docs-ref-autogen/apimanagement/ProductApis.json)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](~/docs-ref-autogen/apimanagement/ProductGroups.json)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](~/docs-ref-autogen/apimanagement/ProductSubscriptions.json)                   | Lists the subscriptions to a product.                                                                                     |
| [Products](~/docs-ref-autogen/apimanagement/Products.json)                                            | Provides operations for managing products.                                                                                |
| [Property](~/docs-ref-autogen/apimanagement/Property.json)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](~/docs-ref-autogen/apimanagement/Regions.json)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](~/docs-ref-autogen/apimanagement/Reports.json)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](~/docs-ref-autogen/apimanagement/Subscriptions.json)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tenant Access](~/docs-ref-autogen/apimanagement/TenantAccess.json)                                   | Provides operations at the root level tenant, such as access key generation.                                              |
| [Tenant Access Git](~/docs-ref-autogen/apimanagement/TenantAccessGit.json)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](~/docs-ref-autogen/apimanagement/TenantConfiguration.json)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [Tenant Configuration Sync State](~/docs-ref-autogen/apimanagement/TenantConfigurationSyncState.json) | Gets the status of the sync state between the Git configuration and the tenant.                                           |
| [User Groups](~/docs-ref-autogen/apimanagement/UserGroups.json)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](~/docs-ref-autogen/apimanagement/UserIdentities.json)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](~/docs-ref-autogen/apimanagement/UserSubscriptions.json)                         | Lists subscriptions by a user.                                                                                            |
| [Users](~/docs-ref-autogen/apimanagement/Users.json)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

