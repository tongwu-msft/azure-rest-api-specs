---
title: Azure API Management REST API
description: REST API reference for the Azure API Management service
ms.service: api-management
author: dlepow
ms.author: danlep
ms.topic: reference
ms.devlang: rest-api
---

# Azure API Management REST API reference

Azure API Management provides a REST API for performing operations on selected entities, such as users, groups, products, and subscriptions. This reference provides a guide for working with the API Management REST API, and specific reference information for each available operation, grouped by entity.

## REST API versions

Reference is provided for the following API Management REST API versions.

### GA (stable)

* [Current (2021-08-01)](xref:management.azure.com.apimanagement.current-ga.api)
* [Previous (2020-12-01)](xref:management.azure.com.apimanagement.previous-ga.api)

### Preview

* [Current (2021-12-01-preview)](xref:management.azure.com.apimanagement.current-preview.api)

## REST operation groups

Links to reference for the current GA (stable) version.

|Operation Group | Description |
|---------------|--------------------------------|
| [API](xref:management.azure.com.apimanagement.current-ga.api)| Provides operations for managing the APIs of a service instance.|
| [API Diagnostic](xref:management.azure.com.apimanagement.current-ga.apidiagnostic)| Provides operations for managing Diagnostic settings for the logger in an API. |
| [API Export](xref:management.azure.com.apimanagement.current-ga.apiexport)| Exports an API to a SAS blob.|
| [API Issue](xref:management.azure.com.apimanagement.current-ga.apiissue) | Provides operations for managing issues for an API.   |
| [API Issue Attachment](xref:management.azure.com.apimanagement.current-ga.apiissueattachment) | Provides operations for managing issues attachments for an API.|
| [API Issue Comment](xref:management.azure.com.apimanagement.current-ga.apiissuecomment)| Provides operations for managing issues comments for an API. |
| [API Management Operations](xref:management.azure.com.apimanagement.current-ga.apimanagementoperations)| Lists the operations for the API Management provider.|
| [API Management Service](xref:management.azure.com.apimanagement.current-ga.apimanagementservice)| Provides operations for managing Azure API Management service instances.|
| [API Management Service Skus](xref:management.azure.com.apimanagement.current-ga.apimanagementserviceskus)| Provides operations for managing Azure API Management service SKUs. |
| [API Management Skus](xref:management.azure.com.apimanagement.current-ga.apimanagementskus)| Provides operations for the available Azure API Management SKUs for your subscription.|
| [API Operation](xref:management.azure.com.apimanagement.current-ga.apioperation)| Lists the operations for an API. |
| [API Operation Policy](xref:management.azure.com.apimanagement.current-ga.apioperationpolicy)| Provides operations for managing the policy configured at the API Operation Level of a service instance.|
| [API Policy](xref:management.azure.com.apimanagement.current-ga.apipolicy)| Provides operations for managing the policy configured at the Api Level of a service instance.|
| [API Product](xref:management.azure.com.apimanagement.current-ga.apiproduct)| Lists the APIs associated with a product.|
| [API Release](xref:management.azure.com.apimanagement.current-ga.apirelease)| Provides operations for managing the API releases in a service instance.|
| [API Revision](xref:management.azure.com.apimanagement.current-ga.apirevision)| Lists the API revisions associated with an API in a service instance.|
| [API Schema](xref:management.azure.com.apimanagement.current-ga.apischema)| Provides operations for managing the schema of an API.|
| [Api Tag Description](xref:management.azure.com.apimanagement.current-ga.apitagdescription)| Provides operations for managing the Description of Tags in the scope of Api.|
| [API Version Set](xref:management.azure.com.apimanagement.current-ga.apiversionset)| Provides operations for managing the Version Set of an API.|
| [APIs](xref:management.azure.com.apimanagement.current-ga.apis)| Provides operations for managing the APIs of a service instance.|
| [Authorization Server](xref:management.azure.com.apimanagement.current-ga.authorizationserver)| Provides operations for managing OAuth2 authorization servers for a service instance.|
| [Backend](xref:management.azure.com.apimanagement.current-ga.backend)| Provides operations for managing backends for a service instance.|
| [Cache](xref:management.azure.com.apimanagement.current-ga.cache)| Provides operations for managing the cache for a service instance.|
| [Certificate](xref:management.azure.com.apimanagement.current-ga.certificate)| Provides operations for managing the certificates used for mutual certificate authentication.|
| [Content Item](xref:management.azure.com.apimanagement.current-ga.contentitem)| Provides operations for managing the content items for the developer portal.|
| [Content Type](xref:management.azure.com.apimanagement.current-ga.contenttype)| Provides operations for managing the content types for the developer portal.|
| [Delegation Settings](xref:management.azure.com.apimanagement.current-ga.delegationsettings)| Provides operations for managing Delegation Settings for Developer Portal of a service instance.|
| [Deleted Services](xref:management.azure.com.apimanagement.current-ga.deletedservices)| Provides operations for managing soft deleted API Management service instances.|
| [Diagnostic](xref:management.azure.com.apimanagement.current-ga.diagnostic)| Provides operations for managing Diagnostic settings for the logger in a service instance.|
| [Email Template](xref:management.azure.com.apimanagement.current-ga.emailtemplate)| Provides operations for managing Email Templates of a service instance.|
| [Gateway](xref:management.azure.com.apimanagement.current-ga.gateway)| Provides operations for managing self-hosted gateways for a service instance.|
| [Gateway Api](xref:management.azure.com.apimanagement.current-ga.gatewayapi)| Provides operations for managing self-hosted gateway apis for a service instance.|
| [Gateway Certificate Authority](xref:management.azure.com.apimanagement.current-ga.gatewaycertificateauthority)| Provides operations for managing self-hosted gateway certificate authorities for a service instance.|
| [Gateway Hostname Configuration](xref:management.azure.com.apimanagement.current-ga.gatewayhostnameconfiguration)| Provides operations for managing self-hosted gateway hostname configuration.|
| [Group](xref:management.azure.com.apimanagement.current-ga.group)| Provides operations for managing groups of users for a service instance, including built-in, custom, and external groups. |
| [Group User](xref:management.azure.com.apimanagement.current-ga.groupuser)| Provides operations for adding and removing users from a group.|
| [Identity Provider](xref:management.azure.com.apimanagement.current-ga.identityprovider)| Provides operations for managing the Identity Providers configured for Authentication on Developer Portal of service instance. |
| [Issue](xref:management.azure.com.apimanagement.current-ga.issue)| Provides operations for managing issues of a service instance.|
| [Logger](xref:management.azure.com.apimanagement.current-ga.logger)| Provides operations for managing Loggers used to collect events.|
| [Named Value](xref:management.azure.com.apimanagement.current-ga.namedvalue)| Provides operations for creating and updating the named value collection for the service instance.|
| [Network Status](xref:management.azure.com.apimanagement.current-ga.networkstatus)| Provides Api for viewing the Network Status of a service instance deployed in Virtual Network.|
| [Notification](xref:management.azure.com.apimanagement.current-ga.notification)| Provides operations for managing notifications for a service instance.|
| [Notifications Recipient Email](xref:management.azure.com.apimanagement.current-ga.notificationrecipientemail) | Provides operations for managing email recipients configured for notifications in a service instance.|
| [Notifications Recipient User](xref:management.azure.com.apimanagement.current-ga.notificationrecipientuser)   | Provides operations for managing email recipient users configured for notifications in a service instance.|
| [OpenId Connect Provider](xref:management.azure.com.apimanagement.current-ga.openidconnectprovider)| Provides operations for managing the Open ID Connect Providers for the service instance.|
| [Operation](xref:management.azure.com.apimanagement.current-ga.operation)| Provides API operations for managing operations for the service instance.|
| [Policy](xref:management.azure.com.apimanagement.current-ga.policy)| Provides operations for policy management at the global service instance level.|
| [Policy Description](xref:management.azure.com.apimanagement.current-ga.policydescription)| Provides operations for policy description for the service instance.|
| [Portal Revision](xref:management.azure.com.apimanagement.current-ga.portalrevision)| Provides operations for developer portal revisions for the service instance.|
| [Portal Settings](xref:management.azure.com.apimanagement.current-ga.portalsettings)| Provides operations for developer portal revisions for the service instance. |
| [Private Endpoint Connection](xref:management.azure.com.apimanagement.current-ga.privateendpointconnection)| Provides operations for managing private endpoint connections to the service instance. |
| [Product](xref:management.azure.com.apimanagement.current-ga.product)| Provides operations for managing products.   |
| [Product API](xref:management.azure.com.apimanagement.current-ga.productapi) | Provides operations for configuring which APIs associated with a product.  |
| [Product Group](xref:management.azure.com.apimanagement.current-ga.productgroup)| Provides operations for configuring which groups that have visibility to a product.|
| [Product Policy](xref:management.azure.com.apimanagement.current-ga.productpolicy)| Provides operations for managing the policy configured at the Product Level of a service instance.|
| [Product Subscriptions](xref:management.azure.com.apimanagement.current-ga.productsubscriptions)| Lists the subscriptions to a product. |
| [Product Tag](xref:management.azure.com.apimanagement.current-ga.producttag) | Provides operations for configuring tags for a product.      |
| [Quota By Counter Keys](xref:management.azure.com.apimanagement.current-ga.quotabycounterkeys)| Provides operations for managing the quota by counter keys. |
| [Quota By Period Keys](xref:management.azure.com.apimanagement.current-ga.quotabyperiodkeys)| Provides operations for managing the quota by period keys.|
| [Region](xref:management.azure.com.apimanagement.current-ga.region)| Lists the Azure regions in which the API Management service is available.|
| [Reports](xref:management.azure.com.apimanagement.current-ga.reports) | Provides usage reports for the service instance. |
| [Sign-In Settings](xref:management.azure.com.apimanagement.current-ga.signinsettings)| Provides operations for managing the sign-in settings on Developer Portal for a service instance.|
| [Sign-Up Settings](xref:management.azure.com.apimanagement.current-ga.signupsettings)| Provides operations for managing the sign-up settings on Developer Portal for a service instance.|
| [Subscription](xref:management.azure.com.apimanagement.current-ga.subscription)| Provides operations for managing product subscriptions.|
| [Tag](xref:management.azure.com.apimanagement.current-ga.tag)| Provides operations for managing the Tag associated with APIs, Products, Operations.|
| [Tag Entity](xref:management.azure.com.apimanagement.current-ga.tagentity)| Provides operations for managing the Tag entity associated with APIs, Products, Operations.|
| [Tag Product](xref:management.azure.com.apimanagement.current-ga.tagproduct)| List the collection of products associated with tags.|
| [Tag Resource](xref:management.azure.com.apimanagement.current-ga.tagresource)| List the collection of resources associated with tags.|
| [Tenant Access](xref:management.azure.com.apimanagement.current-ga.tenantaccess)| Provides operations at the root level tenant, such as access key generation.|
| [Tenant Access Git](xref:management.azure.com.apimanagement.current-ga.tenantaccessgit)| Provides operations for managing the Git configuration for the tenant.|
| [Tenant Configuration](xref:management.azure.com.apimanagement.current-ga.tenantconfiguration)| Provides operations for synchronizing the Git state with the tenant state.|
| [Tenant Settings](xref:management.azure.com.apimanagement.current-ga.tenantsettings)| Provides operations for managing the tenant settings.|
| [User](xref:management.azure.com.apimanagement.current-ga.user)| Provides operations for managing the users of the service instance.|
| [User Confirmation Password](xref:management.azure.com.apimanagement.current-ga.userconfirmationpassword)| Provides operations for managing the confirmation passwords of users of the service instance.|
| [User Group](xref:management.azure.com.apimanagement.current-ga.usergroup)| Lists the groups to which a user belongs.|
| [User Identities](xref:management.azure.com.apimanagement.current-ga.useridentities)| Lists identities used by a user.|
| [User Subscription](xref:management.azure.com.apimanagement.current-ga.usersubscription)| Lists subscriptions by a user.|


## See also

- [Azure API Management documentation](/azure/api-management/)
- [Azure API Management FAQ](/azure/api-management/api-management-faq/)
- [About Azure API Management](/azure/api-management/api-management-key-concepts/)
