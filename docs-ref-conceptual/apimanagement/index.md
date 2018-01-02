---
ms.assetid: 42b764a3-97dd-4a44-9205-4fe1be8bcc92
ms.title: Azure API Management
ms.service: api-management
author: steved0x
ms.author: sdanie
ms.manager: douge
service_description: To be added
---


# Azure API Management

Azure API Management provides a REST API for performing operations on selected entities, such as users, groups, products, and subscriptions. This reference provides a guide for working with the API Management REST API, as well as specific reference information for each available operation, grouped by entity.

## REST Operation Groups

| Operation Group                                                   | Description                                                                                                               |
|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| [API Management Services](~/docs-ref-autogen/apimanagement/ApiManagementService.yml)                | Provides operations for managing Azure API Management service instances.                                                  |
| [API Operations](~/docs-ref-autogen/apimanagement/ApiOperation.yml)                                 | Lists the operations for for an API.                                                                                      |
| [API Products](~/docs-ref-autogen/apimanagement/ApiProduct.yml)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs](~/docs-ref-autogen/apimanagement/Api.yml)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](~/docs-ref-autogen/apimanagement/AuthorizationServer.yml)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Certificates](~/docs-ref-autogen/apimanagement/Certificate.yml)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Group Users](~/docs-ref-autogen/apimanagement/GroupUser.yml)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Groups](~/docs-ref-autogen/apimanagement/Group.yml)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Loggers](~/docs-ref-autogen/apimanagement/Logger.yml)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Open ID Connect Providers](~/docs-ref-autogen/apimanagement/OpenIdConnectProvider.yml)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy Snippets](~/docs-ref-autogen/apimanagement/PolicySnippet.yml)                               | Provides operations for policy management.                                                                                |
| [Product APIs](~/docs-ref-autogen/apimanagement/ProductApi.yml)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](~/docs-ref-autogen/apimanagement/ProductGroup.yml)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](~/docs-ref-autogen/apimanagement/ProductSubscriptions.yml)                   | Lists the subscriptions to a product.                                                                                     |
| [Products](~/docs-ref-autogen/apimanagement/Product.yml)                                            | Provides operations for managing products.                                                                                |
| [Property](~/docs-ref-autogen/apimanagement/Property.yml)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](~/docs-ref-autogen/apimanagement/Regions.yml)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](~/docs-ref-autogen/apimanagement/Reports.yml)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](~/docs-ref-autogen/apimanagement/Subscription.yml)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tenant Access](~/docs-ref-autogen/apimanagement/TenantAccess.yml)                                   | Provides operations at the root level tenant, such as access key generation.                                              |
| [Tenant Access Git](~/docs-ref-autogen/apimanagement/TenantAccessGit.yml)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](~/docs-ref-autogen/apimanagement/TenantConfiguration.yml)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [Tenant Configuration Sync State](~/docs-ref-autogen/apimanagement/TenantConfigurationSyncState.yml) | Gets the status of the sync state between the Git configuration and the tenant.                                           |
| [User Groups](~/docs-ref-autogen/apimanagement/UserGroups.yml)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](~/docs-ref-autogen/apimanagement/UserIdentities.yml)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](~/docs-ref-autogen/apimanagement/UserSubscription.yml)                         | Lists subscriptions by a user.                                                                                            |
| [Users](~/docs-ref-autogen/apimanagement/User.yml)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

