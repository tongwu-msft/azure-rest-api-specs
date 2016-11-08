---
title: "Get provisioned cluster config package versions"
ms.custom: ""
ms.date: "2016-03-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
ms.assetid: ad095932-2770-49f5-8a51-7c2fd599bed3
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get provisioned cluster config package versions
Gets provisioned fabric config versions in a Service Fabric cluster. Optionally, you can specify a particular config version to get.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/$/ GetProvisionedConfigVersions?api-version={api-version}`|  
|GET|`<URI>/$/ GetProvisionedConfigVersions?api-version={api-version}& ConfigVersion={configVersionFilter}`|  
  
### URI parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|configVersionFilter|No|Gets information about the specified config version.|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
[  
{  
"ConfigVersion": "1.0"   
},  
{  
"CodeVersion": "2.0"   
},  
]  
  
```  
  
|Element Name|Description|  
|------------------|-----------------|  
|ConfigVersion|The version of the cluster config package.|