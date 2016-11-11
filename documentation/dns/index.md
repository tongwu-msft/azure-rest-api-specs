---
ms.assetid: 0aeaf25a-c694-4199-b940-7e773d613fc5
ms.title: Azure DNS REST API Reference
ms.service: dns
author: sdwheeler
ms.author: sewhee
ms.manager: carmonm
---

# Azure DNS

The Microsoft Azure DNS Resource Provider REST API allows you to create and modify DNS zones and records hosted within Azure. Zones and records are managed as Azure Resources, see Using resource groups to manage your Azure resources for more details on resources groups and Azure resources.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|DNS Zones| A DNS zone within a resource group |
|DNS Record Sets|The set of records (within a zone) with the same name and record type. Each DNS record type is represented as a separate Azure Resource Manager resource type. These resources are children of the 'dnsZone' resource.|

## See Also

All operations conform to the HTTP/1.1 protocol specification, you must make sure that requests made to these resources are secure. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).