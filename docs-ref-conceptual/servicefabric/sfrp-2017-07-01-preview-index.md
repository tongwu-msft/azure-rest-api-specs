---
title: "Service Fabric Resource Manager REST API Reference"
ms.date: "2018-05-25"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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


# Service Fabric Resource Manager REST API Reference (2017-07-01-preview)

[Service Fabric](http://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. 

A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed. [Service Fabric Resource Manager APIs](sfrp-2017-07-01-preview-index.md) allow you to create and manage Service Fabric clusters in Azure. This is a preview version of the APIs that allows managing application, service, and container resources in Azure.

Following is a list of Service Fabric Resource Manager REST APIs.


----
## [Operations APIs](sfrp-2017-07-01-preview-index-operations.md)

| Name | Description |
| --- | --- |
| [List](sfrp-2017-07-01-preview-api-operations_list.md) | Lists all of the available Service Fabric resource provider API operations.<br/> |

----
## [ApplicationType APIs](sfrp-2017-07-01-preview-index-applicationtype.md)

| Name | Description |
| --- | --- |
| [Get](sfrp-2017-07-01-preview-api-applicationtypes_get.md) | Gets a Service Fabric application type name resource.<br/> |
| [Create](sfrp-2017-07-01-preview-api-applicationtypes_create.md) | Creates or updates a Service Fabric application type name resource.<br/> |
| [Delete](sfrp-2017-07-01-preview-api-applicationtypes_delete.md) | Deletes a Service Fabric application type name resource.<br/> |
| [List](sfrp-2017-07-01-preview-api-applicationtypes_list.md) | Gets the list of application type name resources created in the specified Service Fabric cluster resource.<br/> |

----
## [ApplicationTypeVersion APIs](sfrp-2017-07-01-preview-index-applicationtypeversion.md)

| Name | Description |
| --- | --- |
| [Get](sfrp-2017-07-01-preview-api-applicationtypeversions_get.md) | Gets a Service Fabric application type version resource.<br/> |
| [Create](sfrp-2017-07-01-preview-api-applicationtypeversions_create.md) | Creates or updates a Service Fabric application type version resource.<br/> |
| [Delete](sfrp-2017-07-01-preview-api-applicationtypeversions_delete.md) | Deletes a Service Fabric application type version resource.<br/> |
| [List](sfrp-2017-07-01-preview-api-applicationtypeversions_list.md) | Gets the list of application type version resources created in the specified Service Fabric application type name resource.<br/> |

----
## [Application APIs](sfrp-2017-07-01-preview-index-application.md)

| Name | Description |
| --- | --- |
| [Get](sfrp-2017-07-01-preview-api-applications_get.md) | Gets a Service Fabric application resource.<br/> |
| [Create](sfrp-2017-07-01-preview-api-applications_create.md) | Creates or updates a Service Fabric application resource.<br/> |
| [Update](sfrp-2017-07-01-preview-api-applications_update.md) | Updates a Service Fabric application resource.<br/> |
| [Delete](sfrp-2017-07-01-preview-api-applications_delete.md) | Deletes a Service Fabric application resource.<br/> |
| [List](sfrp-2017-07-01-preview-api-applications_list.md) | Gets the list of application resources created in the specified Service Fabric cluster resource.<br/> |

----
## [Service APIs](sfrp-2017-07-01-preview-index-service.md)

| Name | Description |
| --- | --- |
| [Get](sfrp-2017-07-01-preview-api-services_get.md) | Gets a Service Fabric service resource.<br/> |
| [Create](sfrp-2017-07-01-preview-api-services_create.md) | Creates or updates a Service Fabric service resource.<br/> |
| [Update](sfrp-2017-07-01-preview-api-services_update.md) | Updates a Service Fabric service resource.<br/> |
| [Delete](sfrp-2017-07-01-preview-api-services_delete.md) | Deletes a Service Fabric service resource.<br/> |
| [List](sfrp-2017-07-01-preview-api-services_list.md) | Gets the list of service resources created in the specified Service Fabric application resource.<br/> |

----
## [Models](sfrp-2017-07-01-preview-index-models.md)

| Name | Description |
| --- | --- |
| [ApplicationHealthPolicy](sfrp-2017-07-01-preview-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationMetricDescription](sfrp-2017-07-01-preview-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) | The application resource.<br/> |
| [ApplicationResourceList](sfrp-2017-07-01-preview-model-applicationresourcelist.md) | The list of application resources.<br/> |
| [ApplicationResourceProperties](sfrp-2017-07-01-preview-model-applicationresourceproperties.md) | The application resource properties.<br/> |
| [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) | The application resource for patch operations.<br/> |
| [ApplicationResourceUpdateProperties](sfrp-2017-07-01-preview-model-applicationresourceupdateproperties.md) | The application resource properties for patch operations.<br/> |
| [ApplicationTypeResource](sfrp-2017-07-01-preview-model-applicationtyperesource.md) | The application type name resource<br/> |
| [ApplicationTypeResourceList](sfrp-2017-07-01-preview-model-applicationtyperesourcelist.md) | The list of application type names.<br/> |
| [ApplicationTypeResourceProperties](sfrp-2017-07-01-preview-model-applicationtyperesourceproperties.md) | The application type name properties<br/> |
| [ApplicationTypeVersionResource](sfrp-2017-07-01-preview-model-applicationtypeversionresource.md) | An application type version resource for the specified application type name resource.<br/> |
| [ApplicationTypeVersionResourceList](sfrp-2017-07-01-preview-model-applicationtypeversionresourcelist.md) | The list of application type version resources for the specified application type name resource.<br/> |
| [ApplicationTypeVersionResourceProperties](sfrp-2017-07-01-preview-model-applicationtypeversionresourceproperties.md) | The properties of the application type version resource.<br/> |
| [ApplicationUpgradePolicy](sfrp-2017-07-01-preview-model-applicationupgradepolicy.md) | Describes the policy for a monitored application upgrade.<br/> |
| [AvailableOperationDisplay](sfrp-2017-07-01-preview-model-availableoperationdisplay.md) | Operation supported by the Service Fabric resource provider<br/> |
| [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) | The structure of the error.<br/> |
| [ErrorModelError](sfrp-2017-07-01-preview-model-errormodelerror.md) | The error details.<br/> |
| [MoveCost enum](sfrp-2017-07-01-preview-model-movecost.md) | Specifies the move cost for the service.<br/> |
| [NamedPartitionSchemeDescription](sfrp-2017-07-01-preview-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [OperationListResult](sfrp-2017-07-01-preview-model-operationlistresult.md) | Describes the result of the request to list Service Fabric resource provider operations.<br/> |
| [OperationResult](sfrp-2017-07-01-preview-model-operationresult.md) | Available operation list result<br/> |
| [PartitionScheme enum](sfrp-2017-07-01-preview-model-partitionscheme.md) | Enumerates the ways that a service can be partitioned.<br/> |
| [PartitionSchemeDescription](sfrp-2017-07-01-preview-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [ProxyResource](sfrp-2017-07-01-preview-model-proxyresource.md) | The resource model definition for proxy-only resource.<br/> |
| [RollingUpgradeMonitoringPolicy](sfrp-2017-07-01-preview-model-rollingupgrademonitoringpolicy.md) | The policy used for monitoring the application upgrade<br/> |
| [ServiceCorrelationDescription](sfrp-2017-07-01-preview-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceCorrelationScheme enum](sfrp-2017-07-01-preview-model-servicecorrelationscheme.md) | The service correlation scheme.<br/> |
| [ServiceKind enum](sfrp-2017-07-01-preview-model-servicekind.md) | The kind of service (Stateless or Stateful).<br/> |
| [ServiceLoadMetricDescription](sfrp-2017-07-01-preview-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceLoadMetricWeight enum](sfrp-2017-07-01-preview-model-serviceloadmetricweight.md) | Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.<br/> |
| [ServicePlacementPolicyDescription](sfrp-2017-07-01-preview-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPolicyType enum](sfrp-2017-07-01-preview-model-serviceplacementpolicytype.md) | The type of placement policy for a service fabric service. Following are the possible values.<br/> |
| [ServiceResource](sfrp-2017-07-01-preview-model-serviceresource.md) | The service resource.<br/> |
| [ServiceResourceList](sfrp-2017-07-01-preview-model-serviceresourcelist.md) | The list of service resources.<br/> |
| [ServiceResourceProperties](sfrp-2017-07-01-preview-model-serviceresourceproperties.md) | The service resource properties.<br/> |
| [ServiceResourcePropertiesBase](sfrp-2017-07-01-preview-model-serviceresourcepropertiesbase.md) | The common service resource properties.<br/> |
| [ServiceResourceUpdate](sfrp-2017-07-01-preview-model-serviceresourceupdate.md) | The service resource for patch operations.<br/> |
| [ServiceResourceUpdateProperties](sfrp-2017-07-01-preview-model-serviceresourceupdateproperties.md) | The service resource properties for patch operations.<br/> |
| [ServiceTypeHealthPolicy](sfrp-2017-07-01-preview-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [SingletonPartitionSchemeDescription](sfrp-2017-07-01-preview-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [StatefulServiceProperties](sfrp-2017-07-01-preview-model-statefulserviceproperties.md) | The properties of a stateful service resource.<br/> |
| [StatefulServiceUpdateProperties](sfrp-2017-07-01-preview-model-statefulserviceupdateproperties.md) | The properties of a stateful service resource for patch operations.<br/> |
| [StatelessServiceProperties](sfrp-2017-07-01-preview-model-statelessserviceproperties.md) | The properties of a stateless service resource.<br/> |
| [StatelessServiceUpdateProperties](sfrp-2017-07-01-preview-model-statelessserviceupdateproperties.md) | The properties of a stateless service resource for patch operations.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfrp-2017-07-01-preview-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |

