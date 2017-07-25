---
title: Azure Database for MySQL REST API | Microsoft Docs
description: This article describes the REST APIs available for you to use with Azure Database for MySQL to create, delete, manage, and list servers, databases, logs, firewall rules, and operations.
author: jasonwhowell
ms.author: jasonh
manager: jhubbard
ms.topic: reference
ms.service: mysql-database
ms.devlang: rest-api
service_description: Azure Database for MySQL
ms.date: 07/25/2017
---

# Azure Database for MySQL REST API
The Azure Database for MySQL REST API is available for you to create, delete, manage, and list servers, databases, logs, firewall rules, and operations. 

Azure Database for MySQL provides a managed database service for app development and deployment that allows you to stand up a MySQL database in minutes and scale on the fly - on the cloud you trust most.

 The following information is common to all tasks that you might do using these REST APIs:  
-   Replace `{api-version}` with `2017-04-30-preview`.
-   Replace `{subscriptionId}` with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as 6B29FC40-CA47-1067-B31D-00DD010662DA.  Locate the subscription ID using the [Azure portal subsciptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace `{resourceGroupName}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Replace `{serverName}` with the name of your Azure Database for MySQL server. Use the short name, such as myserver4demo, not the fully qualified network name, such as myserver4demo.mysql.database.azure.com.
-   Set the Content-Type header to **application/json**.  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx). 

## REST operations

| Operation group | Description |
|---|---|
| [Server](~/docs-ref-autogen/mysql/Servers.json) | Creates, Updates, Delete, Get, or List servers. |
| [Configurations](~/docs-ref-autogen/mysql/Configurations.json) | Update, Get, and List the configuration of a server. | 
| [Databases](~/docs-ref-autogen/mysql/Databases.json)  | Create, Delete, Get, or List databases in the server. | 
| [Firewall Rules](~/docs-ref-autogen/mysql/FirewallRules.json) | Create, Delete, Get, or List the firewall rules in a server. |
| [Log Files](~/docs-ref-autogen/mysql/LogFiles.json) | List the log files in a given server. |
| [Operations](~/docs-ref-autogen/mysql/Operations.json) | List the available REST API operations. |


## See also
- For an overview of the service, see [Azure Database for MySQL Overview](/azure/mysql/overview.md)
- [Create an Azure Database for MySQL server using Azure portal](/azure/mysql/quickstart-create-mysql-server-database-using-azure-portal.md)
- [Create an Azure Database for MySQL server using Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli.md)
- [Azure CLI Samples](/azure/mysql/sample-scripts-azure-cli) for Azure Database for MySQL
- For information about connecting to the service, see [Connection libraries for Azure Database for MySQL](/azure/mysql/concepts-connection-libraries.md).
