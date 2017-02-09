---
title: "Data Lake Store REST Reference"
ms.custom: ""
ms.date: "2016-12-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "data-lake-store"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: be7a26f8-5b72-43db-8416-a4138760e380
caps.latest.revision: 11
author: "nitinme"
ms.author: "nitinme"
manager: "jhubbard"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Data Lake Store REST Reference
Use the Azure Data Lake Store REST  APIs to create and manage Data Lake Store resources through Azure Resource Manager. All task operations conform to the HTTP/1.1 protocol specification and most operations return an x-ms-request-id header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure, using `https`. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).  
  
 There are two sets of REST APIs that are used to work with Data Lake Store - Filesystem APIs and Account management APIs.  
  
## Filesystem APIs  
 Data Lake Store supports WebHDFS API for filesystem operations, with some exceptions. For more information, see the [WebHDFS FileSystem APIs](../AzureDataLakeStoreREST/webhdfs-filesystem-apis.md).  
  
##  <a name="accountmanagement"></a> Account management APIs  
 Data Lake Store exposes account management APIs that enable  you to create and manage Data Lake Store accounts. Following are the tasks that you can perform using these APIs.  
  
-   [Create a Data Lake Store account](../AzureDataLakeStoreREST/create-a-data-lake-store-account.md)  
  
-   [Get information about a Data Lake Store account](../AzureDataLakeStoreREST/get-information-about-a-data-lake-store-account1.md)  
  
-   [List all Data Lake Store accounts in a resource group](../AzureDataLakeStoreREST/list-all-data-lake-store-accounts-in-a-resource-group.md)  
  
-   [List all Data Lake Store accounts in a subscription](../AzureDataLakeStoreREST/list-all-data-lake-store-accounts-in-a-subscription.md)  
  
-   [Delete a Data Lake Store account](../AzureDataLakeStoreREST/delete-a-data-lake-store-account2.md)  
  
##  <a name="bk_common_adls"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Data Lake Store:  
  
-   Replace {api-version} with **2016-11-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {account-name} with your Data Lake Store account name in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).