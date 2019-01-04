---
title: "Azure NetApp Files REST API"
ms.custom: na
ms.date: 2018-12-13
ms.prod: azure-netapp-files
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: b-juche
manager: na
---
# Azure NetApp Files REST API
The Azure NetApp Files service is an enterprise-class, high-performant, metered file storage service. It offers the following resources: the NetApp accounts, capacity pools, volumes, mount targets and snapshots. For more information about these resources, see [Understand the storage hierarchy of Azure NetApp Files](https://docs.microsoft.com/azure/azure-netapp-files/azure-netapp-files-understand-storage-hierarchy).

The REST API for the Azure NetApp Files service defines HTTP operations against the NetApp account, capacity pool, volume and snapshot resources. The API includes the operations listed in the following table. 

|Operation|Resource Type|Description|  
|---------------|-------------------|-----------------|  
|[List Operations](https://docs.microsoft.com/rest/api/netapp/Operations/List) |N/A |Lists all of the available Microsoft.NetApp Rest API operations |
|[List NetApp Accounts](https://docs.microsoft.com/rest/api/netapp/Accounts/List) |NetApp Account |Lists all NetApp accounts in the resource group |
|[Get NetApp Account](https://docs.microsoft.com/rest/api/netapp/Accounts/Get) |NetApp Account |Gets the NetApp account |
|[Create or Update NetApp Account](https://docs.microsoft.com/rest/api/netapp/Accounts/CreateOrUpdate) |NetApp Account |Creates or updates a NetApp account |
|[Delete NetApp Account](https://docs.microsoft.com/rest/api/netapp/Accounts/Delete) |NetApp Account |Deletes a NetApp account |
|[Update NetApp Account](https://docs.microsoft.com/rest/api/netapp/Accounts/Update) |NetApp Account |Updates a NetApp account |
|[List Capacity Pools](https://docs.microsoft.com/rest/api/netapp/Pools/List) |Capacity Pool |Lists all capacity pools in the NetApp Account |
|[Get Capacity Pool](https://docs.microsoft.com/rest/api/netapp/Pools/Get) |Capacity Pool |Gets a capacity pool |
|[Create or Update Capacity Pool](https://docs.microsoft.com/rest/api/netapp/Pools/CreateOrUpdate) |Capacity Pool |Creates or updates a capacity pool |
|[Delete Capacity Pool](https://docs.microsoft.com/rest/api/netapp/Pools/Delete) |Capacity Pool |Deletes a capacity pool |
|[Update Capacity Pool](https://docs.microsoft.com/rest/api/netapp/Pools/Update) |Capacity Pool |Updates a capacity pool |
|[List Volumes](https://docs.microsoft.com/rest/api/netapp/Volumes/List) |Volume |Lists volumes |
|[Get Volume](https://docs.microsoft.com/rest/api/netapp/Volumes/Get) |Volume |Gets a volume |
|[Create or Update Volume](https://docs.microsoft.com/rest/api/netapp/Volumes/CreateOrUpdate) |Volume |Creates or updates a volume |
|[Delete Volume](https://docs.microsoft.com/rest/api/netapp/Volumes/Delete) |Volume |Deletes a volume |
|[Update Volume](https://docs.microsoft.com/rest/api/netapp/Volumes/Update) |Volume |Updates a volume |
|[List Mount Targets](https://docs.microsoft.com/rest/api/netapp/MountTargets/List) |Mount Target |Lists mount targets |
|[List Snapshots](https://docs.microsoft.com/rest/api/netapp/Snapshots/List) |Snapshot |Lists snapshots |
|[Get Snapshot](https://docs.microsoft.com/rest/api/netapp/Snapshots/Get) |Snapshot |Gets a snapshot |
|[Create Snapshot](https://docs.microsoft.com/rest/api/netapp/Snapshots/Create) |Snapshot |Creates a snapshot |
|[Delete Snapshot](https://docs.microsoft.com/rest/api/netapp/Snapshots/Delete) |Snapshot |Deletes a snapshot |
|[Update Snapshot](https://docs.microsoft.com/rest/api/netapp/Snapshots/Update) |Snapshot |Updates a snapshot |
