---
title: Azure Database for MySQL REST API | Microsoft Docs
description: This article describes the REST APIs available for you to use with Azure Database for MySQL to create, delete, manage, and list servers, databases, logs, firewall rules, and operations.
author: jasonwhowell
ms.author: jasonh
manager: kfile
ms.topic: reference
ms.service: mysql
ms.devlang: rest-api
service_description: Azure Database for MySQL
ms.date: 03/20/2018
---

# Azure Database for MySQL REST API
The Azure Database for MySQL REST API is available for you to create, delete, manage, and list servers, databases, logs, firewall rules, and operations. 

Azure Database for MySQL provides a managed database service for app development and deployment that allows you to stand up a MySQL database in minutes and scale on the fly - on the cloud you trust most.

The following information is common to all tasks that you might do using these REST APIs:  
-   Use the URI `https://management.azure.com/`
-   Replace `{api-version}` with `2017-12-01`.
-   Replace `{subscriptionId}` with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as 6B29FC40-CA47-1067-B31D-00DD010662DA.  Locate the subscription ID using the [Azure portal subsciptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace `{resourceGroupName}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Replace `{serverName}` with the name of your Azure Database for MySQL server. Use the short name, such as `mydemoserver`, not the fully qualified network name, such as `mydemoserver.mysql.database.azure.com`.
-   Set the Content-Type header to **application/json**.  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx). 

## REST operations

| Operation group | Description |
|---|---|
| [Server](xref:management.azure.com.mysql.servers) | Create, Restore, Update, Delete, Get, or List servers. |
| [Configurations](xref:management.azure.com.mysql.configurations) | Update, Get, and List the configuration of a server. | 
| [Databases](xref:management.azure.com.mysql.databases)  | Create, Delete, Get, or List databases in the server. | 
| [Firewall Rules](xref:management.azure.com.mysql.firewallrules) | Create, Delete, Get, or List the firewall rules in a server. |
| [Log Files](xref:management.azure.com.mysql.logfiles) | List the log files in a given server. |
| [Operations](xref:management.azure.com.mysql.operations) | List the available REST API operations. |


## See also
- For an overview of the service, see [Azure Database for MySQL Overview](/azure/mysql/overview)
- [Create an Azure Database for MySQL server using Azure portal](/azure/mysql/quickstart-create-mysql-server-database-using-azure-portal)
- [Create an Azure Database for MySQL server using Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli)
- [Azure CLI Samples](/azure/mysql/sample-scripts-azure-cli) for Azure Database for MySQL
- For information about connecting to the service, see [Connection libraries for Azure Database for MySQL](/azure/mysql/concepts-connection-libraries).
