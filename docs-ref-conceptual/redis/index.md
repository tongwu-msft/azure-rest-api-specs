---
ms.assetid: d6454772-1594-4c44-9f01-456ccfed94d1
title: Azure Redis Cache
description: Reference for Azure Cache for Redis REST APIs 
ms.service: cache
author: flang-msft
ms.author: franlanglois
ms.topic: reference
ms.date: 08/26/2022

---

# Azure Cache for Redis

Azure Cache for Redis is based on the popular open-source [Redis cache](http://redis.io). It gives you access to a secure, dedicated Redis server, managed by Microsoft and accessible from any application within Azure. For a more detailed overview, see [Azure Cache for Redis](/azure/azure-cache-for-redis/).

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Patch Schedules](xref:management.azure.com.redis.patchschedules) | Provides operations for managing the [maintenance window](/azure-cache-for-redis/cache-administration.md/#schedule-updates) for Premium tier Azure Redis Cache instances.            |
| [Redis](xref:management.azure.com.redis.redis)           | Provides operations for creating and managing Azure Redis Cache instances such as create, update, delete, reboot, import/export, and key regeneration.      |

## See Also

- [Azure Cache for Redis documentation](/azure/azure-cache-for-redis/)
- [Azure Cache for Redis Overview](/azure/azure-cache-for-redis/cache-overview)
- [Azure Cache for Redis FAQ](/azure/azure-cache-for-redis/cache-faq)
