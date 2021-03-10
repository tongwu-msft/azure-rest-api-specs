---
title: Authorization REST API versions | Microsoft Docs
description: Learn about the authorization REST API versions for Azure role-based access control (Azure RBAC).
author: rolyon
ms.author: rolyon
ms.manager: mtillman
ms.date: 03/10/2021
ms.topic: reference
ms.service: role-based-access-control
ms.devlang: rest-api
ms.assetid: 81771ddf-44d0-42d2-b96d-5dd961a03fd2
---

# Authorization REST API versions

## Latest stable version: 2015-07-01

Latest stable version


## Versions

| Version | Description |
| --- | --- |
| [2020-10-01-preview](#2020-10-01-preview) | Device principal type |
| [2020-08-01-preview](#2020-08-01-preview) | Role assignment validation |
| [2020-07-01-preview](#2020-07-01-preview) | Search role assignments<br/>Search deny assignments |
| [2020-04-01-preview](#2020-04-01-preview) | Role assignment with description |
| [2020-03-01-preview](#2020-03-01-preview) | User not found bypass |
| [2019-08-01-preview](#2019-08-01-preview) | Role assignment usage metrics |
| [2019-04-01-preview](#2019-04-01-preview) | Delegated managed identity resource ID<br/>Tenant id query parameter |
| [2019-03-01-preview](#2019-03-01-preview) | Deny assignment conditions |
| [2018-12-01-preview](#2018-12-01-preview) | Role assignment conditions |
| [2018-09-01-preview](#2018-09-01-preview) | Role assignment SPN not found bypass |
| [2018-07-01-preview](#2018-07-01-preview) | Deny assignments |
| [2018-01-01-preview](#2018-01-01-preview) | Data actions |
| [2017-10-01-preview](#2017-10-01-preview) | Delegation |

## 2020-10-01-preview

Support device principal type
- Role assignments
    - "Device" added as valid principalType property

## 2020-08-01-preview

Support role assignment validation
- Role assignments
    - POST .../roleAssignments/{guid}/validate endpoint added

## 2020-07-01-preview

Support search role assignments

Support search deny assignments
- Role assignments
    - .../searchRoleAssignments endpoint added
- Role definitions
    - .../searchRoleDefinitions endpoint added

## 2020-04-01-preview

Support role assignment with description
- Role assignments
    - description property added
        - description: "Description of role assignment"

## 2020-03-01-preview

Support user not found bypass
- Deny assignments
    - Principal not found exception ignored in certain cases
    - createdOn, updatedOn, createdBy, and updatedBy properties added?
- Role assignments
    - Principal not found exception ignored in certain cases
    - createdOn, updatedOn, createdBy, and updatedBy properties added?

## 2019-08-01-preview

Support role assignment usage metrics
- Role assignment metrics
    - .../roleassignmentusagemetrics endpoint added
    - returns subscriptionId, roleAssignmentsLimit, roleAssignmentsCurrentCount, and roleAssignmentsRemainingCount

## 2019-04-01-preview

Support delegated managed identity resource ID

Support tenant id query parameter
- Role assignments
    - delegatedManagedIdentityResourceId property added to role assignment entity

## 2019-03-01-preview

Support deny assignment conditions
- Deny assignments
    - condition property added
        - description: "The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase 'foo_storage_container'"
    - condition version property added
        - description: ""Version of the condition. Currently accepted value is '2.0'"

## 2018-12-01-preview

Support role assignment conditions
- Role assignments
    - condition property added
        - description: "The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase 'foo_storage_container'"
    - conditionVersion property added
        - description: ""Version of the condition. Currently accepted value is '2.0'"

## 2018-09-01-preview

Support role assignment SPN not found bypass
- Intermittently we see issues where as part of some ARM template based deployments, MSI identities get created and are immediately used for role/deny assignment creation. Sometimes, depending on the replication time for the new MSI identities in AAD, the calls made by PAS to Graph for verifying the principal identities fail as the newly created principal id is not found. We handle such cases by ignoring the principal not found error if the specified principal type is "ServicePrincipal". Also ignoring the error for User principal as customers are seeing the same error in the guest user scenario.
- Role assignments
    - principalType property added to role assignment properties for creation and retrieval
        - possible values: User, Group, ServicePrincipal, Unknown, DirectoryRoleTemplate, ForeignGroup, Application, MSI, DirectoryObjectOrGroup, or Everyone
        - description: "The principal type of the assigned principal ID."

## 2018-07-01-preview

Support deny assignments
- Deny assignments
    - deny assignments api added
    - swagger only includes retrieval operations at this point, but it looks like create/update/delete were supported as well

## 2018-01-01-preview

Support data actions
- Provider operations metadata
    - isDataAction parameter added to ProviderOperation in response
        - description: "The dataAction flag to specify the operation type."
- Role assignments
    - roleDefinitionId and principalId explicitly marked as required in swagger
- Role definitions
    - dataActions added to Permissions array in role definition entity
        - description: "Allowed Data actions."
    - notDataActions added to Permissions array in role definition entity
        - description: "Denied Data actions."

## 2017-10-01-preview

Support delegation
- Role assignments
    - canDelegate parameter added to role assignment properties (create and retrieve)

## See also

- [Assign Azure roles using the REST API](https://docs.microsoft.com/azure/role-based-access-control/role-assignments-rest)
- [List Azure role assignments using the REST API](https://docs.microsoft.com/azure/role-based-access-control/role-assignments-list-rest)
