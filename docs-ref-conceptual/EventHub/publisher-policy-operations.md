---
title: "Publisher policy operations"
ms.custom: ""
ms.date: 07/14/2020
ms.prod: "azure"
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
# Publisher policy operations
These APIs enable you to perform publisher policy operations on Event Hubs.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Event Hubs publisher policy:  
  
-   Replace {api-version} with "2014-01" in the URL.  
  
-   Replace {servicebusNamespace} with the namespace obtained from the Azure classic portal.  
  
-   Replace {eventHubPath} with the path to your Event Hub.  
  
-   Replace {publisherName} with the name of your publisher.  
  
## Common headers

 The following table describes common request headers. 
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization| Specify one of the following:<ul><li> Azure Active Directory (AAD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <AAD JWT token>`. <br/>For information on generating an AAD token, see [Authenticate from an application](https://docs.microsoft.com/azure/event-hubs/authenticate-application#authenticate-from-an-application).</li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas#generate-a-shared-access-signature-token) and [Generate SAS token](generate-sas-token.md).</li></ul> |  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
  
## Tasks  
 You can perform the following publisher policy operations:  
  
-   [Get revoked publishers](get-revoked-publishers.md)  
  
-   [Revoke publisher](revoke-publisher.md)  
  
-   [Resume publisher](resume-publisher.md)