---
title: ExpressRoute REST API | Microsoft Docs
ms.date: 08/09/2017
ms.service: expressroute
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---

# Express Route REST API

Azure ExpressRoute lets you create private connections between Azure datacenters and infrastructure on your premises or in a colocation environment. For a more detailed overview see the [Azure ExpressRoute product page](https://azure.microsoft.com/services/expressroute). 

## REST Operation Groups

|Operation Group|Description|
|---|---|
|[ExpressRoute Service Providers](~/docs-ref-autogen/expressroute/expressrouteserviceproviders.json)    |Provides operations listing ExpressRoute providers.|
|[ExpressRoute Circuits](~/docs-ref-autogen/expressroute/expressroutecircuits.json)   | Provides operations for managing ExpressRoute circuit authorizations.|
|[ExpressRoute Authorizations](~/docs-ref-autogen/expressroute/expressroutecircuitauthorizations.json)  |Provides operations for managing ExpressRoute BGP peerings.|
|[ExpressRoute BGP Peering](~/docs-ref-autogen/expressroute/expressroutecircuitpeerings.json)  |Provides operations for managing ExpressRoute BGP peerings.|
|[BGP Service communities](~/docs-ref-autogen/expressroute/bgpservicecommunities.json)    |Gets all available BGP service comunities.|
|[Route filters](~/docs-ref-autogen/expressroute/routefilters.json)   |Provides operations for managing Route filters.|