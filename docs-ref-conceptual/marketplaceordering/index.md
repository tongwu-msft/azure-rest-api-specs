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
|[Marketplace Agreements](/rest/api/marketplaceordering/marketplaceagreements) | Lists all available REST APIs for Marketplace agreements. |
