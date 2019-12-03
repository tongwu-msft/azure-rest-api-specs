---
title: Azure Maintenance REST API 
description: The Maintenance REST API allows you to develop clients that use REST calls to work with the service. This process works by adding a custom maintenance configuration to a resource (either an ADH or isolated VM). When the Azure updater sees this custom configuration, it will skip all non-zero-impact updates, including rebootless updates, which can cause a VM to pause or even freeze for several seconds. For as long as the maintenance configuration is applied to the resource, it will be your responsibility to handle updates for that resource. 
services: maintenance
ms.service: maintenance
ms.subservice: core
ms.topic: reference
author: abkmr
ms.author: abkmr
ms.date: 11/18/2019
---

# Azure Maintenance REST API reference
Azure frequently updates its infrastructure to improve reliability, performance, and security, or to launch new features. Most updates have zero impact on virtual machines. However, there are some updates that cause a brief pause or freeze of up to few seconds. Such rebootless updates do not impact most customers but certain very sensitive workloads require zero interruptions and full control of all maintenance activities. For those customers, we are announcing today the public  preview of our new maintenance control feature. Using [Azure Maintenance](/azure/virtual-machines/maintenance-control-cli), customers can control all impactful host updates, including rebootless updates, for up to 35 days.  No other cloud provider offers this level of control for platform maintenance. 

The REST API allows you to develop clients that use REST calls to work with the service. This process works by adding a custom maintenance configuration to a resource (either an ADH or isolated VM). When the Azure updater sees this custom configuration, it will skip all non-zero-impact updates, including rebootless updates, which can cause a VM to pause or even freeze for several seconds. For as long as the maintenance configuration is applied to the resource, it will be your responsibility to handle updates for that resource. 

## Rest Operation Groups

Azure Maintenance REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Maintenance Configurations](https://docs.microsoft.com/rest/api/maintenance/maintenanceconfigurations) | Provides operations on managing maintenance configurations that apply to all associated resources.|
| [Configuration Assignments](https://docs.microsoft.com/rest/api/maintenance/configurationassignments) | Provides operations for managing associations of Azure resources to Maintenance Configurations |
| [Updates](https://docs.microsoft.com/rest/api/maintenance/applyupdates) | Provides operations for managing at maintenance updates on Azure resources |
| [Apply Updates](https://docs.microsoft.com/rest/api/maintenance/maintenanceconfigurations) | Provides operations for managing operations to start and monitor maintenance operations |

## Next steps

Learn more about this service:
* [Azure Maintenance Documentation](/azure/virtual-machines/maintenance-control-cli)



