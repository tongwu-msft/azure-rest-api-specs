---
title: Manage eligible access to Azure resources through Azure Privileged Identity Management (PIM) using REST API - Azure | Microsoft Docs
description: Managing eligible access to Azure resources using Privileged Identity Management (PIM) REST API
services: active-directory
documentationcenter: na
author: amansw
manager: anujc
editor: ''
ROBOTS: NOINDEX

ms.assetid: 1f90228a-7aac-4ea7-ad82-b57d222ab128
ms.service: role-based-access-control
ms.workload: multiple
ms.tgt_pltfrm: rest-api
ms.devlang: na
ms.topic: article
ms.date: 01/18/2022
ms.author: amansw

---
# Use Azure PIM to manage eligible access with the REST API

[Azure Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management/) enables you to limit standing administrator access to privileged roles, discover who has access, and review privileged access. This article describes the common ways to manage access using the REST API.

## List eligible assignments

To list eligible role assignments (list access), you can use one of the [Role Eligibility Schedule Instances - List For Scope](/rest/api/authorization/role-eligibility-schedule-instances/list-for-scope) or [Role Eligibility Schedules - List For Scope](/rest/api/authorization/role-eligibility-schedules/list-for-scope) REST APIs. To refine your results, you specify a scope and an optional filter. To call the API, you must have access to the `Microsoft.Authorization/roleAssignments/read` operation at the specified scope. All [built-in roles](/azure/role-based-access-control/built-in-roles) are granted access to this operation.

> [!IMPORTANT]
> The difference between *schedules* and *schedule instances* is that while schedule instances only include assignments that are active at the current time, schedules also include assignments that will become active in the future.

1. Start with the following request:

    ```http
    GET https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleEligibilityScheduleInstances?api-version=2020-10-01&$filter={filter}
    ```    
    ```http
    GET https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleEligibilitySchedules?api-version=2020-10-01&$filter={filter}
    ```    

1. Within the URI, replace *{scope}* with the scope for which you want to list the role assignments.

    | Scope | Type |
    | --- | --- |
    | `providers/Microsoft.Management/managementGroups/{mg-name}` | Management Group |
    | `subscriptions/{subscriptionId}` | Subscription |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1` | Resource group |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1/providers/Microsoft.Web/sites/mysite1` | Resource |

1. Replace *{filter}* with the condition that you want to apply to filter the role assignment list.

    | Filter | Description |
    | --- | --- |
    | `$filter=atScope()` | List role assignments for only the specified scope, not including the role assignments at subscopes. |
    | `$filter=principalId%20eq%20'{objectId}'` | List role assignments for a specified user, group, or service principal. |
    | `$filter=roleDefinitionId%20eq%20'{roleDefinitionId}'` | List role assignments for a specified role definition. |
    | `$filter=assignedTo('{objectId}')` | List role assignments for a specified user, including ones inherited from groups. |
    | `$filter=asTarget()` | List role assignments for the current user or service principal, including ones inherited from groups. |
    | `$filter=assignedTo('{objectId}')+and+atScope()` | List role assignments for a specified user, including ones inherited from groups for only the specified scope, not including the role assignments at subscopes.|
    
## Grant eligible assignment

To create an eligible role assignment (grant access), you use the [Role Eligibility Schedule Requests - Create](/rest/api/authorization/role-eligibility-schedule-requests/create) REST API and specify the security principal, role definition, schedule, requestType = `AdminAssign` and scope. To call this API, you must have access to `Microsoft.Authorization/roleAssignments/write` operation. Of the built-in roles, only [Owner](/azure/role-based-access-control/built-in-roles#owner) and [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) are granted access to this operation.

1. Use the [Role Definitions - List](/rest/api/authorization/roledefinitions/list) REST API or see [Built-in roles](/azure/role-based-access-control/built-in-roles) to get the identifier for the role definition you want to assign.

1. Use a GUID tool to generate a unique identifier that will be used for the role assignment identifier. The identifier has the format: `00000000-0000-0000-0000-000000000000`

1. Start with the following request and body:

    ```http
    PUT https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleEligibilityScheduleRequests/{roleEligibilityScheduleRequestName}?api-version=2020-10-01
    ```

    ```json
    {
      "Properties": {
        "RoleDefinitionId": "/subscriptions/{subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/{roleDefinitionId}",
        "PrincipalId": "{principalId}",
        "RequestType": "AdminAssign",
        "ScheduleInfo": {
          "StartDateTime": "2020-09-09T21:31:27.91Z",
          "Expiration": {
            "Type": "AfterDuration", // Values: AfterDuration, AfterDateTime, NoExpiration
            "EndDateTime": null,
            "Duration": "P365D" // Use ISO 8601 format
          }
        }
      }
    }
    ```
    
1. Within the URI, replace *{scope}* with the scope for the role assignment.

    | Scope | Type |
    | --- | --- |
    | `providers/Microsoft.Management/managementGroups/{mg-name}` | Management Group |
    | `subscriptions/{subscriptionId}` | Subscription |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1` | Resource group |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1/providers/Microsoft.Web/sites/mysite1` | Resource |

1. Replace *{roleEligibilityScheduleRequestName}* with the GUID identifier of the role assignment.

1. Within the request body, replace *{subscriptionId}* with your subscription identifier.

1. Replace *{roleDefinitionId}* with the role definition identifier.

1. Replace *{principalId}* with the object identifier of the user, group, or service principal that will be assigned the role.

## Remove eligible assignment

To remove an eligible role assignment (remove access), use the [Role Eligibility Schedule Requests - Create](/rest/api/authorization/role-eligibility-schedule-requests/create) REST API to create a new request to revoke assignment and specify the security principal, role definition, requestType = `AdminRemove` and scope. To call this API, you must have access to the `Microsoft.Authorization/roleAssignments/write` operation. Of the built-in roles, only [Owner](/azure/role-based-access-control/built-in-roles#owner) and [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) are granted access to this operation.

1. Use a GUID tool to generate a unique identifier that will be used for the role assignment identifier. The identifier has the format: `00000000-0000-0000-0000-000000000000`

1. Start with the following request:

    ```http
    PUT https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleEligibilityScheduleRequests/{roleEligibilityScheduleRequestName}?api-version=2020-10-01
    ```
    
    ```json
    {
      "Properties": {
        "RoleDefinitionId": "/subscriptions/{subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/{roleDefinitionId}",
        "PrincipalId": "{principalId}",
        "RequestType": "AdminRemove"
        }
    }
    ```
    
1. Within the URI, replace *{scope}* with the scope for removing the role assignment.

    | Scope | Type |
    | --- | --- |
    | `providers/Microsoft.Management/managementGroups/{mg-name}` | Management Group |
    | `subscriptions/{subscriptionId}` | Subscription |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1` | Resource group |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1/ providers/Microsoft.Web/sites/mysite1` | Resource |

1. Replace *{roleEligibilityScheduleRequestName}* with the GUID identifier of the role assignment.

[!INCLUDE [common-errors](includes/privileged-role-common-errors.md)]
