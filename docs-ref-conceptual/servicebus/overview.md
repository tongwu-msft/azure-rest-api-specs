---
title: "Overview"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 34ddb818-0781-4043-ba25-9627bfd1d1f3
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
# Overview
The simplified REST API sets for managing entities are as follows:  
  
-   GET on any unoccupied naming node (for example, / or /test) is a discovery operation and returns an AtomPub feed listing children. It will only return the “immediate node.” For example, if you have queues at A/B/C, and perform a GET on “/”, it returns “/A”. If you perform a GET on “/A”, it returns only “/A/B”, and so on.  
  
-   “GET” against any occupied node (for example, /test1/test2, /test1/example, or /test2) is a get operation and returns an `AtomPub` entry with the description.  
  
-   “PUT” against any unoccupied node is a create operation. The request body is and `AtomPub` entry with the description.  
  
-   “DELETE” against any occupied node is a delete operation.  
  
-   “DELETE” against any unoccupied node is ignored and returns success.