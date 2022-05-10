---
title: Blueprints REST API
description: Learn how Azure Blueprints enables the creation of an Azure native package of artifacts that can be dynamically deployed to subscriptions.
author: DCtheGeek
ms.author: dacoulte
ms.manager: carmonm
ms.date: 02/01/2019
ms.topic: reference
ms.service: blueprints
ms.devlang: rest-api
---
# Blueprints REST API Reference

Azure Blueprints enables the creation of an Azure native package of artifacts (resource groups,
policies, role assignments, Resource Manager templates and more) that can be dynamically deployed to
subscriptions to create consistent, repeatable environments.

## REST Operation Groups

The Blueprints REST API provides operations for working with the following resources.

|Operation Group | Description |
|----------------|-------------|
| [Artifacts](xref:management.azure.com.blueprints.artifacts) | Operations for managing Artifacts on a Blueprint. |
| [Assignments](xref:management.azure.com.blueprints.assignments) | Operations for managing Assignments of Blueprints. |
| [Assignment Operations](xref:management.azure.com.blueprints.assignmentoperations) | Review all of the available REST API options for Blueprint Assignments. |
| [Blueprints](xref:management.azure.com.blueprints.blueprints) | Operations for managing a Blueprint. |
| [Published Artifacts](xref:management.azure.com.blueprints.publishedartifacts) | Operations for getting published Blueprint Artifacts. |
| [Published Blueprints](xref:management.azure.com.blueprints.publishedblueprints) | Operations for managing the publishing of Blueprints. |

## See Also

- [Azure Governance documentation](https://docs.microsoft.com/azure/governance)
- [Azure Blueprints documentation](https://docs.microsoft.com/azure/governance/blueprints/overview)