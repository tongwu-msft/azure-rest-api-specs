---
title: "Delete a load balancer inbound NAT rule"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 88d853f4-69e0-4bb3-b359-0c560ec8b1b5
caps.latest.revision: 6
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
---
# Delete a load balancer inbound NAT rule
## Request  
 See [Common parameters and headers](../NetworkREST/supporting-tasks.md#bk_common) for headers and parameters that are used by all requests related to load balancer inbound NAT rules.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/loadBalancers/{load-balancer-name}/inboundNatRules/{rule-name}?api-version={api-version}`|  
  
 Replace {rule-name} with the name of the load balancer inbound NAT rule you want deleted.  
  
## Response  
 **Status code:**  
  
-   202-Accepted if resource exists and the request is accepted.  
  
-   When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
-   Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
-   Returns 204-No Content if resource does not exist.  
  
## Remarks  
 For more information about NAT rules, see [Load balancer inbound NAT rules](../loadbalancers/load-balancer-inbound-nat-rules.md).