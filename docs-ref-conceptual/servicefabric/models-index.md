---
title: "Models"
ms.date: "2017-04-27"
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
# Type Models


| Name | Description |
| --- | --- |
| [AadMetadata](model-AadMetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](model-AadMetadataObject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [ApplicationCapacityDescription](model-ApplicationCapacityDescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationDescription](model-ApplicationDescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationHealth](model-ApplicationHealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](model-ApplicationHealthEvaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicy](model-ApplicationHealthPolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](model-ApplicationHealthPolicyMapItem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthState](model-ApplicationHealthState.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationInfo](model-ApplicationInfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationMetricDescription](model-ApplicationMetricDescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](model-ApplicationNameInfo.md) | Information about the application name.<br/> |
| [ApplicationParameter](model-ApplicationParameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationsHealthEvaluation](model-ApplicationsHealthEvaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](model-ApplicationTypeApplicationsHealthEvaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeHealthPolicyMapItem](model-ApplicationTypeHealthPolicyMapItem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](model-ApplicationTypeImageStorePath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeImageStoreVersion](model-ApplicationTypeImageStoreVersion.md) | A version description for the application type<br/> |
| [ApplicationTypeInfo](model-ApplicationTypeInfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](model-ApplicationTypeManifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationUpgradeDescription](model-ApplicationUpgradeDescription.md) | Describes the parameters for an application upgrade. Please note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would results in application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeProgressInfo](model-ApplicationUpgradeProgressInfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ChaosContext](model-ChaosContext.md) | Describes a map, which is collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs. <br/>This map is set by the starter of the Choas run to optionally store the context about the specific run.<br/> |
| [ChaosContextMapItem](model-ChaosContextMapItem.md) | Describes an item in the ChaosContextMap in ChaosParameters.<br/> |
| [ChaosEvent](model-ChaosEvent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventWrapper](model-ChaosEventWrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosParameters](model-ChaosParameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosReport](model-ChaosReport.md) | Contains detailed Chaos report.<br/> |
| [ClusterHealth](model-ClusterHealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthPolicies](model-ClusterHealthPolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](model-ClusterHealthPolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterManifest](model-ClusterManifest.md) | Information about the cluster manifest.<br/> |
| [ClusterUpgradeDescriptionObject](model-ClusterUpgradeDescriptionObject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeHealthPolicyObject](model-ClusterUpgradeHealthPolicyObject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](model-ClusterUpgradeProgressObject.md) | Information about a cluster upgrade.<br/> |
| [CodePackageEntryPoint](model-CodePackageEntryPoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](model-CodePackageEntryPointStatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeApplicationStatusInfo](model-ComposeApplicationStatusInfo.md) | Information about a Service Fabric compose application.<br/> |
| [CreateComposeApplicationDescription](model-CreateComposeApplicationDescription.md) | Defines description for creating a Service Fabric compose application.<br/> |
| [CurrentUpgradeDomainProgressInfo](model-CurrentUpgradeDomainProgressInfo.md) | Information about the current in-progress upgrade domain.<br/> |
| [DeactivationIntentDescription](model-DeactivationIntentDescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DeltaNodesCheckHealthEvaluation](model-DeltaNodesCheckHealthEvaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](model-DeployedApplicationHealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](model-DeployedApplicationHealthEvaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthState](model-DeployedApplicationHealthState.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationInfo](model-DeployedApplicationInfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationsHealthEvaluation](model-DeployedApplicationsHealthEvaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedCodePackageInfo](model-DeployedCodePackageInfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](model-DeployedServicePackageHealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](model-DeployedServicePackageHealthEvaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthState](model-DeployedServicePackageHealthState.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageInfo](model-DeployedServicePackageInfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackagesHealthEvaluation](model-DeployedServicePackagesHealthEvaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](model-DeployedServiceReplicaDetailInfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](model-DeployedServiceReplicaInfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](model-DeployedServiceTypeInfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](model-DeployedStatefulServiceReplicaDetailInfo.md) | Information about a stateful replica running in a code package.<br/> |
| [DeployedStatefulServiceReplicaInfo](model-DeployedStatefulServiceReplicaInfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](model-DeployedStatelessServiceInstanceDetailInfo.md) | Information about a stateless instance running in a code package.<br/> |
| [DeployedStatelessServiceInstanceInfo](model-DeployedStatelessServiceInstanceInfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [EnsureAvailabilitySafetyCheck](model-EnsureAvailabilitySafetyCheck.md) | Safety check that waits for ensures the avaiability of the partition. It waits until there are replicas avaiabile such that bring down this replica will not cause avaiability loss for the partition.<br/> |
| [EnsurePartitionQurumSafetyCheck](model-EnsurePartitionQurumSafetyCheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](model-EntityHealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](model-EntityHealthState.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [Epoch](model-Epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](model-EventHealthEvaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](model-ExecutingFaultsChaosEvent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [FabricCodeVersionInfo](model-FabricCodeVersionInfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](model-FabricConfigVersionInfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](model-FabricError.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricError_Error](model-FabricError_Error.md) | Error object containing error code and error message.<br/> |
| [FailedUpgradeDomainProgressObject](model-FailedUpgradeDomainProgressObject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.<br/> |
| [FailureUpgradeDomainProgressInfo](model-FailureUpgradeDomainProgressInfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](model-FileInfo.md) | Information about a image store file.<br/> |
| [FileVersion](model-FileVersion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](model-FolderInfo.md) | Information about a image store folder. It inclues how many files this folder contains and its image store relative path.<br/> |
| [HealthEvaluation](model-HealthEvaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationWrapper](model-HealthEvaluationWrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](model-HealthEvent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](model-HealthInformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [ImageStoreContent](model-ImageStoreContent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](model-ImageStoreCopyDescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [Int64RangePartitionInformation](model-Int64RangePartitionInformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [KeyValueStoreReplicaStatus](model-KeyValueStoreReplicaStatus.md) | Key value store related information for the replica.<br/> |
| [LoadMetricReport](model-LoadMetricReport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](model-LoadMetricReportInfo.md) | Information about load reported by replica.<br/> |
| [MonitoringPolicyDescription](model-MonitoringPolicyDescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [NamedPartitionInformation](model-NamedPartitionInformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](model-NamedPartitionSchemeDescription.md) | Describes the named partition scheme of the service.<br/> |
| [NodeDeactivationInfo](model-NodeDeactivationInfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationTask](model-NodeDeactivationTask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](model-NodeDeactivationTaskId.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeHealth](model-NodeHealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](model-NodeHealthEvaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthState](model-NodeHealthState.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeId](model-NodeId.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeInfo](model-NodeInfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](model-NodeLoadInfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](model-NodeLoadMetricInformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodesHealthEvaluation](model-NodesHealthEvaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeUpgradeProgressInfo](model-NodeUpgradeProgressInfo.md) | Information about the upgrading node and its status<br/> |
| [PagedApplicationInfoList](model-PagedApplicationInfoList.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](model-PagedApplicationTypeInfoList.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeApplicationStatusInfoList](model-PagedComposeApplicationStatusInfoList.md) | The list of compose applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](model-PagedNodeInfoList.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](model-PagedReplicaInfoList.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceInfoList](model-PagedServiceInfoList.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](model-PagedServicePartitionInfoList.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionHealth](model-PartitionHealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](model-PartitionHealthEvaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthState](model-PartitionHealthState.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionInformation](model-PartitionInformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionLoadInformation](model-PartitionLoadInformation.md) | Represents load information for a partition, which contains the primary and secondary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionSchemeDescription](model-PartitionSchemeDescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](model-PartitionsHealthEvaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](model-PrimaryReplicatorStatus.md) |  |
| [RemoteReplicatorAcknowledgementDetail](model-RemoteReplicatorAcknowledgementDetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](model-RemoteReplicatorAcknowledgementStatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](model-RemoteReplicatorStatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [ReplicaHealth](model-ReplicaHealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](model-ReplicaHealthEvaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthState](model-ReplicaHealthState.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaInfo](model-ReplicaInfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicasHealthEvaluation](model-ReplicasHealthEvaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatusBase](model-ReplicaStatusBase.md) | Information about the replica.<br/> |
| [ReplicatorQueueStatus](model-ReplicatorQueueStatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](model-ReplicatorStatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [RepositoryCredential](model-RepositoryCredential.md) | Credential information to connect to container repository.<br/> |
| [ResolvedServiceEndpoint](model-ResolvedServiceEndpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](model-ResolvedServicePartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [RestartDeployedCodePackageDescription](model-RestartDeployedCodePackageDescription.md) | Defines description for restarting a deloyed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](model-RestartNodeDescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [SafetyCheck](model-SafetyCheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.<br/> |
| [SafetyCheckWrapper](model-SafetyCheckWrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.<br/> |
| [SecondaryActiveReplicatorStatus](model-SecondaryActiveReplicatorStatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](model-SecondaryIdleReplicatorStatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SeedNodeSafetyCheck](model-SeedNodeSafetyCheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [ServiceCorrelationDescription](model-ServiceCorrelationDescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceDescription](model-ServiceDescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceFromTemplateDescription](model-ServiceFromTemplateDescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](model-ServiceHealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](model-ServiceHealthEvaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthState](model-ServiceHealthState.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceInfo](model-ServiceInfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceLoadMetricDescription](model-ServiceLoadMetricDescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceNameInfo](model-ServiceNameInfo.md) | Information about the service name.<br/> |
| [ServicePartitionInfo](model-ServicePartitionInfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](model-ServicePlacementInvalidDomainPolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](model-ServicePlacementNonPartiallyPlaceServicePolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](model-ServicePlacementPolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](model-ServicePlacementPreferPrimaryDomainPolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service�s primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](model-ServicePlacementRequiredDomainPolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](model-ServicePlacementRequireDomainDistributionPolicyDescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServicesHealthEvaluation](model-ServicesHealthEvaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceTypeDescription](model-ServiceTypeDescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](model-ServiceTypeExtensionDescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](model-ServiceTypeHealthPolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](model-ServiceTypeHealthPolicyMapItem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](model-ServiceTypeInfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](model-ServiceTypeManifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceUpdateDescription](model-ServiceUpdateDescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [SingletonPartitionInformation](model-SingletonPartitionInformation.md) | Information about a partition that is singleton. The services with singletone partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](model-SingletonPartitionSchemeDescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [StartedChaosEvent](model-StartedChaosEvent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [StartNodeDescription](model-StartNodeDescription.md) | Describes the parameter for starting a stopped Service Fabric node.<br/> |
| [StatefulServiceDescription](model-StatefulServiceDescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](model-StatefulServiceInfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](model-StatefulServicePartitionInfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](model-StatefulServiceReplicaHealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](model-StatefulServiceReplicaHealthState.md) | Represents the health state of the stateful service replica, which contains the replica id and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](model-StatefulServiceReplicaInfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](model-StatefulServiceTypeDescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](model-StatefulServiceUpdateDescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessServiceDescription](model-StatelessServiceDescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](model-StatelessServiceInfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](model-StatelessServiceInstanceHealth.md) | Represents the health of the statelss service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](model-StatelessServiceInstanceHealthState.md) | Represents the health state of the stateless service instance, which contains the instance id and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](model-StatelessServiceInstanceInfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](model-StatelessServicePartitionInfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](model-StatelessServiceTypeDescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](model-StatelessServiceUpdateDescription.md) | Describes an update for a stateless service.<br/> |
| [StopNodeDescription](model-StopNodeDescription.md) | Describes the parameter for stopping a Service Fabric node.<br/> |
| [StoppedChaosEvent](model-StoppedChaosEvent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [SystemApplicationHealthEvaluation](model-SystemApplicationHealthEvaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TestErrorChaosEvent](model-TestErrorChaosEvent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting a faultable entity, Chaos found that the entity was alreay faulted -- which would be an unexpected event.<br/> |
| [UniformInt64RangePartitionSchemeDescription](model-UniformInt64RangePartitionSchemeDescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](model-UpgradeDomainDeltaNodesCheckHealthEvaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainInfo](model-UpgradeDomainInfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](model-UpgradeDomainNodesHealthEvaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [ValidationFailedChaosEvent](model-ValidationFailedChaosEvent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [WaitForInbuildReplicaSafetyCheck](model-WaitForInbuildReplicaSafetyCheck.md) | Safety check that waits for the replica build operation to finish. This indiciates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typoically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](model-WaitForPrimaryPlacementSafetyCheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](model-WaitForPrimarySwapSafetyCheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the avaiability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](model-WaitForReconfigurationSafetyCheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](model-WaitingChaosEvent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |
