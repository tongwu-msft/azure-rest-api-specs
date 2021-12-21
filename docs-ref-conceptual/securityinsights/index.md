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
| [Actions](/rest/api/securityinsights/stable/actions) | List all alert rules for an action |
| [Alerts Rule Template](/rest/api/securityinsights/stable/alert-rule-templates) | List your Alert rules templates available in your Sentinel workspace  |
| [Alert Rules](/rest/api/securityinsights/stable/alert-rules) | Configure Alert rules and actions for your Sentinel workspace |
| [Bookmarks](/rest/api/securityinsights/stable/bookmarks) | Preserve, tag, map entities, and annotate Log Analytics query results. Create or add a bookmark to an Incident |
| [Data Connectors](/rest/api/securityinsights/stable/data-connectors) | List, enable or disable data connectors to your Sentinel workspace|
| [Incident Comments](/rest/api/securityinsights/stable/incident-comments) | Read and create incident comments in your Sentinel workspace |
| [Incidents](/rest/api/securityinsights/stable/incidents) | Read, create and delete incidents in your Sentinel workspace |
| [Operations](/rest/api/securityinsights/stable/operations) | All avilable operations

