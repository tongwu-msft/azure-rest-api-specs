---
ms.assetid: 709f9922-66f0-4315-ad60-4cac7beb4847
title: Azure SQL Database REST API reference
description: "The Azure SQL Database REST API includes operations for managing Azure SQL Database resources."
ms.service: sql-database
author: rothja
ms.date: 03/30/2021
ms.author: jroth
service_description: To be added
---

# Azure SQL Database REST API

The Azure SQL Database REST API includes operations for managing Azure SQL Database resources.

## REST Operation Groups for 2022-02-01 Preview



| Operation Group | Description |
|-----------------|-------------|
|[Backup Short Term Retention Policies](/rest/api/sql/2022-02-01-preview/backup-short-term-retention-policies)| Create, get, update, list a database's short term retention policy.|
|[Data Warehouse User Activities](/rest/api/sql/2022-02-01-preview/data-warehouse-user-activities)| Get and list the user activities of a data warehouse which includes running and suspended queries.|
|[Database Advanced Threat Protection Settings](/rest/api/sql/2022-02-01-preview/database-advanced-threat-protection-settings)| Create, get, update, list a database's Advanced Threat Protection state.|
|[Database Advisors](/rest/api/sql/2022-02-01-preview/database-advisors)| Get and list database advisors|
|[Database Automatic Tuning](/rest/api/sql/2022-02-01-preview/database-automatic-tuning)| Get and update a database's automatic tuning.|
|[Database Columns](/rest/api/sql/2022-02-01-preview/database-columns)| Get and list database columns.|
|[Database Extensions](/rest/api/sql/2022-02-01-preview/database-extensions)| Perform a database extension operation, like polybase import.|
|[Database Operations](/rest/api/sql/2022-02-01-preview/database-operations)| Get a list of operations performed on the database or cancels the asynchronous operation on the database.|
|[Database Recommended Actions](/rest/api/sql/2022-02-01-preview/database-recommended-actions)| Get and update a database recommended action.|
|[Database Schemas](/rest/api/sql/2022-02-01-preview/database-schemas)| Get and list database schemas.|
|[Database Security Alert Policies](/rest/api/sql/2022-02-01-preview/database-security-alert-policies)| Create, get, update, list a database's security alert policy.|
|[Database Tables](/rest/api/sql/2022-02-01-preview/database-tables)| Get and list database tables.|
|[Database Usages](/rest/api/sql/2022-02-01-preview/database-usages)| Get database usages.|
|[Database Vulnerability Assesment Rule Baselines](/rest/api/sql/2022-02-01-preview/database-vulnerability-assessment-rule-baselines)| Create, get, update, list, delete the database's vulnerability assessment rule baseline.|
|[Database Vulnerability Assessment Scans](/rest/api/sql/2022-02-01-preview/database-vulnerability-assessment-scans)| Get, list, execute, export the vulnerability assessment scans of a database.|
|[Database Vulnerability Assessments](/rest/api/sql/2022-02-01-preview/database-vulnerability-assessments)| Create, get, update, list, delete the database's vulnerability assessment.|
|[Databases](/rest/api/sql/2022-02-01-preview/databases)| Create, get, update, list, delete, import, export, rename, pause, resume, upgrade SQL databases.|
|[Deleted Servers](/rest/api/sql/2022-02-01-preview/deleted-servers)| Get, list, recover the deleted servers|
|[Elastic Pool Operations](/rest/api/sql/2022-02-01-preview/elastic-pool-operations)| Gets a list of operations performed on the elastic pool or cancels the asynchronous operation on the elastic pool.|
|[Elastic Pools](/rest/api/sql/2022-02-01-preview/elastic-pools)| Create, get, update, delete, failover the elastic pools. |
|[Encryption Protectors](/rest/api/sql/2022-02-01-preview/encryption-protectors)| Get, update, list, revalidate the existing encryption protectors.|
|[Endpoint Certificates](/rest/api/sql/2022-02-01-preview/endpoint-certificates)| Get and list the certificates used on endpoints on the target instance.|
|[Failover Groups](/rest/api/sql/2022-02-01-preview/failover-groups)| Create, get, update, list, delete, and failover a failover group.|
|[Firewall Rules](/rest/api/sql/2022-02-01-preview/firewall-rules)| Create, get, update, delete, list firewall rules.|
|[Instance Failover Groups](/rest/api/sql/2022-02-01-preview/instance-failover-groups)| Create, get, update, list, delete, and failover an instance failover group.|
|[Instance Pools](/rest/api/sql/2022-02-01-preview/instance-pools)| Create, get, update, list, delete the instance pools.|
|[Job Agents](/rest/api/sql/2022-02-01-preview/job-agents)| Create, get, update, list, delete the job agents.|
|[Job Credentials](/rest/api/sql/2022-02-01-preview/job-credentials)| Create, get, update, list, delete the job credentials.|
|[Job Executions](/rest/api/sql/2022-02-01-preview/job-executions)| Create, get, update, list, cancel the job executions.|
|[Job Step Executions](/rest/api/sql/2022-02-01-preview/job-step-executions)| Get and list the step executions of a job execution.|
|[Job Steps](/rest/api/sql/2022-02-01-preview/job-steps)| Create, get, update, list, delete job steps for a job's current version.|
|[Job Target Executions](/rest/api/sql/2022-02-01-preview/job-target-executions)| Get or list the target executions of a job step execution.|
|[Job Target Groups](/rest/api/sql/2022-02-01-preview/job-target-groups)| Create, get, update, list, delete the job target groups.|
|[Job Versions](/rest/api/sql/2022-02-01-preview/job-versions)| Get or list job versions.|
|[Jobs](/rest/api/sql/2022-02-01-preview/jobs)| Create, get, update, list, delete jobs.|
|[Ledger Digest Uploads](/rest/api/sql/2022-02-01-preview/ledger-digest-uploads)| Create, get, update, list the ledger digest upload configuration for a database.|
|[Location Capabilities](/rest/api/sql/2022-02-01-preview/capabilities)| Get the subscription capabilities available for the specified location.|
|[Long Term Retention Backups](/rest/api/sql/2022-02-01-preview/long-term-retention-backups)| Create, get, update, list, delete a long term retention backup.|
|[Long Term Retention Managed Instance Backups](/rest/api/sql/2022-02-01-preview/long-term-retention-managed-instance-backups)| Create, get, update, list, delete a long term retention backup for a managed database.|
|[Long Term Retention Policies](/rest/api/sql/2022-02-01-preview/long-term-retention-policies)| Get, list, set a database's long term retention policy.|
|[Maintenance Window Options](/rest/api/sql/2022-02-01-preview/maintenance-window-options)| Get a list of available maintenance windows.|
|[Maintenance Windows](/rest/api/sql/2022-02-01-preview/maintenance-windows)| Get or set maintenance windows settings for a database.|
|[Managed Backup Short Term Retention Policies](/rest/api/sql/2022-02-01-preview/managed-backup-short-term-retention-policies)| Create, get, update, list a managed database's short term retention policy.|
|[Managed Database Columns](/rest/api/sql/2022-02-01-preview/managed-database-columns)| Get or list managed database columns.|
|[Managed Database Queries](/rest/api/sql/2022-02-01-preview/managed-database-queries)| Get query or query execution statistics by query id of a managed database.|
|[Managed Database Restore Details](/rest/api/sql/2022-02-01-preview/managed-database-restore-details)| Get managed database restore details.|
|[Managed Database Schemas](/rest/api/sql/2022-02-01-preview/managed-database-schemas)| Get or list managed database schemas.|
|[Managed Database Security Alert Policies](/rest/api/sql/2022-02-01-preview/managed-database-security-alert-policies)| Create, get, update, list the managed database security alert policies.|
|[Managed Database Security Events](/rest/api/sql/2022-02-01-preview/managed-database-security-events)| Get a list of managed database security events.|
|[Managed Database Sensitivity Labels](/rest/api/sql/2022-02-01-preview/managed-database-sensitivity-labels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Managed Database Tables](/rest/api/sql/2022-02-01-preview/managed-database-tables)| Get or list managed database tables.|
|[Managed Database Transparent Data Encryption](/rest/api/sql/2022-02-01-preview/managed-database-transparent-data-encryption)| Create, get, update, list a managed database's transparent data encryption.|
|[Managed Database Vulnerability Assessment Rule Baselines](/rest/api/sql/2022-02-01-preview/managed-database-vulnerability-assessment-rule-baselines)| Create, get, update, list a managed database's vulnerability assessment rule baseline.|
|[Managed Database Vulnerability Assessment Scans](/rest/api/sql/2022-02-01-preview/managed-database-vulnerability-assessment-scans)| Get, list, execute, export a managed database's vulnerability assessment scans.|
|[Managed Database Vulnerability Assessments](/rest/api/sql/2022-02-01-preview/managed-database-vulnerability-assessments)| Create, get, update, list, delete a managed database's vulnerability assessments.|
|[Managed Databases](/rest/api/sql/2022-02-01-preview/managed-databases)| Create, get, update, list, delete, restore the managed databases.|
|[Managed Instance Administrators](/rest/api/sql/2022-02-01-preview/managed-instance-administrators)| Create, get, update, list, delete managed instance administrators.|
|[Managed Instance Azure AD Only Authentications](/rest/api/sql/2022-02-01-preview/managed-instance-azure-ad-only-authentications)| Get, set, list, delete the existing server Active Directory only authentication properties.|
|[Managed Instance Encryption Protectors](/rest/api/sql/2022-02-01-preview/managed-instance-encryption-protectors)| Get, update, list, revalidate the existing encryption protectors of a managed instance.|
|[Managed Instance Keys](/rest/api/sql/2022-02-01-preview/managed-instance-keys)| Create, get, update, list, delete the managed instance keys.|
|[Managed Instance Long Term Retention Policies](/rest/api/sql/2022-02-01-preview/managed-instance-long-term-retention-policies)| Create, get, list, update the managed instance's long term retention policies.|
|[Managed Instance Operations](/rest/api/sql/2022-02-01-preview/managed-instance-operations)| Get, list, cancel the operations performed on the managed instance.|
|[Managed Instance Private Endpoint Connections](/rest/api/sql/2022-02-01-preview/managed-instance-private-endpoint-connections)| Create, get, list, update, delete the private endpoint connections on a managed instance.|
|[Managed Instance Private Link Resources](/rest/api/sql/2022-02-01-preview/managed-instance-private-link-resources)| Get or list the private link resources on the managed instance.|
|[Managed Instance Tde Certificates](/rest/api/sql/2022-02-01-preview/managed-instance-tde-certificates)| Create a Transparent Data Encryption certificate for a given managed instance.|
|[Managed Instance Vulnerability Assessments](/rest/api/sql/2022-02-01-preview/managed-instance-vulnerability-assessments)| Create, get, list, update, delete the managed instance's vulnerability assessment policies.|
|[Managed Instances](/rest/api/sql/2022-02-01-preview/managed-instances)| Create, get, update, list, delete, failover the managed instances.|
|[Managed Restorable Dropped Database Backup Short Term Retention Policies](/rest/api/sql/2022-02-01-preview/managed-restorable-dropped-database-backup-short-term-retention-policies)| Create, get, update, list the managed restorable dropped database's short term retention policies|      
|[Managed Server DNS Aliases](/rest/api/sql/2022-02-01-preview/managed-server-dns-aliases)| Create, get, list, acquire a managed server DNS alias.|
|[Managed Server Security Alert Policies](/rest/api/sql/2022-02-01-preview/managed-server-security-alert-policies)| Create, get, list, update the managed server's security alert policies.|
|[Operations](/rest/api/sql/2022-02-01-preview/operations)| List all of the available SQL Database REST API operations.|
|[Outbound Firewall Rules](/rest/api/sql/2022-02-01-preview/outbound-firewall-rules)| Create, get, update, list, delete the outbound firewall rules.|
|[Private Endpoint Connections](/rest/api/sql/2022-02-01-preview/private-endpoint-connections)| Create, get, update, list, delete the private endpoint connections on a server.|
|[Private Link Resources](/rest/api/sql/2022-02-01-preview/private-link-resources)| Get or list the private link resources for SQL server.|
|[Recoverable Managed Databases](/rest/api/sql/2022-02-01-preview/recoverable-managed-databases)| Get or list recoverable managed databases.|
|[Replication Links](/rest/api/sql/2022-02-01-preview/replication-links)| Get, list, delete, and failover replication links.|
|[Restorable Dropped Databases](/rest/api/sql/2022-02-01-preview/restorable-dropped-databases)| Get or list restorable dropped databases.|
|[Restorable Dropped Managed Databases](/rest/api/sql/2022-02-01-preview/restorable-dropped-managed-databases)| Get or list restorable dropped managed databases.|
|[Restore Points](/rest/api/sql/2022-02-01-preview/restore-points)| Create, get, update, list, delete database restore points.|
|[Sensitivity Labels](/rest/api/sql/2022-02-01-preview/sensitivity-labels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Server Advanced Threat Protection Settings](/rest/api/sql/2022-02-01-preview/server-advanced-threat-protection-settings)| Create, get, update, list the server's Advanced Threat Protection states.|
|[Server Advisors](/rest/api/sql/2022-02-01-preview/server-advisors)| Get, list, update server advisors.|
|[Server Automatic Tuning](/rest/api/sql/2022-02-01-preview/server-automatic-tuning)| Get or update automatic tuning options on server.|
|[Server Azure AD Administrators](/rest/api/sql/2022-02-01-preview/server-azure-ad-administrators)| Create, get, list, update, delete Azure Active Directory administrators in a server.|
|[Server Azure AD Only Authentications](/rest/api/sql/2022-02-01-preview/server-azure-ad-only-authentications)| Create, get, list, update, delete server Active Directory only authentication property.|
|[Server Blob Auditing Policies](/rest/api/sql/2022-02-01-preview/server-blob-auditing-policies)| Create, get, update, list an extended server or database's blob auditing policy.|
|[Server Devops audit setting](/rest/api/sql/2022-02-01-preview/server-devops-audit-settings)| Create, get, list, update DevOps audit settings of a server.|
|[Server Dns Aliases](/rest/api/sql/2022-02-01-preview/server-dns-aliases)| Create, get, list, acquire or delete a server DNS alias.|
|[Server Keys](/rest/api/sql/2022-02-01-preview/server-keys)| Create, get, list, update, delete server keys.|
|[Server Operations](/rest/api/sql/2022-02-01-preview/server-operations)| Get a list of operations performed on the server.|
|[Server Security Alert Policies](/rest/api/sql/2022-02-01-preview/server-security-alert-policies)| Create, get, list, update a server's security alert policies.|
|[Server Trust Groups](/rest/api/sql/2022-02-01-preview/server-trust-groups)| Create, get, list, update, delete server trust groups.|
|[Server Vulnerability Assessments](/rest/api/sql/2022-02-01-preview/server-vulnerability-assessments)| Create, get, list, update, delete the server vulnerability assessment policies.|
|[Servers](/rest/api/sql/2022-02-01-preview/servers)| Create, get, update, list, delete information about an Azure SQL server. and determine whether a resource can be created with the specified name.|
|[Sql Agent](/rest/api/sql/2022-02-01-preview/sql-agent)| Get or set the sql agent configuration to instance.|
|[Subscription Usages](/rest/api/sql/2022-02-01-preview/subscription-usages)| Get or list the subscription usage metrics.|
|[Sync Agents](/rest/api/sql/2022-02-01-preview/sync-agents)| Create, get, list, update, delete the sync agents. Or generate a sync agent key.|
|[Sync Groups](/rest/api/sql/2022-02-01-preview/sync-groups)| Create, get, list, update, delete the sync groups. Or refreshes a hub database schema.|
|[Sync Members](/rest/api/sql/2022-02-01-preview/sync-members)| Create, get, list, update, delete the sync members.|
|[Tde Certificates](/rest/api/sql/2022-02-01-preview/tde-certificates)| Create a Transparent Data Encryption certificate for a given server.|
|[Time Zones](/rest/api/sql/2022-02-01-preview/time-zones)| Get or list the managed instance time zones.|
|[Transparent Data Encryptions](/rest/api/sql/2022-02-01-preview/transparent-data-encryptions)| Create, get, list, update a logical database's transparent data encryption configurations.|
|[Usages](/rest/api/sql/2022-02-01-preview/usages)| Gets all instance pool usage metrics.|
|[Virtual Clusters](/rest/api/sql/2022-02-01-preview/virtual-clusters)| Create, get, list, update, delete the virtual clusters.|
|[Virtual Network Rules](/rest/api/sql/2022-02-01-preview/virtual-network-rules)| Create, get, list, update, delete the virtual network rules.|
|[Workload Classifiers](/rest/api/sql/2022-02-01-preview/workload-classifiers)| Create, get, list, update, delete the workload classifiers.|
|[Workload Groups](/rest/api/sql/2022-02-01-preview/workload-groups)| Create, get, list, update, delete the workload groups.|
|[Elastic Pool Activities](/rest/api/sql/2014-04-01/elasticpoolactivities)|Get the activities for an elastic pool.|
|[Elastic Pool Database Activities](/rest/api/sql/2014-04-01/elasticpooldatabaseactivities)|Get the activities for databases in an elastic pool.|
|[Recoverable Databases](/rest/api/sql/2014-04-01/recoverabledatabases)|Get a recoverable database, or list all recoverable databases for a server.|
|[Transparent Data Encryption Activities](/rest/api/sql/2014-04-01/transparentdataencryptionactivities)| Returns a database's transparent data encryption operation result.|

## REST Operation Groups for 2021-11-01 Stable

| Operation Group | Description |
|-----------------|-------------|
|[Backup Short Term Retention Policies](/rest/api/sql/2021-11-01/backup-short-term-retention-policies)| Create, get, update, list a database's short term retention policy.|
|[Data Warehouse User Activities](/rest/api/sql/2021-11-01/data-warehouse-user-activities)| Get and list the user activities of a data warehouse which includes running and suspended queries.|
|[Database Advanced Threat Protection Settings](/rest/api/sql/2021-11-01/database-advanced-threat-protection-settings)| Create, get, update, list a database's Advanced Threat Protection state.|
|[Database Advisors](/rest/api/sql/2021-11-01/database-advisors)| Get and list database advisors|
|[Database Automatic Tuning](/rest/api/sql/2021-11-01/database-automatic-tuning)| Get and update a database's automatic tuning.|
|[Database Columns](/rest/api/sql/2021-11-01/database-columns)| Get and list database columns.|
|[Database Extensions](/rest/api/sql/2021-11-01/database-extensions)| Perform a database extension operation, like polybase import.|
|[Database Operations](/rest/api/sql/2021-11-01/database-operations)| Get a list of operations performed on the database or cancels the asynchronous operation on the database.|
|[Database Recommended Actions](/rest/api/sql/2021-11-01/database-recommended-actions)| Get and update a database recommended action.|
|[Database Schemas](/rest/api/sql/2021-11-01/database-schemas)| Get and list database schemas.|
|[Database Security Alert Policies](/rest/api/sql/2021-11-01/database-security-alert-policies)| Create, get, update, list a database's security alert policy.|
|[Database Tables](/rest/api/sql/2021-11-01/database-tables)| Get and list database tables.|
|[Database Usages](/rest/api/sql/2021-11-01/database-usages)| Get database usages.|
|[Database Vulnerability Assesment Rule Baselines](/rest/api/sql/2021-11-01/database-vulnerability-assessment-rule-baselines)| Create, get, update, list, delete the database's vulnerability assessment rule baseline.|
|[Database Vulnerability Assessment Scans](/rest/api/sql/2021-11-01/database-vulnerability-assessment-scans)| Get, list, execute, export the vulnerability assessment scans of a database.|
|[Database Vulnerability Assessments](/rest/api/sql/2021-11-01/database-vulnerability-assessments)| Create, get, update, list, delete the database's vulnerability assessment.|
|[Databases](/rest/api/sql/2021-11-01/databases)| Create, get, update, list, delete, import, export, rename, pause, resume, upgrade SQL databases.|
|[Deleted Servers](/rest/api/sql/2021-11-01/deleted-servers)| Get, list, recover the deleted servers|
|[Elastic Pool Operations](/rest/api/sql/2021-11-01/elastic-pool-operations)| Gets a list of operations performed on the elastic pool or cancels the asynchronous operation on the elastic pool.|
|[Elastic Pools](/rest/api/sql/2021-11-01/elastic-pools)| Create, get, update, delete, failover the elastic pools. |
|[Encryption Protectors](/rest/api/sql/2021-11-01/encryption-protectors)| Get, update, list, revalidate the existing encryption protectors.|
|[Endpoint Certificates](/rest/api/sql/2021-11-01/endpoint-certificates)| Get and list the certificates used on endpoints on the target instance.|
|[Failover Groups](/rest/api/sql/2021-11-01/failover-groups)| Create, get, update, list, delete, and failover a failover group.|
|[Firewall Rules](/rest/api/sql/2021-11-01/firewall-rules)| Create, get, update, delete, list firewall rules.|
|[Instance Failover Groups](/rest/api/sql/2021-11-01/instance-failover-groups)| Create, get, update, list, delete, and failover an instance failover group.|
|[Instance Pools](/rest/api/sql/2021-11-01/instance-pools)| Create, get, update, list, delete the instance pools.|
|[Job Agents](/rest/api/sql/2021-11-01/job-agents)| Create, get, update, list, delete the job agents.|
|[Job Credentials](/rest/api/sql/2021-11-01/job-credentials)| Create, get, update, list, delete the job credentials.|
|[Job Executions](/rest/api/sql/2021-11-01/job-executions)| Create, get, update, list, cancel the job executions.|
|[Job Step Executions](/rest/api/sql/2021-11-01/job-step-executions)| Get and list the step executions of a job execution.|
|[Job Steps](/rest/api/sql/2021-11-01/job-steps)| Create, get, update, list, delete job steps for a job's current version.|
|[Job Target Executions](/rest/api/sql/2021-11-01/job-target-executions)| Get or list the target executions of a job step execution.|
|[Job Target Groups](/rest/api/sql/2021-11-01/job-target-groups)| Create, get, update, list, delete the job target groups.|
|[Job Versions](/rest/api/sql/2021-11-01/job-versions)| Get or list job versions.|
|[Jobs](/rest/api/sql/2021-11-01/jobs)| Create, get, update, list, delete jobs.|
|[Ledger Digest Uploads](/rest/api/sql/2021-11-01/ledger-digest-uploads)| Create, get, update, list the ledger digest upload configuration for a database.|
|[Location Capabilities](/rest/api/sql/2021-11-01/capabilities)| Get the subscription capabilities available for the specified location.|
|[Long Term Retention Backups](/rest/api/sql/2021-11-01/long-term-retention-backups)| Create, get, update, list, delete a long term retention backup.|
|[Long Term Retention Managed Instance Backups](/rest/api/sql/2021-11-01/long-term-retention-managed-instance-backups)| Create, get, update, list, delete a long term retention backup for a managed database.|
|[Long Term Retention Policies](/rest/api/sql/2021-11-01/long-term-retention-policies)| Get, list, set a database's long term retention policy.|
|[Maintenance Window Options](/rest/api/sql/2021-11-01/maintenance-window-options)| Get a list of available maintenance windows.|
|[Maintenance Windows](/rest/api/sql/2021-11-01/maintenance-windows)| Get or set maintenance windows settings for a database.|
|[Managed Backup Short Term Retention Policies](/rest/api/sql/2021-11-01/managed-backup-short-term-retention-policies)| Create, get, update, list a managed database's short term retention policy.|
|[Managed Database Columns](/rest/api/sql/2021-11-01/managed-database-columns)| Get or list managed database columns.|
|[Managed Database Queries](/rest/api/sql/2021-11-01/managed-database-queries)| Get query or query execution statistics by query id of a managed database.|
|[Managed Database Restore Details](/rest/api/sql/2021-11-01/managed-database-restore-details)| Get managed database restore details.|
|[Managed Database Schemas](/rest/api/sql/2021-11-01/managed-database-schemas)| Get or list managed database schemas.|
|[Managed Database Security Alert Policies](/rest/api/sql/2021-11-01/managed-database-security-alert-policies)| Create, get, update, list the managed database security alert policies.|
|[Managed Database Security Events](/rest/api/sql/2021-11-01/managed-database-security-events)| Get a list of managed database security events.|
|[Managed Database Sensitivity Labels](/rest/api/sql/2021-11-01/managed-database-sensitivity-labels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Managed Database Tables](/rest/api/sql/2021-11-01/managed-database-tables)| Get or list managed database tables.|
|[Managed Database Transparent Data Encryption](/rest/api/sql/2021-11-01/managed-database-transparent-data-encryption)| Create, get, update, list a managed database's transparent data encryption.|
|[Managed Database Vulnerability Assessment Rule Baselines](/rest/api/sql/2021-11-01/managed-database-vulnerability-assessment-rule-baselines)| Create, get, update, list a managed database's vulnerability assessment rule baseline.|
|[Managed Database Vulnerability Assessment Scans](/rest/api/sql/2021-11-01/managed-database-vulnerability-assessment-scans)| Get, list, execute, export a managed database's vulnerability assessment scans.|
|[Managed Database Vulnerability Assessments](/rest/api/sql/2021-11-01/managed-database-vulnerability-assessments)| Create, get, update, list, delete a managed database's vulnerability assessments.|
|[Managed Databases](/rest/api/sql/2021-11-01/managed-databases)| Create, get, update, list, delete, restore the managed databases.|
|[Managed Instance Administrators](/rest/api/sql/2021-11-01/managed-instance-administrators)| Create, get, update, list, delete managed instance administrators.|
|[Managed Instance Azure AD Only Authentications](/rest/api/sql/2021-11-01/managed-instance-azure-ad-only-authentications)| Get, set, list, delete the existing server Active Directory only authentication properties.|
|[Managed Instance Encryption Protectors](/rest/api/sql/2021-11-01/managed-instance-encryption-protectors)| Get, update, list, revalidate the existing encryption protectors of a managed instance.|
|[Managed Instance Keys](/rest/api/sql/2021-11-01/managed-instance-keys)| Create, get, update, list, delete the managed instance keys.|
|[Managed Instance Long Term Retention Policies](/rest/api/sql/2021-11-01/managed-instance-long-term-retention-policies)| Create, get, list, update the managed instance's long term retention policies.|
|[Managed Instance Operations](/rest/api/sql/2021-11-01/managed-instance-operations)| Get, list, cancel the operations performed on the managed instance.|
|[Managed Instance Private Endpoint Connections](/rest/api/sql/2021-11-01/managed-instance-private-endpoint-connections)| Create, get, list, update, delete the private endpoint connections on a managed instance.|
|[Managed Instance Private Link Resources](/rest/api/sql/2021-11-01/managed-instance-private-link-resources)| Get or list the private link resources on the managed instance.|
|[Managed Instance Tde Certificates](/rest/api/sql/2021-11-01/managed-instance-tde-certificates)| Create a Transparent Data Encryption certificate for a given managed instance.|
|[Managed Instance Vulnerability Assessments](/rest/api/sql/2021-11-01/managed-instance-vulnerability-assessments)| Create, get, list, update, delete the managed instance's vulnerability assessment policies.|
|[Managed Instances](/rest/api/sql/2021-11-01/managed-instances)| Create, get, update, list, delete, failover the managed instances.|
|[Managed Restorable Dropped Database Backup Short Term Retention Policies](/rest/api/sql/2021-11-01/managed-restorable-dropped-database-backup-short-term-retention-policies)| Create, get, update, list the managed restorable dropped database's short term retention policies|      
|[Managed Server DNS Aliases](/rest/api/sql/2021-11-01/managed-server-dns-aliases)| Create, get, list, acquire a managed server DNS alias.|
|[Managed Server Security Alert Policies](/rest/api/sql/2021-11-01/managed-server-security-alert-policies)| Create, get, list, update the managed server's security alert policies.|
|[Operations](/rest/api/sql/2021-11-01/operations)| List all of the available SQL Database REST API operations.|
|[Outbound Firewall Rules](/rest/api/sql/2021-11-01/outbound-firewall-rules)| Create, get, update, list, delete the outbound firewall rules.|
|[Private Endpoint Connections](/rest/api/sql/2021-11-01/private-endpoint-connections)| Create, get, update, list, delete the private endpoint connections on a server.|
|[Private Link Resources](/rest/api/sql/2021-11-01/private-link-resources)| Get or list the private link resources for SQL server.|
|[Recoverable Managed Databases](/rest/api/sql/2021-11-01/recoverable-managed-databases)| Get or list recoverable managed databases.|
|[Replication Links](/rest/api/sql/2021-11-01/replication-links)| Get, list, delete, and failover replication links.|
|[Restorable Dropped Databases](/rest/api/sql/2021-11-01/restorable-dropped-databases)| Get or list restorable dropped databases.|
|[Restorable Dropped Managed Databases](/rest/api/sql/2021-11-01/restorable-dropped-managed-databases)| Get or list restorable dropped managed databases.|
|[Restore Points](/rest/api/sql/2021-11-01/restore-points)| Create, get, update, list, delete database restore points.|
|[Sensitivity Labels](/rest/api/sql/2021-11-01/sensitivity-labels)| Create, get, update, list the sensitivity labels of a given database. Or enable or disable sensitivity recommendations on a given column.|
|[Server Advanced Threat Protection Settings](/rest/api/sql/2021-11-01/server-advanced-threat-protection-settings)| Create, get, update, list the server's Advanced Threat Protection states.|
|[Server Advisors](/rest/api/sql/2021-11-01/server-advisors)| Get, list, update server advisors.|
|[Server Automatic Tuning](/rest/api/sql/2021-11-01/server-automatic-tuning)| Get or update automatic tuning options on server.|
|[Server Azure AD Administrators](/rest/api/sql/2021-11-01/server-azure-ad-administrators)| Create, get, list, update, delete Azure Active Directory administrators in a server.|
|[Server Azure AD Only Authentications](/rest/api/sql/2021-11-01/server-azure-ad-only-authentications)| Create, get, list, update, delete server Active Directory only authentication property.|
|[Server Blob Auditing Policies](/rest/api/sql/2021-11-01/server-blob-auditing-policies)| Create, get, update, list an extended server or database's blob auditing policy.|
|[Server Devops audit setting](/rest/api/sql/2021-11-01/server-devops-audit-settings)| Create, get, list, update DevOps audit settings of a server.|
|[Server Dns Aliases](/rest/api/sql/2021-11-01/server-dns-aliases)| Create, get, list, acquire or delete a server DNS alias.|
|[Server Keys](/rest/api/sql/2021-11-01/server-keys)| Create, get, list, update, delete server keys.|
|[Server Operations](/rest/api/sql/2021-11-01/server-operations)| Get a list of operations performed on the server.|
|[Server Security Alert Policies](/rest/api/sql/2021-11-01/server-security-alert-policies)| Create, get, list, update a server's security alert policies.|
|[Server Trust Groups](/rest/api/sql/2021-11-01/server-trust-groups)| Create, get, list, update, delete server trust groups.|
|[Server Vulnerability Assessments](/rest/api/sql/2021-11-01/server-vulnerability-assessments)| Create, get, list, update, delete the server vulnerability assessment policies.|
|[Servers](/rest/api/sql/2021-11-01/servers)| Create, get, update, list, delete information about an Azure SQL server. and determine whether a resource can be created with the specified name.|
|[Sql Agent](/rest/api/sql/2021-11-01/sql-agent)| Get or set the sql agent configuration to instance.|
|[Subscription Usages](/rest/api/sql/2021-11-01/subscription-usages)| Get or list the subscription usage metrics.|
|[Sync Agents](/rest/api/sql/2021-11-01/sync-agents)| Create, get, list, update, delete the sync agents. Or generate a sync agent key.|
|[Sync Groups](/rest/api/sql/2021-11-01/sync-groups)| Create, get, list, update, delete the sync groups. Or refreshes a hub database schema.|
|[Sync Members](/rest/api/sql/2021-11-01/sync-members)| Create, get, list, update, delete the sync members.|
|[Tde Certificates](/rest/api/sql/2021-11-01/tde-certificates)| Create a Transparent Data Encryption certificate for a given server.|
|[Time Zones](/rest/api/sql/2021-11-01/time-zones)| Get or list the managed instance time zones.|
|[Transparent Data Encryptions](/rest/api/sql/2021-11-01/transparent-data-encryptions)| Create, get, list, update a logical database's transparent data encryption configurations.|
|[Usages](/rest/api/sql/2021-11-01/usages)| Gets all instance pool usage metrics.|
|[Virtual Clusters](/rest/api/sql/2021-11-01/virtual-clusters)| Create, get, list, update, delete the virtual clusters.|
|[Virtual Network Rules](/rest/api/sql/2021-11-01/virtual-network-rules)| Create, get, list, update, delete the virtual network rules.|
|[Workload Classifiers](/rest/api/sql/2021-11-01/workload-classifiers)| Create, get, list, update, delete the workload classifiers.|
|[Workload Groups](/rest/api/sql/2021-11-01/workload-groups)| Create, get, list, update, delete the workload groups.|


## See Also

- [Azure SQL Database](https://azure.microsoft.com/services/sql-database/)
- [Azure SQL Data Warehouse](https://azure.microsoft.com/services/sql-data-warehouse/)
- [Azure SQL Database Elastic Pool](https://azure.microsoft.com/documentation/articles/sql-database-elastic-pool/)
- [Latest Stable Version of Azure SQL Database REST API](https://review.docs.microsoft.com/en-us/rest/api/sql/retirement?branch=sqlretirement#latest-stable-version-of-azure-sql-database-rest-api)
