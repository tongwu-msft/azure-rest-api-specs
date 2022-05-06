---
ms.assetid: b7c27eda-bd1b-4b77-88dc-e6cb5e25453f
title: Automation REST API | Microsoft Docs
description: Learn how the Azure Automation service provides a highly reliable and scalable workflow execution engine to automate frequently repeated management tasks.
author: georgewallace
ms.author: gwallace
ms.manager: carmonm
ms.date: 02/24/2020
ms.topic: reference
ms.service: azure
ms.devlang: rest-api
service_description: Provides a highly reliable and scalable workflow execution engine to automate frequently repeated management tasks.
---
# Automation REST API Reference
The Azure Automation service provides a highly reliable and scalable workflow execution engine to automate frequently repeated management tasks. The processes are automated through runbooks, which are Windows PowerShell Workflows run in the Azure Automation execution engine. You can use this API to create, update, read, and delete automation resources, including runbooks and runbook jobs. In addition you can manage assets such as variables, schedules, Windows PowerShell modules, credentials, and certificates. 
## Rest Operation Groups
The Automation REST API provides operations for working with the following resources.

|Operation Group | Description |
|----------------|-------------|
| [Activity](xref:management.azure.com.automation.activity) | Manage activities available from a module imported in an Automation account.| 
| [Agent registration information](xref:management.azure.com.automation.agentregistrationinformation) | Manage the Automation agent registration information.| 
| [Automation account](xref:management.azure.com.automation.automationaccount) | Manage and provide information about Automation accounts in a resource group.| 
| [Certificate](xref:management.azure.com.automation.certificate) | Manage and provide information about certificate assets.| 
| [Connection](xref:management.azure.com.automation.connection) | Manage and provide information about connections.|
| [Connection type](xref:management.azure.com.automation.connectiontype) | Manage and provide information about connection types that service connections.|
| [Credential](xref:management.azure.com.automation.credential) | Manage credential assets to authenticate for any resource or purpose.| 
| [DSC compilation job](xref:management.azure.com.automation.dsccompilationjob) | Manage and provide information about compilation jobs for DSC configurations.| 
| [DSC compilation jobstream](xref:management.azure.com.automation.dsccompilationjobstream) | Manage and provide information about compilation jobstreams for DSC configurations.|
| [DSC configuration](xref:management.azure.com.automation.dscconfiguration) | Manage and provide information about DSC configurations.| 
| [DSC node](xref:management.azure.com.automation.dscnode) | Manage and provide information about DSC nodes.| 
| [DSC node configuration](xref:management.azure.com.automation.dscnodeconfiguration) | Configure and provide information abut DSC nodes.| 
| [Fields](xref:management.azure.com.automation.fields) | Review details of modules in an Automation account.| 
| [Hybrid Runbook Worker group](xref:management.azure.com.automation.hybridrunbookworkergroup) | Manage Hybrid Runbook Worker groups.| 
| [Job](xref:management.azure.com.automation.job) |Manage runbook jobs.| 
| [Job schedule](xref:management.azure.com.automation.jobschedule) | Manage job schedules.| 
| [Job stream](xref:management.azure.com.automation.jobstream) | Review job stream for a runbook job. |
| [Keys](xref:management.azure.com.automation.keys) | List automation keys for an Automation Account. | 
| [LinkedWorkspace](xref:management.azure.com.automation.linkedworkspace) | Retrieve the linked workspace for an Automation Account. | 
| [Module](xref:management.azure.com.automation.module) | Operations for managing Windows PowerShell workflow modules.|
| [Node count information](xref:management.azure.com.automation.nodereports) | Get counts for DSC nodes.| 
| [Node reports](xref:management.azure.com.automation.nodereports) | Review DSC reports sent from a DSC node to Automation.|
| [Object data types](xref:management.azure.com.automation.objectdatatypes) | Review details of modules in an Automation account.| 
| [Operations](xref:management.azure.com.automation.operations) | Review all of the available REST API options for Automation.|
| [Runbook](xref:management.azure.com.automation.runbook) | Operations for managing runbooks and draft runbooks.| 
| [Runbook draft](xref:management.azure.com.automation.runbookdraft) | Operations for managing runbooks in Automation. | 
| [Schedule](xref:management.azure.com.automation.schedule) | Schedule operations for runbooks.| 
| [Software Update Configuration Machine Runs](xref:management.azure.com.automation.softwareupdateconfigurationmachineruns) | Provide information for Software Update Configuration Machine Runs.| 
| [Software Update Configuration Runs](xref:management.azure.com.automation.softwareupdateconfigurationmachineruns) | Provide information for Software Update Configuration Runs.|
| [Software Update Configurations](xref:management.azure.com.automation.softwareupdateconfigurations) | Manage Software Update Configurations.|
| [Source Control](xref:management.azure.com.automation.sourcecontrol) | Manage and provide information for Source Control.|
| [Source Control Sync Job](xref:management.azure.com.automation.sourcecontrolsyncjob) | Manage and provide information for Source Control Sync Jobs.|
| [Source Control Sync Job Streams](xref:management.azure.com.automation.sourcecontrolsyncjobstreams) | Manage and provide information Source Control Sync Job Streams|
| [Statistics](xref:management.azure.com.automation.statistics) | Review statistics for an Automation Account.|
| [Test jobs](xref:management.azure.com.automation.testjob) | Manage test jobs for a runbook.|
| [Test job streams](xref:management.azure.com.automation.testjobstreams) | Review job streams for a runbook job.|
| [Usages](xref:management.azure.com.automation.usages) | Review job run time minutes used for an Automation account.| 
| [Variable](xref:management.azure.com.automation.variable) | Manage data that you want to store in an Automation account.| 
| [Watcher](xref:management.azure.com.automation.watcher) | Manage and provide information about Watcher Tasks.|
| [Webhook](xref:management.azure.com.automation.webhook) | Utilize APIs to manage webhooks in an Automation account.| 

## See Also
* [Azure Automation documentation](https://docs.microsoft.com/azure/automation)
