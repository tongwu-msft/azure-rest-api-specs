---
title: Azure Sentinel REST API
description: Operation groups for the Azure Sentinel REST API
author: ofshomro
ms.author: ofshomro
ms.manager: mico
ms.date: 07/22/2020
ms.topic: reference
ms.service: sentinel
ms.devlang: rest-api
---

# Azure Sentinel
Microsoft Azure Sentinel is a scalable, cloud-native, security information event management (SIEM) and security orchestration automated response (SOAR) solution. Azure Sentinel delivers intelligent security analytics and threat intelligence across the enterprise, providing a single solution for alert detection, threat visibility, proactive hunting, and threat response.

Azure Sentinel REST APIs allow you to create and manage data connectors, analytic rules, incidents, bookmarks and get entity information.

## REST Operation Groups

| Operation Group | Description |
| --- | --- |
| [Actions](xref:management.azure.com.securityinsights.actions) | List all alert rules for an action |
| [Alerts Rule Template](xref:management.azure.com.securityinsights.alertruletemplates) | List your Alert rules templates available in your Sentinel workspace  |
| [Alert Rules](xref:management.azure.com.securityinsights.alertrules) | Configure Alert rules and actions for your Sentinel workspace |
| [Bookmarks](xref:management.azure.com.securityinsights.bookmarks) | Preserve, tag, map entities, and annotate Log Analytics query results. Create or add a bookmark to an Incident |
| [Data Connectors](xref:management.azure.com.securityinsights.dataconnectors) | List, enable or disable data connectors to your Sentinel workspace|
| [Incident Comments](xref:management.azure.com.securityinsights.incidentcomments) | Read and create incident comments in your Sentinel workspace |
| [Incidents](xref:management.azure.com.securityinsights.incidents) | Read, create and delete incidents in your Sentinel workspace |
| [Operations](xref:management.azure.com.securityinsights.operations) | All avilable operations

