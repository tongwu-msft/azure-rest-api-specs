---
title: Logz REST API reference
description: This article describes the Logz REST API reference for Logz.io integration with Microsoft Azure.
ms.service: partner-services
ms.subservice: logzio
ms.date: 03/23/2022
author: davidsmatlak
ms.author: davidsmatlak
---

# Logz REST API reference

The Logz REST API includes operations for Logz.io monitoring resources. Logz.io is a partner solution that integrates with Microsoft Azure. For more information, see [What is Logz.io integration with Azure?](/azure/partner-solutions/logzio/overview)

## REST operation groups

| Operation group | Description |
| ---- | ---- |
| [Monitor](xref:management.azure.com.logz.monitor) | Provides operations for compute resources monitored by Logz and the Logz.io agent for virtual machines (VM). |
| [Monitors](xref:management.azure.com.logz.monitors) | Provides operations for a monitor resource, monitors in a resource group or subscription, user roles, and monitored resources. |
| [Operations](xref:management.azure.com.logz.operations) | List all operations provided by `Microsoft.Logz`. |
| [Single Sign On](xref:management.azure.com.logz.singlesignon) | Provides operations for the single sign-on configuration of a monitor resource. |
| [Sub Account](xref:management.azure.com.logz.subaccount) | Provides operations for a sub account of a monitor resource and VMs monitored by the sub account. |
| [Sub Account Tag Rules](xref:management.azure.com.logz.subaccounttagrules) | Provides operations for the tag rule set of a monitor resource with a sub account. |
| [Tag Rules](xref:management.azure.com.logz.tagrules) | Provides operations for the tag rule set of a monitor resource. |
