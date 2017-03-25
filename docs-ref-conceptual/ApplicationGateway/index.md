---
title: Application Gateway REST
ms.date: 03/09/2017
ms.service: application-gateway
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
# Application Gateway REST
Application Gateway is a Network Service which provides HTTP Load balancing as a Service to Azure customers. This is a fully managed service implemented as dedicated Hosted Service in a subscription owned by Gateway Manager but deployed in customer vnet. In addition to basic HTTP Load balancing, it provides other Layer 7 features like Cookie based client affinity and SSL offload, URL routing and multi-site hosting. For a more detailed overview see the [Azure Application Gateway product page](https://azure.microsoft.com/services/application-gateway).  

## REST Operations

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update an application gateway](create-or-update-an-application-gateway.md) |  PUT | Creates or updates an application gateway |  
| [Delete an application gateway](delete-application-gateway.md) |  DELETE | Deletes an existing application gateway. |  
| [Get an application gateway](get-application-gateway.md) |  GET | Gets details on an application gateway. |  
| [List application gateways](list-application-gateways.md) |  GET | Lists all application gateways. | 
| [Start an application gateway](start-application-gateway.md) |  POST | Starts an application gateway. |  
| [Stop an application gateway](stop-application-gateway.md) |  POST | Stops an application gateway. | 


