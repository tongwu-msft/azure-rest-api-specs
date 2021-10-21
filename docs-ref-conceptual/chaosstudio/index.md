---
title: Azure Chaos Studio REST API reference
author: johnkemnetz
ms.author: johnkem
ms.date: 11/01/2021
ms.topic: reference
ms.service: chaos-studio
ms.devlang: rest-api
---

# Azure Chaos Studio REST API reference

Azure Chaos Studio is a managed service for improving resilience by injecting faults into your Azure applications. Running controlled fault injection experiments against your applications, a practice known as chaos engineering, helps you to measure, understand, and improve resilience against real-world incidents, such as a region outages or application failures causing high CPU utilization on a VM.

## REST operation groups

| Operation group | Description |
|-----------------|-------------|
| [Experiments](xref:management.azure.com.chaosstudio.experiments) | Create and manage chaos experiments. A chaos experiment is an Azure resource that describes the faults that should be run and the resources those faults should be run against. |
| [Targets](xref:management.azure.com.chaosstudio.targets) | Create and manage chaos targets. A chaos target enables Chaos Studio to interact with a resource for a particular target type. |
| [Capabilities](xref:management.azure.com.chaosstudio.capabilities) | Create and manage capabilities. A capability enables Chaos Studio to run a particular fault against a resource, such a shutting down a virtual machine. |
| [Target Types](xref:management.azure.com.chaosstudio.targettypes) | List all possible targets that can be enabled for a resource. |
| [Capability Types](xref:management.azure.com.chaosstudio.capabilitytypes) | List all possible capabilities that can be applied to a resource. |
| [Operations](xref:management.azure.com.chaosstudio.operations) | List all operations that can be performed with Chaos Studio. |
