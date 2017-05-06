---
title: "ClusterHealthChunkQueryDescription"
ms.date: "2017-05-06"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
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
# ClusterHealthChunkQueryDescription

The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeFilters](#nodefilters) | array of [NodeHealthStateFilter](sfclient-model-nodehealthstatefilter.md) | No |
| [ApplicationFilters](#applicationfilters) | array of [ApplicationHealthStateFilter](sfclient-model-applicationhealthstatefilter.md) | No |
| [ClusterHealthPolicy](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |
| [ApplicationHealthPolicies](#applicationhealthpolicies) | [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) | No |

____
### NodeFilters
__Type__: array of [NodeHealthStateFilter](sfclient-model-nodehealthstatefilter.md) <br/>
__Required__: No<br/>
<br/>
Defines a list of filters that specify which nodes to be included in the returned cluster health chunk.
If no filters are specified, no nodes are returned. All the nodes are used to evaluate the cluster's aggregated health state, regardless of the input filters.
The cluster health chunk query may specify multiple node filters.
For example, it can specify a filter to return all nodes with health state Error and another filter to always include a node identified by its NodeName.


____
### ApplicationFilters
__Type__: array of [ApplicationHealthStateFilter](sfclient-model-applicationhealthstatefilter.md) <br/>
__Required__: No<br/>
<br/>
Defines a list of filters that specify which applications to be included in the returned cluster health chunk.
If no filters are specified, no applications are returned. All the applications are used to evaluate the cluster's aggregated health state, regardless of the input filters.
The cluster health chunk query may specify multiple application filters.
For example, it can specify a filter to return all applications with health state Error and another filter to always include applications of a specified application type.


____
### ClusterHealthPolicy
__Type__: [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster or of a cluster node.


____
### ApplicationHealthPolicies
__Type__: [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Defines the application health policy map used to evaluate the health of an application or one of its children entities.

