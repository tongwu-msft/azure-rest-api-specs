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
-   Replace {api-version} with `2017-04-30-preview`.
-   Replace {subscriptionId} with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as 6B29FC40-CA47-1067-B31D-00DD010662DA.  Locate the subscription ID using the [Azure portal subsciptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace {resourceGroupName} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Replace {serverName} with the name of your Azure Database for MySQL server. Use the short name, such as myserver4demo, not the fully qualified network name, such as myserver4demo.mysql.database.azure.com.
-   Set the Content-Type header to **application/json**.  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx). 

## REST operations

| Operation group | Operation | Description |
|---|---|---|
| Server | [Create or Update](~/docs-ref-autogen/mysql/Servers.json#Servers_CreateOrUpdate) | Creates a new server or updates an existing server. The update action will overwrite the existing server. |
| Server | [Delete](~/docs-ref-autogen/mysql/Servers.json#Servers_Delete) | Deletes a server. |
| Server | [Get](~/docs-ref-autogen/mysql/Servers.json#Servers_Get) | Gets information about a server. |
| Server | [List](~/docs-ref-autogen/mysql/Servers.json#Servers_List) | List all the servers in a given subscription. |
| Server | [List by Resource Group](~/docs-ref-autogen/mysql/Servers.json#Servers_ListByResourceGroup) | List all the servers in a given resource group. |
| Server | [Update](~/docs-ref-autogen/mysql/Servers.json#Servers_Update) | Updates an existing server.  |
| Configurations | [Create or Update](~/docs-ref-autogen/mysql/Configurations.json#Configurations_CreateOrUpdate) | Updates a configuration of a server. | 
| Configurations | [Get](~/docs-ref-autogen/mysql/Configurations.json#Configurations_Get) | Gets information about a configuration of server. | 
| Configurations | [List](~/docs-ref-autogen/mysql/Configurations.json#Configurations_ListByServer) | List all the configurations in a given server. | 
| Databases | [Create or Update](~/docs-ref-autogen/mysql/Databases.json#Databases_CreateOrUpdate)  | Create a new database or update an existing database. | 
| Databases | [Delete](~/docs-ref-autogen/mysql/Databases.json#Databases_Delete) | Deletes a database. |
| Databases | [Get](~/docs-ref-autogen/mysql/Databases.json#Databases_Get) | Gets information about a database. |
| Databases | [List](~/docs-ref-autogen/mysql/Databases.json#Databases_ListByServer) | List all the databases in a given server. |
| Firewall Rules | [Create or Update](~/docs-ref-autogen/mysql/FirewallRules.json#FirewallRules_CreateOrUpdate) | Creates a new firewall rule or updates an existing firewall rule. |
| Firewall Rules | [Delete](~/docs-ref-autogen/mysql/FirewallRules.json#FirewallRules_Delete) | Deletes a server firewall rule. |
| Firewall Rules | [Get](~/docs-ref-autogen/mysql/FirewallRules.json#FirewallRules_Get) | Gets information about a server firewall rule. |
| Firewall Rules | [List](~/docs-ref-autogen/mysql/FirewallRules.json#FirewallRules_ListByServer) | List all the firewall rules in a given server. |
| Log Files | [List](~/docs-ref-autogen/mysql/LogFiles.json#LogFiles_ListByServer) | List all the log files in a given server. |
| Operations | [List](~/docs-ref-autogen/mysql/Operations.json#Operations_List) | Lists all of the available REST API operations. |


## See also
- For an overview of the service, see [Azure Database for MySQL Overview](/azure/mysql/overview.md)
- [Create an Azure Database for MySQL server using Azure portal](/azure/mysql/quickstart-create-mysql-server-database-using-azure-portal.md)
- [Create an Azure Database for MySQL server using Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli.md)
- [Azure CLI Samples](/azure/mysql/sample-scripts-azure-cli) for Azure Database for MySQL
- For information about connecting to the service, see [Connection libraries for Azure Database for MySQL](/azure/mysql/concepts-connection-libraries.md).
