---
title: "Azure NetApp Files REST API"
ms.custom: na
ms.date: 04/21/2020
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
The Azure NetApp Files service is an enterprise-class, high-performant, metered file storage service. It offers several resources that you can manage by using REST API. 

## REST operation groups

The REST API for the Azure NetApp Files service defines HTTP operations against the supported resources. The API includes the operation groups listed in the following table. 

|Operation|Resource Type|Description|  
|---------------|-------------------|-----------------|  
|[Accounts](https://docs.microsoft.com/rest/api/netapp/accounts) |NetApp account |Manage and provide information about NetApp accounts |
|[NetApp Resource](https://docs.microsoft.com/rest/api/netapp/netappresource) |NetApp resource |Manage and provide information about Azure NetApp Files resources, including whether a file path or resource name is available |
|[Operations - List](https://docs.microsoft.com/rest/api/netapp/operations/list) |Operations |Describe the Resource Provider and list all available Microsoft.NetApp Rest API operations |
|[Pools](https://docs.microsoft.com/rest/api/netapp/pools) |Capacity pool |Manage and provide information about capacity pools in the NetApp account |
|[Snapshots](https://docs.microsoft.com/rest/api/netapp/snapshots) |Snapshot |Manage and provide information about snapshots |
|[Volumes](https://docs.microsoft.com/rest/api/netapp/volumes) |Volume |Manage and provide information about volumes |

## See also
* [Develop for Azure NetApp Files with REST API](https://docs.microsoft.com/azure/azure-netapp-files/azure-netapp-files-develop-with-rest-api)
* [Understand the storage hierarchy of Azure NetApp Files](https://docs.microsoft.com/azure/azure-netapp-files/azure-netapp-files-understand-storage-hierarchy)
