---
title: "Get provisioned cluster code package versions"
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
ms.assetid: 3db624fe-2120-4fd1-b123-8d3e3ca9bacb
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get provisioned cluster code package versions
Gets provisioned fabric code versions in a Service Fabric cluster. Optionally, you can specify a particular code version to get.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/$/GetProvisionedCodeVersions?api-version={api-version}`|  
|GET|`<URI>/$/GetProvisionedCodeVersions?api-version={api-version}&CodeVersion={codeVersionFilter}`|  
  
### URI parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|codeVersionFilter|No|Gets information about the specified code version.|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
[  
{  
"CodeVersion": "5.0.135.9590"   
},  
{  
"CodeVersion": "5.0.208.9590"   
},  
]  
  
```  
  
|Element Name|Description|  
|------------------|-----------------|  
|CodeVersion|The version of the cluster code package.|