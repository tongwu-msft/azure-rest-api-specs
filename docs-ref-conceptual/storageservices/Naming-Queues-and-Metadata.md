---
title: Naming Queues and Metadata - Azure Storage
description: This topic describes rules for naming queues and queue metadata.
author: tamram

ms.date: 08/26/2019
ms.service: storage
ms.topic: reference
ms.author: tamram
---

# Naming Queues and Metadata

This topic describes rules for naming queues and queue metadata.  
  
## Queue Names
  
Every queue within an account must have a unique name. The queue name must be a valid DNS name, and cannot be changed once created. Queue names must confirm to the following rules:  
  
- A queue name must start with a letter or number, and can only contain letters, numbers, and the dash (-) character.  
  
- The first and last letters in the queue name must be alphanumeric. The dash (-) character cannot be the first or last character. Consecutive dash characters are not permitted in the queue name.  
  
- All letters in a queue name must be lowercase.  
  
- A queue name must be from 3 through 63 characters long.  
  
## Metadata Names
  
Metadata for a queue resource is stored as name-value pairs. Beginning with REST API version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference). Existing metadata names that do not adhere to these naming rules can be used with earlier versions of the Queue service, but not with REST API version 2009-09-19 or later.  
  
Metadata names preserve the case with which they were created, but are case-insensitive when set or read. If two or more metadata headers with the same name are submitted for a resource, the Queue service returns status code 400 (Bad Request).  
  
## See Also

- [Queue Service Concepts](Queue-Service-Concepts.md)   
- [Addressing Queue Service Resources](Addressing-Queue-Service-Resources.md)
