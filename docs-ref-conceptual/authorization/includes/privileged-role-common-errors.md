---
author: amansw
ms.topic: include
ms.date: 01/25/2021
ms.assetid: 1f90228a-7aac-4ea7-ad82-b57d222ab128
ms.service: role-based-access-control
ms.localizationpriority: medium
---

## Common errors returned for a new request

Following is a list of common errors that you may encounter while creating a new request and how to mitigate them.

| Error Message | Explanantion | Mitigation |
|---------------|--------------|------------|
|`code`: RoleAssignmentExists<br>`message`: The Role assignment already exists. | A similar role assignment already exists | You can `GET` this role assignment and verify its schedule.
|`code`: RoleAssignmentRequestPolicyValidationFailed<br>`message`: The following policy rules failed: [\"ExpirationRule\"] | The `ScheduleInfo` specified in the request exceeds the maximum allowed duration | You can `GET` the [RoleManagementPolicy](privileged-role-policy-rest-sample.md) for this `RoleDefinitionId` and check the `RoleManagementPolicyExpirationRule`
|`code`: RoleAssignmentRequestPolicyValidationFailed<br>`message`: The following policy rules failed: [\"JustificationRule\"] | You need to specify a `Justification` in the request body | You can `GET` the [RoleManagementPolicy](privileged-role-policy-rest-sample.md) for this `RoleDefinitionId` and check the `RoleManagementPolicyEnablementRule` 
|`code`: RoleAssignmentRequestPolicyValidationFailed<br>`message`: The following policy rules failed: [\"EligibilityRule\"] | A valid `RoleEligibilityScheduleInstance` doesn't exist to activate this role | A resource admin needs to create a [`RoleEligibilityScheduleRequest`](privileged-role-eligibility-rest-sample.md) for this principal
|`code`: RoleAssignmentRequestPolicyValidationFailed<br>`message`: The following policy rules failed: [\"TicketingRule\"] | You need to specify a `TicketInfo` in the request body | You can `GET` the [RoleManagementPolicy](privileged-role-policy-rest-sample.md) for this `RoleDefinitionId` and check the `RoleManagementPolicyEnablementRule` 
|`code`: RoleAssignmentRequestPolicyValidationFailed<br>`message`: The following policy rules failed: [\"MfaRule\"] | You need to complete Azure Multi-Factor Authentication to submit this request | You can `GET` the [RoleManagementPolicy](privileged-role-policy-rest-sample.md) for this `RoleDefinitionId` and check the `RoleManagementPolicyEnablementRule` 
