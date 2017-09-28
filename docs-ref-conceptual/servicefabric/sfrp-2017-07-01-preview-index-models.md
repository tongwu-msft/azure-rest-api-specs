---
title: "Models"
ms.date: "2017-09-27"
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
# Type Models


| Name | Description |
| --- | --- |
| [ApplicationHealthPolicy](sfrp-2017-07-01-preview-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationMetricDescription](sfrp-2017-07-01-preview-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationParameter](sfrp-2017-07-01-preview-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationProperties](sfrp-2017-07-01-preview-model-applicationproperties.md) | The application resource properties.<br/> |
| [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) | The application resource.<br/> |
| [ApplicationResourceList](sfrp-2017-07-01-preview-model-applicationresourcelist.md) | The list of application resources.<br/> |
| [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) | The application resource for patch operations.<br/> |
| [ApplicationTypeProperties](sfrp-2017-07-01-preview-model-applicationtypeproperties.md) | The application type name properties<br/> |
| [ApplicationTypeResource](sfrp-2017-07-01-preview-model-applicationtyperesource.md) | The application type name resource<br/> |
| [ApplicationTypeResourceList](sfrp-2017-07-01-preview-model-applicationtyperesourcelist.md) | The list of application type names.<br/> |
| [ApplicationUpdateProperties](sfrp-2017-07-01-preview-model-applicationupdateproperties.md) | The application resource properties for patch operations.<br/> |
| [ApplicationUpgradePolicy](sfrp-2017-07-01-preview-model-applicationupgradepolicy.md) | The application upgrade policy.<br/> |
| [AvailableOperationDisplay](sfrp-2017-07-01-preview-model-availableoperationdisplay.md) | Operation supported by Service Fabric resource provider<br/> |
| [AzureActiveDirectory](sfrp-2017-07-01-preview-model-azureactivedirectory.md) | The settings to enable AAD authentication on the cluster.<br/> |
| [CertificateDescription](sfrp-2017-07-01-preview-model-certificatedescription.md) | Describes the certificate details.<br/> |
| [ClientCertificateCommonName](sfrp-2017-07-01-preview-model-clientcertificatecommonname.md) | Describes the client certificate details using common name.<br/> |
| [ClientCertificateThumbprint](sfrp-2017-07-01-preview-model-clientcertificatethumbprint.md) | Describes the client certificate details using thumbprint.<br/> |
| [Cluster](sfrp-2017-07-01-preview-model-cluster.md) | The cluster resource<br/> |
| [ClusterCodeVersionsListResult](sfrp-2017-07-01-preview-model-clustercodeversionslistresult.md) | The list results of the ServiceFabric runtime versions.<br/> |
| [ClusterCodeVersionsResult](sfrp-2017-07-01-preview-model-clustercodeversionsresult.md) | The result of the ServiceFabric runtime versions<br/> |
| [ClusterHealthPolicy](sfrp-2017-07-01-preview-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterListResult](sfrp-2017-07-01-preview-model-clusterlistresult.md) | Cluster list results<br/> |
| [ClusterProperties](sfrp-2017-07-01-preview-model-clusterproperties.md) | Describes the cluster resource properties.<br/> |
| [ClusterPropertiesUpdateParameters](sfrp-2017-07-01-preview-model-clusterpropertiesupdateparameters.md) | Describes the cluster resource properties that can be updated during PATCH operation.<br/> |
| [ClusterUpdateParameters](sfrp-2017-07-01-preview-model-clusterupdateparameters.md) | Cluster update request<br/> |
| [ClusterUpgradeDeltaHealthPolicy](sfrp-2017-07-01-preview-model-clusterupgradedeltahealthpolicy.md) | Describes the delta health policies for the cluster upgrade.<br/> |
| [ClusterUpgradePolicy](sfrp-2017-07-01-preview-model-clusterupgradepolicy.md) | Describes the policy used when upgrading the cluster.<br/> |
| [ClusterVersionDetails](sfrp-2017-07-01-preview-model-clusterversiondetails.md) | The detail of the Service Fabric runtime version result<br/> |
| [DiagnosticsStorageAccountConfig](sfrp-2017-07-01-preview-model-diagnosticsstorageaccountconfig.md) | The storage account information for storing Service Fabric diagnostic logs.<br/> |
| [EndpointRangeDescription](sfrp-2017-07-01-preview-model-endpointrangedescription.md) | Port range details<br/> |
| [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) | The error details.<br/> |
| [NamedPartitionSchemeDescription](sfrp-2017-07-01-preview-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NodeTypeDescription](sfrp-2017-07-01-preview-model-nodetypedescription.md) | Describes a node type in the cluster, each node type represents sub set of nodes in the cluster.<br/> |
| [OperationListResult](sfrp-2017-07-01-preview-model-operationlistresult.md) | Describes the result of the request to list Service Fabric operations.<br/> |
| [OperationResult](sfrp-2017-07-01-preview-model-operationresult.md) | Available operation list result<br/> |
| [PartitionSchemeDescription](sfrp-2017-07-01-preview-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [ProxyResource](sfrp-2017-07-01-preview-model-proxyresource.md) | The resource model definition.<br/> |
| [Resource](sfrp-2017-07-01-preview-model-resource.md) | The resource model definition.<br/> |
| [RollingUpgradeMonitoringPolicy](sfrp-2017-07-01-preview-model-rollingupgrademonitoringpolicy.md) | The policy used for monitoring the application upgrade<br/> |
| [ServiceCorrelationDescription](sfrp-2017-07-01-preview-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceLoadMetricDescription](sfrp-2017-07-01-preview-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServicePlacementPolicyDescription](sfrp-2017-07-01-preview-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServiceProperties](sfrp-2017-07-01-preview-model-serviceproperties.md) | The service resource properties.<br/> |
| [ServicePropertiesBase](sfrp-2017-07-01-preview-model-servicepropertiesbase.md) | The common service resource properties.<br/> |
| [ServiceResource](sfrp-2017-07-01-preview-model-serviceresource.md) | The service resource.<br/> |
| [ServiceResourceList](sfrp-2017-07-01-preview-model-serviceresourcelist.md) | The list of service resources.<br/> |
| [ServiceResourceUpdate](sfrp-2017-07-01-preview-model-serviceresourceupdate.md) | The service resource for patch operations.<br/> |
| [ServiceTypeDeltaHealthPolicy](sfrp-2017-07-01-preview-model-servicetypedeltahealthpolicy.md) | Service health policy<br/> |
| [ServiceTypeHealthPolicy](sfrp-2017-07-01-preview-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfrp-2017-07-01-preview-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceUpdateProperties](sfrp-2017-07-01-preview-model-serviceupdateproperties.md) | The service resource properties for patch operations.<br/> |
| [SettingsParameterDescription](sfrp-2017-07-01-preview-model-settingsparameterdescription.md) | Describes a parameter in fabric settings of the cluster.<br/> |
| [SettingsSectionDescription](sfrp-2017-07-01-preview-model-settingssectiondescription.md) | Describes a section in the fabric settings of the cluster.<br/> |
| [SingletonPartitionSchemeDescription](sfrp-2017-07-01-preview-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfrp-2017-07-01-preview-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [VersionProperties](sfrp-2017-07-01-preview-model-versionproperties.md) | The properties of the version resource.<br/> |
| [VersionResource](sfrp-2017-07-01-preview-model-versionresource.md) | A version resource for the specified application type name.<br/> |
| [VersionResourceList](sfrp-2017-07-01-preview-model-versionresourcelist.md) | The list of version resources for the specified application type name.<br/> |
