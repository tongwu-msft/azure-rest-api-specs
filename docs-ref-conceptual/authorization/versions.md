---
title: API versions of Azure RBAC REST APIs | Microsoft Docs
description: Learn about the API versions of the Azure role-based access control (Azure RBAC) REST APIs.
author: rolyon
ms.author: rolyon
ms.manager: amycolannino
ms.date: 09/15/2022
ms.topic: reference
ms.service: role-based-access-control
ms.devlang: rest-api
ms.assetid: 81771ddf-44d0-42d2-b96d-5dd961a03fd2
---

# API versions of Azure RBAC REST APIs

This article lists the current and past versions of the Azure RBAC REST APIs.

## Stable versions

| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2022-04-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/stable/2022-04-01) | GA release of role assignment conditions<br/>[Release note](#2022-04-01) |
| `2020-10-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/stable/2020-10-01) | GA release of Privileged Identity Management resource types<br/>[Release note](#2020-10-01) |
| `2015-07-01`| [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/stable/2015-07-01) | First generally available release |

## Preview versions

Preview versions are released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2020-10-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2020-10-01-preview) | Device principal type<br>Add Privileged Identity Management resource types<br/>[Release note](#2020-10-01-preview) |
| `2020-08-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2020-08-01-preview) | Role assignment validation<br/>[Release note](#2020-08-01-preview) |
| `2020-07-01-preview` | Swagger specification | Search role assignments<br/>Search deny assignments<br/>[Release note](#2020-07-01-preview) |
| `2020-04-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2020-04-01-preview) | Role assignment with description<br/>[Release note](#2020-04-01-preview) |
| `2020-03-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2020-03-01-preview) | User not found bypass<br/>[Release note](#2020-03-01-preview) |
| `2019-08-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2019-08-01-preview) | Role assignment usage metrics<br/>[Release note](#2019-08-01-preview) |
| `2019-04-01-preview` | Swagger specification | Delegated managed identity resource ID<br/>Tenant ID query parameter<br/>[Release note](#2019-04-01-preview) |
| `2019-03-01-preview` | Swagger specification | Deny assignment conditions<br/>[Release note](#2019-03-01-preview) |
| `2018-12-01-preview` | Swagger specification | Role assignment conditions<br/>[Release note](#2018-12-01-preview) |
| `2018-09-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2018-09-01-preview) | Role assignment service principal name not found bypass<br/>[Release note](#2018-09-01-preview) |
| `2018-07-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2018-07-01-preview) | Deny assignments<br/>[Release note](#2018-07-01-preview) |
| `2018-01-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2018-01-01-preview) | Data actions<br/>[Release note](#2018-01-01-preview) |
| `2017-10-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/authorization/resource-manager/Microsoft.Authorization/preview/2017-10-01-preview) | Delegation<br/>[Release note](#2017-10-01-preview) |
| `2017-09-01` | Swagger specification | Stop rewriting management group scopes<br/>[Release note](#2017-09-01) |
| `2016-07-01` | Swagger specification | Strict filter checks<br/>[Release note](#2016-07-01) |

## Release notes

### 2022-04-01

- GA release of role assignment conditions

### 2020-10-01

- GA release of the following *Privileged Identity Management* resource types
    - `Role Assignment Schedule Requests`  
    - `Role Assignment Schedules`
    - `Role Assignment Schedule Instances`
    - `Role Eligibility Schedule Requests`
    - `Role Eligibility Schedules`
    - `Role Eligibility Schedule Instances`
    - `Eligible Child Resources`
    - `Role Management Policies`
    - `Role Management Policy Assignments`    

### 2020-10-01-preview

Support device principal type
- Role assignments
    - `Device` added as valid `principalType` property

- Added the following *Privileged Identity Management* resource types
    - `Role Assignment Schedule Requests`  
    - `Role Assignment Schedules`
    - `Role Assignment Schedule Instances`
    - `Role Eligibility Schedule Requests`
    - `Role Eligibility Schedules`
    - `Role Eligibility Schedule Instances`
    - `Eligible Child Resources`
    - `Role Management Policies`
    - `Role Management Policy Assignments`    

### 2020-08-01-preview

Support role assignment validation
- Role assignments
    - `POST .../roleAssignments/{guid}/validate` endpoint added

### 2020-07-01-preview

Support search role assignments

Support search deny assignments
- Role assignments
    - `.../searchRoleAssignments` endpoint added
- Role definitions
    - `.../searchRoleDefinitions` endpoint added

### 2020-04-01-preview

Support role assignment with description
- Role assignments
    - `description` property added
        - Description: "Description of role assignment"

### 2020-03-01-preview

Support user not found bypass
- Deny assignments
    - Principal not found exception ignored if `principalType` is explicitly set to `user`
- Role assignments
    - Principal not found exception ignored if `principalType` is explicitly set to `user`

### 2019-08-01-preview

Support role assignment usage metrics
- Role assignment metrics
    - `.../roleassignmentusagemetrics` endpoint added
    - returns `subscriptionId`, `roleAssignmentsLimit`, `roleAssignmentsCurrentCount`, and `roleAssignmentsRemainingCount`

### 2019-04-01-preview

Support delegated managed identity resource ID

Support tenant ID query parameter
- Role assignments
    - `delegatedManagedIdentityResourceId` property added to role assignment entity

### 2019-03-01-preview

Support deny assignment conditions
- Deny assignments
    - `condition` property added
        - Description: "The conditions on the deny assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase 'my_storage_container'"
    - `conditionVersion` property added
        - Description: "Version of the condition. Currently accepted value is '2.0'"

### 2018-12-01-preview

Support role assignment conditions
- Role assignments
    - `condition` property added
        - Description: "The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase 'my_storage_container'"
    - `conditionVersion` property added
        - Description: "Version of the condition. Currently accepted value is '2.0'"

### 2018-09-01-preview

Support role assignment service principal name not found bypass
- Role assignments
    - `principalType` property added to role assignment properties for creation and retrieval
        - possible values: `User`, `Group`, `ServicePrincipal`, `Unknown`, `DirectoryRoleTemplate`, `ForeignGroup`, `Application`, `MSI`, `DirectoryObjectOrGroup`, or `Everyone`
        - Description: "The principal type of the assigned principal ID."
    - Principal not found exception ignored if `principalType` is explicitly set to `ServicePrincipal`

### 2018-07-01-preview

Support deny assignments
- Deny assignments
    - Deny assignments API added
    - PUT/DELETE calls are restricted to certain Azure services only

### 2018-01-01-preview

Support data actions
- Provider operations metadata
    - `isDataAction` parameter added to `ProviderOperation` in response
        - Description: "The dataAction flag to specify the operation type."
- Role assignments
    - `roleDefinitionId` and `principalId` explicitly marked as required in swagger
- Role definitions
    - `dataActions` added to `Permissions` array in role definition entity
        - Description: "Allowed Data actions."
    - `notDataActions` added to `Permissions` array in role definition entity
        - Description: "Denied Data actions."

### 2017-10-01-preview

Support delegation
- Role assignments
    - `canDelegate` parameter added to role assignment properties (create and retrieve)

### 2017-09-01

Stop rewriting management group scopes
- [Breaking] Role assignments
    - Role assignments at management group scope will have the same management group scope even if retrieved at a subscription/resource group scope
    - In previous versions, scope will be rewritten to the request scope
- [Breaking] Role definitions
    - Role definitions with a management group in `assignableScopes`, when retrieved at a subscription/resource group scope, will not have the subscription scope in `assignableScopes`
    - In previous versions, the request subscription scope is added to `assignableScopes`

### 2016-07-01

Strict filter checks
- [Breaking] Unsupported filters in /roleDefinition requests will result in bad requests

## See also

- [Assign Azure roles using the REST API](/azure/role-based-access-control/role-assignments-rest)
- [List Azure role assignments using the REST API](/azure/role-based-access-control/role-assignments-list-rest)
