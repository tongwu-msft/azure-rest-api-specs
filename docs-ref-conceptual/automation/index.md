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
service_description: To be added
---

# Automation REST API Reference
The Azure Automation service provides a highly reliable and scalable workflow execution engine to automate frequently repeated management tasks. The processes are automated through runbooks, which are Windows PowerShell Workflows run in the Azure Automation execution engine. You can use this API to create, update, read, and delete automation resources, including runbooks and runbook jobs. In addition you can manage assets such as variables, schedules, Windows PowerShell modules, credentials, and certificates. 

## Rest Operation Groups
The Automation REST API provides operations for working with the following resources.

|Operation Group | Description |
|----------------|-------------|
| [Activity](~/docs-ref-autogen/automation/activity.yml) | Manage activities available from a module imported in an Automation account.|  
| [Agent registration information](~/docs-ref-autogen/automation/agentregistrationinformation.yml) | Manage the Automation agent registration information.|  
|[Automation account](~/docs-ref-autogen/automation/automationaccount.yml) | Manage and provide information about Automation accounts in a resource group.|  
| [Certificate](~/docs-ref-autogen/automation/certificate.yml) | Manage and provide information about certificate assets.|  
| [Connection type](~/docs-ref-autogen/automation/connectiontype.yml) | Manage and provide information about connection types that service connections.|  
| [Connection](~/docs-ref-autogen/automation/connection.yml) | Manage and provide information about connections.|  
| [Credential](~/docs-ref-autogen/automation/credential.yml) | Manage credential assets to authenticate for any resource or purpose.|  
| [DSC compilation job](~/docs-ref-autogen/automation/dsccompilationjob.yml) | Manage and provide information about compilation jobs for DSC configurations.|  
| [DSC configuration](~/docs-ref-autogen/automation/dscconfiguration.yml) | Manage and provide information about DSC configurations.|  
| [DSC node](~/docs-ref-autogen/automation/dscnode.yml) | Manage and provide information about DSC nodes.|  
| [DSC node configuration](~/docs-ref-autogen/automation/dscnodeconfiguration.yml) | Configure and provide information abut DSC nodes.|  
| [Fields](~/docs-ref-autogen/automation/fields.yml) | Review details of modules in an Automation account.|  
| [Hybrid Runbook Worker group](~/docs-ref-autogen/automation/hybridrunbookworkergroup.yml) | Manage Hybrid Runbook Worker groups.|  
| [Job](~/docs-ref-autogen/automation/job.yml) |Manage runbook jobs.|  
| [Job schedule](~/docs-ref-autogen/automation/jobschedule.yml) | Manage job schedules.|  
| [Job stream](~/docs-ref-autogen/automation/jobstream.yml) | Review job stream for a runbook job. |  
| [Module](~/docs-ref-autogen/automation/module.yml) | Operations for managing Windows PowerShell workflow modules.|  
| [Node reports](~/docs-ref-autogen/automation/nodereports.yml) | Review DSC reports sent from a DSC node to Automation.|  
| [Object data types](~/docs-ref-autogen/automation/objectdatatypes.yml) | Review details of modules in an Automation account.|  
| [Operations](~/docs-ref-autogen/automation/operations.yml) | Review all of the available REST API options for Automation.|   
| [Runbook](~/docs-ref-autogen/automation/runbook.yml) | Operations for managing runbooks and draft runbooks.|  
| [Runbook draft](~/docs-ref-autogen/automation/runbookdraft.yml) | Operations for managing runbooks in Automation. |  
| [Schedule](~/docs-ref-autogen/automation/schedule.yml) | Schedule operations for runbooks.|  
| [Statistics](~/docs-ref-autogen/automation/statistics.yml) | Review statistics for an Automation account.|  
| [Test job streams](~/docs-ref-autogen/automation/testjobstreams.yml) | Review job streams for a runbook job.|  
| [Test jobs](~/docs-ref-autogen/automation/testjobs.yml) | Manage test jobs for a runbook.|  
| [Usages](~/docs-ref-autogen/automation/usages.yml) | Review job run time minutes used for an Automation account.|  
| [Variable](~/docs-ref-autogen/automation/variable.yml) | Manage data that you want to store in an Automation account.|  
| [Webhook](~/docs-ref-autogen/automation/webhook.yml) | Utilize APIs to manage webhooks in an Automation account.|  

## See Also
* [Azure Automation documentation](https://docs.microsoft.com/azure/automation)
* [Operations Management Suite documentation](http://docs.microsoft.com/azure/operations-management-suite/operations-management-suite-overview)
