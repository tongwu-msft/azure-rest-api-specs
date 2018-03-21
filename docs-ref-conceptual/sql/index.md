---
ms.assetid: 709f9922-66f0-4315-ad60-4cac7beb4847
ms.title: Azure SQL Database REST API reference
ms.service: sql-database
author: stevestein
ms.author: sstein
ms.manager: douge
service_description: To be added
---

# Azure SQL Database REST API

The Azure SQL Database REST API includes operations for managing Azure SQL Database resources.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Operations](xref:management.azure.com.sqldatabase.operations)|List all of the available SQL Database REST API operations|
|[Databases](~/docs-ref-autogen/sql/databases.yml)| Create, get, update, and delete SQL databases, data warehouses, restore points, service tier advisors, and transparent data encryption configuration.|
|[Servers](xref:management.azure.com.sqldatabase.servers)|Create, get, update, or list information about an Azure SQL server.|
|[Firewall Rules](xref:management.azure.com.sqldatabase.firewallrules)|Create, get, update, delete, or list firewall rules.|
|[Elastic Pools](~/docs-ref-autogen/sql/elasticpools.yml)|Create, get, update, or delete elastic pools.|
|[Recommended Elastic Pools](xref:management.azure.com.sqldatabase.recommendedelasticpools)|Get and list information about Azure SQL recommended pools and Azure SQL databases inside pools.|
|[Elastic Pool Activities](xref:management.azure.com.sqldatabase.elasticpoolactivities)|Get the activities for an elastic pool.|
|[Elastic Pool Database Activities](xref:management.azure.com.sqldatabase.elasticpooldatabaseactivities)|Get the activities for databases in an elastic pool.|
|[Replication Links](xref:management.azure.com.sqldatabase.replicationlinks)| Get, list, delete, and failover a replication link.|
|[Failover Groups](xref:management.azure.com.sqldatabase.failovergroups)| Create, get, update, list, delete, and failover a failover group.| 
|[Capabilities](xref:management.azure.com.sqldatabase.capabilities)| Get the supported SQL Database capabilities available for a given region.| 
|[Database Blob Auditing Policies](xref:management.azure.com.sqldatabase.databaseblobauditingpolicies)| Create or update a database's blob auditing policy.|
|[Database Threat Detection Policies](xref:management.azure.com.sqldatabase.databasethreatdetectionpolicies)| Create or update a database's threat detection policy.|
|[Databases - Import Export](xref:management.azure.com.sqldatabase.databases-importexport)|Import and Export databases (bacpac files).|
|[Recoverable Databases](xref:management.azure.com.sqldatabase.recoverabledatabases)|Get a recoverable database, or list all recoverable databases for a server.|
|[Restorable Dropped Databases](xref:management.azure.com.sqldatabase.restorabledroppeddatabases)| Get a deleted database or list of databases that can be restored.|
|[Restore Points](xref:management.azure.com.sqldatabase.restorepoints)|Get a list of database restore points.|
|[Server Azure AD Administrators](xref:management.azure.com.sqldatabase.serverazureadadministrators)| Create a new Server Active Directory Administrator or update an existing server Active Directory Administrator.|
|[Server DNS Aliases](xref:management.azure.com.sqldatabase.serverdnsaliases)|Create, get, list, acquire or delete a server DNS alias.|
|[Check Server Name](~/docs-ref-autogen/sql/servers%20-%20name%20availability.yml)| Check if a server name is valid and available.|
|[Service Tier Advisor](xref:management.azure.com.sqldatabase.servicetieradvisors)| Get service tier recommendations.|
|[Transparent Data Encryption Activities](xref:management.azure.com.sqldatabase.transparentdataencryptionactivities)| Returns a database's transparent data encryption operation result.|
|[Transparent Data Encryptions](xref:management.azure.com.sqldatabase.transparentdataencryptions)| Create or update a database's transparent data encryption configuration.|




## See Also

- [Azure SQL Database](https://azure.microsoft.com/services/sql-database/)
- [Azure SQL Data Warehouse](https://azure.microsoft.com/services/sql-data-warehouse/)
- [Azure SQL Database Elastic Pool](https://azure.microsoft.com/documentation/articles/sql-database-elastic-pool/)
