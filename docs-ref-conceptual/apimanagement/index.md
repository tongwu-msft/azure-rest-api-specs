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
| [API Management Services](xref:management.azure.com.apimanagement.apimanagementservice)                | Provides operations for managing Azure API Management service instances.                                                  |
| [API Operations](xref:management.azure.com.apimanagement.apioperation)                                 | Lists the operations for for an API.                                                                                      |
| [API Operation Policy](xref:management.azure.com.apimanagement.apioperationpolicy)                     | Provides operations for managing the policy configured at the API Operation Level of a service instance.                  |
| [API Products](xref:management.azure.com.apimanagement.apiproduct)                                     | Lists the APIs associated with a product.                                                                                 |
| [APIs Policy](xref:management.azure.com.apimanagement.apipolicy)                                       | Provides operations for managing the policy configured at the Api Level of a service instance.                            |
| [API Releases](xref:management.azure.com.apimanagement.apirelease)                                     | Provides operations for managing the API releases in a service instance.                                                  |
| [API Revisions](xref:management.azure.com.apimanagement.apirevisions)                                  | Lists the API revisions associated with an API in a service instance.                                                     |
| [APIs](xref:management.azure.com.apimanagement.api)                                                    | Provides operations for managing the APIs of a service instance.                                                          |
| [Authorization Servers](xref:management.azure.com.apimanagement.authorizationserver)                   | Provides operations for managing OAuth2 authorization servers for a service instance.                                     |
| [Backends](xref:management.azure.com.apimanagement.backend)                                            | Provides operations for managing Backends for a service instance.                                                         |
| [Certificates](xref:management.azure.com.apimanagement.certificate)                                    | Provides operations for managing the certificates used for mutual certificate authentication.                             |
| [Delegation Settings](xref:management.azure.com.apimanagement.delegationsettings)                      | Provides operations for managing Delegation Settings for Developer Portal of a service instance.                          |
| [Diagnostics](xref:management.azure.com.apimanagement.diagnostic)                                      | Provides operations for managing Diagnostic settings for the logger in a service instance.                                |
| [Diagnostic Logger](xref:management.azure.com.apimanagement.diagnosticlogger)                          | Provides operations for associating Diagnostic settings with a logger in a service instance.                              |
| [Email Templates](xref:management.azure.com.apimanagement.emailtemplate)                               | Provides operations for managing Email Templates of a service instance.                                                  |
| [Groups](xref:management.azure.com.apimanagement.group)                                                | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Group Users](xref:management.azure.com.apimanagement.groupuser)                                       | Provides operations for adding and removing users from a group.                                                           |
| [Identity Providers](xref:management.azure.com.apimanagement.identityprovider)                         | Provides operations for managing the Identity Providers configured for Authentication on Developer Portal of service instance.|
| [Loggers](xref:management.azure.com.apimanagement.logger)                                              | Provides operations for managing Loggers used to collect events.                                                          |
| [Network Status](xref:management.azure.com.apimanagement.networkstatus)                                | Providers Api for viewing the Network Status of a service instance deployed in Virtual Network.                           |
| [Notifications](xref:management.azure.com.apimanagement.notification)                                  | Providers operations for managing notifications for a service instance.                                                   |
| [Notifications Email Recipients](xref:management.azure.com.apimanagement.notificationrecipientemail)   | Providers operations for managing email recipients configured for a notifications in a service instance.                  |
| [Open ID Connect Providers](xref:management.azure.com.apimanagement.openidconnectprovider)             | Provides operations for managing the Open ID Connect Providers for the service instance.                                  |
| [Policy](xref:management.azure.com.apimanagement.policy)                                               | Provides operations for policy management at the global service instance level.                                           |
| [Policy Snippets](xref:management.azure.com.apimanagement.policysnippets)                               | Lists the policies available in service instance.                                                                         |
| [Products](xref:management.azure.com.apimanagement.product)                                            | Provides operations for managing products.                                                                                |
| [Product Policy](xref:management.azure.com.apimanagement.productpolicy)                                | Provides operations for managing the policy configured at the Product Level of a service instance.                        |
| [Product APIs](xref:management.azure.com.apimanagement.productapi)                                     | Provides operations for configuring which APIs associated with a product.                                                 |
| [Product Groups](xref:management.azure.com.apimanagement.productgroup)                                 | Provides operations for configuring which groups that have visibility to a product.                                       |
| [Product Subscriptions](xref:management.azure.com.apimanagement.productsubscriptions)                   | Lists the subscriptions to a product.                                                                                     |
| [Property](xref:management.azure.com.apimanagement.property)                                            | Provides operations for creating and updating the property collection for the service instance.                           |
| [Regions](xref:management.azure.com.apimanagement.regions)                                              | Lists the Azure regions in which the API Management service is available.                                                 |
| [Reports](xref:management.azure.com.apimanagement.reports)                                              | Provides usage reports for the service instance.                                                                          |
| [Subscriptions](xref:management.azure.com.apimanagement.subscription)                                  | Provides operations for managing product subscriptions.                                                                   |
| [SignIn Settings](xref:management.azure.com.apimanagement.signinsettings)                               | Provides operations for managing the SignIn settings on Developer Portal for a service instance.                          |
| [SignUp Settings](xref:management.azure.com.apimanagement.signupsettings)                               | Provides operations for managing the SignUp settings on Developer Portal for a service instance.                          |
| [Subscriptions](xref:management.azure.com.apimanagement.subscription)                                  | Provides operations for managing product subscriptions.                                                                   |
| [Tag Description](xref:management.azure.com.apimanagement.tagdescription)                               | Provides operations at the root level tenant, such as access key generation.  
| [Tenant Entity](xref:management.azure.com.apimanagement.tagentity)                                   | Provides operations for managing the Description of Tags.                                                                  |
| [Tenant Resource](xref:management.azure.com.apimanagement.tagresource)                                   | Provides operations for managing the Tag entity associated with Apis, Products, Operations.                             |
| [Tenant Access](xref:management.azure.com.apimanagement.tenantaccess)                                   | List the collection of resources associated with tags.                                                                   |
| [Tenant Access Git](xref:management.azure.com.apimanagement.tenantaccessgit)                            | Provides operations for managing the Git configuration for the tenant.                                                    |
| [Tenant Configuration](xref:management.azure.com.apimanagement.tenantconfiguration)                     | Provides operations for synchronizing the Git state with the tenant state.                                                |
| [User Groups](xref:management.azure.com.apimanagement.usergroup)                                       | Lists the groups to which a user belongs.                                                                                 |
| [User Identities](xref:management.azure.com.apimanagement.useridentities)                               | Lists identities used by a user.                                                                                          |
| [User Subscriptions](xref:management.azure.com.apimanagement.usersubscription)                         | Lists subscriptions by a user.                                                                                            |
| [Users](xref:management.azure.com.apimanagement.user)                                                  | Provides operations for managing the users of the service instance.                                                       |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

