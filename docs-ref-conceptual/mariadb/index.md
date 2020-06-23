---
title: Azure Database for MariaDB REST API | Microsoft Docs
description: This article describes the REST APIs available for you to use with Azure Database for MariaDB to create, delete, manage, and list servers, databases, logs, firewall rules, and operations.
author: jasonwhowell
ms.author: jasonh
ms.topic: reference
service: mariadb
ms.service: mariadb
ms.devlang: rest-api
service_description: Azure Database for MariaDB
ms.date: 09/24/2018
---

# Azure Database for MariaDB REST API
The Azure Database for MariaDB REST API is available for you to create, delete, manage, and list servers, databases, logs, firewall rules, and operations.

Azure Database for MariaDB provides a managed database service for app development and deployment that allows you to stand up a MariaDB database in minutes and scale on the fly - on the cloud you trust most.

The following information is common to all tasks that you might do using these REST APIs:  
-   Use the URI `https://management.azure.com/`
-   Replace `{api-version}` with `2018-06-01-preview`.
-   Replace `{subscriptionId}` with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as 6B29FC40-CA47-1067-B31D-00DD010662DA.  Locate the subscription ID using the [Azure portal subsciptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace `{resourceGroupName}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Replace `{serverName}` with the name of your Azure Database for MariaDB server. Use the short name, such as `mydemoserver`, not the fully qualified network name, such as `mydemoserver.mariadb.database.azure.com`.
-   Set the Content-Type header to **application/json**.  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).

## REST operations

| Operation group | Description |
|---|---|
| [Server](xref:management.azure.com.mariadb.servers) | Create, Restore, Update, Delete, Get, or List servers. |
| [Configurations](xref:management.azure.com.mariadb.configurations) | Update, Get, and List the configuration of a server. |
| [Databases](xref:management.azure.com.mariadb.databases)  | Create, Delete, Get, or List databases in the server. |
| [Firewall Rules](xref:management.azure.com.mariadb.firewallrules) | Create, Delete, Get, or List the firewall rules in a server. |
| [Log Files](xref:management.azure.com.mariadb.logfiles) | List the log files in a given server. |
| [Operations](xref:management.azure.com.mariadb.operations) | List the available REST API operations. |


## See also
- For an overview of the service, see [Azure Database for MariaDB Overview](/azure/mariadb/overview)
- [Create an Azure Database for MariaDB server using Azure portal](/azure/mariadb/quickstart-create-mariadb-server-database-using-azure-portal)

<!-- comment out until CLI support released
- [Create an Azure Database for MariaDB server using Azure CLI](/azure/mariadb/quickstart-create-mariadb-server-database-using-azure-cli)
- [Azure CLI Samples](/azure/mariadb/sample-scripts-azure-cli) for Azure Database for MariaDB
- For information about connecting to the service, see [Connection libraries for Azure Database for MariaDB](/azure/mariadb/concepts-connection-libraries).
-->