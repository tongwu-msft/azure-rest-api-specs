---
title: "Publisher policy operations"
description: Learn how the Publisher Policy Operations APIs enable you to perform publisher policy operations on Event Hubs.
ms.custom: ""
ms.date: 07/14/2020
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7131e270-4f57-4818-8bd4-88fbe14073c8
caps.latest.revision: 5
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"
---
# Publisher policy operations - common headers and parameters
These APIs enable you to perform publisher policy operations on Event Hubs.  
  
## Common parameters
 The following information is common to all tasks related to Event Hubs publisher policy:  
  
-   Replace `{api-version}` with `2014-01` in the URL.    
-   Replace `{servicebusNamespace}` with name of the namespace.   
-   Replace `{eventHubPath}` with the path to your event hub.    
-   Replace `{publisherName}` with the name of your publisher.  
  
## Common headers

 The following table describes common request headers. 
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`| Specify one of the following:<ul><li> Azure Active Directory (Azure AD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <Azure AD JWT token>`. <br/>For information on generating an Azure AD token, see [Get Azure AD token](get-azure-active-directory-token.md). </li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas#generate-a-shared-access-signature-token) and [Generate SAS token](generate-sas-token.md).</li></ul> |  
|`Content-Type`|Set to `application/atom+xml;type=entry;charset=utf-8`.|  
  
## Tasks  
 You can perform the following publisher policy operations:  
  
-   [Get revoked publishers](get-revoked-publishers.md)  
  
-   [Revoke publisher](revoke-publisher.md)  
  
-   [Resume publisher](resume-publisher.md)