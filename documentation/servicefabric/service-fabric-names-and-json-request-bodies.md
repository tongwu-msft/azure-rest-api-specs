---
title: "Service Fabric Names and JSON Request Bodies"
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
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: 985b88f1-3257-456a-9004-750053eed16f
caps.latest.revision: 5
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Service Fabric Names and JSON Request Bodies
When de-serializing Service Fabric Names in a JSON request body, the following should be considered:  
  
-   " " (space) should not be converted to `%20`  
  
-   `/` should be converted to `\/`  
  
 Therefore, .NET users should not convert their Service Fabric Name into a URI before deserializing it and should prefer string:  
  
 The following sample demonstrates the correct request body format for “/”  
  
```  
POST http://localhost:19007/Applications/$/Create?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 114  
Content-Type: application/json; charset=utf-8  
  
{"Name":"fabric:\/sample Application","TypeName":"PersistentPiEstimatorApp","TypeVersion":"1.0","ParameterList":[]}  
```