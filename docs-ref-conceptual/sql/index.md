---
ms.assetid: 709f9922-66f0-4315-ad60-4cac7beb4847
title: Azure SQL Database REST API reference
ms.service: sql-database
author: stevestein
ms.date: 03/30/2021
ms.author: sstein
ms.manager: douge
service_description: To be added
---

# Azure SQL Database REST API

The Azure SQL Database REST API includes operations for managing Azure SQL Database resources.

## REST Operation Groups



| Operation Group | Description |
|-----------------|-------------|
|[Backup Short Term Retention Policies](/rest/api/sql/2021-02-01-preview/backupshorttermretentionpolicies)| Create, get, update, list a database's short term retention policy.|
|[Blob Auditing](/rest/api/sql/2021-02-01-preview/blob%20auditing)| Create, get, update, list an extended server or database's blob auditing policy.|
|[Data Warehouse User Activities](/rest/api/sql/2021-02-01-preview/datawarehouseuseractivities)| Get and list the user activities of a data warehouse which includes running and suspended queries.|
|[Database Advisors](/rest/api/sql/2021-02-01-preview/databaseadvisors)| Get and list database advisors|
|[Database Automatic Tuning](/rest/api/sql/2021-02-01-preview/databaseautomatictuning)| Get and update a database's automatic tuning.|
|[Database Columns](/rest/api/sql/2021-02-01-preview/databasecolumns)| Get and list database columns.|
|[Database Extensions](/rest/api/sql/2021-02-01-preview/databaseextensions)| Perform a database extension operation, like polybase import.|
|[Database Operations](/rest/api/sql/2021-02-01-preview/databaseoperations)| Get a list of operations performed on the database or cancels the asynchronous operation on the database.|
|[Database Recommended Actions](/rest/api/sql/2021-02-01-preview/databaserecommendedactions)| Get and update a database recommended action.|
|[Database Schemas](/rest/api/sql/2021-02-01-preview/databaseschemas)| Get and list database schemas.|
|[Database Security Alert Policies](/rest/api/sql/2021-02-01-preview/databasesecurityalertpolicies)| Create, get, update, list a database's security alert policy.|
|[Database Tables](/rest/api/sql/2021-02-01-preview/databasetables)| Get and list database tables.|
|[Database Usages](/rest/api/sql/2021-02-01-preview/databaseusages)| Get database usages.|
|[Database Vulnerability Assesment Rule Baselines](/rest/api/sql/2021-02-01-preview/databasevulnerabilityassesmentrulebaselines)| Create, get, update, list, delete the database's vulnerability assessment rule baseline.|
|[Database Vulnerability Assessment Scans](/rest/api/sql/2021-02-01-preview/databasevulnerabilityassessmentscans)| Get, list, execute, export the vulnerability assessment scans of a database.|
|[Database Vulnerability Assessments](/rest/api/sql/2021-02-01-preview/databasevulnerabilityassessments)| Create, get, update, list, delete the database's vulnerability assessment.|
|[Databases](/rest/api/sql/2021-02-01-preview/databases)| Create, get, update, list, delete, import, export, rename, pause, resume, upgrade SQL databases.|
|[Deleted Servers](/rest/api/sql/2021-02-01-preview/deletedservers)| Get, list, recover the deleted servers|
|[Elastic Pool Operations](/rest/api/sql/2021-02-01-preview/elasticpooloperations)| Gets a list of operations performed on the elastic pool or cancels the asynchronous operation on the elastic pool.|
|[Elastic Pools](/rest/api/sql/2021-02-01-preview/elasticpools)| Create, get, update, delete, failover the elastic pools. |
|[Encryption Protectors](/rest/api/sql/2021-02-01-preview/encryptionprotectors)| Get, update, list, revalidate the existing encryption protectors.|
|[Failover Groups](/rest/api/sql/2021-02-01-preview/failovergroups)| Create, get, update, list, delete, and failover a failover group.|
|[Firewall Rules](/rest/api/sql/2021-02-01-preview/firewallrules)| Create, get, update, delete, list firewall rules.|
|[Instance Failover Groups](/rest/api/sql/2021-02-01-preview/instancefailovergroups)| Create, get, update, list, delete, and failover an instance failover group.|
|[Instance Pools](/rest/api/sql/2021-02-01-preview/instancepools)| Create, get, update, list, delete the instance pools.|
|[Job Agents](/rest/api/sql/2021-02-01-preview/jobagents)| Create, get, update, list, delete the job agents.|
|[Job Credentials](/rest/api/sql/2021-02-01-preview/jobcredentials)| Create, get, update, list, delete the job credentials.|
|[Job Executions](/rest/api/sql/2021-02-01-preview/jobexecutions)| Create, get, update, list, cancel the job executions.|
|[Job Step Executions](/rest/api/sql/2021-02-01-preview/jobstepexecutions)| Get and list the step executions of a job execution.|
|[Job Steps](/rest/api/sql/2021-02-01-preview/jobsteps)| Create, get, update, list, delete job steps for a job's current version.|
|[Job Target Executions](/rest/api/sql/2021-02-01-preview/jobtargetexecutions)| Get or list the target executions of a job step execution.|
|[Job Target Groups](/rest/api/sql/2021-02-01-preview/jobtargetgroups)| Create, get, update, list, delete the job target groups.|
|[Job Versions](/rest/api/sql/2021-02-01-preview/jobversions)| Get or list job versions.|
|[Jobs](/rest/api/sql/2021-02-01-preview/jobs)| Create, get, update, list, delete jobs.|
|[Ledger Digest Uploads](/rest/api/sql/2021-02-01-preview/ledgerdigestuploads)| Create, get, update, list the ledger digest upload configuration for a database.|
|[Location Capabilities](/rest/api/sql/2021-02-01-preview/location%20capabilities)| Get the subscription capabilities available for the specified location.|
|[Long Term Retention Backups](/rest/api/sql/2021-02-01-preview/longtermretentionbackups)| Create, get, update, list, delete a long term retention backup.|
|[Long Term Retention Managed Instance Backups](/rest/api/sql/2021-02-01-preview/longtermretentionmanagedinstancebackups)| Create, get, update, list, delete a long term retention backup for a managed database.|
|[Long Term Retention Policies](/rest/api/sql/2021-02-01-preview/longtermretentionpolicies)| Get, list, set a database's long term retention policy.|
|[Maintenance Window Options](/rest/api/sql/2021-02-01-preview/maintenancewindowoptions)| Get a list of available maintenance windows.|
|[Maintenance Windows](/rest/api/sql/2021-02-01-preview/maintenancewindows)| Get or set maintenance windows settings for a database.|
|[Managed Backup Short Term Retention Policies](/rest/api/sql/2021-02-01-preview/managedbackupshorttermretentionpolicies)| Create, get, update, list a managed database's short term retention policy.|
|[Managed Database Columns](/rest/api/sql/2021-02-01-preview/manageddatabasecolumns)| Get or list managed database columns.|
|[Managed Database Queries](/rest/api/sql/2021-02-01-preview/manageddatabasequeries)| Get query or query execution statistics by query id of a managed database.|
|[Managed Database Restore Details](/rest/api/sql/2021-02-01-preview/manageddatabaserestoredetails)| Get managed database restore details.|
|[Managed Database Schemas](/rest/api/sql/2021-02-01-preview/manageddatabaseschemas)| Get or list managed database schemas.|
|[Managed Database Security Alert Policies](/rest/api/sql/2021-02-01-preview/manageddatabasesecurityalertpolicies)| Create, get, update, list the managed database security alert policies.|
|[Managed Database Security Events](/rest/api/sql/2021-02-01-preview/manageddatabasesecurityevents)| Get a list of managed database security events.|
|[Managed Database Sensitivity Labels](/rest/api/sql/2021-02-01-preview/manageddatabasesensitivitylabels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Managed Database Tables](/rest/api/sql/2021-02-01-preview/manageddatabasetables)| Get or list managed database tables.|
|[Managed Database Transparent Data Encryption](/rest/api/sql/2021-02-01-preview/manageddatabasetransparentdataencryption)| Create, get, update, list a managed database's transparent data encryption.|
|[Managed Database Vulnerability Assessment Rule Baselines](/rest/api/sql/2021-02-01-preview/manageddatabasevulnerabilityassessmentrulebaselines)| Create, get, update, list a managed database's vulnerability assessment rule baseline.|
|[Managed Database Vulnerability Assessment Scans](/rest/api/sql/2021-02-01-preview/manageddatabasevulnerabilityassessmentscans)| Get, list, execute, export a managed database's vulnerability assessment scans.|
|[Managed Database Vulnerability Assessments](/rest/api/sql/2021-02-01-preview/manageddatabasevulnerabilityassessments)| Create, get, update, list, delete a managed database's vulnerability assessments.|
|[Managed Databases](/rest/api/sql/2021-02-01-preview/manageddatabases)| Create, get, update, list, delete, restore the managed databases.|
|[Managed Instance Administrators](/rest/api/sql/2021-02-01-preview/managedinstanceadministrators)| Create, get, update, list, delete managed instance administrators.|
|[Managed Instance Azure AD Only Authentications](/rest/api/sql/2021-02-01-preview/managedinstanceazureadonlyauthentications)| Get, set, list, delete the existing server Active Directory only authentication properties.|
|[Managed Instance Encryption Protectors](/rest/api/sql/2021-02-01-preview/managedinstanceencryptionprotectors)| Get, update, list, revalidate the existing encryption protectors of a managed instance.|
|[Managed Instance Keys](/rest/api/sql/2021-02-01-preview/managedinstancekeys)| Create, get, update, list, delete the managed instance keys.|
|[Managed Instance Long Term Retention Policies](/rest/api/sql/2021-02-01-preview/managedinstancelongtermretentionpolicies)| Create, get, list, update the managed instance's long term retention policies.|
|[Managed Instance Operations](/rest/api/sql/2021-02-01-preview/managedinstanceoperations)| Get, list, cancel the operations performed on the managed instance.|
|[Managed Instance Private Endpoint Connections](/rest/api/sql/2021-02-01-preview/managedinstanceprivateendpointconnections)| Create, get, list, update, delete the private endpoint connections on a managed instance.|
|[Managed Instance Private Link Resources](/rest/api/sql/2021-02-01-preview/managedinstanceprivatelinkresources)| Get or list the private link resources on the managed instance.|
|[Managed Instance Tde Certificates](/rest/api/sql/2021-02-01-preview/managedinstancetdecertificates)| Create a Transparent Data Encryption certificate for a given managed instance.|
|[Managed Instance Vulnerability Assessments](/rest/api/sql/2021-02-01-preview/managedinstancevulnerabilityassessments)| Create, get, list, update, delete the managed instance's vulnerability assessment policies.|
|[Managed Instances](/rest/api/sql/2021-02-01-preview/managedinstances)| Create, get, update, list, delete, failover the managed instances.|
|[Managed Restorable Dropped Database Backup Short Term Retention Policies](/rest/api/sql/2021-02-01-preview/managedrestorabledroppeddatabasebackupshorttermretentionpolicies)| Create, get, update, list the managed restorable dropped database's short term retention policies|      
|[Managed Server Security Alert Policies](/rest/api/sql/2021-02-01-preview/managedserversecurityalertpolicies)| Create, get, list, update the managed server's security alert policies.|
|[Operations Health](/rest/api/sql/2021-02-01-preview/operationshealth)| Get a service operation health status.|
|[Operations](/rest/api/sql/2021-02-01-preview/operations)| List all of the available SQL Database REST API operations.|
|[Outbound Firewall Rules](/rest/api/sql/2021-02-01-preview/outboundfirewallrules)| Create, get, update, list, delete the outbound firewall rules.|
|[Private Endpoint Connections](/rest/api/sql/2021-02-01-preview/privateendpointconnections)| Create, get, update, list, delete the private endpoint connections on a server.|
|[Private Link Resources](/rest/api/sql/2021-02-01-preview/privatelinkresources)| Get or list the private link resources for SQL server.|
|[Recoverable Managed Databases](/rest/api/sql/2021-02-01-preview/recoverablemanageddatabases)| Get or list recoverable managed databases.|
|[Replication Links](/rest/api/sql/2021-02-01-preview/replicationlinks)| Get, list, delete, and failover replication links.|
|[Restorable Dropped Databases](/rest/api/sql/2021-02-01-preview/restorabledroppeddatabases)| Get or list restorable dropped databases.|
|[Restorable Dropped Managed Databases](/rest/api/sql/2021-02-01-preview/restorabledroppedmanageddatabases)| Get or list restorable dropped managed databases.|
|[Restore Points](/rest/api/sql/2021-02-01-preview/restorepoints)| Create, get, update, list, delete database restore points.|
|[Sensitivity Labels](/rest/api/sql/2021-02-01-preview/sensitivitylabels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Server Advisors](/rest/api/sql/2021-02-01-preview/serveradvisors)| Get, list, update server advisors.|
|[Server Automatic Tuning](/rest/api/sql/2021-02-01-preview/serverautomatictuning)| Get or update automatic tuning options on server.|
|[Server Azure AD Administrators](/rest/api/sql/2021-02-01-preview/serverazureadadministrators)| Create, get, list, update, delete Azure Active Directory administrators in a server.|
|[Server Azure AD Only Authentications](/rest/api/sql/2021-02-01-preview/serverazureadonlyauthentications)| Create, get, list, update, delete server Active Directory only authentication property.|
|[Server Dev Ops Audit](/rest/api/sql/2021-02-01-preview/serverdevopsaudit)| Create, get, list, update DevOps audit settings of a server.|
|[Server Dns Aliases](/rest/api/sql/2021-02-01-preview/serverdnsaliases)| Create, get, list, acquire or delete a server DNS alias.|
|[Server Keys](/rest/api/sql/2021-02-01-preview/serverkeys)| Create, get, list, update, delete server keys.|
|[Server Operations](/rest/api/sql/2021-02-01-preview/serveroperations)| Get a list of operations performed on the server.|
|[Server Security Alert Policies](/rest/api/sql/2021-02-01-preview/serversecurityalertpolicies)| Create, get, list, update a server's security alert policies.|
|[Server Trust Groups](/rest/api/sql/2021-02-01-preview/servertrustgroups)| Create, get, list, update, delete server trust groups.|
|[Server Vulnerability Assessments](/rest/api/sql/2021-02-01-preview/servervulnerabilityassessments)| Create, get, list, update, delete the server vulnerability assessment policies.|
|[Servers](/rest/api/sql/2021-02-01-preview/servers)| Create, get, update, list, delete information about an Azure SQL server. and determine whether a resource can be created with the specified name.|
|[Sql Agent](/rest/api/sql/2021-02-01-preview/sqlagent)| Get or set the sql agent configuration to instance.|
|[Subscription Usages](/rest/api/sql/2021-02-01-preview/subscriptionusages)| Get or list the subscription usage metrics.|
|[Sync Agents](/rest/api/sql/2021-02-01-preview/syncagents)| Create, get, list, update, delete the sync agents. Or generate a sync agent key.|
|[Sync Groups](/rest/api/sql/2021-02-01-preview/syncgroups)| Create, get, list, update, delete the sync groups. Or refreshes a hub database schema.|
|[Sync Members](/rest/api/sql/2021-02-01-preview/syncmembers)| Create, get, list, update, delete the sync members.|
|[Tde Certificates](/rest/api/sql/2021-02-01-preview/tdecertificates)| Create a Transparent Data Encryption certificate for a given server.|
|[Time Zones](/rest/api/sql/2021-02-01-preview/timezones)| Get or list the managed instance time zones.|
|[Transparent Data Encryptions](/rest/api/sql/2021-02-01-preview/transparentdataencryptions)| Create, get, list, update a logical database's transparent data encryption configurations.|
|[Usages](/rest/api/sql/2021-02-01-preview/usages)| Gets all instance pool usage metrics.|
|[Virtual Clusters](/rest/api/sql/2021-02-01-preview/virtualclusters)| Create, get, list, update, delete the virtual clusters.|
|[Virtual Network Rules](/rest/api/sql/2021-02-01-preview/virtualnetworkrules)| Create, get, list, update, delete the virtual network rules.|
|[Workload Classifiers](/rest/api/sql/2021-02-01-preview/workloadclassifiers)| Create, get, list, update, delete the workload classifiers.|
|[Workload Groups](/rest/api/sql/2021-02-01-preview/workloadgroups)| Create, get, list, update, delete the workload groups.|
|[Elastic Pool Activities](/rest/api/sql/2014-04-01/elasticpoolactivities)|Get the activities for an elastic pool.|
|[Elastic Pool Database Activities](/rest/api/sql/2014-04-01/elasticpooldatabaseactivities)|Get the activities for databases in an elastic pool.|
|[Recoverable Databases](/rest/api/sql/2014-04-01/recoverabledatabases)|Get a recoverable database, or list all recoverable databases for a server.|
|[Transparent Data Encryption Activities](/rest/api/sql/2014-04-01/transparentdataencryptionactivities)| Returns a database's transparent data encryption operation result.|




## See Also

- [Azure SQL Database](https://azure.microsoft.com/services/sql-database/)
- [Azure SQL Data Warehouse](https://azure.microsoft.com/services/sql-data-warehouse/)
- [Azure SQL Database Elastic Pool](https://azure.microsoft.com/documentation/articles/sql-database-elastic-pool/)
