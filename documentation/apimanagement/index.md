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
| [API Management Services](~/api-ref/apimanagement/ApiManagementServices.json)                | Provides operations for managing Azure API Management service instances.                                                  |
| [API Operations](~/api-ref/apimanagement/ApiOperations.json)                                 | Lists the operations for for an API.                                                                                      |
| [API Products](~/api-ref/apimanagement/ApiProducts.json)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs](~/api-ref/apimanagement/Apis.json)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](~/api-ref/apimanagement/AuthorizationServers.json)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Certificates](~/api-ref/apimanagement/Certificates.json)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Group Users](~/api-ref/apimanagement/GroupUsers.json)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Groups](~/api-ref/apimanagement/Groups.json)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Loggers](~/api-ref/apimanagement/Loggers.json)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Open ID Connect Providers](~/api-ref/apimanagement/OpenIdConnectProviders.json)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy Snippets](~/api-ref/apimanagement/PolicySnippets.json)                               | Provides operations for policy management.                                                                                |
| [Product APIs](~/api-ref/apimanagement/ProductApis.json)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](~/api-ref/apimanagement/ProductGroups.json)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](~/api-ref/apimanagement/ProductSubscriptions.json)                   | Lists the subscriptions to a product.                                                                                     |
| [Products](~/api-ref/apimanagement/Products.json)                                            | Provides operations for managing products.                                                                                |
| [Property](~/api-ref/apimanagement/Property.json)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](~/api-ref/apimanagement/Regions.json)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](~/api-ref/apimanagement/Reports.json)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](~/api-ref/apimanagement/Subscriptions.json)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tenant Access](~/api-ref/apimanagement/TenantAccess.json)                                   | Provides operations at the root level tenant, such as access key generation.                                              |
| [Tenant Access Git](~/api-ref/apimanagement/TenantAccessGit.json)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](~/api-ref/apimanagement/TenantConfiguration.json)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [Tenant Configuration Sync State](~/api-ref/apimanagement/TenantConfigurationSyncState.json) | Gets the status of the sync state between the Git configuration and the tenant.                                           |
| [User Groups](~/api-ref/apimanagement/UserGroups.json)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](~/api-ref/apimanagement/UserIdentities.json)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](~/api-ref/apimanagement/UserSubscriptions.json)                         | Lists subscriptions by a user.                                                                                            |
| [Users](~/api-ref/apimanagement/Users.json)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

