---
title: Azure Synapse Analytics REST API Reference
description: Reference for using the Azure Synapse Analytics REST API to create and manage Azure Synapse resources through Azure Resource Manager and Azure Synapse endpoints.
ms.service: synapse-analytics
author: matt1883
ms.author: mahi
ms.date: 05/14/2020
---
 
# Azure Synapse Analytics REST API
 
Use the Azure Synapse Analytics REST APIs to create and manage Azure Synapse resources through Azure Resource Manager and Azure Synapse endpoints. All task operations conform to the HTTP/1.1 protocol specification and most operations return an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure, using `https`. For more information on making secure requests, see [Acquire an access token](/rest/api/azure/#acquire-an-access-token).
 
## REST Operation Groups
 
| Operation Group | Description |
|-----------------|-------------|
| [Workspaces](xref:management.azure.com.synapse.workspaces) | Provides operations to create and manage Synapse Analytics workspaces. |
| [Big Data Pools](xref:management.azure.com.synapse.bigdatapools) | Provides operations to create and manage big data pools (e.g., Apache Spark pools) of a Synapse Analytics workspace. |
| [Integration Runtime Auth Keys](xref:management.azure.com.synapse.integrationruntimeauthkeys) | Provides operations to create and manage integration runtime auth keys of a Synapse Analytics workspace. |
| [Integration Runtime Connection Infos](xref:management.azure.com.synapse.integrationruntimeconnectioninfos) | Provides operations to create and manage integration runtime connection infos of a Synapse Analytics workspace. |
| [Integration Runtime Credentials](xref:management.azure.com.synapse.integrationruntimecredentials) | Provides operations to create and manage integration runtime credentials of a Synapse Analytics workspace. |
| [Integration Runtime Monitoring Data](xref:management.azure.com.synapse.integrationruntimemonitoringdata) | Provides operations to create and manage integration runtime monitoring data of a Synapse Analytics workspace. |
| [Integration Runtime Node Ip Address](xref:management.azure.com.synapse.integrationruntimenodeipaddress) | Provides operations to create and manage integration runtime node ip address of a Synapse Analytics workspace. |
| [Integration Runtime Nodes](xref:management.azure.com.synapse.integrationruntimenodes) | Provides operations to create and manage integration runtime nodes of a Synapse Analytics workspace. |
| [Integration Runtime Object Metadata](xref:management.azure.com.synapse.integrationruntimeobjectmetadata) | Provides operations to create and manage integration runtime object metadata of a Synapse Analytics workspace. |
| [Integration Runtime Status](xref:management.azure.com.synapse.integrationruntimestatus) | Provides operations to create and manage integration runtime status of a Synapse Analytics workspace. |
| [Integration Runtimes](xref:management.azure.com.synapse.integrationruntimes) | Provides operations to create and manage integration runtimes of a Synapse Analytics workspace. |
| [IP Firewall Rules](xref:management.azure.com.synapse.ipfirewallrules) | Provides operations to create and manage ip firewall rules of a Synapse Analytics workspace. |
| [Operations](xref:management.azure.com.synapse.operations) | Provides operations to create and manage operations of a Synapse Analytics workspace. |
| [SQL Pool Blob Auditing Policies](xref:management.azure.com.synapse.sqlpoolblobauditingpolicies) | Provides operations to create and manage SQL pool blob auditing policies of a Synapse Analytics workspace. |
| [SQL Pool Connection Policies](xref:management.azure.com.synapse.sqlpoolconnectionpolicies) | Provides operations to create and manage SQL pool connection policies of a Synapse Analytics workspace. |
| [SQL Pool Data Warehouse User Activities](xref:management.azure.com.synapse.sqlpooldatawarehouseuseractivities) | Provides operations to create and manage SQL pool data warehouse user activities of a Synapse Analytics workspace. |
| [SQL Pool Geo Backup Policies](xref:management.azure.com.synapse.sqlpoolgeobackuppolicies) | Provides operations to create and manage SQL pool geo backup policies of a Synapse Analytics workspace. |
| [SQL Pool Metadata Sync Configs](xref:management.azure.com.synapse.sqlpoolmetadatasyncconfigs) | Provides operations to create and manage SQL pool metadata sync configs of a Synapse Analytics workspace. |
| [SQL Pool Operation Results](xref:management.azure.com.synapse.sqlpooloperationresults) | Provides operations to create and manage SQL pool operation results of a Synapse Analytics workspace. |
| [SQL Pool Operations](xref:management.azure.com.synapse.sqlpooloperations) | Provides operations to create and manage SQL pool operations of a Synapse Analytics workspace. |
| [SQL Pool Replication Links](xref:management.azure.com.synapse.sqlpoolreplicationlinks) | Provides operations to create and manage SQL pool replication links of a Synapse Analytics workspace. |
| [SQL Pool Restore Points](xref:management.azure.com.synapse.sqlpoolrestorepoints) | Provides operations to create and manage SQL pool restore points of a Synapse Analytics workspace. |
| [SQL Pool Schemas](xref:management.azure.com.synapse.sqlpoolschemas) | Provides operations to create and manage SQL pool schemas of a Synapse Analytics workspace. |
| [SQL Pool Security Alert Policies](xref:management.azure.com.synapse.sqlpoolsecurityalertpolicies) | Provides operations to create and manage SQL pool security alert policies of a Synapse Analytics workspace. |
| [SQL Pool Sensitivity Labels](xref:management.azure.com.synapse.sqlpoolsensitivitylabels) | Provides operations to create and manage SQL pool sensitivity labels of a Synapse Analytics workspace. |
| [SQL Pool Table Columns](xref:management.azure.com.synapse.sqlpooltablecolumns) | Provides operations to create and manage SQL pool table columns of a Synapse Analytics workspace. |
| [SQL Pool Tables](xref:management.azure.com.synapse.sqlpooltables) | Provides operations to create and manage SQL pool tables of a Synapse Analytics workspace. |
| [SQL Pool Transparent Data Encryptions](xref:management.azure.com.synapse.sqlpooltransparentdataencryptions) | Provides operations to create and manage SQL pool transparent data encryptions of a Synapse Analytics workspace. |
| [SQL Pool Usages](xref:management.azure.com.synapse.sqlpoolusages) | Provides operations to create and manage SQL pool usages of a Synapse Analytics workspace. |
| [SQL Pool Vulnerability Assessment Rule Baselines](xref:management.azure.com.synapse.sqlpoolvulnerabilityassessmentrulebaselines) | Provides operations to create and manage SQL pool vulnerability assessment rule baselines of a Synapse Analytics workspace. |
| [SQL Pool Vulnerability Assessment Scans](xref:management.azure.com.synapse.sqlpoolvulnerabilityassessmentscans) | Provides operations to create and manage SQL pool vulnerability assessment scans of a Synapse Analytics workspace. |
| [SQL Pool Vulnerability Assessments](xref:management.azure.com.synapse.sqlpoolvulnerabilityassessments) | Provides operations to create and manage SQL pool vulnerability assessments of a Synapse Analytics workspace. |
| [SQL Pools](xref:management.azure.com.synapse.sqlpools) | Provides operations to create and manage SQL pools of a Synapse Analytics workspace. |
| [Workspace AAD Admins](xref:management.azure.com.synapse.workspaceaadadmins) | Provides operations to create and manage workspace AAD admins of a Synapse Analytics workspace. |
| [Workspace Managed Identity SQL Control Settings](xref:management.azure.com.synapse.workspacemanagedidentitysqlcontrolsettings) | Provides operations to create and manage workspace managed identity SQL control settings of a Synapse Analytics workspace. |
 
## Common parameters and headers
 
The following information is common to all tasks that you might do related to Azure Synapse:
 
* Replace `{api-version}` with **2019-06-01-preview** for management operations, or **2019-11-01-preview** for data plane operations.
* Replace `{subscription-id}` in the URI with your Azure subscription identifier.
* Replace `{resource-group-name}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).
Replace `{account-name}` in the URI with your Data Lake Analytics account name.
* Set the **Content-Type** header to **application/json**.
* Set the **Authorization** header to a JSON Web Token that you obtain from Azure Active Directory. For data plane operations, be sure to obtain a token for the resource URI / audience claim "https://dev.azuresynapse.net/", NOT "https://management.core.windows.net/" nor "https://management.azure.com/". For more information, see [Acquire an access token](/rest/api/azure/#acquire-an-access-token).
 
## See also
 
- [Azure Synapse Analytics](https://azure.microsoft.com/services/synapse-analytics/)
