---
ms.assetid: 709f9922-66f0-4315-ad60-4cac7beb4847
title: Azure SQL Database and Azure SQL Managed Instance REST API reference
ms.service: sql-database
author: stevestein
ms.author: sstein
ms.manager: jroth
ms.date: 03/24/2021
service_description: To be added
---

# Azure SQL Database and Azure SQL Managed Instance REST API

The Azure SQL Database REST API includes operations for managing Azure SQL Database and Azure SQL Managed Instance resources.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Backup Long Term Retention Policies](xref:management.azure.com.sql.backuplongtermretentionpolicies)|Backup Long Term Retention Policies REST API operations.|
|[Backup Short Term Retention Policies](xref:management.azure.com.sql.backupshorttermretentionpolicies)|Backup Short Term Retention Policies REST API operations.|
|[Capabilities](xref:management.azure.com.sql.capabilities)| Get the supported capabilities available for a given region.|
|[Data Masking Policies](xref:management.azure.com.sql.datamaskingpolicies)|Data Masking Policies REST API operations.|
|[Data Masking Rules](xref:management.azure.com.sql.datamaskingrules)|Data Masking Rules REST API operations.|
|[Data Warehouse User Activities](xref:management.azure.com.sql.datawarehouseuseractivities)|Data Warehouse User Activities REST API operations.|
|[Database Advisors](xref:management.azure.com.sql.databaseadvisors)|List all of the available SQL Database REST API operations.|
|[Database Auditing Settings](xref:management.azure.com.sql.databaseauditingsettings)|Database Advisors REST API operations.|
|[Database Automatic Tuning](xref:management.azure.com.sql.databaseautomatictuning)|Database Automatic Tuning REST API operations.|
|[Database Extended Auditing Settings](xref:management.azure.com.sql.databaseextendedauditingsettings)|Database Extended Auditing Settings REST API operations.|
|[Database Operations](xref:management.azure.com.sql.databaseoperations)|List all of the available SQL Database REST API operations.|
|[Database Recommended Actions](xref:management.azure.com.sql.databaserecomendedactions)|Database Recommended Actions REST API operations.|
|[Database Threat Detection Policies](xref:management.azure.com.sql.databasethreatdetectionpolicies)|Database Threat Detection Policies REST API operations.|
|[Database Vulnerability Assessment Rule Baselines](xref:management.azure.com.sql.databasevulnerabilityassessmentrulebaselines)|Database Vulnerability Assessment Rule Baselines REST API operations.|
|[Database Vulnerability Assessment Scans](xref:management.azure.com.sql.databasevulnerabilityassessmentscans)|Database Vulnerability Assessment Scans REST API operations.|
|[Database Vulnerability Assessments](xref:management.azure.com.sql.databasevulnerabilityassessments)|Database Vulnerability Assessments REST API operations.|
|[Databases](xref:management.azure.com.sql.databases)| Create, get, update, and delete SQL databases, data warehouses, restore points, service tier advisors, and transparent data encryption configuration.|
|[Elastic Pool Activities](xref:management.azure.com.sql.elasticpoolactivities)|Get the activities for an elastic pool.|
|[Elastic Pool Database Activities](xref:management.azure.com.sql.elasticpooldatabaseactivities)|Get the activities for databases in an elastic pool.|
|[Elastic Pool operations](xref:management.azure.com.sql.elasticpooloperations)|Cancel or list elastic pool operations.|
|[Elastic Pools](xref:management.azure.com.sql.elasticpools)|Create, get, update, or delete elastic pools.|
|[Encryption Protectors](xref:management.azure.com.sql.encryptionprotectors)|Encryption protector operations.|
|[Failover Groups](xref:management.azure.com.sql.failovergroups)| Create, get, update, list, delete, and failover a failover group.|
|[Firewall Rules](xref:management.azure.com.sql.firewallrules)|Create, get, update, delete, or list firewall rules.|
|[Instance Failover Groups](xref:management.azure.com.sql.instancefailovergroups)|Instance Failover Groups operations.|
|[Instance Pools](xref:management.azure.com.sql.instancepools)|Instance Pools operations.|
|[Job Agents](xref:management.azure.com.sql.jobagents)|Job Agents REST API operations.|
|[Job Credentials](xref:management.azure.com.sql.jobcredentials)|Job Credentials REST API operations.|
|[Job Executions](xref:management.azure.com.sql.jobexecutions)|Job Executions REST API operations.|
|[Job Step Executions](xref:management.azure.com.sql.jobstepexecutions)|Job Step Executions REST API operations.|
|[Job Steps](xref:management.azure.com.sql.jobsteps)|Job Steps REST API operations.|
|[Job Target Executions](xref:management.azure.com.sql.jobtargetexecutions)|Job Target Executions REST API operations.|
|[Job Target Groups](xref:management.azure.com.sql.jobtargetgroups)|Job Target Groups REST API operations.|
|[Job Versions](xref:management.azure.com.sql.jobversions)|Job Versions REST API operations.|
|[Jobs](xref:management.azure.com.sql.jobs)|Jobs REST API operations.|
|[Long Term Retention Backups](xref:management.azure.com.sql.longtermretentionbackups)|Long Term Retention Backups REST API operations.|
|[Long Term Retention Managed Instance Backups](xref:management.azure.com.sql.longtermretentionmanagedinstancebackups)|Long Term Retention Managed Instance Backups REST API operations.|
|[Managed Database Vulnerability Assessment Rule Baselines](xref:management.azure.com.sql.manageddatabasevulnerabilityassessmentrulebaselines)|Managed Database Vulnerability Assessment Rule Baselines REST API operations.|
|[Managed Database Vulnerability Assessment Scans](xref:management.azure.com.sql.manageddatabasevulnerabilityassessmentscans)|Managed Database Vulnerability Assessment Scans REST API operations.|
|[Managed Database Vulnerability Assessments](xref:management.azure.com.sql.manageddatabasevulnerabilityassessments)|Managed Database Vulnerability Assessments REST API operations.|
|[Managed Databases](xref:management.azure.com.sql.manageddatabases)|Managed Databases REST API operations.|
|[Managed Instance Encryption Protectors](xref:management.azure.com.sql.operations)|Managed Instance Encryption Protectors REST API operations.|
|[Managed Instance Keys](xref:management.azure.com.sql.managedinstancekeys)|Managed Instance Keys REST API operations.|
|[Managed Instance Long Term Retention Policies](xref:management.azure.com.sql.managedinstancelongtermretentionpolicies)|Managed Instance Long Term Retention Policies REST API operations.|
|[Managed Instance Operations](xref:management.azure.com.sql.managedinstanceoperations)|Managed Instance Operations REST API operations.|
|[Managed Instance Vulnerability Assessments](xref:management.azure.com.sql.managedinstancevulnerabilityassessments)|Managed Instance Vulnerability Assessments REST API operations.|
|[Managed Instances](xref:management.azure.com.sql.managedinstances)|Managed Instances REST API operations.|
|[Managed Instances - Failover](https://docs.microsoft.com/rest/api/sql/managed%20instances%20-%20failover)|Managed Instances - Failover REST API operations.|
|[Operations](xref:management.azure.com.sql.operations)|List all of the available SQL Database REST API operations.|
|[Recoverable Databases](xref:management.azure.com.sql.recoverabledatabases)|Get a recoverable database, or list all recoverable databases for a server.|
|[Recoverable Managed Databases](xref:management.azure.com.sql.operations)|Recoverable Managed Databases REST API operations.|
|[Replication Links](xref:management.azure.com.sql.replicationlinks)|Replication Links REST API operations.|
|[Restorable Dropped Databases](xref:management.azure.com.sql.restorabledroppeddatabases)| Get a deleted database or list of databases that can be restored.|
|[Restore Points](xref:management.azure.com.sql.restorepoints)|Get a list of database restore points.|
|[Sensitivity Labels](xref:management.azure.com.sql.sensitivitylabels)|Sensitivity Labels REST API operations.|
|[Server Advisors](xref:management.azure.com.sql.serveradvisors)|Server Advisors REST API operations.|
|[Server Auditing Settings](xref:management.azure.com.sql.serverauditingsettings)|Server Auditing Settings REST API operations.|
|[Server Automatic Tuning](xref:management.azure.com.sql.serverautomatictuning)|Server Automatic Tuning REST API operations.|
|[Server Azure AD Administrators](xref:management.azure.com.sql.serverazureadadministrators)|Server Azure AD Administrators REST API operations.|
|[Server DevOps Audit Settings](xref:management.azure.com.sql.serverdevopsauditsettings)|Server DevOps Audit Settings REST API operations.|
|[Server Dns Aliases](xref:management.azure.com.sql.serverdnsaliases)|Server Dns Aliases REST API operations.|
|[Server Extended Auditing Settings](https://docs.microsoft.com/rest/api/sql/server%20extended%20auditing%20settings)|Server Extended Auditing Settings REST API operations.|
|[Server Keys](xref:management.azure.com.sql.serverkeys)|Server Keys REST API operations.|
|[Server Security Alert Policies](xref:management.azure.com.sql.serversecurityalertpolicies)|Server Security Alert Policies REST API operations.|
|[Server Trust Groups](xref:management.azure.com.sql.servertrustgroups)|Server Trust Groups REST API operations.|
|[Server Vulnerability Assessments](xref:management.azure.com.sql.servervulnerabilityassessments)|Server Vulnerability Assessments REST API operations.|
|[Servers](xref:management.azure.com.sql.servers)|Create, get, update, or list information about an Azure SQL server.|
|[Servers - Name Availability](https://docs.microsoft.com/rest/api/sql/servers%20-%20name%20availability)|Servers - Name Availability REST API operations.|
|[Service Tier Advisors](xref:management.azure.com.sql.servicetieradvisors)|Service Tier Advisors REST API operations.|
|[Subscription Usages](xref:management.azure.com.sql.subscriptionusages)|Subscription Usages REST API operations.|
|[Sync Agents](xref:management.azure.com.sql.syncagents)|Sync Agents REST API operations.|
|[Sync Groups](xref:management.azure.com.sql.syncgroups)|Sync Groups REST API operations.|
|[Sync Members](xref:management.azure.com.sql.syncmembers)|Sync Members REST API operations.|
|[Transparent Data Encryption Activities](xref:management.azure.com.sql.transparentdataencryptionactivities)|Transparent Data Encryption Activities REST API operations.|
|[Transparent Data Encryptions](xref:management.azure.com.sql.transparentdataencryptions)|Transparent Data Encryptions REST API operations.|
|[Virtual Clusters](xref:management.azure.com.sql.virtualclusters)|Virtual Clusters REST API operations.|
|[Virtual Network Rules](xref:management.azure.com.sql.virtualnetworkrules)|Virtual Network Rules REST API operations.|



## See Also

- [Azure SQL Database](https://docs.microsoft.com/azure/azure-sql/database/)
- [Azure SQL Managed Instance](https://docs.microsoft.com/azure/azure-sql/managed-instance/)
