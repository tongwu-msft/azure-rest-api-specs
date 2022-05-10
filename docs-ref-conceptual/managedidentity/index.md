---
ms.assetid:
title: Managed Identity REST API | Microsoft Docs
description: Learn how Managed identities for Azure resources provides Azure services with an automatically managed identity in Azure Active Directory.
ms.service: active-directory
author: danielqiu
ms.author: daqi
ms.manager: sudheerb
---

# Managed Identity REST API reference

Managed identities for Azure resources provides Azure services with an automatically managed identity in Azure Active Directory. You can use this identity to authenticate to any service that supports Azure AD authentication, without having credentials in your code.

## Rest Operation Groups

The Managed Identity REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [User Assigned Identity](/rest/api/managedidentity/userassignedidentities) | Create, Update, Get, Delete and List User Assigned Identity |
| [Operations](/rest/api/managedidentity/operations/list) | Lists available operations |

## See also

* [Managed Identity documentation](/azure/active-directory/managed-identities-azure-resources/)
