---
title: RBAC role assignment approvals with REST - Azure | Microsoft Docs
description: Approve or deny Azure Privileged Identity Management (PIM) role assignment request approvals using REST API
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

# Use Role Assignment Approvals to approve PIM role activation requests with REST API
Role Assignment Approvals help you manage approval requests for role assignment activation requests. For example, you can get approvals which require an approval from the calling user or you can get approvals where the calling user requested the activation. Then, a `PATCH` operation can be performed on each stage of the approval to approve or deny the request.

## List all role assignment approval requests

To list role assignment approval requests, you can use the [Role Assignment Approval - List](/rest/api/authorization/role-assignment-approval/list) REST API. To refine your results, you can specify an optional filter.

1. Start with the following request:

    ```http
    GET https://management.azure.com/providers/Microsoft.Authorization/roleAssignmentApprovals?api-version=2021-01-01-preview&$filter={filter}
    ```    

1. Replace *{filter}* with the condition that you want to apply to filter the role assignment list.

    | Filter | Description |
    | --- | --- |
    | `$filter=asApprover()` | List only includes all role assignment approvals that the calling user is assigned as an approver for. |
    | `$filter=asCreatedBy()` | List only includes all role assignment approvals that the calling user created requests for. |
    | `$filter=asTarget()` | List only includes all role assignment approvals that the calling user has requests targeted for. |

1. You need to extract the `id` of each `stage` of the `roleAssignmentApproval` and approve or deny the stage.

## Get approval stage details

To get the details of any stage of a role assignment approval, you can use [Role Assignment Approval Step - Get By ID](/rest/api/authorization/role-assignment-approval-step/get-by-id) REST API.

1. Use the following request:

    ```http
    GET https://management.azure.com/providers/Microsoft.Authorization/roleAssignmentApprovals/{approvalId}/stages/{stageId}?api-version=2021-01-01-preview
    ```    

## Approve or Deny an approval stage

To approve or deny of any stage of a role assignment approval, you can use [Role Assignment Approval Step - Patch](/rest/api/authorization/role-assignment-approval-step/patch) REST API.

1. Use the following request:

    ```http
    PATCH https://management.azure.com/providers/Microsoft.Authorization/roleAssignmentApprovals/{approvalId}/stages/{stageId}?api-version=2021-01-01-preview
    ```  
    ````json
    {    
        "properties": {
            "reviewResult": "Approve", // Or "Deny"
            "justification": "Trusted User"
        }
    }
    ````
