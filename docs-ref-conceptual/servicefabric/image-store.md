---
title: "Image store"
ms.custom: ""
ms.date: "2017-02-03"
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
ms.assetid: 
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Image store
APIs to manage the Azure Service Fabric image store.  
  
## Common parameters and headers  
 The following information is common to all tasks that you might do related to image store:  
  
-   Replace {api-version} with the version of the REST API you are targeting. For version 1.0, use the value "1.0".  
  
-   Replace {remote-location} in the URI with the relative path within the native image store.  
  
## Tasks  
 You can do the following with the native image store:  
  
-   [Get a list of image store content](get-a-list-of-image-store-content.md)  
  
-   [Delete image store content](delete-image-store-content.md)

-   [Upload file to image store](upload-a-file-to-image-store.md)

-   [Copy image store content](copy-image-store-content.md)