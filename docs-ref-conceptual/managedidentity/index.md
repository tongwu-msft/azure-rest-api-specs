#Managed Identity REST API reference

Managed identities for Azure resources provides Azure services with an automatically managed identity in Azure Active Directory. You can use this identity to authenticate to any service that supports Azure AD authentication, without having credentials in your code.

##Rest Operation Groups

###Operations

- [Lists available operations for the Microsoft.ManagedIdentity provider](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/operations/list?branch=mand)

###User Assigned Identity
- [Lists all the userAssignedIdentities available under the specified subscription](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/listbysubscription?branch=mand)
- [Lists all the userAssignedIdentities available under the specified ResourceGroup](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/listbyresourcegroup?branch=mand)
- [Create or update an identity in the specified subscription and resource group](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/createorupdate?branch=mand)
- [Update an identity in the specified subscription and resource group](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/update?branch=mand)
- [Gets the user assigned identity](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/get?branch=mand)
- [Deletes the user assigned identity](https://review.docs.microsoft.com/en-us/rest/api/managedidentity/userassignedidentities/delete?branch=mand)
