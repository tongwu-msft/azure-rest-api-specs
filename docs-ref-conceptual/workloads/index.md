---
title: Azure Center for SAP solutions API reference documents
description: Overview of Azure Center for SAP solutions Rest APIs
author: sagarkeswani
ms.topic: reference
ms.date: 7/13/2022
ms.author: sagarkeswani
ms.service: azure-industry
---
The Workloads platform offers deployment and management service for SAP and PHP workloads. 

For SAP there are two services: 
* Azure Center for SAP solutions (ACSS)
* Azure Monitor for SAP solutions (AMS)

**_Azure Center for SAP solutions_** is an Azure offering that makes SAP a top-level workload on Azure. You can use ACSS to deploy or manage SAP systems on Azure seamlessly. The deployment experience sets up and connects the individual SAP components on your behalf. ACSS simplifies the management of SAP systems and provides quality checks to increase the reliability of these systems on Azure.

An important concept in ACSS is the Virtual Instance for SAP solutions (VIS) resource. The VIS is a logical representation of an SAP system on Azure.

### REST operation groups

| Operation group | Description |
|-----------------|-------------|
|SAP Application Server Instances|Create, read, update and delete SAP Application Server instances|
|SAP Availability Zone Details|Read SAP availability zone details|
|SAP Central Instances|Create, read, update and delete SAP Central service instances|
|SAP Database Instances|Create, read, update and delete SAP Databases|
|SAP Disk Configurations|Get SAP Disk Configurations|
|SAP Sizing Recommendations|Get SAP sizing recommendations|
|SAP Supported Sku|Get SAP supported SKUs|
|SAP Virtual Instances|Create, read, update and delete Virtual instances for SAP solutions, apply filters to the Virtual instances and perform Start/Stop operations on SAP systems|



**_Azure Monitor for SAP Solutions (AMS)_** is an Azure-native monitoring product for anyone running their SAP landscapes on Azure. It works with both SAP on Azure Virtual Machines and SAP on Azure Large Instances.

With Azure Monitor for SAP Solutions, you can collect telemetry data from Azure infrastructure and databases in one central location and visually correlate the data for faster troubleshooting.You can monitor different components of an SAP landscape like SAP HANA database, SAP NetWeaver, and so on, by adding the corresponding provider for that component.


### REST operation groups

| Operation group | Description |
|-----------------|-------------|
|SAP Monitor|Create, read, update and delete SAP Monitor resource|
|Provider Instances|Create, read and delete Provider instances for SAP Monitor resources|


