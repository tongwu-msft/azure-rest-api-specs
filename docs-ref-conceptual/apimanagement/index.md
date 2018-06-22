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

| Operation Group                                                                                     | Description                                                                                                                    |
|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| [API](xref:management.azure.com.apimanagement.api)                                                  | Provides operations for managing the APIs of a service instance.                                                               |
| [API Diagnostic](xref:management.azure.com.apimanagement.apidiagnostic)                             | Provides operations for managing Diagnostic settings for the logger in an API.                                                 |
| [API Diagnostic Logger](xref:management.azure.com.apimanagement.apidiagnosticlogger)                | Provides operations for associating Diagnostic settings with a logger in an API.                                               |
| [API Export](xref:management.azure.com.apimanagement.apiexport)                                     | Exports an API to a SAS blob.                                                                                                  |
| [API Issue](xref:management.azure.com.apimanagement.apiissue)                                       | Provides operations for managing issues for an API.                                                                            |
| [API Issue Attachment](xref:management.azure.com.apimanagement.apiissueattachment)                  | Provides operations for managing issues attachments for an API.                                                                |
| [API Issue Comment](xref:management.azure.com.apimanagement.apiissuecomment)                        | Provides operations for managing issues comments for an API.                                                                   |
| [API Management Operations](xref:management.azure.com.apimanagement.apimanagementoperations)        | Lists the operations for the API Management provider.                                                                          |
| [API Management Service](xref:management.azure.com.apimanagement.apimanagementservice)              | Provides operations for managing Azure API Management service instances.                                                       |
| [API Operation](xref:management.azure.com.apimanagement.apioperation)                               | Lists the operations for for an API.                                                                                           |
| [API Operation Policy](xref:management.azure.com.apimanagement.apioperationpolicy)                  | Provides operations for managing the policy configured at the API Operation Level of a service instance.                       |
| [APIs Policy](xref:management.azure.com.apimanagement.apipolicy)                                    | Provides operations for managing the policy configured at the Api Level of a service instance.                                 |
| [API Product](xref:management.azure.com.apimanagement.apiproduct)                                   | Lists the APIs associated with a product.                                                                                      |
| [API Release](xref:management.azure.com.apimanagement.apirelease)                                   | Provides operations for managing the API releases in a service instance.                                                       |
| [API Revisions](xref:management.azure.com.apimanagement.apirevisions)                               | Lists the API revisions associated with an API in a service instance.                                                          |
| [API Schema](xref:management.azure.com.apimanagement.apischema)                                     | Provides operations for managing the schema of an API.                                                                         |
| [API Version Set](xref:management.azure.com.apimanagement.apiversionset)                            | Provides operations for managing the Version Set of an API.                                                                    |
| [Authorization Server](xref:management.azure.com.apimanagement.authorizationserver)                 | Provides operations for managing OAuth2 authorization servers for a service instance.                                          |
| [Backend](xref:management.azure.com.apimanagement.backend)                                          | Provides operations for managing Backends for a service instance.                                                              |
| [Certificate](xref:management.azure.com.apimanagement.certificate)                                  | Provides operations for managing the certificates used for mutual certificate authentication.                                  |
| [Delegation Settings](xref:management.azure.com.apimanagement.delegationsettings)                   | Provides operations for managing Delegation Settings for Developer Portal of a service instance.                               |
| [Diagnostics](xref:management.azure.com.apimanagement.diagnostic)                                   | Provides operations for managing Diagnostic settings for the logger in a service instance.                                     |
| [Diagnostic Logger](xref:management.azure.com.apimanagement.diagnosticlogger)                       | Provides operations for associating Diagnostic settings with a logger in a service instance.                                   |
| [Email Template](xref:management.azure.com.apimanagement.emailtemplate)                             | Provides operations for managing Email Templates of a service instance.                                                        |
| [Group](xref:management.azure.com.apimanagement.group)                                              | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups.      |
| [Group User](xref:management.azure.com.apimanagement.groupuser)                                     | Provides operations for adding and removing users from a group.                                                                |
| [Identity Provider](xref:management.azure.com.apimanagement.identityprovider)                       | Provides operations for managing the Identity Providers configured for Authentication on Developer Portal of service instance. |
| [Issue](xref:management.azure.com.apimanagement.issue)                                              | Provides operations for managing issues of a service instance.                                                                 |
| [Logger](xref:management.azure.com.apimanagement.logger)                                            | Provides operations for managing Loggers used to collect events.                                                               |
| [Network Status](xref:management.azure.com.apimanagement.networkstatus)                             | Provides Api for viewing the Network Status of a service instance deployed in Virtual Network.                                 |
| [Notification](xref:management.azure.com.apimanagement.notification)                                | Provides operations for managing notifications for a service instance.                                                         |
| [Notifications Recipient Email](xref:management.azure.com.apimanagement.notificationrecipientemail) | Provides operations for managing email recipients configured for notifications in a service instance.                          |
| [Notifications Recipient User](xref:management.azure.com.apimanagement.notificationrecipientuser)   | Provides operations for managing email recipient users configured for notificatoins in a service instance.                     |
| [Open ID Connect Providers](xref:management.azure.com.apimanagement.openidconnectprovider)          | Provides operations for managing the Open ID Connect Providers for the service instance.                                       |
| [Policy](xref:management.azure.com.apimanagement.policy)                                            | Provides operations for policy management at the global service instance level.                                                |
| [Policy Snippets](xref:management.azure.com.apimanagement.policysnippets)                           | Lists the policies available in service instance.                                                                              |
| [Product](xref:management.azure.com.apimanagement.product)                                          | Provides operations for managing products.                                                                                     |
| [Product API](xref:management.azure.com.apimanagement.productapi)                                   | Provides operations for configuring which APIs associated with a product.                                                      |
| [Product Group](xref:management.azure.com.apimanagement.productgroup)                               | Provides operations for configuring which groups that have visibility to a product.                                            |
| [Product Policy](xref:management.azure.com.apimanagement.productpolicy)                             | Provides operations for managing the policy configured at the Product Level of a service instance.                             |
| [Product Subscriptions](xref:management.azure.com.apimanagement.productsubscriptions)               | Lists the subscriptions to a product.                                                                                          |
| [Property](xref:management.azure.com.apimanagement.property)                                        | Provides operations for creating and updating the property collection for the service instance.                                |
| [Quota By Counter Keys](xref:management.azure.com.apimanagement.quotabycounterkeys)                 | Provides operations for managing the quota by counter keys.                                                                    |
| [Quota By Period Keys](xref:management.azure.com.apimanagement.quotabyperiodkeys)                   | Provides operations for managing the quota by period keys.                                                                     |
| [Regions](xref:management.azure.com.apimanagement.regions)                                          | Lists the Azure regions in which the API Management service is available.                                                      |
| [Reports](xref:management.azure.com.apimanagement.reports)                                          | Provides usage reports for the service instance.                                                                               |
| [Subscriptions](xref:management.azure.com.apimanagement.subscription)                               | Provides operations for managing product subscriptions.                                                                        |
| [Sign In Settings](xref:management.azure.com.apimanagement.signinsettings)                          | Provides operations for managing the SignIn settings on Developer Portal for a service instance.                               |
| [Sign Up Settings](xref:management.azure.com.apimanagement.signupsettings)                          | Provides operations for managing the SignUp settings on Developer Portal for a service instance.                               |
| [Subscription](xref:management.azure.com.apimanagement.subscription)                                | Provides operations for managing product subscriptions.                                                                        |
| [Tag Description](xref:management.azure.com.apimanagement.tagdescription)                           | Provides operations for managing the Description of Tags.                                                                      |
| [Tag Entity](xref:management.azure.com.apimanagement.tagentity)                                     | Provides operations for managing the Tag entity associated with Apis, Products, Operations.                                    |
| [Tag Resource](xref:management.azure.com.apimanagement.tagresource)                                 | List the collection of resources associated with tags.                                                                         |
| [Tenant Access](xref:management.azure.com.apimanagement.tenantaccess)                               | Provides operations at the root level tenant, such as access key generation.                                                   |
| [Tenant Access Git](xref:management.azure.com.apimanagement.tenantaccessgit)                        | Provides operations for managing the Git configuration for the tenant.                                                         |
| [Tenant Configuration](xref:management.azure.com.apimanagement.tenantconfiguration)                 | Provides operations for synchronizing the Git state with the tenant state.                                                     |
| [User](xref:management.azure.com.apimanagement.user)                                                | Provides operations for managing the users of the service instance.                                                            |
| [User Group](xref:management.azure.com.apimanagement.usergroup)                                     | Lists the groups to which a user belongs.                                                                                      |
| [User Identities](xref:management.azure.com.apimanagement.useridentities)                           | Lists identities used by a user.                                                                                               |
| [User Subscription](xref:management.azure.com.apimanagement.usersubscription)                       | Lists subscriptions by a user.                                                                                                 |

## See Also

- [Azure API Management documentation](https://azure.microsoft.com/documentation/services/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

