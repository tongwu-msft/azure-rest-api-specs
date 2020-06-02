---
title: Azure Automated Quota Management REST API Reference
author: Onkarb
ms.author: Onkarb
ms.date: 05/27/2020
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api
---

# Azure Automated Quota Management REST API

The Azure Automated Quota Managment REST API allows you to enroll to automatic management of [service limits (quota)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits) for your resources programmatically. 

After subscription, Azure will manage [service limits (quota)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits) for your resources.

The APIs currently support Azure Virtual Machines (cores/vCPU) service limits (quota).

Using the API, you can:
* Enable or disable automatic management of service limits (quota) for supported resources.
* Update notification preferences for automatic service limits (quota) management.
* Get status of automatic management of service limits (quota) enrollment and current notification preferences.

