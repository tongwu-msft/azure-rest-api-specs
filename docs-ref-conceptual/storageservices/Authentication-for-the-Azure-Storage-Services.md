---
title: "Authentication for the Azure Storage Services"
ms.custom: na
ms.date: 05/20/2018
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.author: tamram
ms.assetid: 96cec7bc-63cc-4227-920a-dddd850433c9
caps.latest.revision: 63
author: tamram
manager: jeconnoc
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Authentication for the Azure Storage Services

Every request made against a secured resource in the Blob, File, Queue, or Table service must be authenticated. Authentication ensures that resources in your storage account are accessible only when you want them to be, and only to those users or applications to whom you grant access. 

Options for authenticating requests to Azure Storage include:

- **Azure Active Directory (Azure AD)(Preview):** [Azure AD](https://docs.microsoft.com/azure/active-directory/active-directory-whatis.md) is Microsoft's cloud-based identity and access management service. Azure AD integration is currently available in preview for the Blob and Queue services. With Azure AD, you can assign fine-grained access to users, groups, or applications via role-based access control (RBAC). For information about Azure AD integration with Azure Storage, see [Authenticate with Azure Active Directory](Authenticate-with-Azure-Active-Directory.md). 
- **Shared Key:** Shared Key authentication relies on your account access keys and other parameters to produce an encrypted signature string that is passed on the request in the Authorization header. For more information about Shared Key authentication, see [Authenticate with Shared Key](Authenticate-with-Shared-Key.md).
- **Shared access signatures:** Shared access signatures (SAS) delegate access to a particular resource in your account with specified permissions and over a specified time interval. For more information about SAS, see [Delegating Access with a Shared Access Signature](Delegating-Access-with-a-Shared-Access-Signature.md). 
- **Anonymous access to containers and blobs:** You can optionally make blob resources public at the container or blob level. A public container or blob is accessible to any user for anonymous read access. Read requests to public containers and blobs do not require authentication. For more information, see [Enable public read access for containers and blobs in Azure Blob storage](https://docs.microsoft.com/azure/storage/blobs/storage-manage-access-to-resources).

> [!TIP]
> Authenticating from your Azure Storage applications with Azure AD provides superior security and ease of use over existing authentication options. While you can continue to use Shared Key authentication with your applications, using Azure AD circumvents the need to store your account access key with your code. Similarly, you can continue to use shared access signatures (SAS) to grant fine-grained access to resources in your storage account, but Azure AD offers similar capabilities without the need to manage SAS tokens or worry about revoking a compromised SAS. For more information about Azure AD integration in Azure Storage, see [Authenticating requests to Azure Storage using Azure Active Directory (Preview)](https://docs.microsoft.com/azure/storage/common/storage-authentication-aad).
  
