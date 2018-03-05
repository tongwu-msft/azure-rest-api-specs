---
title: Azure Database for PostgreSQL REST API | Microsoft Docs
description: This article describes the REST APIs available for you to use with Azure Database for PostgreSQL to create, delete, manage, and list servers, databases, logs, firewall rules, and operations.
author: jasonwhowell
ms.author: jasonh
manager: kfile
ms.topic: reference
ms.service: postgresql-database
ms.devlang: rest-api
service_description: Azure Database for PostgreSQL
ms.date: 03/05/2018
---

# Azure Database for PostgreSQL REST API
The Azure Database for PostgreSQL REST API is available for you to create, delete, manage, and list servers, databases, logs, firewall rules, and operations. 

Azure Database for PostgreSQL provides a managed database service for app development and deployment that allows you to stand up a PostgreSQL database in minutes and scale on the fly - on the cloud you trust most.

 The following information is common to all tasks that you might do using these REST APIs:  
-   Replace `{api-version}` with `2017-12-01-preview`.
-   Replace `{subscriptionId}` with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as 6B29FC40-CA47-1067-B31D-00DD010662DA.  Locate the subscription ID using the [Azure portal subsciptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace `{resourceGroupName}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Replace `{serverName}` with the name of your Azure Database for PostgreSQL server. Use the short name, such as `mydemoserver`, not the fully qualified network name, such as `mydemoserver.postgres.database.azure.com`.
-   Set the Content-Type header to **application/json**.  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx). 

## REST operations

| Operation group | Description |
|---|---|
| [Server](~/docs-ref-autogen/postgresql/Servers.yml) | Create, Restore, Update, Delete, Get, or List servers. |
| [Configurations](~/docs-ref-autogen/postgresql/Configurations.yml) | Update, Get, and List the configuration of a server. | 
| [Databases](~/docs-ref-autogen/postgresql/Databases.yml)  | Create, Delete, Get, or List databases in the server. | 
| [Firewall Rules](~/docs-ref-autogen/postgresql/FirewallRules.yml) | Creates, Delete, Get, or List the firewall rules in a server. |
| [Log Files](~/docs-ref-autogen/postgresql/LogFiles.yml) | Lists the log files in a given server. |
| [Operations](~/docs-ref-autogen/postgresql/Operations.yml) | Lists the available REST API operations. |


## See also
- For an overview of the service, see [Azure Database for PostgreSQL Overview](/azure/postgresql/overview)
- [Create an Azure Database for PostgreSQL server using Azure portal](/azure/postgresql/quickstart-create-server-database-portal)
- [Create an Azure Database for PostgreSQL server using Azure CLI](/azure/postgresql/quickstart-create-server-database-azure-cli)
- [Azure CLI Samples](/azure/postgresql/sample-scripts-azure-cli) for Azure Database for PostgreSQL
- For information about connecting to the service, see [Connection libraries for Azure Database for PostgreSQL](/azure/postgresql/concepts-connection-libraries).
