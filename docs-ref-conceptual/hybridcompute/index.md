---
title: Hybrid Compute REST API
description: Operation groups for the Hybrid Compute REST API
author: MGoedtel
ms.author: magoedte
ms.date: 08/17/2020
ms.topic: reference
ms.service: billing
ms.devlang: rest-api
---

# Hybrid Compute

Azure Arc enables you to manage servers running outside of Azure using Azure Resource Manager. Each server is represented in Azure as a hybrid compute machine resource. Once a server is managed with Azure Arc, you can deploy agents, scripts, or configurations to the machine using extensions. The Hybrid Compute API allows you to create, list, update and delete your Azure Arc enabled servers and any extensions associated with them.

## REST Operation Groups

The Hybrid Compute REST API provides operations for working with the following resources:

| Operation Group | Description |
| --- | --- |
| [Machine Extensions](xref:management.azure.com.hybridcompute.machineextensions) | Operations to manage extensions on Azure Arc enabled servers |
| [Machines](xref:management.azure.com.hybridcompute.machines) | Operations to manage Azure Arc enabled servers |
| [Operations](xref:management.azure.com.hybridcompute.operations) | Lists available operations |

## See Also

- [Azure Arc enabled servers documentation](https://docs.microsoft.com/azure/azure-arc/servers/overview)
