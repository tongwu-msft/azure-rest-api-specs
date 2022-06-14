---
title: Manage Azure Privileged Identity Management (PIM) role management policies with REST - Azure | Microsoft Docs
description: Manage the Privileged Identity Management (PIM) role management policies that govern role assignment and activation using REST API
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

# Use Role Management Policies to manage rules for each role within each resource
Role Management Policies help you govern the rules for any role eligibility request or role assignment request. For example, you can set the maximum duration for which an assignment can be active, or you can even allow permanent assignment. You can update the notification settings for each assignment. You can also set approvers for each role activation.

## List role management policies for a resource

To list role management policies, you can use [Role Management Policies - List For Scope](/rest/api/authorization/role-management-policies/list-for-scope) REST API. To refine your results, you specify a scope and an optional filter. To call the API, you must have access to the `Microsoft.Authorization/roleAssignments/read` operation at the specified scope. All [built-in roles](/azure/role-based-access-control/built-in-roles) are granted access to this operation.

> [!IMPORTANT]
> You do not need to Create role management policies as each role within each resource has a default policy

1. Start with the following request:

    ```http
    GET https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleManagementPolicies?api-version=2020-10-01&$filter={filter}
    ```    
    
1. Within the URI, replace *{scope}* with the scope for which you want to list the role management policies.

    | Scope | Type |
    | --- | --- |
    | `providers/Microsoft.Management/managementGroups/{mg-name}` | Management Group |
    | `subscriptions/{subscriptionId}` | Subscription |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1` | Resource group |
    | `subscriptions/{subscriptionId}/resourceGroups/myresourcegroup1/providers/Microsoft.Web/sites/mysite1` | Resource |
    
1. Replace *{filter}* with the condition that you want to apply to filter the role assignment list.

    | Filter | Description |
    | --- | --- |
    | `$filter=roleDefinitionId%20eq%20'{scope}/providers/Microsoft.Authorization/roleDefinitions/{roleDefinitionId}'` | List role management policy for a specified role definition within the resource scope. |

## Update a role management policy

1. Choose the rule(s) that you want to update. These are the types of rule -

    | Rule Type | Description |
    | --- | --- |
    | RoleManagementPolicyEnablementRule | Enable MFA, Justification on assignments or Ticketing information |
    | RoleManagementPolicyExpirationRule | Specify maximum duration of a role assignment or activation |
    | RoleManagementPolicyNotificationRule | Configure email notification settings for assignments, activations and approvals |
    | RoleManagementPolicyApprovalRule | Configure approval settings for a role activation |
    | RoleManagementPolicyAuthenticationContextRule | Configure the ACRS rule for Conditional Access Policy |

1. Use the following request:

    ```http
    PATCH https://management.azure.com/{scope}/providers/Microsoft.Authorization/roleManagementPolicies/{roleManagementPolicyId}?api-version=2020-10-01
    ```

    ```json
    {
      "properties": {
        "rules": [
          {
            "isExpirationRequired": false,
            "maximumDuration": "P180D",
            "id": "Expiration_Admin_Eligibility",
            "ruleType": "RoleManagementPolicyExpirationRule",
            "target": {
              "caller": "Admin",
              "operations": [
                "All"
              ],
              "level": "Eligibility",
              "targetObjects": null,
              "inheritableSettings": null,
              "enforcedSettings": null
            }
          },
          {
            "notificationType": "Email",
            "recipientType": "Admin",
            "isDefaultRecipientsEnabled": false,
            "notificationLevel": "Critical",
            "notificationRecipients": [
              "admin_admin_eligible@test.com"
            ],
            "id": "Notification_Admin_Admin_Eligibility",
            "ruleType": "RoleManagementPolicyNotificationRule",
            "target": {
              "caller": "Admin",
              "operations": [
                "All"
              ],
              "level": "Eligibility",
              "targetObjects": null,
              "inheritableSettings": null,
              "enforcedSettings": null
            }
          },
          {
            "enabledRules": [
              "Justification",
              "MultiFactorAuthentication",
              "Ticketing"
            ],
            "id": "Enablement_EndUser_Assignment",
            "ruleType": "RoleManagementPolicyEnablementRule",
            "target": {
              "caller": "EndUser",
              "operations": [
                "All"
              ],
              "level": "Assignment",
              "targetObjects": null,
              "inheritableSettings": null,
              "enforcedSettings": null
            }
          },
          {
            "setting": {
              "isApprovalRequired": true,
              "isApprovalRequiredForExtension": false,
              "isRequestorJustificationRequired": true,
              "approvalMode": "SingleStage",
              "approvalStages": [
                {
                  "approvalStageTimeOutInDays": 1,
                  "isApproverJustificationRequired": true,
                  "escalationTimeInMinutes": 0,
                  "primaryApprovers": [
                    {
                      "id": "2385b0f3-5fa9-43cf-8ca4-b01dc97298cd",
                      "description": "amansw_new_group",
                      "isBackup": false,
                      "userType": "Group"
                    }
                  ],
                  "isEscalationEnabled": false,
                  "escalationApprovers": null
                }
              ]
            },
            "id": "Approval_EndUser_Assignment",
            "ruleType": "RoleManagementPolicyApprovalRule",
            "target": {
              "caller": "EndUser",
              "operations": [
                "All"
              ],
              "level": "Assignment",
              "targetObjects": null,
              "inheritableSettings": null,
              "enforcedSettings": null
            }
          }
        ]
      }
    }

    ````
