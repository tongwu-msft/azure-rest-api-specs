---
title: "Topic Subscription"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 56d5e781-f6bb-41e3-af92-f6af2b3e780f
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
# Topic Subscription
The address of a subscription to a topic is defined as follows.  
  
```  
https://{serviceNamespace}.servicebus.Windows.net/{topic-path}/Subscriptions/{subscription-name}  
```  
  
> [!NOTE]
>  `{subscription-name}` must be a single segment, meaning no slash is allowed. The maximum length of a subscription name is 50 characters.