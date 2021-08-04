---
ms.assetid: 42b764a3-97dd-4a44-9205-4fe1be8bcc92
title: Azure API Management
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
| [API](xref:management.azure.com.apimanagement.2020-12-01.apis)                                                  | Provides operations for managing the APIs of a service instance.                                                               |
| [API Diagnostic](xref:management.azure.com.apimanagement.2020-12-01.api-diagnostic)                             | Provides operations for managing Diagnostic settings for the logger in an API.                                                 |
| [API Export](xref:management.azure.com.apimanagement.2020-12-01.api-export)                                     | Exports an API to a SAS blob.                                                                                                  |
| [API Issue](xref:management.azure.com.apimanagement.2020-12-01.api-issue)                                       | Provides operations for managing issues for an API.                                                                            |
| [API Issue Attachment](xref:management.azure.com.apimanagement.2020-12-01.api-issue-attachment)                  | Provides operations for managing issues attachments for an API.                                                                |
| [API Issue Comment](xref:management.azure.com.apimanagement.2020-12-01.api-issue-comment)                        | Provides operations for managing issues comments for an API.                                                                   |
| [API Management Operations](xref:management.azure.com.apimanagement.2020-12-01.api-management-operations)        | Lists the operations for the API Management provider.                                                                          |
| [API Management Service](xref:management.azure.com.apimanagement.2020-12-01.api-management-service)              | Provides operations for managing Azure API Management service instances.  |
| [API Management Service Skus](xref:management.azure.com.apimanagement.2020-12-01.api-management-service-skus)              | Provides operations for managing Azure API Management service SKUs. |
| [API Management Skus](xref:management.azure.com.apimanagement.2020-12-01.api-management-skus)              | Provides operations for the available Azure API Management SKUs for your subscription.                                                                |
| [API Operation](xref:management.azure.com.apimanagement.2020-12-01.api-operation)                               | Lists the operations for an API.                                                                                           |
| [API Operation Policy](xref:management.azure.com.apimanagement.2020-12-01.api-operation-policy)                  | Provides operations for managing the policy configured at the API Operation Level of a service instance.                       |
| [APIs Policy](xref:management.azure.com.apimanagement.2020-12-01.api-policy)                                    | Provides operations for managing the policy configured at the Api Level of a service instance.                                 |
| [API Product](xref:management.azure.com.apimanagement.2020-12-01.api-product)                                   | Lists the APIs associated with a product.                                                                                      |
| [API Release](xref:management.azure.com.apimanagement.2020-12-01.api-release)                                   | Provides operations for managing the API releases in a service instance.                                                       |
| [API Revision](xref:management.azure.com.apimanagement.2020-12-01.api-revision)                               | Lists the API revisions associated with an API in a service instance.                                                          |
| [API Schema](xref:management.azure.com.apimanagement.2020-12-01.api-schema)                                     | Provides operations for managing the schema of an API.                                                                         |
| [Api Tag Description](xref:management.azure.com.apimanagement.2020-12-01.api-tag-description)                    | Provides operations for managing the Description of Tags in the scope of Api.                                                  |
| [API Version Set](xref:management.azure.com.apimanagement.2020-12-01.api-version-set)                            | Provides operations for managing the Version Set of an API.                                                                    |
| [APIs](xref:management.azure.com.apimanagement.2020-12-01.apis)                            | Provides operations for managing the APIs of a service instance.                                                                    |
| [Authorization Server](xref:management.azure.com.apimanagement.2020-12-01.authorization-server)                 | Provides operations for managing OAuth2 authorization servers for a service instance.                                          |
| [Backend](xref:management.azure.com.apimanagement.2020-12-01.backend)                                          | Provides operations for managing backends for a service instance.                                                              |
| [Cache](xref:management.azure.com.apimanagement.2020-12-01.cache)                                          | Provides operations for managing the cache for a service instance.                                                              |
| [Certificate](xref:management.azure.com.apimanagement.2020-12-01.certificate)                                  | Provides operations for managing the certificates used for mutual certificate authentication.                                  |
| [Content Item](xref:management.azure.com.apimanagement.2020-12-01.content-item)                                              | Provides operations for managing the content items for the developer portal.                                                           |
| [Content Type](xref:management.azure.com.apimanagement.2020-12-01.content-type)                                              | Provides operations for managing the content types for the developer portal.                                                           |
| [Delegation Settings](xref:management.azure.com.apimanagement.2020-12-01.delegation-settings)                   | Provides operations for managing Delegation Settings for Developer Portal of a service instance.                               |
| [Deleted Services](xref:management.azure.com.apimanagement.2020-12-01.deleted-services)                   | Provides operations for managing soft deleted API Management service instances.                               |
| [Diagnostics](xref:management.azure.com.apimanagement.2020-12-01.diagnostic)                                   | Provides operations for managing Diagnostic settings for the logger in a service instance.                                     |
| [Email Template](xref:management.azure.com.apimanagement.2020-12-01.email-template)                             | Provides operations for managing Email Templates of a service instance.                                                        |
| [Gateway](xref:management.azure.com.apimanagement.2020-12-01.gateway)                                              | Provides operations for managing self-hosted gateways for a service instance.      |
| [Gateway Api](xref:management.azure.com.apimanagement.2020-12-01.gateway-api)                                           | Provides operations for managing self-hosted gateway apis for a service instance.      |
| [Gateway Certificate Authority](xref:management.azure.com.apimanagement.2020-12-01.gateway-certificate-authority)                                           | Provides operations for managing self-hosted gateway certificate authorities for a service instance.      |
| [Gateway Hostname configuration](xref:management.azure.com.apimanagement.2020-12-01.gateway-hostname-configuration)                      | Provides operations for managing self-hosted gateway hostname configuration.      |
| [Group](xref:management.azure.com.apimanagement.2020-12-01.group)                                              | Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups.      |
| [Group User](xref:management.azure.com.apimanagement.2020-12-01.group-user)                                     | Provides operations for adding and removing users from a group.                                                                |
| [Identity Provider](xref:management.azure.com.apimanagement.2020-12-01.identity-provider)                       | Provides operations for managing the Identity Providers configured for Authentication on Developer Portal of service instance. |
| [Issue](xref:management.azure.com.apimanagement.2020-12-01.issue)                                              | Provides operations for managing issues of a service instance.                                                                 |
| [Logger](xref:management.azure.com.apimanagement.2020-12-01.logger)                                            | Provides operations for managing Loggers used to collect events.                                                               |
| [Named Values](xref:management.azure.com.apimanagement.2020-12-01.named-value)                                        | Provides operations for creating and updating the named value collection for the service instance.                                |
| [Network Status](xref:management.azure.com.apimanagement.2020-12-01.network-status)                             | Provides Api for viewing the Network Status of a service instance deployed in Virtual Network.                                 |
| [Notification](xref:management.azure.com.apimanagement.2020-12-01.notification)                                | Provides operations for managing notifications for a service instance.                                                         |
| [Notifications Recipient Email](xref:management.azure.com.apimanagement.2020-12-01.notification-recipient-email) | Provides operations for managing email recipients configured for notifications in a service instance.                          |
| [Notifications Recipient User](xref:management.azure.com.apimanagement.2020-12-01.notification-recipient-user)   | Provides operations for managing email recipient users configured for notifications in a service instance.                     |
| [Open ID Connect Providers](xref:management.azure.com.apimanagement.2020-12-01.openid-connect-provider)          | Provides operations for managing the Open ID Connect Providers for the service instance.                                       |
| [Policy](xref:management.azure.com.apimanagement.2020-12-01.policy)                                            | Provides operations for policy management at the global service instance level.                                                |      
| [Policy Description](xref:management.azure.com.apimanagement.2020-12-01.policy)                                            | Provides operations for policy descriptiion for the service instance.                                                |                                                                              |
| [Portal Revisions](xref:management.azure.com.apimanagement.2020-12-01.portal-revision)                                            | Provides operations for developer portal revisions for the service instance.                                                |                                                                              |
| [Portal Settings](xref:management.azure.com.apimanagement.2020-12-01.portal-settings)                                            | Provides operations for developer portal revisions for the service instance.                                                |                                                                              |
| [Product](xref:management.azure.com.apimanagement.2020-12-01.product)                                          | Provides operations for managing products.                                                                                     |
| [Product API](xref:management.azure.com.apimanagement.2020-12-01.product-api)                                   | Provides operations for configuring which APIs associated with a product.                                                      |
| [Product Group](xref:management.azure.com.apimanagement.2020-12-01.product-group)                               | Provides operations for configuring which groups that have visibility to a product.                                            |
| [Product Policy](xref:management.azure.com.apimanagement.2020-12-01.product-policy)                             | Provides operations for managing the policy configured at the Product Level of a service instance.                             |
| [Product Subscriptions](xref:management.azure.com.apimanagement.2020-12-01.product-subscriptions)               | Lists the subscriptions to a product.                                                                                          |
| [Product Tag](xref:management.azure.com.apimanagement.2020-12-01.product-tag)               | Provides operations for configuring tags for a product.                                                                                          |
| [Quota By Counter Keys](xref:management.azure.com.apimanagement.2020-12-01.quota-by-counter-keys)                 | Provides operations for managing the quota by counter keys.                                                                    |
| [Quota By Period Keys](xref:management.azure.com.apimanagement.2020-12-01.quota-by-period-keys)                   | Provides operations for managing the quota by period keys.                                                                     |
| [Regions](xref:management.azure.com.apimanagement.2020-12-01.region)                                          | Lists the Azure regions in which the API Management service is available.                                                      |
| [Reports](xref:management.azure.com.apimanagement.2020-12-01.reports)                                          | Provides usage reports for the service instance.                                                                               |
| [Subscriptions](xref:management.azure.com.apimanagement.2020-12-01.subscription)                               | Provides operations for managing product subscriptions.                                                                        |
| [Sign-In Settings](xref:management.azure.com.apimanagement.2020-12-01.sign-in-settings)                          | Provides operations for managing the sign-in settings on Developer Portal for a service instance.                               |
| [Sign-Up Settings](xref:management.azure.com.apimanagement.2020-12-01.sign-up-settings)                          | Provides operations for managing the sign-up settings on Developer Portal for a service instance.                               |
| [Subscription](xref:management.azure.com.apimanagement.2020-12-01.subscription)                                | Provides operations for managing product subscriptions.                                                                        |
| [Tag](xref:management.azure.com.apimanagement.2020-12-01.tag)                                     | Provides operations for managing the Tag associated with APIs, Products, Operations.                                    |
| [Tag Entity](xref:management.azure.com.apimanagement.2020-12-01.tag-entity)                                     | Provides operations for managing the Tag entity associated with APIs, Products, Operations.                                    |
| [Tag Product](xref:management.azure.com.apimanagement.2020-12-01.tag-resource)                                 | List the collection of products associated with tags.          
| [Tag Resource](xref:management.azure.com.apimanagement.2020-12-01.tag-resource)                                 | List the collection of resources associated with tags.                                                                         |
| [Tenant Access](xref:management.azure.com.apimanagement.2020-12-01.tenant-access)                               | Provides operations at the root level tenant, such as access key generation.                                                   |
| [Tenant Access Git](xref:management.azure.com.apimanagement.2020-12-01.tenant-access-git)                        | Provides operations for managing the Git configuration for the tenant.                                                         |
| [Tenant Configuration](xref:management.azure.com.apimanagement.2020-12-01.tenant-configuration)                 | Provides operations for synchronizing the Git state with the tenant state.                                                     |
| [Tenant Settings](xref:management.azure.com.apimanagement.2020-12-01.tenant-settings)                 | Provides operations for managing the tenant settings.                                                     |
| [User](xref:management.azure.com.apimanagement.2020-12-01.user)                                                | Provides operations for managing the users of the service instance.                                                            |
| [User Confirmation Password](xref:management.azure.com.apimanagement.2020-12-01.user-confirmation-password)                                                | Provides operations for managing the confirmation passwords of users of the service instance.                                                            |
| [User Group](xref:management.azure.com.apimanagement.2020-12-01.user-group)                                     | Lists the groups to which a user belongs.                                                                                      |
| [User Identities](xref:management.azure.com.apimanagement.2020-12-01.user-identities)                           | Lists identities used by a user.                                                                                               |
| [User Subscription](xref:management.azure.com.apimanagement.2020-12-01.user-subscription)                       | Lists subscriptions by a user.                                                                                                 |


## See Also

- [Azure API Management documentation](https://docs.microsoft.com/azure/api-management/)
- [Azure API Management FAQ](https://azure.microsoft.com/documentation/articles/api-management-faq/)
- [What is Azure API Management](https://azure.microsoft.com/documentation/articles/api-management-key-concepts/)
- [Original Access API model](../apimanagement/ApiManagementREST/API-Management-REST.md)

