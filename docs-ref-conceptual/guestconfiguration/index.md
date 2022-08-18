---
ms.assetid: 630f3049-18b0-462e-847b-08e959a2d364
title: Azure Policy Guest Configuration REST API
description: Learn how Guest Configuration definitions in Azure Policy allow you to validate settings inside virtual machines.
author: DCtheGeek
ms.author: dacoulte
ms.manager: carmonm
ms.date: 10/23/2018
ms.topic: reference
ms.service: azure-policy
ms.devlang: rest-api
---
# Azure Policy Guest Configuration REST API Reference

Guest Configuration definitions in Azure Policy allow you to validate settings inside virtual
machines. This includes the configuration of the Operating System, applications, or even
environmental data. You can use this API to create or update Guest Configuration, and get
information about the compliance details of a virtual machine including which specific settings are
not compliant with the assigned configuration.

## REST Operation Groups

The Azure Policy Guest Configuration REST API provides operations for working with the following
resources.

|Operation Group | Description |
|----------------|-------------|
| [Guest Configuration Assignment Reports](xref:management.azure.com.guestconfiguration.guestconfigurationassignmentreports) | Review reports and historical compliance for assigned virtual machines.|
| [Guest Configuration Assignments](xref:management.azure.com.guestconfiguration.guestconfigurationassignments) | Manage assignments of guest configurations for virtual machines.|
| [Operations](xref:management.azure.com.guestconfiguration.operations) | Review all of the available REST API options for Azure Policy Guest Configuration.|

## See Also

- [Azure Policy documentation](https://docs.microsoft.com/azure/governance/policy/)
- [Azure Policy Guest Configuration](https://docs.microsoft.com/azure/governance/policy/concepts/guest-configuration)
- [Azure Governance](https://docs.microsoft.com/azure/governance/)