---
ms.title: Azure HDInsight REST API Reference
ms.date: 11/16/2016
ms.service: hdinsight
author: jasonwhowell
ms.author: jasonh
ms.manager: kfile
ms.assetid: 37b1c530-8ef4-49d5-8dd2-48220e980d3e
---

# Azure HDInsight REST API

Use these APIs to create and manage HDInsight resources through Azure Resource Manager. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an x-ms-request-id header that can be used to obtain information about the request. Ensure that requests made to these resources are secure. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).  
  
 These APIs allow you to create and manage an HDInsight cluster.

##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks related to clusters that you might do:  
  
-   Replace {api-version} with 2015-03-01-preview  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {cluster-name} with your HDInsight cluster name in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx). 

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Application](hdinsight-application.md)| Provides operations to create, remove, and retrieve HDInsight clusters with applications. |
|[Cluster](hdinsight-cluster.md) | Provides operations to work with HDInsight clusters. |  
  
##  Common parameters and headers  

The following information is common to all tasks related to clusters that you might do:  
  
-   Replace {api-version} with 2015-03-01-preview  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {cluster-name} with your HDInsight cluster name in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx). 

