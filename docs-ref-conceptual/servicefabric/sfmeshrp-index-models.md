---
title: "Models"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Type Models


| Name | Description |
| --- | --- |
| [ApplicationProperties](sfmeshrp-model-applicationproperties.md) | This type describes properties of an application resource.<br/> |
| [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) | This type describes an application resource.<br/> |
| [ApplicationResourceDescriptionList](sfmeshrp-model-applicationresourcedescriptionlist.md) | A pageable list of application resources.<br/> |
| [ApplicationResourceProperties](sfmeshrp-model-applicationresourceproperties.md) | This type describes properties of an application resource.<br/> |
| [ApplicationResourceStatus enum](sfmeshrp-model-applicationresourcestatus.md) | Possible values include: 'Invalid', 'Ready', 'Upgrading', 'Creating', 'Deleting', 'Failed'<br/> |
| [AvailableOperationDisplay](sfmeshrp-model-availableoperationdisplay.md) | An operation available at the listed Azure resource provider.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfmeshrp-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [ContainerCodePackageProperties](sfmeshrp-model-containercodepackageproperties.md) | Describes a container and its runtime properties.<br/> |
| [ContainerEvent](sfmeshrp-model-containerevent.md) | A container event.<br/> |
| [ContainerInstanceView](sfmeshrp-model-containerinstanceview.md) | Runtime information of a container instance.<br/> |
| [ContainerLabel](sfmeshrp-model-containerlabel.md) | Describes a container label.<br/> |
| [ContainerLogs](sfmeshrp-model-containerlogs.md) | The logs of the container.<br/> |
| [ContainerState](sfmeshrp-model-containerstate.md) | The container state.<br/> |
| [ContainerVolume](sfmeshrp-model-containervolume.md) | Describes how a volume is attached to a container.<br/> |
| [DiagnosticsDescription](sfmeshrp-model-diagnosticsdescription.md) | Describes the diagnostics options available<br/> |
| [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) | Reference to sinks in DiagnosticsDescription.<br/> |
| [DiagnosticsSinkKind enum](sfmeshrp-model-diagnosticssinkkind.md) | The kind of DiagnosticsSink.<br/> |
| [DiagnosticsSinkProperties](sfmeshrp-model-diagnosticssinkproperties.md) | Properties of a DiagnosticsSink.<br/> |
| [EndpointProperties](sfmeshrp-model-endpointproperties.md) | Describes a container endpoint.<br/> |
| [EnvironmentVariable](sfmeshrp-model-environmentvariable.md) | Describes an environment variable for the container.<br/> |
| [ErrorModel](sfmeshrp-model-errormodel.md) | The error details.<br/> |
| [HealthState enum](sfmeshrp-model-healthstate.md) | The health state of a resource such as Application, Service, or Network.<br/> |
| [ImageRegistryCredential](sfmeshrp-model-imageregistrycredential.md) | Image registry credential.<br/> |
| [IngressConfig](sfmeshrp-model-ingressconfig.md) | Describes public connectivity configuration for the network.<br/> |
| [IngressQoSLevel enum](sfmeshrp-model-ingressqoslevel.md) | Possible values include: 'Bronze'<br/> |
| [Layer4IngressConfig](sfmeshrp-model-layer4ingressconfig.md) | Describes the layer4 configuration for public connectivity for this network.<br/> |
| [ManagedProxyResource](sfmeshrp-model-managedproxyresource.md) | The resource model definition for Azure Resource Manager proxy resource. It will have everything other than required location and tags. This proxy resource is explicitly created or updated by including it in the parent resource.<br/> |
| [NetworkProperties](sfmeshrp-model-networkproperties.md) | Describes a network.<br/> |
| [NetworkRef](sfmeshrp-model-networkref.md) | Describes a network reference in a service.<br/> |
| [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) | This type describes a network resource.<br/> |
| [NetworkResourceDescriptionList](sfmeshrp-model-networkresourcedescriptionlist.md) | A pageable list of network resources.<br/> |
| [NetworkResourceProperties](sfmeshrp-model-networkresourceproperties.md) | Describes properties of a network resource.<br/> |
| [OperatingSystemTypes enum](sfmeshrp-model-operatingsystemtypes.md) | Possible values include: 'Linux', 'Windows'<br/> |
| [OperationListResult](sfmeshrp-model-operationlistresult.md) | Describes the result of the request to list Service Fabric operations.<br/> |
| [OperationResult](sfmeshrp-model-operationresult.md) | List of operations available at the listed Azure resource provider.<br/> |
| [ProvisionedResourceProperties](sfmeshrp-model-provisionedresourceproperties.md) | Describes common properties of a provisioned resource.<br/> |
| [ProxyResource](sfmeshrp-model-proxyresource.md) | The resource model definition for Azure Resource Manager proxy resource. It will have everything other than required location and tags.<br/> |
| [Resource](sfmeshrp-model-resource.md) | The resource model definition for Azure Resource Manager resource.<br/> |
| [ResourceLimits](sfmeshrp-model-resourcelimits.md) | This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.<br/> |
| [ResourceRequests](sfmeshrp-model-resourcerequests.md) | This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.<br/> |
| [ResourceRequirements](sfmeshrp-model-resourcerequirements.md) | This type describes the resource requirements for a container or a service.<br/> |
| [ServiceList](sfmeshrp-model-servicelist.md) | A pageable list of all services in an application.<br/> |
| [ServiceReplicaDescription](sfmeshrp-model-servicereplicadescription.md) | This type describes a replica of a service resource.<br/> |
| [ServiceReplicaList](sfmeshrp-model-servicereplicalist.md) | A pageable list of replicas of a service resource.<br/> |
| [ServiceReplicaProperties](sfmeshrp-model-servicereplicaproperties.md) | Describes the properties of a service replica.<br/> |
| [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) | This type describes a service resource.<br/> |
| [ServiceResourceProperties](sfmeshrp-model-serviceresourceproperties.md) | This type describes properties of a service resource.<br/> |
| [ServiceResourceStatus enum](sfmeshrp-model-serviceresourcestatus.md) | Possible values include: 'Unknown', 'Active', 'Upgrading', 'Deleting', 'Creating', 'Failed'<br/> |
| [Setting](sfmeshrp-model-setting.md) | Describes a setting for the container.<br/> |
| [TrackedResource](sfmeshrp-model-trackedresource.md) | The resource model definition for Azure Resource Manager tracked top-level resource.<br/> |
| [VolumeProperties](sfmeshrp-model-volumeproperties.md) | This type describes properties of a volume resource.<br/> |
| [VolumeProviderParametersAzureFile](sfmeshrp-model-volumeproviderparametersazurefile.md) | This type describes a volume provided by an Azure Files file share.<br/> |
| [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) | This type describes a volume resource.<br/> |
| [VolumeResourceDescriptionList](sfmeshrp-model-volumeresourcedescriptionlist.md) | A pageable list of volume resources.<br/> |
| [VolumeResourceProperties](sfmeshrp-model-volumeresourceproperties.md) | Describes properties of a volume resource.<br/> |
