---
title: Marketplace Ordering REST API
description: Operation group for the Marketplace Ordering REST API
author: yuvlhv
ms.author: yulahav
ms.manager: liraanan
ms.date: 11/17/2020
ms.topic: reference
ms.service: container-service
ms.devlang: rest-api
---

# Marketplace Ordering REST API

The MarketplaceCommerce API (MPC, also known as StoreApi) is used for purchases of third-party Virtual Machines (VM), Managed Applications (MA), and Developer Services.

MarketplaceCommerce is called by ARM\CLI for the purchase. This includes validation and eligibility check of the request, then getting information about the offer from the catalog. It later calls RIRP for asset creation.

## REST Operation group

|Operation Group    |Description    |
|-------------------|---------------|
|[Marketplace Agreements](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Frest%2Fapi%2Fadvisor%2Foperations&data=04%7C01%7Cv-abenetti%40microsoft.com%7C19ad5a097c8647f9010a08d88abfb575%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637411903305758246%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=pT7pNS8TB4SsBfgmIHk8qkr3Za%2Br8OcEruROs2awG7g%3D&reserved=0) | Lists all available REST APIs for Marketplace agreements. |
