---
title: "Get information about an application | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: dffe1766-a996-4f4d-986b-7199048fd4b6
caps.latest.revision: 4
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about an application
  Gets information about the specified application.  
  
## Request  
 See Common Parameters and Headers for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region}.batch.core.windows.net/applications/{applicationId}?api-version={api-version}`|  
  
 The request body is empty.  
  
## Response  
 Status code: 200.  For more information, see Status and Error Codes.  
  
 The following example shows a sample application summary:  
  
```  
{  
  "id":"litware",  
  "displayName":"Litware Analytics",  
  "versions": [  
    "10.7",  
    "10.8",  
    "11.0.beta"  
  ]  
}  
```  
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|id|String|The id of the application.|  
|displayName|String|The display name of the application.|  
|versions|Collection|A list of available versions of the application. Each entry is a string.|  
  
## Remarks  
 This operation returns only applications and versions that are available for use on compute nodes; that is, that can be used in an application package reference.  For administrator information about applications and versions that are not yet available to compute nodes, use the Azure portal or the Azure Resource Manager API.  
  
  