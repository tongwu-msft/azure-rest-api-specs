---
ms.assetid: b7c27eda-bd1b-4b77-88dc-e6cb5e25453f
title: Automation REST API | Microsoft Docs
author: mgoedtel
ms.author: magoedte
ms.manager: carmonm
ms.date: 04/12/17
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api 
---

# Automation REST API Reference
The Azure Automation service provides a highly reliable and scalable workflow execution engine to automate frequently repeated management tasks. The processes are automated through runbooks, which are Windows PowerShell Workflows run in the Azure Automation execution engine. You can use this API to create, update, read, and delete automation resources, including runbooks and runbook jobs. In addition you can manage assets such as variables, schedules, Windows PowerShell modules, credentials, and certificates.

## Rest Operation Groups
The Automation REST API provides operations for working with the following resources.

|Operation Group | Description |
|----------------|-------------|
| [Activity](](~/docs-ref-autogen/automation/activity.json) | Manage activities available from a module imported in an Automation account.|  
| [Agent registration information](~/docs-ref-autogen/automation/agentregistrationinformation.json) | Manage the Automation agent registration information.|  
|[Automation account](~/docs-ref-autogen/automation/automationaccount.json) | Manage and provide information about Automation accounts in a resource group.|  
| [Certificate](~/docs-ref-autogen/automation/certificate.json) | Manage and provide information about certificate assets.|  
| [Connection type](~/docs-ref-autogen/automation/connectiontype.json) | Manage and provide information about connection types that service connections.|  
| [Connection](~/docs-ref-autogen/automation/connection.json) | Manage and provide information about connections.|  
| [Credential](~/docs-ref-autogen/automation/credential.json) | Manage credential assets to authenticate for any resource or purpose.|  
| [DSC compilation job](~/docs-ref-autogen/automation/dsccompilationjob.json) | Manage and provide information about compilation jobs for DSC configurations.|  
| [DSC configuration](~/docs-ref-autogen/automation/dscconfiguration.json) | Manage and provide information about DSC configurations.|  
| [DSC node](~/docs-ref-autogen/automation/dscnode.json) | Manage and provide information about DSC nodes.|  
| [DSC node configuration](~/docs-ref-autogen/automation/dscnodeconfiguration.json) | Configure and provide information abut DSC nodes.|  
| [Fields](~/docs-ref-autogen/automation/fields.json) | Review details of modules in an Automation account.|  
| [Hybrid Runbook Worker group](~/docs-ref-autogen/automation/hybridrunbookworkergroup.json) | Manage Hybrid Runbook Worker groups.|  
| [Job](~/docs-ref-autogen/automation/job.json) |Manage runbook jobs.|  
| [Job schedule](~/docs-ref-autogen/automation/jobschedule.json) | Manage job schedules.|  
| [Job stream](~/docs-ref-autogen/automation/jobstream.json) | Review job stream for a runbook job. |  
| [Module](~/docs-ref-autogen/automation/module.json) | Operations for managing Windows PowerShell workflow modules.|  
| [Node reports](~/docs-ref-autogen/automation/nodereports.json) | Review DSC reports sent from a DSC node to Automation.|  
| [Object data types](~/docs-ref-autogen/automation/objectdatatypes.json) | Review details of modules in an Automation account.|  
| [Operations](~/docs-ref-autogen/automation/operations.json) | Review all of the available REST API options for Automation.|   
| [Runbook](~/docs-ref-autogen/automation/runbook.json) | Operations for managing runbooks and draft runbooks.|  
| [Runbook draft](~/docs-ref-autogen/automation/runbookdraft.json) | Operations for managing runbooks in Automation. |  
| [Schedule](~/docs-ref-autogen/automation/schedule.json) | Schedule operations for runbooks.|  
| [Statistics](~/docs-ref-autogen/automation/statistics.json) | Review statistics for an Automation account.|  
| [Test job streams](~/docs-ref-autogen/automation/testjobstreams.json) | Review job streams for a runbook job.|  
| [Test jobs](~/docs-ref-autogen/automation/testjobs.json) | Manage test jobs for a runbook.|  
| [Usages](~/docs-ref-autogen/automation/usages.json) | Review job run time minutes used for an Automation account.|  
| [Variable](~/docs-ref-autogen/automation/variable.json) | Manage data that you want to store in an Automation account.|  
| [Webhook](~/docs-ref-autogen/automation/webhook.json) | Utilize APIs to manage webhooks in an Automation account.|  

## See Also
* [Azure Automation documentation](https://docs.microsoft.com/azure/automation)
* [Operations Management Suite documentation](http://docs.microsoft.com/azure/operations-management-suite/operations-management-suite-overview)
