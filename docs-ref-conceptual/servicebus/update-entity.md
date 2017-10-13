---
title: "Create or Update Entity"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ef56be71-bc51-48a1-838c-13c4a680c5d5
caps.latest.revision: 10
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
# Create or Update Entity
Creates or updates a messaging entity.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|https://{serviceNamespace}.servicebus.windows.net/{Entity Path}|HTTP/1.1|  

The entity path can be a multi-segment name, with segments separated by '/'. The entirety of the path makes up the name of the entities. Multiple entities can share the same prefix segments. 

  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization| Specifies a Shared Access Signature (SAS) token with "Manage" rights. See [Service Bus authentication with Shared Access Signatures](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas) for details.|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
|If-Match|Set this header to “*” to update the entity. You must provide all the property values that are desired on the updated entity. Any values not provided are set to the service default values. If this header is missing, the update call returns an error indicating that this entity already exists.|  
  
### Request Body  
The body of the request must contain a valid Atom XML entry that embeds the description of 
the entity that shall be created

```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<entry xmlns='http://www.w3.org/2005/Atom'>  
  <content type='application/xml'>  
    {description}  
  </content>  
</entry>  
```

whereby the {description} described either a Queue or a Topic for top-level entities, or a 
subscription or rule relative to their parent entities.

A queue, for instance, is described with a ```QueueDescription``` element. The XML payload for creating or updating a queue therefore may take the following form, whereby all omitted properties assume their default values:

```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
  <content type="application/xml">  
    <QueueDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
       <LockDuration>T1M</LockDuration>
    </QueueDescription>
  </content>  
</entry>  
```

See [Overview](overview.md) for more details on entities and how they relate to paths.
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you update an entity with a name containing special or encoded characters (for example, "test?Name=value&"), which gets encoded to "test%3FName%3Dvalue%26"), a (401) unauthorized exception will be generated.  
  
|Code|Description|  
|----------|-----------------|  
|201|Entity updated.|  
|400|Invalid request body.|  
|401|Authorization failure.|  
|403|Quota exceeded; entity not updated.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 The entity description is returned. Some description properties might contain default values if they were missing from the PUT request.