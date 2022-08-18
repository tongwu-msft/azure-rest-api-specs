---
title: Managed Applications REST API
description: Operation groups for the Managed Applications REST API
author: tfitzmac
ms.author: tomfitz
ms.date: 12/18/2020
ms.topic: reference
ms.service: managed-applications
ms.devlang: rest-api
---

# Managed Applications

Azure Managed Applications enable you to offer cloud solutions that are easy for consumers to deploy and operate. The publisher implements the infrastructure and provides ongoing support. The resources are deployed to a resource group that's managed by the publisher of the app.

## REST Operation Groups

| Operation Group | Description |
| --- | --- |
| [Application Definitions](xref:management.azure.com.managedapplications.applicationdefinitions) | Provides operations for working with Managed Application definitions. |
| [Applications](xref:management.azure.com.managedapplications.applications) | Provides operations to create and update Managed Applications. |
| [Jit Requests](xref:management.azure.com.managedapplications.jitrequests) | Provides operations for requesting just-in-time access to the managed resources. |

## See Also

- [Azure managed applications overview](/azure/azure-resource-manager/managed-applications/overview)
- [Quickstart: Create and publish a managed application definition](/azure/azure-resource-manager/managed-applications/publish-service-catalog-app)
- [Enable and request just-in-time access for Azure Managed Applications](/azure/azure-resource-manager/managed-applications/request-just-in-time-access)
