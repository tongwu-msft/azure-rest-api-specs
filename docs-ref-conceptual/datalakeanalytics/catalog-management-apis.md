---
title: "Catalog management APIs"
ms.custom: ""
ms.date: "02/09/2017"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 78ed543a-c77f-47c7-8b79-a62d40d9429d
caps.latest.revision: 7
ms.author: "jgao"
manager: "jhubbard"
---
# Catalog management APIs
Use the following REST APIs to manage Azure Data Lake Analytics catalogs.  
  
-   [List U-SQL catalog items](list-u-sql-catalog-items.md)  
-   [Get information about a U-SQL catalog item](get-information-about-a-u-sql-catalog-item.md)  
-   [Delete a U-SQL credential](delete-a-u-sql-credential1.md)  
  
##  <a name="bk_common_adla"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Data Lake Store:  
  
-   Replace {api-version} with 2016-11-01.  
-   Replace {account-name} with your Data Lake Analytics account name in the URI.  
-   Set the Content-Type header to **application/json**.    
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For catalog operations, be sure to obtain a token for the resource URI / audience claim “https://datalake.azure.net/”, NOT “https://management.core.windows.net/” nor “https://management.azure.com/”. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).