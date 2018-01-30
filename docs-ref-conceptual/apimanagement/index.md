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
| [API Operation Policy](~/docs-ref-autogen/apimanagement/ApiOperationPolicy.yml)                     | Provides operations for managing the policy configured at the API Operation Level of a service instance.                  |
| [API Products](~/docs-ref-autogen/apimanagement/ApiProduct.yml)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs Policy](~/docs-ref-autogen/apimanagement/ApiPolicy.yml)                                       | Provides operations for managing the policy configured at the Api Level of a service instance.                            |
| [API Releases](~/docs-ref-autogen/apimanagement/ApiRelease.yml)                                     | Provides operations for managing the API releases in a service instance.                                                  |
| [API Revisions](~/docs-ref-autogen/apimanagement/ApiRevisions.yml)                                  | Lists the API revisions associated with an API in a service instance.                                                     |
| [APIs](~/docs-ref-autogen/apimanagement/Api.yml)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](~/docs-ref-autogen/apimanagement/AuthorizationServer.yml)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Backends](~/docs-ref-autogen/apimanagement/Backend.yml)                                            | Provides operations for managing Backends for a service instance.                                                         |
| [Certificates](~/docs-ref-autogen/apimanagement/Certificate.yml)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Delegation Settings](~/docs-ref-autogen/apimanagement/DelegationSettings.yml)                      | Provides operations for managing Delegation Settings for Developer Portal of a service instance.                          |
| [Diagnostics](~/docs-ref-autogen/apimanagement/Diagnostic.yml)                                      | Provides operations for managing Diagnostic settings for the logger in a service instance.                                |
| [Diagnostic Logger](~/docs-ref-autogen/apimanagement/DiagnosticLogger.yml)                          | Provides operations for associating Diagnostic settings with a logger in a service instance.                              |
| [Email Templates](~/docs-ref-autogen/apimanagement/EmailTemplate.yml)                               | Provides operations for managing Email Templates of a service instance.                                                  |
| [Groups](~/docs-ref-autogen/apimanagement/Group.yml)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Group Users](~/docs-ref-autogen/apimanagement/GroupUser.yml)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Identity Providers](~/docs-ref-autogen/apimanagement/IdentityProvider.yml)                         | Provides operations for managing the Identity Providers configured for Authentication on Developer Portal of service instance.|
| [Loggers](~/docs-ref-autogen/apimanagement/Logger.yml)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Network Status](~/docs-ref-autogen/apimanagement/NetworkStatus.yml)                                | Providers Api for viewing the Network Status of a service instance deployed in Virtual Network.                           |
| [Notifications](~/docs-ref-autogen/apimanagement/Notification.yml)                                  | Providers operations for managing notifications for a service instance.                                                   |
| [Notifications Email Recipients](~/docs-ref-autogen/apimanagement/NotificationRecipientEmail.yml)   | Providers operations for managing email recipients configured for a notifications in a service instance.                  |
| [Open ID Connect Providers](~/docs-ref-autogen/apimanagement/OpenIdConnectProvider.yml)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy](~/docs-ref-autogen/apimanagement/Policy.yml)                                               | Provides operations for policy management at the global service instance level.                                           |
| [Policy Snippets](~/docs-ref-autogen/apimanagement/PolicySnippets.yml)                               | Lists the policies available in service instance.                                                                         |
| [Products](~/docs-ref-autogen/apimanagement/Product.yml)                                            | Provides operations for managing products.                                                                                |
| [Product Policy](~/docs-ref-autogen/apimanagement/ProductPolicy.yml)                                | Provides operations for managing the policy configured at the Product Level of a service instance.                        |
| [Product APIs](~/docs-ref-autogen/apimanagement/ProductApi.yml)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](~/docs-ref-autogen/apimanagement/ProductGroup.yml)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](~/docs-ref-autogen/apimanagement/ProductSubscriptions.yml)                   | Lists the subscriptions to a product.                                                                                     |
| [Property](~/docs-ref-autogen/apimanagement/Property.yml)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](~/docs-ref-autogen/apimanagement/Regions.yml)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](~/docs-ref-autogen/apimanagement/Reports.yml)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](~/docs-ref-autogen/apimanagement/Subscription.yml)                                  | Provides operations for managing product subscriptions.                                                                   |
| [SignIn Settings](~/docs-ref-autogen/apimanagement/SignInSettings.yml)                               | Provides operations for managing the SignIn settings on Developer Portal for a service instance.                          |
| [SignUp Settings](~/docs-ref-autogen/apimanagement/SignUpSettings.yml)                               | Provides operations for managing the SignUp settings on Developer Portal for a service instance.                          |
| [Subscriptions](~/docs-ref-autogen/apimanagement/Subscription.yml)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tenant Access](~/docs-ref-autogen/apimanagement/TenantAccess.yml)                                   | Provides operations at the root level tenant, such as access key generation.                                              |
| [Tenant Access Git](~/docs-ref-autogen/apimanagement/TenantAccessGit.yml)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](~/docs-ref-autogen/apimanagement/TenantConfiguration.yml)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [User Groups](~/docs-ref-autogen/apimanagement/UserGroup.yml)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](~/docs-ref-autogen/apimanagement/UserIdentities.yml)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](~/docs-ref-autogen/apimanagement/UserSubscription.yml)                         | Lists subscriptions by a user.                                                                                            |
| [Users](~/docs-ref-autogen/apimanagement/User.yml)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

