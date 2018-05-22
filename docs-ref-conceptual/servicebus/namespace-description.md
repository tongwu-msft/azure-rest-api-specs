---
title: "Namespace Description"
ms.custom: ""
ms.date: "2016-06-06"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6ffabc1d-1062-4ed5-8ce8-4b9092af7d7c
caps.latest.revision: 9
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
# Namespace Description
The namespace description is an XML `AtomPub` document that defines the desired semantics for a service namespace. The namespace description contains the following properties.  
  
##  <a name="RESTAPIv2_1"></a> Namespace Description Properties  
 Region: `string`  
 Specifies the targeted region in which the namespace should be created. It can be any of the following values:  
  
|Value|  
|-----------|  
|East Asia|  
|North Europe|  
|West Europe|  
|East US|  
|Southeast Asia|  
|North Central US|  
|West US|  
|South Central US|  
  
 Default Key: `string`  
 Default ACS access key to generate the access token.  
  
 Status: `Int`  
 Status of the namespace. It can be one of these values:  
  
 1 = Created/Active  
  
 2 = Creating  
  
 3 = Suspended  
  
 4 = Deleting  
  
 CreatedAt: `DateTime`  
 Date and time at which this namespace was created.  
  
 ACS Management Endpoint: `string (URL)`  
 ACS endpoint you can use to obtain access tokens.  
  
> [!NOTE]
>  This should be standard from the configuration file when creating a new namespace.  
  
 Service Bus Endpoint: `string (URL)`  
 Endpoint you can use to perform messaging or relay operations.  
  
> [!NOTE]
>  This should be standard from the configuration file when creating a new namespace.  
  
 Connection String: `string`  
 Namespace connection string.  
  
 NamespaceType: `string`  
 Specifies the type of entity that lives in this namespace. It can be one of the following values:  
  
-   **Messaging**: for creating messaging entities in this namespace; for example, queues, topics, subscriptions, or relays.  
  
-   **EventHub**: for creating Event Hubs in this namespace.  
  
-   **NotificationHub**: for creating notification hubs in this namespace.