---
title: "WebHDFS FileSystem APIs"
ms.custom: ""
ms.date: "2016-12-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "data-lake-store"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9b0cffc1-a3fb-456e-aa03-8e7ba8a4d9b7
caps.latest.revision: 8
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
# WebHDFS FileSystem APIs
Azure Data Lake Store is a cloud-scale file system that is compatible with Hadoop Distributed File System (HDFS) and works with the Hadoop ecosystem.  Your existing applications or services that use the WebHDFS API can easily integrate with ADLS.  
  
## URL for REST calls  
 A typical WebHDFS REST URL looks like the following:  
  
```  
http://<DATANODE>:<PORT>/webhdfs/v1/<PATH>?op=<OP>...&api-version=2016-11-01
```  
  
 To map this URL for a REST call to Data Lake Store, make the following changes:  
  
-   Use `https` instead of `http`  
  
-   Replace DATANODE with the fully-qualified account name, like `<data_lake_store_name>.azuredatalakestore.net`  
  
-   Skip the port  
  
 So, a REST endpoint URL for Data Lake Store using the WebHDFS APIs should look like the following:  
  
```  
https://<data_lake_store_name>.azuredatalakestore.net/webhdfs/v1/<PATH>?op=<OP>...?api-version=2016-11-01 
```  
  
## Passing authorization token in the message header  
 Data Lake Store uses Azure Active Directory to authorize REST calls. All REST calls to Data Lake Store must include an authorization token as part of the message header. For a detailed discussion on how Azure Active Directory  uses OAuth, see [OAuth2.0 in Azure Active Directory](https://msdn.microsoft.com/library/azure/dn645545.aspx). For instructions on how to request an authorization token, see [How do I authenticate using Azure Active Directory](https://azure.microsoft.com/documentation/articles/data-lake-store-get-started-rest-api#how-do-i-authenticate-using-azure-active-directory/).  
  
> [!NOTE]
>  For a list of common headers and parameters that are required for calls to Data Lake Store, see [Common parameters and headers](index.md#bk_common).  
  
## WebHDFS compliant APIs for Data Lake Store  
 The table below lists the WebHDFS APIs that can be used with Data Lake Store. Wherever applicable, the table also lists deviation from the standard WebHDFS APIs, such as if some parameters are not supported, or when some parameters are supported differently.  
  
> [!NOTE]
>  Data Lake Store currently supports WebHDFS version 2.7.2.  
  
|WebHDFS API with Data Lake Store|Request/Response|Important considerations|  
|--------------------------------------|-----------------------|------------------------------|  
|CREATE|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Create_and_Write_to_a_File)|The following request parameters are **not** supported.<br /><br /> -   **blocksize** - This is fixed at 256MB and cannot be changed.<br />-   **replication** - This is handled internally by Data Lake Store.Even if you provide this parameter, it will be ignored and no error will be returned.<br />-   **buffersize** - This is fixed at 4MB and cannot be changed.|  
|APPEND|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Append_to_a_File)|The following request parameters are not supported:<br /><br /> -   **buffersize** - This is fixed at 4MB and cannot be changed|  
|CONCAT|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Concat_Files)|-|  
|OPEN|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Open_and_Read_a_File)|The following request parameters are not supported:<br /><br /> -   **buffersize** - This is fixed at 4MB and cannot be changed|  
|MKDIRS|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Make_a_Directory)|-| 
|RENAME|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Rename_a_FileDirectory)|-|  
|DELETE|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Delete_a_FileDirectory)|-|  
|GETFILESTATUS|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Status_of_a_FileDirectory)|The following response parameters are supported differently:<br /><br />-   **type** - SYMLINK is not supported so it will not be returned; FILE and DIRECTORY will be.|  
|LISTSTATUS|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#List_a_Directory)|-|
|GETCONTENTSUMMARY|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Get_Content_Summary_of_a_Directory)|The following response parameters are not supported:<br /><br /> -   **quota** - Data Lake Store does not return quota.<br />-   **spaceQuota** - Data Lake Store does not return spaceQuota.|  
|SETPERMISSION|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Set_Permission)|-|
|SETOWNER|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Set_Owner)|-|
|MODIFYACLENTRIES|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Modify_ACL_Entries)|-|
|REMOVEACLENTRIES|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Remove_ACL_Entries)|-|
|SETACL|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Set_ACL)|-|  
|GETACLSTATUS|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Get_ACL_Status)|-|  
|CHECKACCESS|See [here](http://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/WebHDFS.html#Check_access)|-|
