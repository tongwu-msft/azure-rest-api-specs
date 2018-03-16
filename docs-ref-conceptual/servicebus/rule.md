---
title: "Rule"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 09721837-143f-4f40-9537-2fafe70355da
caps.latest.revision: 6
author: "sethmanheim"
ms.author: "sethm"
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
# Rule
The rule for a topic subscription is defined as follows.  
  
```  
https://{serviceNamespace}.servicebus.Windows.net/{topic-path}/Subscriptions/{subscription-name}/rules/{rule-name}  
```  
  
> [!NOTE]
>  `{rule-name}` must be a single segment, meaning no slash is allowed. The maximum length of a rule name is 50 characters.