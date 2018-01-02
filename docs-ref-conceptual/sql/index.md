---
ms.assetid: 709f9922-66f0-4315-ad60-4cac7beb4847
ms.title: Azure SQL Database REST API reference
ms.prod: azure
ms.service: sql-database
author: 
ms.author: sstein
ms.manager: douge
service_description: To be added
---

# Azure SQL Database REST API

The Azure SQL Database REST API includes operations for managing Azure SQL Database resources.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Operations](~/docs-ref-autogen/sql/operations.yml)|List all of the available SQL Database REST API operations|
|[Databases](~/docs-ref-autogen/sql/databases.yml)| Create, get, update, and delete SQL databases, data warehouses, restore points, service tier advisors, and transparent data encryption configuration.|
|[Servers](~/docs-ref-autogen/sql/servers.yml)|Create, get, update, or list information about an Azure SQL server.|
|[Firewall Rules](~/docs-ref-autogen/sql/firewallrules.yml)|Create, get, update, delete, or list firewall rules.|
|[Elastic Pools](~/docs-ref-autogen/sql/elasticpools.yml)|Create, get, update, or delete elastic pools.|
|[Recommended Elastic Pools](~/docs-ref-autogen/sql/recommendedelasticpools.yml)|Get and list information about Azure SQL recommended pools and Azure SQL databases inside pools.|
|[Elastic Pool Activities](~/docs-ref-autogen/sql/elasticpoolactivities.yml)|Get the activities for an elastic pool.|
|[Elastic Pool Database Activities](~/docs-ref-autogen/sql/elasticpooldatabaseactivities.yml)|Get the activities for databases in an elastic pool.|
|[Replication Links](~/docs-ref-autogen/sql/replicationlinks.yml)| Get, list, delete, and failover a replication link.|
|[Failover Groups](~/docs-ref-autogen/sql/failovergroups.yml)| Create, get, update, list, delete, and failover a failover group.| 
|[Capabilities](~/docs-ref-autogen/sql/capabilities.yml)| Get the supported SQL Database capabilities available for a given region.| 
|[Database Blob Auditing Policies](~/docs-ref-autogen/sql/databaseblobauditingpolicies.yml)| Create or update a database's blob auditing policy.|
|[Database Threat Detection Policies](~/docs-ref-autogen/sql/databasethreatdetectionpolicies.yml)| Create or update a database's threat detection policy.|
|[Databases - Import Export](~/docs-ref-autogen/sql/databases%20-%20import%20export.yml)|Import and Export databases (bacpac files).|
|[Recoverable Databases](~/docs-ref-autogen/sql/recoverabledatabases.yml)|Get a recoverable database, or list all recoverable databases for a server.|
|[Restorable Dropped Databases](~/docs-ref-autogen/sql/restorabledroppeddatabases.yml)| Get a deleted database or list of databases that can be restored.|
|[Restore Points](~/docs-ref-autogen/sql/restorepoints.yml)|Get a list of database restore points.|
|[Server Azure AD Administrators](~/docs-ref-autogen/sql/serverazureadadministrators.yml)| Create a new Server Active Directory Administrator or update an existing server Active Directory Administrator.
|[Check Server Name](~/docs-ref-autogen/sql/servers%20-%20sql.yml)| Check if a server name is valid and available.|
|[Service Tier Advisor](~/docs-ref-autogen/sql/servicetieradvisors.yml)| Get service tier recommendations.|
|[Transparent Data Encryption Activities](~/docs-ref-autogen/sql/transparentdataencryptionactivities.yml)| Returns a database's transparent data encryption operation result.|
|[Transparent Data Encryptions](~/docs-ref-autogen/sql/transparentdataencryptions.yml)| Create or update a database's transparent data encryption configuration.|




## See Also

- [Azure SQL Database](https://azure.microsoft.com/services/sql-database/)
- [Azure SQL Data Warehouse](https://azure.microsoft.com/services/sql-data-warehouse/)
- [Azure SQL Database Elastic Pool](https://azure.microsoft.com/documentation/articles/sql-database-elastic-pool/)